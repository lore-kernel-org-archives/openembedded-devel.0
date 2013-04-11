Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UQFIE-0007id-75
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 13:03:53 +0200
Received: by mail-ee0-f45.google.com with SMTP id c50so674482eek.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2013 03:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=JJng7/iso3VrNmn9h5LkbEb8/zs+zLRiZcGL6m/mlC4=;
	b=oyAfJXOGA12AaFdSOnqUgI91YMZWNORLn7dg+aUDPUst8UUBKgBaw7UnjDMUKyz8Iz
	JuxBnXSfi+2dgLNxEJcUyw9HQk74qL3g4UBo8ZBBHvZ/Akn/tB/UyJaSZN+orftEFkVt
	Be/jbIKEgP707Cxe8sva7uGhP7Iz2/2w0P+eZcidmVH29qJ7JsoU0UkTHx0B3AnNQRx5
	GS/rK53CV/DSjpXrVrF4731BnbJSptyP/slEDzTSiCdIcPzUv9Y4M5ZblBUnMFdoCTqc
	BDtW8rjAjXo0p+Pj0P3qP6GdkDVLb8LRMVYemLt8R8aZ0urc3hoCuOyS59ugoc31kZ9F
	K5Yw==
X-Received: by 10.15.41.2 with SMTP id r2mr15737340eev.20.1365677187568;
	Thu, 11 Apr 2013 03:46:27 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id a41sm4946895eei.4.2013.04.11.03.46.26
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 03:46:26 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Apr 2013 12:46:01 +0200
Message-Id: <1365677165-9296-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1365677165-9296-1-git-send-email-koen@dominion.thruhere.net>
References: <1365677165-9296-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQndalqbrfD7kBeFaVMG5D3ux8wSAgrjbvNre/gOjXIACUSRtXV9qdyST8uz5U/MFEGglbYI
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCHv2 4/8] gateone: fix html5 feature check
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
X-List-Received-Date: Thu, 11 Apr 2013 11:03:56 -0000

The BlobBuilder and Blob checks never succeeded, even on cutting edge browsers. Nudge SRCREV forward to drag in those fixes.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-connectivity/gateone/gateone_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
index 652876f..e9c182d 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "HTML5 (plugin-free) web-based terminal emulator and SSH client"
 LICENSE = "AGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ee5b168fc7de89a0cadc49e27830aa2c"
 
-PR = "r9"
+PR = "r10"
 
 PV = "1.1"
-SRCREV = "bb74e1095adb66b04b51ed6ff10ae0aa96afdd46"
+SRCREV = "ea5db3dcb3bbbe445ae6d1a5611c1f8d547c57b9"
 SRC_URI = "git://github.com/liftoff/GateOne.git \
            file://gateone-avahi.service \
            file://server.conf \
-- 
1.8.1.4



