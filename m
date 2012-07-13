Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Spc6m-0006VU-0s
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 11:24:21 +0200
Received: by mail-ey0-f175.google.com with SMTP id l1so885914eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=+doWcgXh0dH/hNN//Jd2F6ZCcS7uNAIQpcBmWy5c5VM=;
	b=b4ofPsS+U76rqrUhAEt0MDvdACuX7gztgrZg9zBn+TPg592aK6B2GPxCht6iXNrY4r
	h+6W/SdfV/F/w8mFqbcywQy7+nEvITXSgZbzOsPR63kncdfEGcFwDGX6W+BxfT5XbhE9
	hbBuWhrgkl7IxNMbMnccf4yE4fN8jpWYN6BoK38e831zkXSCHqFA4ty+YlDAO6EYxmz+
	lRtpoYr2cvvwyHQ5eMSAykuIDCn7ftjeaIu+9kzGfUCgFsCY7DKYrlEo7td9LvrBY2dC
	Rb7Z7BMFBhFPyCfamETWPLPmEgCL7XiumKSV+foBCo9oUXE6sJDsR2krmYJ5YhzO8C29
	7N0Q==
Received: by 10.14.99.1 with SMTP id w1mr81092eef.74.1342170788023;
	Fri, 13 Jul 2012 02:13:08 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id e48sm23160627eea.12.2012.07.13.02.13.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 02:13:07 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 11:12:01 +0200
Message-Id: <1342170730-14982-15-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
References: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnIY5Q3mTEf1pjV/Zm0q3fVCYU/I/zi0Z653iMfWeSj/yEw6+jCPEE6tVgazCEcxvdMXSdn
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>, eric@eukrea.com
Subject: [for-denzil][meta-oe 15/24] kernel.bbclass: pass KERNEL_VERSION to depmod calls in postinst
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
X-List-Received-Date: Fri, 13 Jul 2012 09:24:23 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* without this, kernel upgrades where KERNEL_VERSION is changed
  e.g. 3.4.2 -> 3.4.3 generate .dep for running 3.4.2 and after reboot user ends
  up without any module loaded to make it worse after reboot nothing is upgraded
  to trigger another kernel(-module) postinst to generate .dep for now running 3.4.3

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/classes/kernel.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index 66398ef..ce82351 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -276,13 +276,13 @@ fi
 if [ -n "$D" ]; then
 	${HOST_PREFIX}depmod -A -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
 else
-	depmod -a
+	depmod -a ${KERNEL_VERSION}
 fi
 }
 
 pkg_postinst_modules () {
 if [ -z "$D" ]; then
-	depmod -a
+	depmod -a ${KERNEL_VERSION}
 	update-modules || true
 fi
 }
-- 
1.7.10



