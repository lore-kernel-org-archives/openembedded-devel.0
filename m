Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218A8C47070
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:57 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.6773.1702967270255441027
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EZLa+js6;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d38bedd799so32635905ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967270; x=1703572070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hUMjttaQzFzSkRLlCF9DLnPnvS9VVhAJNZScZS4PQY=;
        b=EZLa+js6dOoLYsgFp0Mg6gUT1frZqf7RikMbx/lmEmJmMoAOY78xzfZS5pkaPjtK5X
         3igGo+RemLizVf1bfi6sgx11LtmBYcOIauI9jmxax/6dgMwHPT//ho5ssjkDU/ETUmcx
         1c7r3Ypj3PAwOJPHRafyAXatIyefWKfjUoakdFXY1FRUByU7O+bx61MStPMNEtK9pw4X
         6SEzsMj0wt2gGPwe/GDLCcjM1ssIKGCAglzFplIhAE/HeIcQY+GiNtc/+fnLJglbCWV8
         trscqre/OHlMFxjYPG1/SAhwdeuReUWbx2KaByafvyb0nAQF0DKm10tnLMZdRrdgyhdI
         cP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967270; x=1703572070;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hUMjttaQzFzSkRLlCF9DLnPnvS9VVhAJNZScZS4PQY=;
        b=nuCs3EeA6ft2R7E7Ne83UawjOLo/P7tbU+IaAedlNtI62/4IYBV2g5Xb+lckOL01nu
         fpVgIyuoSLGQiB0A2v1oHryx6Yrwzb7niLanqPya/oVB6w07w4snUCsry95nW4W7sIO/
         VScc5zSerlyQ/ZEN8XFkU+7PNTVkt3GO2IAG1EkhKTceB3L080lpQxNoS0LEMhO7KoTp
         xfXWuXCJ3CIeFoYe6R8lKZyugr1OzdbkV6ilE/qA41c8mEdO1RO16opvAzYO/vn/OB1x
         Se4MMMMKObve/G4nQTLPSgKkGq0JrNTKX3sisElvIXnaOGd1WG0J+s5DohAieefXAhHo
         ourQ==
X-Gm-Message-State: AOJu0YzpDkp7vlHMsmfg4YZ56nY9WO8ggNRbQvQF6WMsLHlE0ezSeb+T
	gPESJq+HBaIe9XP6sVIY0dqtA/umQdU=
X-Google-Smtp-Source: AGHT+IH4uozvnbM7PeJbiJVRGK0QX2OMFEjnYJmmOSoPIYautuEHmwXPau+iBxinl/nf8P2VoIXYPA==
X-Received: by 2002:a17:903:2447:b0:1d3:d568:fb38 with SMTP id l7-20020a170903244700b001d3d568fb38mr1536161pls.13.1702967269724;
        Mon, 18 Dec 2023 22:27:49 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702612025-3238-1-git-send-email-wangmy@fujitsu.com>
References: <1702612025-3238-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] hwdata: upgrade 0.376 -> 0.377
Message-Id: <170296726899.1627685.3901475395968827553.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:48 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107610


On Fri, 15 Dec 2023 11:47:05 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] hwdata: upgrade 0.376 -> 0.377
      commit: 166902731656ed1a1f6fc368cea79175a6934df2

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


