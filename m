Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BB3C88E64
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 03:13:22 +0000 (UTC)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12167.1789355598072692803
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2026 20:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PHtlEb6Z;
 spf=pass (domain: gmail.com, ip: 74.125.228.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8692a856865so1917553b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 20:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789355597; x=1789960397; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJhHMu3WP5axg6wYuj8RUCpXRPX7Im5vhoWxE50p1ng=;
        b=PHtlEb6Z75702p9ewkIMOhrx1OD1HLxFGjrblTCl8ICwmG7gJMSCHu8NtmASutugK/
         zoee1bO60UFK6GGdWpG/D8qtK/OxH7WL34KLoLsi6btFQpajr6kDHimjDLiemLeg5bXm
         Z9WDUfOGVI9c7OhLyWwtkCBWh2CMnzmkoolacAYx3gCRtcSClLZdygQkaESG1xcCjH+n
         FBut+oRpEdHRCokO96eI/yNyYDI5fk/+22Kv0AxhVdQPYxASNFgWFcCjhlF088qJ8WKm
         PDq9qiuTrGAmFfKtxrubBFiQbJjRYm7W7t8pyi16ZvSSJZJlHkivNpDeymgCa1W24FoL
         DYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355597; x=1789960397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EJhHMu3WP5axg6wYuj8RUCpXRPX7Im5vhoWxE50p1ng=;
        b=ISmAmm9ocHI8AlQMMZAPLttI5jbbvTrgRSMdSCvm4L+6EFNB1Po6Jro4eGQFkqPP8M
         IIHrkqM042CFoW39LQApoTgjauDPFwV5bZaDtP8OhBMrVJTkePy/FbdC5+r1YFmQGj9V
         2gKxb3lNv4XeSXWW8owUZL5kEqkdbwa7aH8imOZXPvarBgD8+VpErvmWiw6lOO/UoVRh
         rsIh2RI5YgX5GNXcAmwAfL6I6nNUoH1i3yfzo/0StVP7YDh5xaNulBou56u+eUJTaODc
         v/07zxWJVbY57ZSnZRERMIH3R8oLKcHG56rV26Qt/M2+69S9VOFxuK9C7dUWY+qfH4/F
         UMYA==
X-Gm-Message-State: AFuF++lGB7i+uSxhR4v3tBQAW/ebq59j+7VHy+6uJyEJrIacHg/mLzwT
	OPLyo+gE9FY0RGH9TJK8ua0vTbpAiYRC3btSBz2eHCCWX3X6RqQbE7YT6x05f/7V
X-Gm-Gg: AYBFou1UZTE1tVtDB/eq4KabM7gr+XW1qwRoquNlEL7NQr2ldvPLCp70O1CdvrNgICg
	ukixe8b+RmG5q5SPLwLmqVEdezS6j7/Ql1BU0eet+O0r+7L9nyHlpd0bpLd/xdXkq9eWid72cpa
	U9DdMdL/YBEzRE0TiJBx5vThfLiyH4goLTkelmNNzwMr0YMDESJq0BkMlAesXxeE5u/lVh8focg
	nZWJUv3gZC1VHntVZkXxTC6UdMmit0zbJv/X02KpKnUoNaS6lH8bDyLPEAF2sNJvxMhHJlfT1z/
	NQrSIqD2Ds/WKe3CEJlMOIUM6hd/yyCSPKZS27eP+ek07oa90XeEYwlm+WB6E9s8UDyUdkcmXm1
	dyn7FzeoNxsRcGDjcUTNRHHSr9SrIHU6xReQ7DzSCr2wZvWSVxsMiAj5I91tLCpeD+awE0MtCUz
	tgrVf738quTY/zLptCX/w/tCidnKUfkyfcu41JkAUywHM0U/BJv5fO/YNjWJ5C7f3A8lIJtR5/8
	6ow5qCfowWKbE/A6Dhw
X-Received: by 2002:a05:6a00:950b:b0:86a:b3:fc50 with SMTP id d2e1a72fcca58-86f82e5bd35mr1911280b3a.3.1789355597312;
        Sun, 13 Sep 2026 20:13:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([202.170.174.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a2b5c72sm3712425b3a.52.2026.09.13.20.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:13:16 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 4/10] python3-h11: mark CVE-2025-43859 fixed
Date: Mon, 14 Sep 2026 15:12:52 +1200
Message-ID: <20260914031300.3677365-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914031300.3677365-1-ankur.tyagi85@gmail.com>
References: <20260914031300.3677365-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 03:13:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130012

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2025-43859

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-h11_0.16.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-h11_0.16.0.bb b/meta-python/recipes-devtools/python/python3-h11_0.16.0.bb
index ed1702ff54..0bc1cd5c41 100644
--- a/meta-python/recipes-devtools/python/python3-h11_0.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h11_0.16.0.bb
@@ -10,3 +10,5 @@ SRC_URI[sha256sum] = "4e35b956cf45792e4caa5885e69fba00bdbc6ffafbfa020300e549b208
 CVE_PRODUCT = "python-hyper:h11"
 
 RDEPENDS:${PN} += "python3-profile"
+
+CVE_STATUS[CVE-2025-43859] = "fixed-version: fixed in v0.16.0"

