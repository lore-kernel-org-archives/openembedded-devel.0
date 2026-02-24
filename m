Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB77F4BB82
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 19:05:05 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28138.1771959897764885236
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 11:04:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LFf+ocUP;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4837584120eso41116355e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 11:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771959896; x=1772564696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ydCDIDHnyhPJIpJtD8Xdxi8SMCd+lw1zqfUxtCknUt8=;
        b=LFf+ocUPqkUD+WBStHDSUPRBKsX2yrewX34Hs/LDCYO/3WSIeooGDpztpkTrAMpVGk
         l4FAcemq7LCLqfs7doSSp41BSpMFxmAU8OfJPiyxBn3QDchRptLSmMVQqqEfJWHvGFo4
         uYo3GAoJduElmJKb/QY7qWkX2QzJggklZo+elYoZWRV0QrQ2wJoeTWBJD2C94dokaoM5
         G4OdqcnRhopffWyIaXZpoS5ZDimtCqIJhBhn2QvhBrhCkCOkkbGXu2zv2v/EAAlMFFa0
         Lu5/yAwYdGlMFlGs5RHgQ/l5GSRKURBzBPJFzUTytdPhPw6cnH42H5MMHv0P8+stRwFG
         tkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771959896; x=1772564696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ydCDIDHnyhPJIpJtD8Xdxi8SMCd+lw1zqfUxtCknUt8=;
        b=MPB6wEsMXf2pMhKBJHdPMsGSjFJcMhZPD7dLOSS8esmhM7li3TV3enkmXVtXSuP3yF
         aYpn7Ay9T2B7EgczdUXFoBGTQUnTfpVahLkNwHj0hut0kjIPMB80pmJQ5mcArXQSyNv4
         BGjfeKy7RbmyDf2sC4rBgbcI7zHwZt4MlWK3KBa3qlrJJ7YVddHj8HH5PSwK6byigW0e
         eEfXFnP87a02m/hPktK/6gndMCUOlvqCahK2QP8C1QGg30c+zjnKN5pGovUdup5zPlI0
         dOXbxxh459MYnm4iJhUSEV6NBs1rSXvs//Xnc2b1KqNZUkGZQqj7IHBA5sxAjK172CuI
         7k8A==
X-Gm-Message-State: AOJu0YxS1pBZsd+ptPJswvfCPofNS5ZC4Hknc2BrUW+y24ZXq9iDYnx9
	DTEat04NIw+23Si9HEfGi0v3PG+FJxkpqCmziGMQGd+WWX5Op9PvbJoHrwKcRQ==
X-Gm-Gg: AZuq6aKPu2lEOJ+ka8Zx2ZthbbgWqVXT95CR6/EvGhzgMuIEDeUJBBxv2cNB5eFIiSp
	TAQi+Wz7D1vAPef880Jt0IxQh+OqmrbC6mms/LGucf7JtLNOBXGiNNdVXKkZ0bN4neDyD2+0SrO
	zz5M0VArbg7g/5fOUFtCdBUOAbi6HlvOvdJ8krWLS4QpVaH463/JMoz3mzHKznKXgoB62PXUy5R
	T5N5gmeiB/S03nmOHJpD+PP1MSg4phVSxaXz3EvTrlU6oT7OUBxexfgYh5srVpUieTuh3cx+T8O
	Yc/b7dY3iN0UhGDvIdgKKVf0s1YLdvEDk+9spwAnIm8IgD2iKntdFniNNdK+yfXq9+eKrH8wycj
	YwWkJ385RlqYokLKt+gAX0L6nwpHfumMqIt6Up7CVqAt8oIdhJTvRo7t/5Imagx3CeDjYq2t5/B
	beIaA2t3hmKUdopMGy+6Sf
X-Received: by 2002:a05:600c:3484:b0:483:7f4e:fef6 with SMTP id 5b1f17b1804b1-483a95fa4e7mr176787995e9.26.1771959896089;
        Tue, 24 Feb 2026 11:04:56 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c09897sm29394920f8f.17.2026.02.24.11.04.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 11:04:55 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][whinlatter][PATCH 6/8] gnome-shell: ignore CVE-2021-3982
Date: Tue, 24 Feb 2026 20:04:49 +0100
Message-ID: <20260224190451.1596179-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224190451.1596179-1-skandigraun@gmail.com>
References: <20260224190451.1596179-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 19:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124594

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-3982

The vulnerability is about a privilege escalation, in case
the host distribution sets CAP_SYS_NICE capability on the
gnome-shell binary.

OE distros don't do that, and due to this this recipe is not
affected by this issue. The CVE is ignored.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.3.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.3.bb
index 33ba5eaa39..428717566d 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.3.bb
@@ -91,3 +91,4 @@ PACKAGES =+ "${PN}-tools ${PN}-gsettings"
 FILES:${PN}-tools = "${bindir}/*-tool"
 RDEPENDS:${PN}-tools = "python3-core"
 
+CVE_STATUS[CVE-2021-3982] = "not-applicable-config: OE doesn't set CAP_SYS_NICE capability"

