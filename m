Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.12413.1599135308069527207
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2020 05:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=D1Zne0on;
 spf=pass (domain: blade-group.com, ip: 209.85.221.50, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f50.google.com with SMTP id c15so2929313wrs.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2020 05:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WG2HYwVxW5xLUlnZvR8prQRTG3xdwqP7dSi/PrBkicE=;
        b=D1Zne0onwLWT9NvuglGuqDwawu8Qv+axgjh9TgGK/wYPLn3gGxVZNc3yT6XGv1Iltz
         iClbuHzt/a6oeQryxASui3iShOZdHpeqzHH/8uDPVOIVy25DDRyKDySGXK3wycn0lBqX
         5AhTmN/nqOGMUgHiy5NHS5hYtTqZP4TrTvVXp4g5x8rV7U5bkUcsrafrsTTm8OJxyW7a
         UuD3IlTT5aCZkbUFN/qtG1DlFRx6ur0qpqdSDAfGNS/KOWEHWBLtd/C8w6XSjlAos86B
         qzOpY33Bphgm4WZLzjoyl60Gx9Mm2sPAI8BTNF93vUOwVjVLIYenB1gsnGxq/K3K/AO4
         t9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WG2HYwVxW5xLUlnZvR8prQRTG3xdwqP7dSi/PrBkicE=;
        b=fJROOdi6v2cGtujOz4ErMSrnKh9p1+8pk9/kF0ggBQaZBokcQfcerSicWW9Un85Q02
         rS6cxx2zOStH/LHxZ7c2fUHDiGK3p2MG6FaIdBVMlIEUXQgib8IAMfLRS2KkGfYMmR5b
         AlAiNs4On9lymrNNuHaBPsT42Mh3FTQtnzzet+C3OSyTIKnegg495oy62n6NhqvZiI5a
         vlquKmI+Hwxey38Sae4iGbSa5Zd0e8X4mdqSScKmj+dazSd/qytOpehFOfsbsGxmVvVj
         RRrXTLurIt35MP7oKGA4lPZOFDsRYEmqhYxIGWR0Hy1QHQqTnaV8IYVESNny9m2lM8c3
         nTVQ==
X-Gm-Message-State: AOAM530z6VTU35uIMJSuOhbtazbUajOP46orAjxA2BlQoucmJiG35s/3
	xMscCvliGbx6yhwbOTeG2f3Lw9tG3io7rcCW
X-Google-Smtp-Source: ABdhPJynIpUjmxb1omFJJr5ukzo90R9REtGTLPN7FFhI2Bgp6Z80+jwJVcG2+H5NHoUTAFvg7/eJBg==
X-Received: by 2002:a5d:4645:: with SMTP id j5mr2137174wrs.230.1599135306085;
        Thu, 03 Sep 2020 05:15:06 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan (91-170-159-152.subs.proxad.net. [91.170.159.152])
        by smtp.gmail.com with ESMTPSA id r15sm3948920wmn.24.2020.09.03.05.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 05:15:05 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-devel@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [meta-oe][patch v2 0/1] New terminal emulator: st 0.8.4
Date: Thu,  3 Sep 2020 14:14:10 +0200
Message-Id: <20200903121411.3017527-1-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

v2 changes:

- added to packagegroup-meta-oe
- reverted and ship the terminfo file, as it's not shipped by
  ncurses-terminfo in current versions

Yann Dirson (1):
  New terminal emulator: st 0.8.4

 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 meta-oe/recipes-graphics/suckless/st_0.8.4.bb | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/suckless/st_0.8.4.bb

-- 
2.28.0

