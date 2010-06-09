Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OMSG6-0005Mc-B6
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 22:52:28 +0200
Received: by pxi14 with SMTP id 14so2410264pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jun 2010 13:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=L5JYSD+shSb5sd2b7OR2AqbDVISEXlt6iNZHG4/l33Q=;
	b=rjoh/fhUOjGyKNrcCeKBzFvZWJZdpG50JfKbhgBiDhziFQAZ0QnkRCVyCktEae4fUR
	mYHZ7A8QCTuO85YMmitI08Vk+6ziPldhy9O0LbbS5J/VO4wRMdOOG9RNhNRuSm+SueM7
	VW9wrEiJXeNnwqFIjYnBfPZXRBXZ3qVcZKUnM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=qy6ciyDp0bWAPPOrxGVlbHl10X6MVXyrnx4mmp0Q8hC1L/91MlSOKx2NJNmrodhefq
	JG8ggfNXY17Z3Dfpo3m5rrHTt/Hu2iQhSVOQz7SYqBiCmtY6oTtsSchZo1BKDHJWRLev
	lPZHufMcL/yBdmVNGrM5OvqHfkr+zI/fyGRD4=
Received: by 10.115.84.6 with SMTP id m6mr789071wal.59.1276116479145;
	Wed, 09 Jun 2010 13:47:59 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c1sm68520140wam.7.2010.06.09.13.47.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 09 Jun 2010 13:47:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Jun 2010 13:47:52 -0700
Message-Id: <1276116472-26078-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] minimal-uclibc.conf: Add pam to DISTRO_FEATURES
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
X-List-Received-Date: Wed, 09 Jun 2010 20:52:28 -0000

* if pam is not in the DISTRO_FEATURES then pam
  modules dont end up in th root file system but
  when using shadow pam is used for authentication
  and uclibc needs these modules otherwise login
  fails.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/minimal-uclibc.conf |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/conf/distro/minimal-uclibc.conf b/conf/distro/minimal-uclibc.conf
index df72769..a0af3a6 100644
--- a/conf/distro/minimal-uclibc.conf
+++ b/conf/distro/minimal-uclibc.conf
@@ -38,4 +38,5 @@ require conf/distro/minimal.conf
 DISTRO_FEATURES = "nfs smbfs wifi ppp alsa ext2 vfat pcmcia usbgadget usbhost pci"
 # Following features are for ARM and E500 based machines
 DISTRO_FEATURES += "eabi"
-
+# pam is needed on uclibc if using shadow 
+DISTRO_FEATURES += "pam"
-- 
1.7.0.4



