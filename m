Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E647C9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:50:53 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34505.1790506250479320365
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SlPyuz4r;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8631d0023daso1060949b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506250; x=1791111050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UdP+ooFWkzDl7kqxaPro4ocNwFluNQG6uVPOOt+v//I=;
        b=SlPyuz4rR/YD1tAJ6Rjs9Vtl5THSpIk5ga3x3Yu8pM0j3n1TCTrK38sIevs6Bvop7m
         FZkxQP1/i4U6LTLK20lYgq2oxf/CLUEpRCiPyssw6Nm/FRtKxKnk9ITntuYSJiMmoxcu
         utuVtiEsgZ+tEqa4JVYepgsyXKA16tszJsh+wr16au3tJOU7E6eMvEE0bNrzrmbSjoLM
         y0tiSzSMSvAvKkMayuldS2QGSC/SitRQj8CuVJld5/lGmJjn1/pvUiitKFxtDjb+87cG
         qe53k66bubuDmDJD6FLLyIN8IYGAVt+uHD4aeOojnH3tA1X4ee7juCZXRx29T4+xF2RU
         hEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506250; x=1791111050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UdP+ooFWkzDl7kqxaPro4ocNwFluNQG6uVPOOt+v//I=;
        b=R/g67wlgan3ake1RF2LUSbUqWclX7zt5f/F+T3VXp5YnpJyJdo8Ic3qhr3hqkKkWHZ
         MVEEgjXCgqJk+APv7lIn377jPRy1hdyXG/q0w84Bj1/d9KqQ75eYPlNR+45tQKEdC40C
         GCZos5baymIGlGoTF7nnftFesemXA+7pdEzKOu/rOE0LaErvQkAjni0paut8FSLklH0x
         eueR0byCMFXoOFdGKfkyZ0pOmfR/qyaL57zwkqR4o0b1ooHUbtOW8Gdun5D0sUq27qoe
         FjPWI3hPhN2zQb4c1mNCm4u/odF/4En6g7y66zitgIbSjheUiUfCgP3Cm56P2chkGM1E
         XUyg==
X-Gm-Message-State: AFuF++kaiMpbabfkkqhjk/sFt4yB/XZFrPFoKTF+B6XnZYgsLYmQkVG1
	BURNKJa14deKrFHbc8NExEJ9gr8za4GUhsRihvXyWFe/75qPvC17hWlk/qkojg==
X-Gm-Gg: AYBFou1njGmnqIDn1Z+dPnD3E7/jPUwvakrpG+u2zN0oky7WRnwaTSud9JfuDcENBvE
	0e0UF3VJc58N3QLTn9Ix8MRvujd6c5MqHPJXxBRuXSU68xFvz9dmY6vkbhfsbpR8oydut0TD/m7
	BlYbEeYZZIeHyyVhCV4GoY5J8kdyFzezpxCTQYdjdlPyjIB2nAxbGiiOp4R322DiqnlaOjXzokk
	oXaVl5rzklXY5BC4L4ixt4QHe2JKIjMtI59FiISfchQ2C6VvHY4lHw2ZasqnkbEMl+H7r8rbsDu
	3jgjtMZYV0Gr+FsmT2sag01SrrgBxe+Z97kaSH6ktGNVTigD2qpd/LhToHtoKWsk4kiR9F1XlZq
	WA3Hz6d4TbDfBS/LxNbDwY93OCHo4q+r+zPnv300selQ+C0IMNESLogLwnC35jC3nywseN6zfRJ
	A4XwNbeXyLU0jOqet0v2AgfVdxEYELTprFDZdRtSo4EPWlYYPfJkccRYzpaKfBziXFTrn2sJI8d
	Ph8soKn+6YPuE+Nfb+pRoKyM6X7QvEgSg==
X-Received: by 2002:a05:6a00:807:b0:881:e626:74b7 with SMTP id d2e1a72fcca58-881e6268a39mr1972218b3a.49.1790506249814;
        Sun, 27 Sep 2026 03:50:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:50:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 15/35] cifs-utils: upgrade 7.7 -> 7.8
Date: Sun, 27 Sep 2026 23:49:42 +1300
Message-ID: <20260927105002.1832451-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130349

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../cifs/{cifs-utils_7.7.bb => cifs-utils_7.8.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/cifs/{cifs-utils_7.7.bb => cifs-utils_7.8.bb} (97%)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_7.7.bb b/meta-networking/recipes-support/cifs/cifs-utils_7.8.bb
similarity index 97%
rename from meta-networking/recipes-support/cifs/cifs-utils_7.7.bb
rename to meta-networking/recipes-support/cifs/cifs-utils_7.8.bb
index 51475bae77..7fe76377e1 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_7.7.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_7.8.bb
@@ -4,7 +4,7 @@ SECTION = "otherosfs"
 LICENSE = "GPL-3.0-only AND LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "3a7dc396306654aa225c35767e56ac1fb239922e"
+SRCREV = "be9d47cc3c8f3842e8c6418885525130eeae87ed"
 SRC_URI = "git://git.samba.org/cifs-utils.git;branch=master;tag=${BP}"
 
 DEPENDS += "libtalloc"

