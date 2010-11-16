Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PIMIk-0002fg-F4
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 15:14:27 +0100
Received: by fxm11 with SMTP id 11so488609fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 06:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=hmMuhNp+HOdzacQ00OoZj+TC7/gNqVXdonvK3Ccc0g0=;
	b=ssiOy5HXiN+nzGJ42aYbYv0HvqI1dy0myTB7PlgQmJmwAMe1SHxSJI3naS/F6tpkjo
	P6LRBDpDXz6F3eJOUx1mf+JEuSoBceGEtHn1mBYHYzY10u2gbhP10h9z8g9zpz3kOz5m
	yxU3WQ7e4zd3b/RGr4wATZmXYGmVXToN4zj14=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=kyAmvXTMwVKiHb0w75T2I2qRLKpzR1r2liPTl9cZj8rYCTmIoSwoDN46zUw3HW4MJB
	skryWr94CoHMQNSIngQBFfM+2bWkzXZTRX+Ss9M4Xkka7ep1I9mt57UaADzcim5fNceV
	lnJdfOB7mmDeTE1sBwgmJOHbuzf4v3abpXAWA=
Received: by 10.223.71.201 with SMTP id i9mr1647858faj.89.1289916801460;
	Tue, 16 Nov 2010 06:13:21 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id f5sm262969fai.22.2010.11.16.06.13.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 16 Nov 2010 06:13:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Nov 2010 15:13:18 +0100
Message-Id: <1289916799-21803-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.2
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] udh.inc: use RDEPENDS_${PN}
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
X-List-Received-Date: Tue, 16 Nov 2010 14:14:27 -0000

---
 recipes/uhd/uhd.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/uhd/uhd.inc b/recipes/uhd/uhd.inc
index 3b5be58..d2e7903 100644
--- a/recipes/uhd/uhd.inc
+++ b/recipes/uhd/uhd.inc
@@ -3,9 +3,9 @@ HOMEPAGE = "http://www.ettus.com"
 LICENSE = "GPLV3+"
 
 DEPENDS = "git-native python-cheetah-native boost libusb1 uhd-firmware"
-RDEPENDS += "uhd-firmware"
+RDEPENDS_${PN} += "uhd-firmware"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 inherit cmake
 
-- 
1.7.3.2



