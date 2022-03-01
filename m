Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D1D5C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 20:34:05 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.2397.1646166844011782915
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:34:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EQrvD2nw;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id q11so14408341pln.11
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wec2HvBpxfc8dEoytXv2SjCv0dQgBpVo+1p02p1zE+E=;
        b=EQrvD2nwqO3D5GardjlECshwgno78g9OMEgOGUcUeVIgX232Dpql8qKX1vH3O2NlbB
         tUQuVVyDC6zRI0MwfRLF8HhRky9rHvh6kYS/UPVx7EoWxAzrY4RXL66X8xuDp7CTP77c
         6kwNjwlCztq+tqGqzyDhwQleg1k2BPvwLNawp+gqmZeajdoRN0DkRTMzUesd9cmr1bDa
         dQIzoqJt51OrnKKi7QK77SM8MIE/LnWnv5+t+PK1N7RHK93SIhKh7tDHiCUyhAYScn4B
         8gP4Uv3aZ440f5N3lMmp/+CxZ6OLWO3FbGAtj81Gkkw34JlN5ciHD5/An5JKr6RAZDrH
         Fe8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wec2HvBpxfc8dEoytXv2SjCv0dQgBpVo+1p02p1zE+E=;
        b=vhJmJ+eWer0lBZRgmC/LoJf1E3ET2sxpyQMawMvAylSSBqLiAVYLmJqOTK85zdLRLf
         qdyLNmbYzoEiQPNnO63vSPzJPX94x3i8Zj91TEbAzFe3OibboGzM5Wljxj79bVSQl4IS
         XOUppK9YneGffJc6IBjLp/lJPw+HKOm/5+5WLi9OXgeEkOOaXyH/fIh4qtpk50HyOUpZ
         UtKm8M2UwEOqfoIJzWE7gfxCBfWF9zzmyf+dXWbr7KBbZaRn9xiP2wJgp6Z9INrZEn08
         7jI0BWRjhule/r4C5Zzfjb6u+DVZ0AtFoO1h1gnKOYanMGTzPYI7YqyMhXAxHwN2at1S
         5NxQ==
X-Gm-Message-State: AOAM531/2ArdEc/pKL2r3bEswuARpGtKMLvpvqkT2GKW6EFdvlsUmtKY
	OfwAwtninn4bBz20mlynZrH+fbDgZuw=
X-Google-Smtp-Source: 
 ABdhPJxmnAP3LDQ2oFQeFqJs9+ZeAiOreF6j9kEGTN++KRzIMfbjoszlTIi0x1DG0ZsesqNYHeT8Fg==
X-Received: by 2002:a17:902:d4d1:b0:150:1d1c:30bd with SMTP id
 o17-20020a170902d4d100b001501d1c30bdmr25589348plg.1.1646166842893;
        Tue, 01 Mar 2022 12:34:02 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:b4e2:b3d2:f012:52ea])
        by smtp.gmail.com with ESMTPSA id
 o6-20020a17090ad20600b001b8d01566ccsm2896968pju.8.2022.03.01.12.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 12:34:02 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 3/9] python3-dnspython: inherit poetry_core
Date: Tue,  1 Mar 2022 12:33:48 -0800
Message-Id: <20220301203354.3839755-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301203354.3839755-1-tim.orling@konsulko.com>
References: <20220301203354.3839755-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 20:34:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95650

Use PEP-517 build-backend instead of setuptools3.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-dnspython_2.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-dnspython_2.2.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.2.0.bb
index ee670af824..cf76a142b5 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_2.2.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
 
 SRC_URI[sha256sum] = "e79351e032d0b606b98d38a4b0e6e2275b31a5b85c873e587cc11b73aca026d6"
 
-inherit pypi setuptools3 ptest
+inherit pypi poetry_core ptest
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.30.2


