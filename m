Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.5904.1617634482261396349
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Apr 2021 07:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gmXQ7u7q;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id a12so8320948pfc.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Apr 2021 07:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=TYrUtUEl3zlMr6yghs6qkfmCGPaUspqCGYz3ihBLXyA=;
        b=gmXQ7u7qKqsQyAQfZ8fUnV0TXHtiCSe8+IOW/gNTS9X9Lve/J7+FIhIOGKkN0YD79H
         TidVwdS2o/bnhT/9eH5wGlklbt5U+iQ2719RJF6K00jjROxLKtKfv2DhQGxZnW/8i24r
         W4cg4ZKwRABEg+vFphYzWUBdrJlpfFAuSyEs0ka72eO4v9Q/leGhTufcf2f1ZMG5EpqB
         Hi2xTKogQ5VfJmRfOcVSjHW5szE+gl2iNEfvDYa603wWXDpesz+uN0p/tbLxqk5CoiOB
         EtPITaeTAxl0Is6WAir/kUQ/JRk/VOm7WBTFNeBkir9NIRFQSqdFhWp5N1VfTiCpvg4e
         8Grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=TYrUtUEl3zlMr6yghs6qkfmCGPaUspqCGYz3ihBLXyA=;
        b=JZRcJoamtgd5YPrPXwMPhUzAZXohxsOtra4s8RC9m7yJsRQu9P6/75LQn+w71Bvl7y
         7kSWw4KZlcSI1+SViG4RI3oHmljJYfTZH9reKQ7a2FqMC0pWDeBOslMfH8Q6cHOQ89eg
         dOyevUaPEWOuBfn45UphZMAb25YOPfemXZOQym/EH0m+jPvpkYHu3UNgdyXUKShOc7s9
         sTY6XOhjcEpSUlF04WSJ3BMorkrN6nyqV8oaz69GbmP9+7Y6V+JoJmbUaLsdr6mNAShD
         A8MuGoikt8MbMcSYPz3FpzO+J2/Bal4xR3lHOGJjdaXPvLTx/4K7nck8S5BnhNGJWTi7
         x0Hg==
X-Gm-Message-State: AOAM5339Er3urqFibjBr2r4npmJvQ6yBCuAUbt0YLR2YI9hhn7LfHSW1
	EwptX1oSSYcTzhVIvMTKBDTwjuya4eg=
X-Google-Smtp-Source: ABdhPJwfkN25II6ZkKYn+PFonNp5pWLvRH9FWaB9QaM0hPJU/jpXXBYYx30TSHRxp37K0VhLfop6vg==
X-Received: by 2002:a63:2507:: with SMTP id l7mr23456596pgl.198.1617634481528;
        Mon, 05 Apr 2021 07:54:41 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:cb2:3225:c999:3d47])
        by smtp.gmail.com with ESMTPSA id k11sm16501654pjs.1.2021.04.05.07.54.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:54:41 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Dunfell patch review 10/11] packagegroup-meta-oe: add guider
Date: Mon,  5 Apr 2021 07:54:23 -0700
Message-Id: <68cafb6e5e36c48e28ca8c03d4f4f0b5ba6bfeae.1617634345.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617634345.git.akuster808@gmail.com>
References: <cover.1617634345.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* now when it's not depending on meta-python2 we can add it without conditional

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 13d87a164c2..505d4efc1a4 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -124,7 +124,7 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
     android-tools android-tools-conf bootchart breakpad \
     capnproto cgdb cscope ctags \
     debootstrap dmalloc flatbuffers \
-    giflib grpc icon-slicer iptraf-ng jq jsoncpp jsonrpc json-spirit \
+    giflib grpc guider icon-slicer iptraf-ng jq jsoncpp jsonrpc json-spirit \
     kconfig-frontends lemon libedit libgee libsombok3 \
     libubox log4cplus lshw ltrace lua mcpp memstat mercurial \
     mpich msgpack-c nlohmann-json nodejs openocd pax-utils \
-- 
2.17.1

