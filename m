Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickael.chazaux@gmail.com>) id 1O3qJM-00067r-BE
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Apr 2010 14:42:49 +0200
Received: by wye20 with SMTP id 20so631776wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Apr 2010 05:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=UdNDWuGZiXbuGFPaV+mAf00KTZyZbllL1zNvQIAiw0U=;
	b=xTFpoVou7Lltoc3lLROY12OTaN5AwuuaenFLi3ZmuGsjNlevL3kq0sAV5IWC8TKZNX
	0z5R8PblgGhPGGd496rlKbgtgLCza4Xt14JLpF7KcFYqnjt9DpltSsVTetIzIyX39RQI
	GkXPVYAzCrT9aSlAlwR5j3rTmo1FYE7uCQu18=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=ggYTwFwB8gXIMIv9YFx3dgIkvfXI2lj88mKHOcxDHdPLH+oJ4/eNb1UWiSKpCEuK9v
	Nd0qSxiHYf+S7vRBHR+x19KnqM3jdtPp7Affvhc+BgT3UdljVVMvNku6V19b9R+bhZRI
	P3s7smOdjFxQv5OrrUgehNR8PCQ/pCcuvCJFU=
Received: by 10.216.93.19 with SMTP id k19mr493932wef.223.1271680753674;
	Mon, 19 Apr 2010 05:39:13 -0700 (PDT)
Received: from localhost.localdomain (delta360.server4you.de [85.25.136.130])
	by mx.google.com with ESMTPS id
	r29sm48441455wbv.9.2010.04.19.05.39.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 19 Apr 2010 05:39:12 -0700 (PDT)
Sender: Mickael Chazaux <mickael.chazaux@gmail.com>
From: =?utf-8?q?Micka=C3=ABl=20Chazaux?= <mchazaux@adeneo-embedded.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Apr 2010 14:39:06 +0200
Message-Id: <1271680746-12366-1-git-send-email-mchazaux@adeneo-embedded.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: mickael.chazaux@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?q?Micka=C3=ABl=20Chazaux?= <mchazaux@adeneo-embedded.com>
Subject: [PATCH] Add perl-native dependency for pixman
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
X-List-Received-Date: Mon, 19 Apr 2010 12:42:49 -0000

---
 recipes/xorg-lib/pixman.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/xorg-lib/pixman.inc b/recipes/xorg-lib/pixman.inc
index a5987bb..539a33a 100644
--- a/recipes/xorg-lib/pixman.inc
+++ b/recipes/xorg-lib/pixman.inc
@@ -3,6 +3,8 @@ PRIORITY = "optional"
 DESCRIPTION = "Low-level pixel manipulation library."
 LICENSE = "X11"
 
+DEPENDS = "perl-native"
+
 BBCLASSEXTEND = "native"
 
 SRC_URI = "http://cairographics.org/releases/${BPN}-${PV}.tar.gz;name=archive "
-- 
1.6.3.3



