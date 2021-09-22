Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.971.1632338566078329073
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fenjBA7E;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id w8so3795269pgf.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5OiM9GDmWhFp+C1dYUsSTIcEcot61rNYjtD3x7WlotI=;
        b=fenjBA7EHNBQaAkS/tHI/nexx0mN2FtHAdTgZ3S4P3Czyq78/xgvqMyB1Er7oZOOVJ
         5QnpknEzWqOUvQIVsn0US5oIlieu0XlaNCo1tpCqL0CmiTnL+g4GPI14I8qw4vPokMvl
         IGa/SlaveXMyEcs+eZlumig149yVwzZExAaHXE0py1YVKamx3kQtEKkjabTecx+VkmQi
         Js09VeWlQYIun4mtPGZQetLi9+0U357QacrAA+jFjG4vGBX8rQxCNXiqeSSyoU1bNFfS
         QM2fanuI704sBjZgfCNsu51g7xjXgC30H+OKSBEJVQO7oAFfj6rLkdKl7EXnLxvRRs3Q
         7/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5OiM9GDmWhFp+C1dYUsSTIcEcot61rNYjtD3x7WlotI=;
        b=KYuU+zg3Ade66EKAAk17TpuDmdhkZ1aYMzJvytp5iPnm8yqKVNkNLIQGOtA5FNVgaY
         6dIZAWzYbkMAq9iappViVtXOQI3/biSv9/ldI8gMrZwNDkss3UpuidJcJzGlvCcX38vw
         w9LgazK7ZDVgNB0hI52Ylfc4+/TLV9hEmXmzQfyg4tH2vNCeve2mks98j+KL394VcLtL
         qHQkeFO/jBGZ4DRSWvNWZrlp9IIX8+ZfKtlOgK1jAm5q+P/ZDmoUf6rjWecA6K3sPT55
         5sFFpkkz666iVic4mqSi/vNmMeIXBpwdXC2wfsuCpfIcLQ6ThmrxIniRDRGMJfFEuvc1
         gU2A==
X-Gm-Message-State: AOAM530xtIy/sWY1rgpECHfLJ5VSyDtkJUWJGq+kAojVadVSAwjysHlH
	qKYJiiHa4tqwSbNleiwKqCufnykqYw8u/w==
X-Google-Smtp-Source: ABdhPJx/JjH5nC0biwfJ3nASEcRYCZ8I1XoRy0wtgudwzATVJZE/l2PEIxOciZriAUfaMcrED25h7g==
X-Received: by 2002:a63:530e:: with SMTP id h14mr462645pgb.279.1632338565453;
        Wed, 22 Sep 2021 12:22:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:45 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 34/39] firewalld: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:22:08 -0700
Message-Id: <20210922192213.3062719-34-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
../firewalld-0.9.4/configure: line 3408: pkg.m4: command not found
../firewalld-0.9.4/configure: line 3422: syntax error near unexpected token `0.16'
../firewalld-0.9.4/configure: line 3422: `  PKG_PROG_PKG_CONFIG(0.16)'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/firewalld/firewalld_0.9.4.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.4.bb b/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.4.bb
index 7aed5105cd..7d29bf1ed0 100644
--- a/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.4.bb
+++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.9.4.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "52c5e3d5b1e2efc0e86c22b2bc1f7fd80908cc2d8130157dc2a3517a59
 # glib-2.0-native is needed for GSETTINGS_RULES autoconf macro from gsettings.m4
 DEPENDS = "intltool-native glib-2.0-native nftables"
 
-inherit gettext autotools bash-completion python3native gsettings systemd update-rc.d
+inherit gettext autotools bash-completion pkgconfig python3native gsettings systemd update-rc.d
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "--with-systemd-unitdir=${systemd_system_unitdir},--disable-systemd"
-- 
2.33.0

