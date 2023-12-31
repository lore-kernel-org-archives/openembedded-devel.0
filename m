Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB61C47073
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:39 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.198915.1703983117555143017
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cN1GQtgP;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-35ffb15244dso44077475ab.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983116; x=1704587916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=piqw2axu+C0UU8wObjmhpDGvFshih3jrc8usxv+USaY=;
        b=cN1GQtgPTgYPN+vXVRw8/IoaxfYV0fUWk9pU/8Z4rtgMMudI9+mcu1Jh8tiNd97uC9
         SKI0syv6Hy5hbiVjt2LNnC3Zc+cgJ4szPR3hfMMxQkh6/OGIQ1SueceOIfTNuuctI8fv
         +ur0VtbgW8/b3hErrd8N3kYNHLn22M5r+LqEj1zio7jZiP+4O15bq4SKdSOJWtAF7ziH
         3uRLIZmNlYAMGeICWAMrD7OzdNN8z96qtWJAAXJfjQj/Ny9CILazD2HTUyx28hy5cJty
         sJiuHtEX8cmaLr/CxVA+K0c1OPT3jyCiig/OO4AlgYUAyUU5XBKUSQol/m73KRIQcCzA
         a7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983116; x=1704587916;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=piqw2axu+C0UU8wObjmhpDGvFshih3jrc8usxv+USaY=;
        b=I5uibNefS5QbiAnnFYt2BFFH9gzlFLmC56j7fRDgNOSTN6iGY+SSrgSZraGKha35Gc
         +vKmaSdb58RtoVyZJp9R06KcMmjuzSlCvKcEe67crQEBaJKklOIGw5pNILflrThKt2xm
         lU+Tk5B2Jc11Kh/dgQimueI2kHS75kbcuArc9HXGwjY35+bjghhsgry0azT99k6CbBJO
         cHVMqiL12orEwFhw+Au1CxYBvNs0PQpUUZePcKhS5GO8psrd6E2bd1dWs41zUJr9xNpS
         kxlVNxorN91TzkIW/M2niY83i+UQBT5pcLbi4pRnkfc48NHozeO+Q+AahSehtKXcJTF/
         RK2g==
X-Gm-Message-State: AOJu0YzYwhD0+ZO5pO1Rnht5kOMv+Qku5ZOba+L1+GvyYUZufSYZKDo8
	LcfqOvMH1JK2dldLkg//kveh++62uvs=
X-Google-Smtp-Source: AGHT+IE/7RPKZyp30wWHQBAYkBrxAz5AGew2j8S2ab0T4mpoJD4GVitp0IuGHXyXVC/tSXCiOA6B1Q==
X-Received: by 2002:a05:6e02:1aaa:b0:35f:fe74:2cc0 with SMTP id l10-20020a056e021aaa00b0035ffe742cc0mr16151616ilv.18.1703983116582;
        Sat, 30 Dec 2023 16:38:36 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1703575902-13390-1-git-send-email-wangmy@fujitsu.com>
References: <1703575902-13390-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-ipython: upgrade 8.18.1 ->
 8.19.0
Message-Id: <170398311569.873206.16479784299158015751.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:35 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107932


On Tue, 26 Dec 2023 15:31:42 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> https://github.com/ipython/ipython/blob/8.19.0/docs/source/whatsnew/version8.rst
> 
> 

Applied, thanks!

[1/1] python3-ipython: upgrade 8.18.1 -> 8.19.0
      commit: 3225a285e91d93f0dfc354ed3e040621fe8b7397

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


