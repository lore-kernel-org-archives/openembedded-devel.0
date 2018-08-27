Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id DF67260721
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 17:48:06 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d4-v6so8087718pfn.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 10:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=k7GT3pUuqjDe3ThDBARv43Ii73ofCRWXnpQATZug/xA=;
	b=Zh3jM9M52wuKtlWRIF5E3PEEQ6JVqIeSd2d+05r3WlDgfg2akt8wOv6NO/XD789rpW
	7hp/LyRjd0RgENW2pV4GxusELP/tBW3HHgNJNrPpNyOd/ZWFAJ5cyeKhG8bBWUJxk9jR
	pDywFVAlNnMTD71H9cqNIZ5E8po092/XYPmscYxt66kT+BcXiY+Glk8AfvkXNCJZJjxf
	Hd52xUYl4ZVfOXO9NIW0rW6CcbJGKadJr7pEhxHdcNjNzrO6igAxL1NAUMErvjlMqQTh
	T9xQtpN3pwsCeerhvE9u5j2OhFqrrVNyExIuMdp0nPEbJcb/kxG+mapFKgn6+SsWEfDM
	uaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=k7GT3pUuqjDe3ThDBARv43Ii73ofCRWXnpQATZug/xA=;
	b=EjXPDF1RWm+wSjXakkV6V+vgKler7iUliegRVJG4o08fOUNOfpjkHE2X0TW1Td9SyW
	ZlrOpIgXQ6JAsnrEcRavepHiM2xaU1WRNvZMh5cwTN23vpj+On29o+kdtBfV/8yFf+9y
	xAWCA0HZ7vBhpMhYQ4Y2mfJ93r3CPkyP7pr/8FmJ2ezSXg8X7p5IjQNhlKwYO8R7FH+U
	/WkuvJWmEZl2344eMVpjXA3LXiGg63I2E9oZx9nE5+vw7B8m3T3DA8xwEGGn0nO7mdZ5
	VW8y2pbuEXXO5imufptrYBrDR6JJJlxHew1bD+Fxxch6bDJEX5rotfXXAwZYQJoJnAJQ
	USGw==
X-Gm-Message-State: APzg51DD5ZeUdN7OxMc5Xf8ZS10U56v4GWjS8n7VoJCHvx64VMpBZeni
	nLmP8uD0jpu4A9d4yOvUVHq7rmzL
X-Google-Smtp-Source: ANB0VdaiVEe6+dHIYwXo8oR2Sw2T3r3jdWjVetuj0Jo/VTkIAQ0MzN3YtZvijxmFkcN9er2TSjtZ3A==
X-Received: by 2002:a62:f5c1:: with SMTP id
	b62-v6mr15609746pfm.158.1535392087771; 
	Mon, 27 Aug 2018 10:48:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	u43-v6sm24454446pgn.81.2018.08.27.10.48.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Aug 2018 10:48:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Aug 2018 10:47:54 -0700
Message-Id: <20180827174757.7027-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180827174757.7027-1-raj.khem@gmail.com>
References: <20180827174757.7027-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/5] can-isotp: Upgrade to latest
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Aug 2018 17:48:07 -0000

Fixes build with linux kernel 4.18+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/socketcan/can-isotp_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
index 3c019eb7ce..6ce3cab112 100644
--- a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
@@ -1,6 +1,6 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=72d977d697c3c05830fdff00a7448931"
-SRCREV = "d1248b0f22ea8dc3b9d84a61bd35a83309bdb4b4"
+SRCREV = "6003f9997587e6a563cebf1f246bcd0eb6deff3d"
 PV = "1.0+git${SRCPV}"
 
 SRC_URI = "git://github.com/hartkopp/can-isotp.git;protocol=https"
-- 
2.18.0


