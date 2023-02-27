Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2974FC64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 21:42:24 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.7895.1677534138523698396
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 13:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=h/BeIG/9;
 spf=pass (domain: konsulko.com, ip: 209.85.166.178, mailfrom: scott.murray@konsulko.com)
Received: by mail-il1-f178.google.com with SMTP id i12so4969681ila.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 13:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zQnNPmZXvN/qNsI25NH3KllRo418YKv+1oCX5lePJTE=;
        b=h/BeIG/9SJaBeYANNDfCSup09TrgXpKHjk6WJiOpbWihVSORD0CbugEqEDaCM9yu3y
         mnheXpKXa7NC7wurtHrcaDQklGlTY7/I8VJmqNUpX567c7x+NrfNMOee7flebRELuwKe
         awOOnZekfrUA94HADsVhgkRiPMqUb8KSz4wDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zQnNPmZXvN/qNsI25NH3KllRo418YKv+1oCX5lePJTE=;
        b=HPM/eTakCL3hcYQO4ZDAeDYrJIsDlJBI7YfJeZw4C1xerBhglRYq8wekhfGU2sJO0x
         7aqjfexc55TMJfZLsXfqauKxsVdV4b0XtmGAJPjSEMCD/vFS774YhFyqueQ4Y/cPKc0Q
         5C+RacYe5OIOZdfKCYXhhsgzDG0ViTDKemWRkPCVMs9zttBQznplY1fyzyQ2PHoRz3NC
         35LTXiJG+gDpC02rqbul2yCChEyohvR8RL+lOPgzDu9moY45zzJUnPkq1C6zaMH2Y98p
         4SD3At4x9qKy29Chh0AWYRTdMWsf4UkbwD7jSKs3EfjVShJESssFp+/Wps1bYE/iQxmD
         55hA==
X-Gm-Message-State: AO0yUKW0BBwzXM+zZOxs6RLk1PUa5jMHxXvbK9Kke/jOeowyvG67PLXV
	Tm8W6nrQBe46E1EpsEM0E/W1X6Y+QuVhFrkW
X-Google-Smtp-Source: AK7set8IbGwtnl61wS7URYhu3Ii0tFGutE8lQ5JPZX+Dqp+ksEqg//Cpbv0IptZQBQhz9FO2h5iT+Q==
X-Received: by 2002:a05:6e02:b43:b0:313:cb9e:8026 with SMTP id f3-20020a056e020b4300b00313cb9e8026mr920969ilu.11.1677534137419;
        Mon, 27 Feb 2023 13:42:17 -0800 (PST)
Received: from ghidorah.spiteful.org (192-0-174-82.cpe.teksavvy.com. [192.0.174.82])
        by smtp.gmail.com with ESMTPSA id a17-20020a02ac11000000b003c4f35c21absm2264516jao.137.2023.02.27.13.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 13:42:16 -0800 (PST)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org,
	Armin Kuster <akuster808@gmail.com>
Subject: [meta-oe][langdale][PATCH 0/2] Backport mpd and ncmpc upgrades
Date: Mon, 27 Feb 2023 16:42:06 -0500
Message-Id: <cover.1677531249.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 21:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101299

Backport mpd and ncmpc client upgrades to keep current with fixes.

Khem Raj (2):
  ncmpc: Upgrade to 0.47
  mpd: Upgrade to 0.23.12 release

 .../musicpd/{mpd_0.23.9.bb => mpd_0.23.12.bb} |  2 +-
 ...egular-integer-to-fix-Wenum-constexp.patch | 37 +++++++++++++++++++
 .../musicpd/{ncmpc_0.46.bb => ncmpc_0.47.bb}  |  3 +-
 3 files changed, 40 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.23.9.bb => mpd_0.23.12.bb} (98%)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/ncmpc/0001-SearchPage-use-regular-integer-to-fix-Wenum-constexp.patch
 rename meta-multimedia/recipes-multimedia/musicpd/{ncmpc_0.46.bb => ncmpc_0.47.bb} (92%)

-- 
2.39.0


