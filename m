Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5C8C77B74
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 18:58:41 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.52985.1681153118418951678
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 11:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=piSTXUBY;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id dm2so14736166ejc.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 11:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681153117; x=1683745117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cRCCgTpTXPe3v71O3gFnsQ9wZmzaBgDgCIQiAAKm6Q=;
        b=piSTXUBYW1bafRoBHfeNRS+A1KZl8WEU+ctvRbJTJwdP0klyDnQKowGoiDfHs2YSEp
         J08ddjEdNALekFtfqmX13Ul4pQgU/m14Oe48JyGLquHDiQJH0bH9hLrG9qj14h4KykFp
         PDFzrS4fYkeuqCf6Xs3H7dc408EX3sDSn6vzkutOWyauUz3OfRDEk/uM4xcAtMIXUQGF
         Ym7oSqAMq9RKvxeM8lnHzy0If7Li+phjaRqdBQ2fquQT1OKA/DWePmK141pO8NrCpa0F
         6lnuS9GaG3lQf4HU0p6IgzjrrMk5/RV4f0dvwnG5iw27qnkRdecYfeVIaFXpLpFYBjl8
         jPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681153117; x=1683745117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0cRCCgTpTXPe3v71O3gFnsQ9wZmzaBgDgCIQiAAKm6Q=;
        b=wggF1R6RSKqjsqNgKomHWjEh4z6WwcYYLRtp6xeuzZmQsVAhiyNMLSj/5nWdz/CjBp
         bcKdwHxZuJK2R2gTEg0D0zXOXzaGG/uAsITotEYG/MK1sim1q1z95XVPIkYHd/QqHy8L
         nzgepsXzx5r1DFirvuaR1YA9ML+IxNbwEelJV4frOmIM25VEUEccouTMtKAvOuQyuvKl
         UDtFOicTjluWX5+ejqEYAk9LROrHfs71q5Uqcr7aZOh2s2IMPGlIgDBxg6JMOSCI/zH+
         UOTqlS8U3xMULDgHz71zXG8ST2ngdgtXCFNs+yMMyRPDCJVHXVIPgjP7RASQTM14TAkW
         Izgw==
X-Gm-Message-State: AAQBX9dS7JaKRtH+kEeKkYzKivZ/04xT/IOyvTESTioQQbn40D9s3wgG
	1KEwp62ly/qf4Yg9lP0AX17ZQcxdmwU=
X-Google-Smtp-Source: AKy350aVXru4T0zq51rnpfnCkFynWwBXA93EaTGWvaTHjON2xTreXAmaxVszMFiuMwbfH7ouWsEITw==
X-Received: by 2002:a17:906:3958:b0:94a:4ec9:cf27 with SMTP id g24-20020a170906395800b0094a4ec9cf27mr5235640eje.20.1681153116751;
        Mon, 10 Apr 2023 11:58:36 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id xh8-20020a170906da8800b0094809142160sm5288321ejb.55.2023.04.10.11.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 11:58:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 2/9] openwsman: Change download branch from master to main.
Date: Mon, 10 Apr 2023 20:58:12 +0200
Message-Id: <20230410185819.2416704-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410185819.2416704-1-Martin.Jansa@gmail.com>
References: <20230410185819.2416704-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 18:58:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102044

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb
index af0a3c2bd2..6801020ef9 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb
@@ -17,7 +17,7 @@ REQUIRED_DISTRO_FEATURES = "pam"
 
 SRCREV = "d8eba6cb6682b59d84ca1da67a523520b879ade6"
 
-SRC_URI = "git://github.com/Openwsman/openwsman.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/Openwsman/openwsman.git;branch=main;protocol=https \
            file://libssl-is-required-if-eventint-supported.patch \
            file://openwsmand.service \
            file://0001-lock.c-Define-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch \
-- 
2.40.0


