Received: from futzingaround.com ([67.212.234.189])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <o2e@saaworld.com>) id 1P2dWA-0006CD-BN
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 07:23:20 +0200
Received: from [172.16.62.54] (c-98-207-238-38.hsd1.ca.comcast.net
	[98.207.238.38]) (authenticated bits=0)
	by futzingaround.com (8.13.1/8.13.1) with ESMTP id o944v5Ek029708
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 3 Oct 2010 21:57:06 -0700
From: Scott Anderson <o2e@saaworld.com>
Date: Sun, 3 Oct 2010 21:57:04 -0700
Message-Id: <16328951-A799-4807-8D0A-B2734EB57056@saaworld.com>
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v1081)
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 67.212.234.189
X-SA-Exim-Mail-From: o2e@saaworld.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Fix for arfile.py to handle six digit UIDs
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
X-List-Received-Date: Mon, 04 Oct 2010 05:23:20 -0000
X-Groupsio-MsgNum: 24333
Content-Type: multipart/mixed; boundary=Apple-Mail-16-770863127

--Apple-Mail-16-770863127
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi all,

I also ran into the problem described by Blaine Kubesh here: =
http://lists.linuxtogo.org/pipermail/openembedded-users/2010-March/001068.=
html

Essentially, the problem is that arfile.py is splitting the ar header =
with white-space instead of fixed-width fields, so two fields would get =
treated as a single field.  Now I'm far from a expert in Python, git, =
bitbake or OpenEmbedded (among many other things, frankly), but I =
believe the attached patch is an improvement over the status quo, as it =
honors the fixed field widths.

Thanks (especially to Tom Rini for pointing me in the right direction),
  SAA

Signed-off-by: Scott Anderson <o2e@saaworld.com>



--Apple-Mail-16-770863127
Content-Disposition: attachment;
	filename=fix_big_uid
Content-Type: application/octet-stream;
	name="fix_big_uid"
Content-Transfer-Encoding: 7bit

diff --git a/recipes/ipkg-utils/ipkg-utils/arfile_header_split.patch b/recipes/ipkg-utils/ipkg-utils/arfile_header_split.patch
new file mode 100644
index 0000000..ce1993b
--- /dev/null
+++ b/recipes/ipkg-utils/ipkg-utils/arfile_header_split.patch
@@ -0,0 +1,16 @@
+--- ipkg-utils/arfile.py.orig	2010-09-29 13:38:15.000000000 -0700
++++ ipkg-utils/arfile.py	2010-10-01 16:06:00.000000000 -0700
+@@ -74,7 +74,12 @@
+             if l == "\n":
+                 l = self.f.readline()
+                 if not l: break
+-            descriptor = l.split()
++            # Field lengths from /usr/include/ar.h:
++            ar_field_lens = [ 16, 12, 6, 6, 8, 10, 2 ]
++            descriptor = []
++            for field_len in ar_field_lens:
++                descriptor.append(l[:field_len].strip())
++                l = l[field_len:]
+ #            print descriptor
+             size = int(descriptor[5])
+             memberName = descriptor[0][:-1]
diff --git a/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb b/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
index 42653fd..d22fd26 100644
--- a/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
+++ b/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL"
 CONFLICTS = "ipkg-link"
 RDEPENDS_${PN} = "python"
 SRCDATE = "20050930"
-PR = "r27"
+PR = "r28"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
@@ -17,6 +17,7 @@ SRC_URI = "${HANDHELDS_CVS};module=ipkg-utils \
            file://ipkg-make-index-track-stamps.patch \
            file://fields_tweaks.patch \
            file://ipkg-env.patch \
+           file://arfile_header_split.patch \
 	   "
 
 S = "${WORKDIR}/ipkg-utils"

--Apple-Mail-16-770863127--
