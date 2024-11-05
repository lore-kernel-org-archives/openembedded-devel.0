Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0287D33A50
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.27837.1730831901996638661
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lCZc3DDy;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e2e3e4f65dso11351497b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831901; x=1731436701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2liv2MtSp82xl1vMC8IRokI74CkTDKDkTpc09HY4EQ=;
        b=lCZc3DDy7AZqsTafokM3wqVJXX8z/vrq6YFGb9u1z69x4qt1TzOAojAyTu2u9UadlI
         JMFxL6/PQUFaszQfSaIFXcxr3dETA8XjuowiePAPA1rm+5mc7fzM1CtWsD7kgCMFdf4B
         vt0gyEBbTJ1hVGqBRnD9yXsmrEoAyIwraFz9ODykb7HBAZoqnvCSPmUUtcraesbItESt
         MtewD4SEoTpgHaH94o19DmRyfTLblJ9vEv2gSaXuQ0+Ywwukw1ii7XSXEK0K2Wv3ZUNQ
         lr/cRLl3r97bkAEVp7SUXJdTZbKTknhOCtt9r13RjrhhXMwa+uEjZ3fjLi8lUVwYTdqF
         ebPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831901; x=1731436701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2liv2MtSp82xl1vMC8IRokI74CkTDKDkTpc09HY4EQ=;
        b=Arx71gKECfoyhx/xX+UT61nAVL6l9HnJfuHsOIQZc1OxLcZJeCxLDOjwYWZUcSFyZ6
         8SLmyvnphHmM8DOQkzh0UmHd8MioTEytFxcfjZvd8v07hTHC1mumm8UsqgsVVib2S/fe
         mNMw72csBkpeESo8Fkci9ZX11pXXQuYwCNJ8V93A2Sjkmwm+PN/r3AdkXFxGc3U/d88C
         Wt9DOMFId8B+9gIt3nN9oabTS+Jdk0HxB6xPVoaU00jzOMHsghyo/hn9sKyojS2mDUX1
         4GSSUhp9cpaCxXlyJcOmpha+BlpX0i6bQs2TxfsBIogiG+Du+qSNyfZ1GitAPaGTi3n4
         b6dg==
X-Gm-Message-State: AOJu0Yz9w/hDAkYBoE2ir+iRhnylSnjBx7WcE1670iyH897+0/GqECgv
	DVq1pnyuRd03dGO7UsHJwiix4mzT186jsbBykJNJDsTO101luzyAhbdeZKxn
X-Google-Smtp-Source: AGHT+IFyb2HdpSiKedeRhzixh96CxZV12+VLG38cvc/Uy98r0YGN11bsgUL7ftNZONhui8Fh0gcY4A==
X-Received: by 2002:a05:690c:6186:b0:6ea:96bf:1706 with SMTP id 00721157ae682-6ea96bf2f0fmr77254797b3.0.1730831900622;
        Tue, 05 Nov 2024 10:38:20 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:20 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 030/161] glade: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:06 -0500
Message-ID: <20241105183658.34982-32-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113545

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/glade/glade_3.22.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb b/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
index 72c4036be..84ca98a8b 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
@@ -18,7 +18,6 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade/3.22/glade-${PV}.tar.xz \
            file://remove-yelp-help-rules-var.patch \
           "
-SRC_URI[md5sum] = "c074fa378c8f1ad80d20133c4ae6f42d"
 SRC_URI[sha256sum] = "edefa6eb24b4d15bd52589121dc109bc08c286157c41288deb74dd9cc3f26a21"
 
 EXTRA_OECONF += "--disable-man-pages"
-- 
2.43.0


