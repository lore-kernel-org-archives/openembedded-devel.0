Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68FAC5DF67
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:01:58 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2518.1787029310108456980
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Fng9XxXb;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-39266382df6so3403835a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029309; x=1787634109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lirNrhpP5Y/V6kQ4R19nii9S0piTDpkmy/+db9bJCGk=;
        b=Fng9XxXbaU8ivaeQPC+AGGcX3vNxYYxEhECW8rBecSlow3cTv/3k7Jo7NR9BeZMsmq
         XvbkN4LLxJrpNpVCLN4GfI+qZz0BD38OUdaVb0r9p5MjNhrTQaFNKR/7zFu2ZhsUNHmq
         E8Acg4mSnI1ur+Wx9Z/dvSMLV6bprroNNptJkThNwe4LzVdP8u2J7H2rOqUuoSk6uh8J
         2RHVWzN1VnAOzQi0I77teAS28S2Qf/b7kBnH2H33bNwKAlS4TDvhmPnGh4u2yqFN0gOG
         K/JLuZEV+zsbQGrF5cKw/Qna98hMmTwoV5L4OMkUPy34lTpw1dgtbyRqHdaZhrkbyOTV
         M9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029309; x=1787634109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lirNrhpP5Y/V6kQ4R19nii9S0piTDpkmy/+db9bJCGk=;
        b=WgtJ7dcPvL89EHUIs3ggEJdIlgcLf7KQXwBvVvzSJs2sQEY+pFPBywii9VCwntp5V+
         MAt/YL2U4ukZSMn4P7QdT/R7gP1dbK6ypkzCActMfAf3h/peWS8QTfq6J3r45bF03l6S
         zL4aOuIGL6XxiegSChNiKx7/X80RODQODy9hJLCwzWnJXkNkcVxp8Astx+vXzCj+SVe4
         +ZgczxycK7hujeYRprhFIIlpxiST6NHGh6QlbTm1poma5JnQ+LqmPC67RhvncGu9RRKS
         q5EvX2xMTBWXeyiT7X/y7X7Mkx8CzrX1DWpzOi8wvbmqEiKbw04qR0V6JYaG2ga3PeJ6
         pPtg==
X-Gm-Message-State: AOJu0YzpIO3t7cWAhCHYLKthZwr7ev3A7gsKKYzZfveeQU+2KX5G3LbP
	tVrAT49HBySrh3vkORmQMvQAFaAMR9fkrcMaJwdn2OJRK0n8T6W9N/jPF41UV+il
X-Gm-Gg: AR+sD13sgJmn0BGuuQ+6dbyfGXPbv7ILcSLpznFJ6Q7brNw6L8AzaPtSZecChklO2rB
	tx10hTLOq4icsfuy0Yy//GjW5361/2aGrHsKJAZOyWMNNMZHfD++hVmtEbUHwuUnc3ky1gzAs7J
	PMYkRgtbIgd3tA9XCQh6meoW8gXuGIZNyw26VmUXewncBcvnLbxw1X5wloq9amMkwVdte1NiTA5
	cFI0aZ9CdjlkvrW2s1kZq5k20iryEqdIb0bRkIdsPI4y99xrame9QKcN+PGPwphjFcmlf4eu1fJ
	qoXK6SvL7uA2sa/KpHmztJZxvrV/+flIQmXzmOPQ/t4l1P4wvBCsVi6wYEnNHCYKy8aR4AmIMWZ
	2WWtgW7fTQ0plcaBNSEo4uce+go+BHSeQwtju4Mlmf5vjVcbvju6BaMpS5aoCBa5IWwZ+WM4qZm
	G3XKqg7qnCi8HFO90EYGnMLGcEoDhV4pUCXIX7c31KFv4l4sXvrOQl/VTnzbcFGGfNeQ3ifiOzC
	ekV1gxT0cac
X-Received: by 2002:a17:90b:1d0a:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-3955a795765mr7039128a91.13.1787029309446;
        Mon, 17 Aug 2026 22:01:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:01:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 5/27] gnome-software: upgrade 50.0 -> 50.3
Date: Tue, 18 Aug 2026 17:01:00 +1200
Message-ID: <20260818050123.2901739-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:01:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129204

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also add UPSTREAM_CHECK variables to check for new releases.
Fixes:
$ devtool latest-version gnome-software
...
INFO: Current version: 50.0
INFO: Latest version:

Release Notes:
https://gitlab.gnome.org/GNOME/gnome-software/-/blob/50.3/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{gnome-software_50.0.bb => gnome-software_50.3.bb}       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_50.0.bb => gnome-software_50.3.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_50.0.bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_50.3.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_50.0.bb
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_50.3.bb
index 0cbf238181..4b43be9052 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_50.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_50.3.bb
@@ -28,7 +28,10 @@ RDEPENDS:${PN} = "iso-codes"
 
 EXTRA_OEMESON += "-Dtests=false"
 
-SRC_URI[archive.sha256sum] = "3515e2015f235b6abb7a342806008acb1f184c29d9c4ced3581f8ed4c1f1c241"
+SRC_URI[archive.sha256sum] = "b1318e68f02bb3902fcd8f904d56f03f534ea5098f65e4c6bb9c2c924da7f823"
+
+UPSTREAM_CHECK_URI = "https://gitlab.gnome.org/GNOME/gnome-software/-/tags"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
 PACKAGECONFIG ?= "flatpak"
 PACKAGECONFIG[flatpak] = "-Dflatpak=true,-Dflatpak=false,flatpak ostree"

