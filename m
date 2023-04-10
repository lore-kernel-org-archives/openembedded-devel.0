Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E257C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 18:58:01 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.54223.1681153080305815971
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 11:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IrQjJ8vS;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id sh8so14567798ejc.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 11:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681153079; x=1683745079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5K9bnRrci2eYUece1R+dc97K2aWiIbx4QWgQnf/gi7M=;
        b=IrQjJ8vSay+/WF1+eUJI6XEqucEdmmsjJyvuZGLSztIylQIuXXXMC3EFI/YBHTHawK
         J0Afcwd1gCJqQkeG0NKI9jY0e/fn+8hsXzYJXvPoteyqsFSMSlmlQarsj8wefrmdNek/
         57z0ykqcftWlXSMKaTn4LGn9iN+ilMrVCrLLM4o3oFJNbfBhXtFGtSlkgzrjhWughB6G
         MLli4X0QsMgrpsUskC6livfQP6FeLcybx4qALEoOe+5gvCNXXtEkpVGDBVL3GiAXmmv7
         /xYGKtt7jqjmMEGWQu8fFZzEFuBgA7LQvmPb13LLb603RKwinlPUUUnalRpuCVIT7nup
         9IsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681153079; x=1683745079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5K9bnRrci2eYUece1R+dc97K2aWiIbx4QWgQnf/gi7M=;
        b=Y6DTBUMs0I7ij7+msOd95Sq4N/d5AE/7M0URBnfxkFhKMABB4PCTPfqLgqZBqd8W7L
         BXXAy880r+O8h9en1dSAo91a2di0JvGoY38IRJ+UHzE7I08A5m0AJKlZE2/k3fDFimMN
         Y++oZF7V+LX6UpnCEEegT/jWQ2suDsuRjZ7GyR4VR6kzSjyA6rVouLg6almuhanfmAqZ
         1I6D0XPe3NqvaZu0Phri+2hxkDK53WgSkyHnD3ZhS2BHZu4Fdb8xxzRLq1PtqkaAjbOL
         K6KciTS/Q5eQ5e6hQ7wGBSgOzlWb7Rb3BG3TThe8DXJcIM0qoolc+nqr+ruUmgsmMwuI
         FNGw==
X-Gm-Message-State: AAQBX9cvjknGHrC6dc15G2Ja89D/T2ezSNKJzreoUyBAmsemhVkGZTBj
	gJP7eej0IZ9AsoRLS2K8Poy7QR8Ch6o=
X-Google-Smtp-Source: AKy350YDxyZZU3av6NmNkka0Vmbo7EQoIHTElalqJFj7hGVGewfI1IOQDzKllFbQpN6Z4g1kaMBOxw==
X-Received: by 2002:a17:906:916:b0:946:c022:8979 with SMTP id i22-20020a170906091600b00946c0228979mr7400170ejd.21.1681153078629;
        Mon, 10 Apr 2023 11:57:58 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id jl25-20020a17090775d900b0094b360a281dsm696720ejc.123.2023.04.10.11.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 11:57:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH 2/7] restinio: fix S variable in multilib builds
Date: Mon, 10 Apr 2023 20:57:37 +0200
Message-Id: <20230410185742.2416583-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410185742.2416583-1-Martin.Jansa@gmail.com>
References: <20230410185742.2416583-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 18:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102037

From: Martin Jansa <martin.jansa@gmail.com>

* do_populate_lic as well as do_configure fails in multilib builds, because S points to empty:
  lib32-restinio/0.6.13-r0/lib32-restinio-0.6.13/dev

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/restinio/restinio_0.6.13.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb b/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
index e715135dc3..03eff43dd2 100644
--- a/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
+++ b/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
@@ -9,11 +9,11 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=f399b62ce0a152525d1589a5a40c0ff6"
 DEPENDS = "asio fmt http-parser"
 
-SRC_URI = "https://github.com/Stiffstream/restinio/releases/download/v.${PV}/restinio-${PV}.tar.bz2"
+SRC_URI = "https://github.com/Stiffstream/restinio/releases/download/v.${PV}/${BP}.tar.bz2"
 SRC_URI[md5sum] = "37a4310e98912030a74bdd4ed789f33c"
 SRC_URI[sha256sum] = "b35d696e6fafd4563ca708fcecf9d0cf6705c846d417b5000f5252e0188848e7"
 
-S = "${WORKDIR}/${PN}-${PV}/dev"
+S = "${WORKDIR}/${BP}/dev"
 
 inherit cmake
 
-- 
2.40.0


