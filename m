Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFB7C7EE2E
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 21:42:24 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web11.7965.1677534140295884943
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 13:42:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Jp4C2c7d;
 spf=pass (domain: konsulko.com, ip: 209.85.166.179, mailfrom: scott.murray@konsulko.com)
Received: by mail-il1-f179.google.com with SMTP id a1so4966178iln.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 13:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnBiS6nlhJ0AEQnkF0eORKhchLgDF+kJ4g/7grqekwM=;
        b=Jp4C2c7dWOFhDQ0kjopbjaB2bXAQWQZx6/wkphKNyTtdhU9ZQrtdio+tEjNeL/u0/L
         QVLTnUovAlphTBZtWt2TY4KlrkCenqrj3hcwM2LAXMuHpWK7XzFg2Vo6RnOehBwWDDLV
         ubxN15QFh0eI5fLxqk4U+AdHZISVmQ12dGtfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnBiS6nlhJ0AEQnkF0eORKhchLgDF+kJ4g/7grqekwM=;
        b=7sun2003rY8HHhCtNGZfgI7/Nlx1PA+Y5LbVbCNDshxyRUVCW2yM8mh9CENgEuEuxF
         KfO3TR8U7gWh90EOiRgKsXBQQD+QkjAE2uB/vRLP0dHA4NYDNZcAzRnaneyKK/3iYkha
         VF88Y7Lq7/kh/H9Lw0r43cDPHu+tav3he1zSKWKdM9vuzqepOJlQtzq6+D+GQilqoSXn
         NtgjGguao829QhEvNydEhHKWq/i3jiIksHPotp96boFOcr3AlVAc2B+UsMoY+8say8IP
         r0N6TOn94CUny6QA9DDWKeKi+TMaoNxYlMTI8mJ6RyQo1poCu+DzUppabtgYaovUoSnh
         6d3A==
X-Gm-Message-State: AO0yUKX5yQA4X75bigzYDxvk/mgkaYPoqjSahbizjVws5zlV2rNeUFmV
	qpfRJEH8uVfDd8C0ef0IlRlG5bbNgO0t350n
X-Google-Smtp-Source: AK7set/cBPxj7XYeOwQ+zumQ9zpB8gCUSQSbMVQnnaXDDCOG95TeKZ6oo19H+fwHr6ArogUVWlLH4A==
X-Received: by 2002:a05:6e02:20c9:b0:313:f9df:2f4d with SMTP id 9-20020a056e0220c900b00313f9df2f4dmr760895ilq.29.1677534139255;
        Mon, 27 Feb 2023 13:42:19 -0800 (PST)
Received: from ghidorah.spiteful.org (192-0-174-82.cpe.teksavvy.com. [192.0.174.82])
        by smtp.gmail.com with ESMTPSA id a17-20020a02ac11000000b003c4f35c21absm2264516jao.137.2023.02.27.13.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 13:42:18 -0800 (PST)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org,
	Armin Kuster <akuster808@gmail.com>
Subject: [meta-oe][langdale][PATCH 2/2] mpd: Upgrade to 0.23.12 release
Date: Mon, 27 Feb 2023 16:42:08 -0500
Message-Id: <bf60461d5232cb7901eac4d2cc1265323c2dc269.1677531249.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1677531249.git.scott.murray@konsulko.com>
References: <cover.1677531249.git.scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 21:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101301

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ba5a86a51a459581d8f39afd95ddd27cca5def83)
Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 .../musicpd/{mpd_0.23.9.bb => mpd_0.23.12.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.23.9.bb => mpd_0.23.12.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.9.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.9.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
index e63c1b5e1..13938444c 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.9.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
@@ -21,7 +21,7 @@ DEPENDS += " \
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=v0.23.x;protocol=https \
            file://mpd.conf.in \
            "
-SRCREV = "12147f6d5822899cc4316799b494c093b4b47f91"
+SRCREV = "d91da9679801224847c30147f5914785b6f8f240"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_system_unitdir}', '-Dsystemd=disabled', d)}"
-- 
2.39.0


