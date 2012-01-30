Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1RrnNH-0001Go-U4
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 10:18:08 +0100
Received: by iaby12 with SMTP id y12so4215387iab.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 01:10:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.189.137 with SMTP id gi9mr3270870igc.29.1327914614849; Mon,
	30 Jan 2012 01:10:14 -0800 (PST)
Received: by 10.50.155.134 with HTTP; Mon, 30 Jan 2012 01:10:14 -0800 (PST)
Date: Mon, 30 Jan 2012 10:10:14 +0100
Message-ID: <CADZ6=asn5Tq6adpuysW229BYXDu3ExUVNDWEZtzpjyAUv9PHgQ@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-java][PATCH] llvm-config: Work around shebang max length issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jan 2012 09:18:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This patch works around a max shebang length issue
in llvm's llvm-config.

llvm-config is a perl script. meta-java configures
the llvm sources to use OE's perl which might reside in
a path longer than 127 chars. llvm's perl script
will then have a shebang line longer than 127 characters.
This will break the script.
In linux, shebang interpreter paths are cut off after 127 bytes.

meta-java's llvm recipe already wraps the perl script llvm-config
with a small shell script. This patch adds an explicit perl
interpreter call to this wrapping shell script.

Signed-off-by: Thilo Fromm <github@thilo-fromm.de>

---
 recipes-core/llvm/llvm-common.bb          |   12 ++++++++++++
 recipes-core/llvm/llvm-common/llvm-config |    2 +-
 2 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/recipes-core/llvm/llvm-common.bb b/recipes-core/llvm/llvm-comm=
on.bb
index 38ca1ee..3db4af0 100644
--- a/recipes-core/llvm/llvm-common.bb
+++ b/recipes-core/llvm/llvm-common.bb
@@ -4,8 +4,20 @@ LIC_FILES_CHKSUM =3D
"file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3

file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20420
\
                    "

+# provide native perl binaries via PATH
+inherit perlnative
+DEPENDS +=3D "perl-native"
+
 SRC_URI =3D "file://llvm-config"

+do_compile() {
+  cd ..
+  # This adds an explicit call to the interpreter in the wrapper script
+  #  so we don't run into shebang max size issues in the
llvm-configX.X perl script
+  #  if the path to perl-native > 127 chars.
+  sed -i -e "s|@PATH_TO_PERL@|`which perl`|" llvm-config
+}
+
 do_install() {
   install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
   install -m 0755 ${WORKDIR}/llvm-config
${SYSROOT_DESTDIR}${bindir_crossscripts}/
diff --git a/recipes-core/llvm/llvm-common/llvm-config
b/recipes-core/llvm/llvm-common/llvm-config
index a9a416d..08463e5 100644
--- a/recipes-core/llvm/llvm-common/llvm-config
+++ b/recipes-core/llvm/llvm-common/llvm-config
@@ -2,7 +2,7 @@
 # Wrapper script for real llvm-config. Simply calls

 if [ $WANT_LLVM_RELEASE ]; then
-	exec `dirname $0`/${TARGET_PREFIX}llvm-config$WANT_LLVM_RELEASE ${@}
+	exec "@PATH_TO_PERL@" `dirname
$0`/${TARGET_PREFIX}llvm-config$WANT_LLVM_RELEASE ${@}
 else
   echo "The variable WANT_LLVM_RELEASE is not defined and exported"
 	echo "by your build recipe. Go figure."
--=20
1.7.5.4


--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle


