Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QFsgh-0003g7-5W
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Apr 2011 20:45:11 +0200
Received: by pwj9 with SMTP id 9so1939279pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2011 11:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=3sLJ0RKLPvGA+/Kb23EmccslX/ZO08Z6W/NQpfSyJEw=;
	b=fIWNaZC/Iv1BVME0npJR/7lxKmTfvFaIkq7jSMPU/jPrSy3QfzMambryXwkK+oZaf4
	HVDtbp0Hv9s+xwdNUA25Da8M4jJSBTgaCIGm/U9KN5Hsynsd8idnNxn6ZfedvlPCIamc
	xm7ccYgoxRxvIPBPHy1E+KOG0u+HxhGDMGJDk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=KOVWGbGDdsB3Q925NFndvgeatIecIQP/rXwDYptTNkXZ9O+2JfJhoIeRQPjUQZ4TUx
	ViQMC42IhFLq8aYggDn3nnmbVxWn3EwP8KokKFcyna68BSLtWeDYAdBWu29XbjIkF9YV
	CzKt8bfOV+Q3QRQz5R50agPp4tIBelaMG8bCs=
Received: by 10.142.247.34 with SMTP id u34mr1815918wfh.48.1304102556858;
	Fri, 29 Apr 2011 11:42:36 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id y5sm2064148pbq.57.2011.04.29.11.42.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Apr 2011 11:42:35 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Apr 2011 11:42:24 -0700
Message-Id: <1304102545-27774-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH v2] proxy-libintl_20100902.bb: Specify -fPIC in CFLAGS
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
X-List-Received-Date: Fri, 29 Apr 2011 18:45:11 -0000

From: Khem Raj <raj.khem@gmail.com>

Some architectures like mips become upset if you
try to link non-pic libraries to shared objects
some generate pic by default so it does not matter
Specifying -fPIC on commandline should make all happy

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../proxy-libintl/proxy-libintl_20100902.bb        |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
index 7c433bd..f125fb5 100644
--- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
+++ b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://src/proxy-libintl/COPYING.LIB.txt;md5=bc400bc21422f9a92e76ec2c5167ca2e"
 
-PR = "r0"
+PR = "r1"
 PROVIDES = "virtual/libintl virtual/gettext"
 
 SRC_URI = " \
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "291ac350cc5eb4a01b0d651ca99fae64cee8a1c06b2005277fab5a4356
 S = "${WORKDIR}"
 FILES_${PN}-dev = "${includedir}/libintl.h ${libdir}/libintl.a"
 
-CFLAGS_append = " -Wall -I ../../include ${@['-DSTUB_ONLY', ''][bb.data.getVar('USE_NLS', d, 1) != 'no']}"
+CFLAGS_append = " -fPIC -Wall -I ../../include ${@['-DSTUB_ONLY', ''][bb.data.getVar('USE_NLS', d, 1) != 'no']}"
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_compile() {
-- 
1.7.4.1



