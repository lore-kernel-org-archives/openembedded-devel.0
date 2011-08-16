Received: from stoexhub01.domain01.net ([83.145.59.142]
	helo=stoexhub02.domain01.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtESr-0008J4-Vj
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 09:53:34 +0200
Received: from localhost (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.137.0; Tue, 16 Aug 2011
	09:48:56 +0200
Date: Tue, 16 Aug 2011 09:49:08 +0200
From: Anders Darander <anders@chargestorm.se>
To: oe-dev <openembedded-devel@lists.openembedded.org>
Message-ID: <20110816074907.GE22184@chargestorm.se>
Mail-Followup-To: oe-dev <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: [meta-oe][RFC] Need for qmake_base.bbclass?
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
X-List-Received-Date: Tue, 16 Aug 2011 07:53:34 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline


Hi,

I've diff'ed qmake_base.bbclass in meta-oe and oe-core, with the result
at the end of the e-mail.

I'd like to get rid of qmake_base.bbclass in oe-core.
If we merge the second hunk of the diff to oe-core, do we risk getting
any failures/problems?

Locally, I've been running without the meta-oe version for a while, but
I'm only building a subset of all packages (and a subset of Qt as well).

Cheers,
Anders
 

--- ../openembedded-core/meta/classes/qmake_base.bbclass
2011-06-09 22:05:03.030620629 +0200
+++ meta-oe/classes/qmake_base.bbclass  2011-08-16 08:34:54.175700192
+0200
@@ -13,6 +13,9 @@
 export OE_QMAKE_STRIP="echo"
 export OE_QMAKE_RPATH="-Wl,-rpath-link,"
 
+# do not export STRIP to the environment
+STRIP[unexport] = "1"
+
 # default to qte2 via bb.conf, inherit qt3x11 to configure for qt3x11
 
 oe_qmake_mkspecs () {
@@ -47,7 +50,7 @@
 
 qmake_base_do_configure() {
        case ${QMAKESPEC} in
-       *linux-oe-g++|*linux-uclibc-oe-g++|*linux-gnueabi-oe-g++)
+
*linux-oe-g++|*linux-uclibc-oe-g++|*linux-gnueabi-oe-g++|*linux-uclibceabi-oe-g++)
                ;;
        *-oe-g++)
                die Unsupported target ${TARGET_OS} for oe-g++ qmake
spec
@@ -92,11 +95,6 @@
                bbnote "qmake prevar substitution:
${EXTRA_QMAKEVARS_PRE}"
        fi
 
-       # Hack .pro files to use OE utilities
-       find -name '*.pro' \
-            -exec sed -i -e 's,=\s*.*/lrelease,=
${OE_QMAKE_LRELEASE},g' \
-                         -e 's,=\s*.*/lupdate,= ${OE_QMAKE_LUPDATE},g'
'{}' ';'
-
 #bbnote "Calling '${OE_QMAKE_QMAKE} -makefile -spec ${QMAKESPEC} -o
Makefile $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST'"
        unset QMAKESPEC || true
        ${OE_QMAKE_QMAKE} -makefile -spec ${QMAKESPEC} -o Makefile
$QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST || die "Error
calling ${OE_QMAKE_QMAKE} on $PROFILES"

-- 
Anders Darander
ChargeStorm AB


