Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UPxwW-0001Mc-Lc
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 18:32:16 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so317438eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 09:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=FijSjwo0KdsjfuQaAeHLvEpYj/dJ3WGSmnywVDmLecI=;
	b=GWxMRX1FU2+peHl5IzEST5kL5kR0h0P2SRBpWIiOQvpnbkY+nfe3XPqSsgD3KxT1Kl
	y0q1mjZRiRKVLXdhwSIcedlriY84nVOnJu+FKacVAOhAzaV0Y5kPLF3H8CcJK6cLSdWK
	ffuz0TPEy/+ecIyATU9qNPmdtf+e8dRjPezgveNCBZw3Jc1BqukGx6TbUCvHVURMzcC9
	Qm9QugnPQBxjbEYzd6uVhzyqIymlWDOUxu0vRzXsx0RIr54cWH24lO0QVAPifqE/LXH6
	uwrk8DEY8KtZH5D8wb9peOvRZUexFdegh0smXohkrTM8mNDlYpzsY9sQTfV7XElXDaPK
	fcwg==
X-Received: by 10.15.94.200 with SMTP id bb48mr6990438eeb.21.1365610494856;
	Wed, 10 Apr 2013 09:14:54 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id d47sm673685eem.9.2013.04.10.09.14.53
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 09:14:54 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Apr 2013 18:14:17 +0200
Message-Id: <1365610462-29689-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
References: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQk9gkjI/B89iU3i2/M5VQsgmOfj+JJjHw1KFdKO6II0q3FcTY1fBhtcWLTt0/wennYCUCeC
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 3/8] python-tornado: update to top of 2.2 branch
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
X-List-Received-Date: Wed, 10 Apr 2013 16:32:18 -0000

Drags in a few bugfixes needed for gateone

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-devtools/python/python-tornado_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-tornado_git.bb b/meta-oe/recipes-devtools/python/python-tornado_git.bb
index 00d0bbb..82a94e6 100644
--- a/meta-oe/recipes-devtools/python/python-tornado_git.bb
+++ b/meta-oe/recipes-devtools/python/python-tornado_git.bb
@@ -3,8 +3,8 @@ LICENSE = "Apache"
 LIC_FILES_CHKSUM = "file://README;md5=e7fb9954003d7cd93322ccf282210d1c"
 
 PV = "2.2"
-SRCREV = "02bc76155de5bf4dca243e4d0c019c0ac4c8b3be"
 PR = "r1"
+SRCREV = "c501917eba46dec30b1f2ef12497dffc4beec505"
 SRC_URI = "git://github.com/facebook/tornado.git;branch=branch2.2 \
            file://0001-disable-AI_ADDRCONFIG-flag.patch \
           "
-- 
1.8.1.4



