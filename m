Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57FCCE79CA
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 10:29:26 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.34511.1695205766147579745
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 03:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W+qb+PT+;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ba1e9b1fa9so109274951fa.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 03:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695205764; x=1695810564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5tMr395ZuUKa/90HlcrRDcUvOgNegUhpclSqzGVdiw=;
        b=W+qb+PT+rVlkPNK/YolmnDtBwnDhPTYR6L1+x8hI/aFrTsQywz7tGeehe3lXnDdSto
         7agppsCn0Z9yFBHh/Vj/QiujBKEONru4IekKEoYRPqpfPdS4Cfz/tywmyRSq9AELzE9Y
         NO5oatexH2GZC0yMj9f9Z/flEtGa8Nmvi0IYTAyA+xDGBV1+il0Pv4RYL93Bx200wVaN
         dKVxjVtJbX31/Lj0byY6R+kolOtv614LHNBUSCOf6u6/bGOCXiZhJwoSMJaZlGkFrVEA
         EbC/Xo7PzEnJgCs9iA/06dEvQLAdOd3jFksIR5XEqyj8DLwRFUt/lw508SYhphb/iohl
         LXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695205764; x=1695810564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5tMr395ZuUKa/90HlcrRDcUvOgNegUhpclSqzGVdiw=;
        b=AVrrhhSHOroufhmRatUvOSVbzWF+/tmEjwQc6duushtGa0B9Rkf2BjetkNNcVTbPup
         WeILuzwOJ5z/jRbKaLlX6Bbv9CFoyae8zQ2BkMMy10ZtCudB2etG/zEoAPXOhtA5aE4b
         lGWq9Yo9bS14LmwMMVw2nqm6YgvWcgr9cc/MM/L3VT5qFDFt1wvfemmMNMckPyOLugy4
         QkHUMUdOtmrl5DLF9/o1u8rlnmxvbTKUd65q6ryghjvl5QaNZYTEbcByEEwSsX2+pfhs
         5Oq5YzZHUeHk3YrT5YVfeeBrnX5ol7Tfqo05p/lDyxo1uDvOnf7Lmg7A7h8d5VhRqhJs
         eg9w==
X-Gm-Message-State: AOJu0YwhJI84AI1nYde0ZTeDVbD9ktCfVnTrb2j5hX+CMq0dEOpUr7PU
	gN/XION2X+ALaX+o9JKg5FdNyYt1Zyo=
X-Google-Smtp-Source: AGHT+IFt3zjCBbbIO07Rnjvrkdz+y46Zs7588h1xDKq35MP02YSeMmxJ1EQMRqSz0HUfEOeCZ+eygg==
X-Received: by 2002:a2e:8785:0:b0:2bf:7dac:a51 with SMTP id n5-20020a2e8785000000b002bf7dac0a51mr1677266lji.51.1695205764236;
        Wed, 20 Sep 2023 03:29:24 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id cf20-20020a170906b2d400b0099bd453357esm9080642ejb.41.2023.09.20.03.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 03:29:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 6/6] ot-br-posix: exclude siggen dependency on ipset
Date: Wed, 20 Sep 2023 12:29:15 +0200
Message-ID: <20230920102915.1269280-6-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920102915.1269280-1-martin.jansa@gmail.com>
References: <20230920102915.1269280-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 10:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105013

* ipset is MACHINE_ARCH because inherits module-base.bbclass
* fixes:
  bitbake-diffsigs \
    sstate-before/hammerhead-halium/cortexa8t2hf-neon-halium-webos-linux-gnueabi/ot-br-posix/0.3.0+git.do_package_write_ipk.sigdata.48e7c1f619a5069d7aef82321e09d5598873d41cf561d3af1cffc94732dcacf0 \
    sstate-before/mako/cortexa8t2hf-neon-halium-webos-linux-gnueabi/ot-br-posix/0.3.0+git.do_package_write_ipk.sigdata.9e0988bdeaf607e7de39a2fc307129ef41b57170cd775805eee46f0f5f89b80c
  Hash for task dependency ipset:do_packagedata changed from 5d72520e773137ba1d716eeca111fce4355169ed18e4c81b5e5d764abf569f18 to 89ad5bdbdc7bd3fb72625cb963aff2c794da51fe2f70ecbfb34b9cff9b1b9308

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-networking/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index ea6d9c9479..2343179a62 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -23,6 +23,7 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   wireguard-tools->wireguard-module \
   mdio-tools->mdio-netlink \
+  ot-br-posix->ipset \
 "
 BBFILES_DYNAMIC += " \
     meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
-- 
2.42.0


