Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 962C37259C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 09:13:21 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id y19so16860039wgg.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 01:13:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6YtigiN+LEiZP4w9R+DGtzKzaRorXDqmG5mqAXI3vrg=;
	b=OeKldQjbOcOpkjiK2FugODrL9nXwg26hgJUbFnKr2wYyPMPkARAc+Flh1DPXKn3pnW
	dssopnbUCLeORDATYNeH0L5+xkxdpLsRR4CBwuRndaqRSDZfm1P2laACj6tjCxPSg3ye
	B4Of+PRh5qsWrE9Eeg/r7HOnUwotlJsfEJiLsKqo0JjrkqgFENfIFJff4g8860L7Bejp
	aSUHiG3FyRV1ppBhjlFIF8gDJitbq4TIDwE466IR+rWklFlxvvgSIcNNilaWynFkj3aS
	LDw3U62UtJ/Wr8SuvZtszipt+70j9viP8AQhqQ+7q5MqYbxPgqyDjMH6ZY5mEZWW9OwB
	/rIw==
X-Gm-Message-State: ALoCoQlpHOaqznjz0Fz6ImvhIY+QKo8xYpEnbMUrGwD8CcprFOMQT1NhEqv0mckAGBcE1tIqJqW/
X-Received: by 10.180.103.6 with SMTP id fs6mr2838243wib.11.1418721200637;
	Tue, 16 Dec 2014 01:13:20 -0800 (PST)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id d2sm309403wjs.32.2014.12.16.01.13.19
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 16 Dec 2014 01:13:19 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Dec 2014 10:13:13 +0100
Message-Id: <1418721193-12130-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gumstix-community] linux-firmware bbappend: remove PR_INC
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Dec 2014 09:13:25 -0000

OE-core errors out nowadays when encountering it:

ERROR: Use of PRINC 1 was detected in the recipe
/build/jenkins/angstrom-v2015.06/machine/arietta-g25/sources/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
(or one of its .bbappends)

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-kernel/linux-firmware/linux-firmware_git.bbappend | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-kernel/linux-firmware/linux-firmware_git.bbappend b/recipes-kernel/linux-firmware/linux-firmware_git.bbappend
index e632dbe..6d656f0 100644
--- a/recipes-kernel/linux-firmware/linux-firmware_git.bbappend
+++ b/recipes-kernel/linux-firmware/linux-firmware_git.bbappend
@@ -1,5 +1,3 @@
-PRINC := "${@int(PRINC) + 1}"
-
 do_install_append() {
 	ln -sf libertas/lbtf_sdio.bin ${D}/lib/firmware/lbtf_sdio.bin
 }
-- 
1.9.0


