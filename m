Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SjoUw-0006b9-8I
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jun 2012 11:25:18 +0200
Received: by eaal1 with SMTP id l1so277087eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2012 02:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=5Ov2y7mcJE8RKFaKDs880c4lDchKNq6LMdqBsVZXz4Y=;
	b=lX8RoWAq0q1A0wVyqI7PsTXKu8GVyCesPjBuLgHVaRCJl2gd4RJcMvwPWR/e0VFqR+
	DH48TirQe+zsH0QG+VQtP9T/WjTdauPZbh3rDQHBQAUREQ4xVw9eVKuxIoI5Io+2/xek
	ArIEfCK7clKV9MIn540amP1bSu6mo3gBCmHbB8isV0Hv9vPlx7sUZUPLF/JK0vbEMysG
	zf2hyluo33k8A066Uvy5//xK0oarmPvwBcuVzjNXwwu0Flx7aJ4oEbhZQsvBvVG1dZuh
	eN9jjbiGmkQ+TcdrGJHsm0bEAdIZ8utlSLiTvEnUYopqsE5rrwxnnQ+A4eDchWEOzSGW
	W3yw==
Received: by 10.14.95.201 with SMTP id p49mr3904988eef.103.1340788465195;
	Wed, 27 Jun 2012 02:14:25 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id m46sm139113800eeh.9.2012.06.27.02.14.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jun 2012 02:14:24 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Jun 2012 11:14:21 +0200
Message-Id: <1340788461-12751-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnrNq2Y+E2jYQNv+vVYkE6TQh7ei8ll4vrmso115IvnIxdfizXFTu8Vr83kRLwOzMhqBQLn
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] ntp: unbreak fetching of ntp-ssl
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
X-List-Received-Date: Wed, 27 Jun 2012 09:25:18 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb b/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
index ece8720..a3d719e 100644
--- a/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
+++ b/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
@@ -7,7 +7,7 @@ inherit systemd
 SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE_${PN}-systemd = "ntpd.service"
 
-SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/${P}.tar.gz \
+SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
         file://tickadj.c.patch \
         file://ntp-4.2.4_p6-nano.patch \
         file://ntpd \
-- 
1.7.10



