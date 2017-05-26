Return-Path: <marek.belisko@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D3D3F78258
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 May 2017 06:34:12 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d127so1667350wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 May 2017 23:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=8JH1vr0uWQOWJppXFL9FYwqkg9Fuw6ipkb3CHyrQfzM=;
	b=GV90Bs2QJMF+6ygFTLn/efc2ggcdjjLqIpsjrciSwmCc7XpYGkxiDym1SAyNBpaHiz
	XRcsLquW0bLfCGAbeJ3+OqO8jkDzUFDF4T/nyl5bmHGHCfbmJbQLNsl7iJ+puQvMrz47
	fjlfnG4nV4tGEvvSmvV2makBGf21gde/67mnQihHLPPtVYyGKyfNexRnTRkejajBma01
	AI6G0nVWM1eiyB2kekq4sCUOIUbqXTONGRpDkLmuPMb8TbrlCCETeGnKUJJA0v/rtLjA
	p+qktk9jV+7yWrUG5UMTJXuaeFe7DJE+1TQlszy0Cm7p02KMurRf02445FxRUuQrYOKm
	ZS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=8JH1vr0uWQOWJppXFL9FYwqkg9Fuw6ipkb3CHyrQfzM=;
	b=grFzCbhFwhr20P31CPrMEYyLA1H4AYYQeZ+w4wa6xt6s/ZtP/50CmhpzNw8hl3X1lI
	8ExNC+qRleQdZTNbUpf2ZzgHQ7ExTQst+WKFXE5bqRt+G5LmogcwAN6lDeYPjWwblX+s
	eTAgAgxYp1lEgHMDivz/lCAK3Bm/jh5jUqVnLmkfHTpdoJGJ0JrWekq2etwNeaLxs/86
	4fX/iOKWBUWnwDyMEMoycLdr8nj+o4gVO8QPVsT5t4XJyOp7+5wZ7np7I6m3L/c6gxjd
	u7Ta3aL1eBTjgO4CD3gYenL8MoxruZkEmvx6uRkdwVu0JGOs9tXEwY714sySavvZiUaa
	4fnQ==
X-Gm-Message-State: AODbwcCCTGlSx3x/FzumrmQfV+ZDrArnsV+LlFhbTNk8+pukeT45ehDw
	72I8P5GcLhPn/uzO
X-Received: by 10.223.170.197 with SMTP id i5mr271868wrc.143.1495780453255;
	Thu, 25 May 2017 23:34:13 -0700 (PDT)
Received: from mbuntu.sueba (81.89.61.168.host.vnet.sk. [81.89.61.168])
	by smtp.gmail.com with ESMTPSA id 7sm9530198wrs.69.2017.05.25.23.34.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 May 2017 23:34:12 -0700 (PDT)
Sender: Belisko Marek <marek.belisko@gmail.com>
From: Marek Belisko <marek.belisko@open-nandra.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 May 2017 08:34:10 +0200
Message-Id: <1495780450-27813-1-git-send-email-marek.belisko@open-nandra.com>
X-Mailer: git-send-email 2.7.4
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Subject: [meta-oe][PATCHv2] recipes-support: Move libgpiod to meta-oe directory
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
X-List-Received-Date: Fri, 26 May 2017 06:34:13 -0000

Previously it was placed in meta directory which is
wrong. Move to meta-oe.

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
V2:
Use -M option when sending patch - to detect renames. Thanks Andrea.

 {meta => meta-oe}/recipes-support/libgpiod/libgpiod.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta => meta-oe}/recipes-support/libgpiod/libgpiod.bb (100%)

diff --git a/meta/recipes-support/libgpiod/libgpiod.bb b/meta-oe/recipes-support/libgpiod/libgpiod.bb
similarity index 100%
rename from meta/recipes-support/libgpiod/libgpiod.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod.bb
-- 
2.7.4


