Return-Path: <johannes.pointner@br-automation.com>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 13 Jun 2017 10:12:20 UTC
Received: from mail2.br-automation.com (mail.br-automation.com [213.33.116.60])
	by mail.openembedded.org (Postfix) with ESMTP id 1D65B7831C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jun 2017 10:12:20 +0000 (UTC)
X-AuditID: c0a80110-7e5ff70000000f59-ca-593fb6fbe51e
Received: from brsmtp01.br-automation.com (Unknown_Domain [192.168.1.60])
	by mail2.br-automation.com () with SMTP id 58.64.03929.BF6BF395;
	Tue, 13 Jun 2017 11:57:17 +0200 (CEST)
MIME-Version: 1.0
From: Johannes Pointner <johannes.pointner@br-automation.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Jun 2017 11:56:48 +0200
Message-Id: <20170613095648.30418-1-johannes.pointner@br-automation.com>
X-Mailer: git-send-email 2.13.1
X-MIMETrack: Itemize by SMTP Server on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 13/06/2017 11:57:51,
	Serialize by Router on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 13/06/2017 11:57:55,
	Serialize complete at 13/06/2017 11:57:55,
	Itemize by SMTP Server on BRSMTP01/Eggelsberg/AT/B&R(Release
	9.0.1FP5|November 22, 2015) at 13.06.2017 11:57:15
X-TNEFEvaluated: 1
X-Disclaimed: 65035
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkluLIzCtJLcpLzFFi42I5sILRRvfvNvtIgxfnlCwuHl7K7MDocW7j
	CsYAxigum5TUnMyy1CJ9uwSujOZ1y1gLGkwrln98x9bAeES3i5GTQ0LAROLSp/ssXYxcHEIC
	mxklJqxcxQqS4BUQlDg58wkLiM0mYCtxZMJXMFtEQFfi44e5jCA2s4C1xPvlC8DqhQUsJdpf
	XmEDsVkEVCW+zeqEmuMhcebgbSaIem2JZQtfM0MslpeY9q6XFWSxhEAHs8TlbRtZIBJCEqcX
	n4UqEpa4s2kD+wRGvllIbpqFZNYCRqZVjOK5iZk5RnpJRbqJpSX5uYklmfl5esn5uZsYIQEk
	sINx9xvtQ4wCHIxKPLyS6+wjhVgTy4orcw8xSnAwK4nwNmwBCvGmJFZWpRblxxeV5qQWH2KU
	5mBREuetV7OKFBJITyxJzU5NLUgtgskycXBKNTA2CWsllgjMM/t0oDWnlutivtKiswmP+969
	O++4dm/dumDpP/OOvNFYfOEyw+qY0u5lb64/cM4tLFh6a9vsrRfvzdhYuS/Yp/ipa8+rs28s
	rLfKqAlZdtq+NXhTuX0zd7WLQNnxsyfunJ6dFDH39RSllJDZs3c3xt+KLnv2Y1nZyqXcGxZX
	P4japsRSnJFoqMVcVJwIABDnGmkcAgAA
Subject: [meta-networking][PATCH] samba: upgrade to 4.6.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Jun 2017 10:12:22 -0000
Content-Transfer-Encoding: quoted-printable

This includes a security fix that adresses the following defect:
CVE-2017-7494 (Remote code execution from a writable share)

* Detail release note:
  - https://www.samba.org/samba/history/samba-4.6.5.html

* Remove 00-fix-typos-in-man-pages.patch which has been fixed
  upstream a long time ago

Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
---
 .../samba/samba/00-fix-typos-in-man-pages.patch    | 108 -----------------=
----
 .../samba/{samba=5F4.6.2.bb =3D> samba=5F4.6.5.bb}       |   5 +-
 2 files changed, 2 insertions(+), 111 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/00-fix=
