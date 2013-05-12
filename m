Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UbdTh-0008PY-A8
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 May 2013 23:06:50 +0200
Received: by mail-ea0-f172.google.com with SMTP id d10so47809eaj.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 May 2013 13:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=bF1KWxvidUC0IbA3iQZUQ35cjhjUutLRdhLS79iy65w=;
	b=lsIMWRuu1/nIa17i57vXU4zPuDIAeZRF57563FzLt/oWY8VfJ3QyYLYIJQtLki5tXz
	V6eC70frouEipf2+6a470zDf8WnoEd9rqGKKEn2rjYrqJna1AsTKF6FWjei9BkEvdObM
	IFvZGNQqeVBRRKBW97pcjoXaxDo5fifEcI32bYr949MLR0W+j5z8a8hDPluRnQXTBn9z
	HEBRxjBH3GmCRfDDRglUg662HuX9x74EvTWVmL5Y4/Xhxw06FnMmXzlPAckJrPv6CjRC
	k1hHsHJTdxe4nvB8SxmzOo37xPR6u/ELwt/y98UeHYfb1JRPiZeqB5S7zxHqhtXOMC+h
	l9yw==
X-Received: by 10.14.4.199 with SMTP id 47mr43056332eej.29.1368391716802;
	Sun, 12 May 2013 13:48:36 -0700 (PDT)
Received: from localhost.localdomain (p4FDF06B8.dip0.t-ipconnect.de.
	[79.223.6.184]) by mx.google.com with ESMTPSA id
	w52sm18480626eev.12.2013.05.12.13.48.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 12 May 2013 13:48:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 May 2013 22:48:19 +0200
Message-Id: <1368391699-1402-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1368391699-1402-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368391699-1402-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-network/meta-gnome 4/4] proftpd: pack missing files
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
X-List-Received-Date: Sun, 12 May 2013 21:07:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

WARNING: QA Issue: proftpd: Files/directories were installed but not shipped
  /home
  /home/ftp
  /home/ftp/pub

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-daemons/proftpd/proftpd_1.3.4b.bb      |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
index 806413b..3c48422 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.proftpd.org"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
            file://make.patch \
@@ -59,3 +59,5 @@ INITSCRIPT_PARAM = "defaults 85 15"
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "${FTPGROUP}"
 USERADD_PARAM_${PN} = "--system -g ${FTPGROUP} ${FTPUSER}"
+
+FILES_${PN} += "/home/${FTPUSER}"
-- 
1.7.4.4



