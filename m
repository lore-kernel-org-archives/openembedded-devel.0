Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UQFIC-0007ia-Q1
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 13:03:49 +0200
Received: by mail-ee0-f43.google.com with SMTP id e50so676293eek.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2013 03:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=9HcjL50YxtUCfbxWY6JoUiKW/Oi2mldJN5HvQiS4Abc=;
	b=D/KsE+iT2t653GoJoKrJK6lBYVywlLJMiXzLeIDoyF35M5e7ba4zW6WLdOWlVgqV+0
	tfx4MgTrXtYBpirXDVCbsGtw+hMZkQ64EnhyC5OmusRlVuWoKamE0qrsoekzFHaligXI
	X2F24L9bDJ2lzpD0VORAW+Pm1ewLM6f+t5XPZyKfA0Jak5FaC6cag5Lc9/9B1JWHoXZ/
	VX6rzhWMj6b2fs1Pp1gBR1WL4ngLGkjTCMbwbvfU5gsvvtedqbngrGAMY0a866sZvARb
	xYlW+9asYO1Gopm6r6xeWj2DjIONOqZaHGvY8bjiiLUYERVJ2Ht8zayYuRkDRoc5RqPO
	oPAA==
X-Received: by 10.15.32.67 with SMTP id z43mr15828086eeu.24.1365677186163;
	Thu, 11 Apr 2013 03:46:26 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id a41sm4946895eei.4.2013.04.11.03.46.24
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 03:46:25 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Apr 2013 12:46:00 +0200
Message-Id: <1365677165-9296-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1365677165-9296-1-git-send-email-koen@dominion.thruhere.net>
References: <1365677165-9296-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQm5/dMPeF5SD4N6C1blYSXVDR4H07+KMu7b7N7nj5BvRM9ux3RKD79nF5v+iNWgLwo9Aczx
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCHv2 3/8] python-tornado: update to top of 2.2 branch
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
X-List-Received-Date: Thu, 11 Apr 2013 11:03:51 -0000

Drags in a few bugfixes needed for gateone

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-devtools/python/python-tornado_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python-tornado_git.bb b/meta-oe/recipes-devtools/python/python-tornado_git.bb
index 00d0bbb..f158923 100644
--- a/meta-oe/recipes-devtools/python/python-tornado_git.bb
+++ b/meta-oe/recipes-devtools/python/python-tornado_git.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "Tornado is an open source version of the scalable, non-blocking w
 LICENSE = "Apache"
 LIC_FILES_CHKSUM = "file://README;md5=e7fb9954003d7cd93322ccf282210d1c"
 
-PV = "2.2"
-SRCREV = "02bc76155de5bf4dca243e4d0c019c0ac4c8b3be"
-PR = "r1"
+PV = "2.2.1+git${SRCPV}"
+
+SRCREV = "c501917eba46dec30b1f2ef12497dffc4beec505"
 SRC_URI = "git://github.com/facebook/tornado.git;branch=branch2.2 \
            file://0001-disable-AI_ADDRCONFIG-flag.patch \
           "
-- 
1.8.1.4