-typos-in-man-pages.patch
 rename meta-networking/recipes-connectivity/samba/{samba=5F4.6.2.bb =3D> s=
amba=5F4.6.5.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/samba/samba/00-fix-typos-=
in-man-pages.patch b/meta-networking/recipes-connectivity/samba/samba/00-fi=
x-typos-in-man-pages.patch
deleted file mode 100644
index c94bc3185..000000000
--- a/meta-networking/recipes-connectivity/samba/samba/00-fix-typos-in-man-=
pages.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 1573638212a9733a44939a4d38a226f38dca36f1 Mon Sep 17 00:00:00 2001
-From: Michele Baldessari <michele@acksyn.org>
-Date: Tue, 9 Jul 2013 23:23:33 +0200
-Subject: [PATCH] Fix typos in man-pages
-
-Fix some typos in the man-pages.
-
-Signed-off-by: Michele Baldessari <michele@acksyn.org>
-Reviewed-by: Simo Sorce <idra@samba.org>
-
-Autobuild-User(master): Simo Sorce <idra@samba.org>
-Autobuild-Date(master): Wed Jul 10 16:45:07 CEST 2013 on sn-devel-104
----
- docs-xml/manpages/dbwrap=5Ftool.1.xml              | 2 +-
- docs-xml/manpages/idmap=5Fautorid.8.xml            | 2 +-
- docs-xml/manpages/net.8.xml                      | 2 +-
- docs-xml/manpages/pdbedit.8.xml                  | 2 +-
- docs-xml/manpages/samba.7.xml                    | 2 +-
- docs-xml/manpages/smbclient.1.xml                | 2 +-
- docs-xml/manpages/smbpasswd.5.xml                | 2 +-
- docs-xml/manpages/vfs=5Fsmb=5Ftraffic=5Fanalyzer.8.xml | 2 +-
- 8 files changed, 8 insertions(+), 8 deletions(-)
-
-Index: samba-4.1.11/docs-xml/manpages/smbstatus.1.xml
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- samba-4.1.11.orig/docs-xml/manpages/smbstatus.1.xml
-+++ samba-4.1.11/docs-xml/manpages/smbstatus.1.xml
-@@ -137,6 +137,13 @@
- 		</listitem>
- 		</varlistentry>
-=20
-+		<varlistentry>
-+		<term>-n|--numeric</term>
-+		<listitem><para>causes smbstatus to display numeric UIDs and GIDs inste=
ad of
-+				resolving them to names.</para>
-+		</listitem>
-+		</varlistentry>
-+
- 	</variablelist>
- </refsect1>
-=20
-Index: samba-4.1.11/docs-xml/manpages/sharesec.1.xml
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- samba-4.1.11.orig/docs-xml/manpages/sharesec.1.xml
-+++ samba-4.1.11/docs-xml/manpages/sharesec.1.xml
-@@ -129,6 +129,13 @@
- 		</para></listitem>
- 		</varlistentry>
-=20
-+		<varlistentry>
-+		<term>-S|--setsddl=3DSTRING</term>
-+		<listitem><para>
-+		Set security descriptor by providing ACL in SDDL format.
-+		</para></listitem>
-+		</varlistentry>
-+
- 		&stdarg.help;
- 		&stdarg.server.debug;
- 		&popt.common.samba;
-Index: samba-4.1.11/docs-xml/build/DTD/samba.entities
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- samba-4.1.11.orig/docs-xml/build/DTD/samba.entities
-+++ samba-4.1.11/docs-xml/build/DTD/samba.entities
-@@ -270,6 +270,44 @@ file.
- &popt.common.samba;
- '>
-=20
-+<!ENTITY stdarg.signing '
-+<varlistentry>
-+<term>-S|--signing on|off|required</term>
-+<listitem><para>Set the client signing state.
-+</para></listitem>
-+</varlistentry>
-+'>
-+
-+<!ENTITY stdarg.machinepass '
-+<varlistentry>
-+<term>-P|--machine-pass</term>
-+<listitem><para>Use stored machine account password.
-+</para></listitem>
-+</varlistentry>
-+'>
-+
-+<!ENTITY stdarg.encrypt '
-+<varlistentry>
-+<term>-e|--encrypt</term>
-+<listitem><para>
-+This command line parameter requires the remote
-+server support the UNIX extensions or that the SMB3 protocol has been sel=
ected.
-+Requests that the connection be encrypted. Negotiates SMB encryption usin=
g either
-+SMB3 or POSIX extensions via GSSAPI. Uses the given credentials for
-+the encryption negotiation (either kerberos or NTLMv1/v2 if given
-+domain/username/password triple. Fails the connection if encryption
-+cannot be negotiated.
-+</para></listitem>
-+</varlistentry>
-+'>
-+
-+<!ENTITY stdarg.pwnthash '
-+<varlistentry>
-+<term>--pw-nt-hash</term>
-+<listitem><para>The supplied password is the NT hash.
-+</para></listitem>
-+</varlistentry>
-+'>
-=20
- <!ENTITY stdarg.resolve.order '
- <varlistentry>
diff --git a/meta-networking/recipes-connectivity/samba/samba=5F4.6.2.bb b/=
meta-networking/recipes-connectivity/samba/samba=5F4.6.5.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/samba/samba=5F4.6.2.bb
rename to meta-networking/recipes-connectivity/samba/samba=5F4.6.5.bb
index 38876c2c3..c54112023 100644
--- a/meta-networking/recipes-connectivity/samba/samba=5F4.6.2.bb
+++ b/meta-networking/recipes-connectivity/samba/samba=5F4.6.5.bb
@@ -12,7 +12,6 @@ ${SAMBA=5FMIRROR}    http://www.mirrorservice.org/sites/f=
tp.samba.org \n \
 "
=20
 SRC=5FURI =3D "${SAMBA=5FMIRROR}/stable/samba-${PV}.tar.gz \
-           file://00-fix-typos-in-man-pages.patch \
            file://16-do-not-check-xsltproc-manpages.patch \
            file://20-do-not-import-target-module-while-cross-compile.patch=
 \
            file://21-add-config-option-without-valgrind.patch \
@@ -24,8 +23,8 @@ SRC=5FURI=5Fappend=5Flibc-musl =3D " \
            file://samba-4.2.7-pam.patch \
            file://samba-4.3.9-remove-getpwent=5Fr.patch \
           "
-SRC=5FURI[md5sum] =3D "461def8190ffc651fd8458b24ca2a622"
-SRC=5FURI[sha256sum] =3D "927afcc16e444718985e3952de92d34e7b776b9ca0238179=
d866da18a6441c35"
+SRC=5FURI[md5sum] =3D "2ae8ce2862d8bfa95e4681371ebb1623"
+SRC=5FURI[sha256sum] =3D "c06901e1d318b425b8c3ecea3ef23a91e7371312a9ea7adb=
f34fb8eb42ca3b84"
=20
 inherit systemd waf-samba cpan-base perlnative update-rc.d
 # remove default added RDEPENDS on perl
--=20
2.13.1



