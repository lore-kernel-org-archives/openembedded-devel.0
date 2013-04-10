Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UPxwY-0001Mt-Ce
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 18:32:20 +0200
Received: by mail-ea0-f181.google.com with SMTP id z10so322541ead.40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 09:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=3vkqr0nANcTd3sjHZeHS+FSJRW9CPhpB6KnQ/7UBSDo=;
	b=cOrUdXqrWcIRFp1nGHbVhFSn1ThoVihkX6YbRxry9BU3TEm5tL3f8Gh2LDtLPPq6OA
	DUyNvkDqUrflSBlX/DDmpisMAWeY6ubcYMJlh8mn6XL6tcyMBi3+TLfHSC759LXZTSGY
	E7batOZzRfaSUfnOuUv2uANmZQ8Cyhc3Xky3ECTxaaTUId4fFEox50yYuP0CxHmvRbB/
	+FTPPjHfhAWvDKq+crOY86G96tdTB4jpPKqCZANAA27/8za/+PJmDnaLotLICMydZYiF
	RUCaap5I5hiDScH9MxSX5rWh1AR7N6k1AZweGCvMAjUTAMkSUXl/D/pVPBpltv7UY5RP
	RYdA==
X-Received: by 10.15.61.8 with SMTP id h8mr6860611eex.33.1365610496666;
	Wed, 10 Apr 2013 09:14:56 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id d47sm673685eem.9.2013.04.10.09.14.54
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 09:14:55 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Apr 2013 18:14:18 +0200
Message-Id: <1365610462-29689-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
References: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQl0PPM6a1AS6kGt4vv7Gv+gS1OS6tB1+xcfttCXP7RMODrHiCBTUWxV+krBcfIkHmzhZLoy
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 4/8] gateone: fix html5 feature check
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
X-List-Received-Date: Wed, 10 Apr 2013 16:32:23 -0000

The BlobBuilder and Blob checks never succeeded, even on cutting edge browsers. Nudge SRCREV forward to drag in those fixes.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-connectivity/gateone/gateone_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
index 652876f..8133cf9 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ee5b168fc7de89a0cadc49e27830aa2c"
 PR = "r9"
 
 PV = "1.1"
-SRCREV = "bb74e1095adb66b04b51ed6ff10ae0aa96afdd46"
+SRCREV = "ea5db3dcb3bbbe445ae6d1a5611c1f8d547c57b9"
 SRC_URI = "git://github.com/liftoff/GateOne.git \
            file://gateone-avahi.service \
            file://server.conf \
-- 
1.8.1.4



