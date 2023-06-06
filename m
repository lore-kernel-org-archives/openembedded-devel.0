Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B77C77B73
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 14:09:11 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.927.1686060546592360186
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 07:09:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=bV0tQFEm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-30af56f5f52so5310752f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 07:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686060545; x=1688652545;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oMx9ehn5x0JZ8nb8nA5XBWebDEMPLAoylfB6zoOa/mc=;
        b=bV0tQFEmjURw1Y5skpjxQOnYIMN31sNEYAUHKIa99zMlg47ON6tyiA6WAc+aKMtUYH
         Ivpvi7p+g/kTw6ucfX5Rtl1h3ZfUmbUjQBOfh4t0fJ5aPd04CivIOlrRpEk2aRTTRMEM
         dn8vg07juN4+eP7EQisC1Umd72tsNoirFmxlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686060545; x=1688652545;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMx9ehn5x0JZ8nb8nA5XBWebDEMPLAoylfB6zoOa/mc=;
        b=FtHjiHI/arBD5n9WCVJaWeljQRTTOyHtUudV0cDgLxnFTNVrT8ar1SckjiK43sc8XQ
         xgGroDiTXOM0jUn64RFiw3lg7xPszggP/c3u4FPHHRj/hURVB1cCveAq/+rMWFHFJykF
         heBJDjlsyvMVDzvY2SKjla6+UkVt4liylc5TEqnZWKFU30Bs9n4sAntV0PRWednWpE8h
         P6lvlh6OU76ijIGd0uBvaGKSb9oqME3XSMCRxArAGADnyOfTEWoDVD99LT9TG8LGiZdN
         qDBwmbS5tRBQDI79XikkbDmK/tMN9ahmK3ts7uG5zJ12IIQ8bdUBEv+CxtLJMLtUVA9D
         fKMQ==
X-Gm-Message-State: AC+VfDy/xQWBG7B3AQoWBIlK9iIkoweP5NoBhcyP4zwj4bcSLjxrqqWK
	GkH2P+zjEKsnbICOkVHWF8QuCg==
X-Google-Smtp-Source: ACHHUZ7YxUgboNHBC5s9QTEPsYcUb4smhDa3/Ta+232Gu0GdkcLyiPnfGQ3RZ+x3OorPtW6VqmACQA==
X-Received: by 2002:a5d:4fc3:0:b0:30a:bf2b:e03c with SMTP id h3-20020a5d4fc3000000b0030abf2be03cmr2052900wrw.23.1686060544918;
        Tue, 06 Jun 2023 07:09:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7f10:3282:4c2:7240? ([2001:8b0:aba:5f3c:7f10:3282:4c2:7240])
        by smtp.gmail.com with ESMTPSA id y12-20020adff14c000000b0030ae7bd1737sm12777496wro.45.2023.06.06.07.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 07:09:04 -0700 (PDT)
Message-ID: <0bb48a02c4a6cb40054efd4d987afc3aed6f756a.camel@linuxfoundation.org>
Subject: Re: [oe] [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix
 CVE-2022-42867
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sanjaykumar "kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
	Cisco)" <schitrod@cisco.com>, "Yogita.Urade@windriver.com"
 <Yogita.Urade@windriver.com>,  "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Cc: Steve Sakoman <steve@sakoman.com>
Date: Tue, 06 Jun 2023 15:09:03 +0100
In-Reply-To: <SJ0PR11MB67179F9E3E4E35904C1AD27DDC52A@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <20230606052015.314199-1-yogita.urade@windriver.com>
	 <BL0PR11MB34105C7AAA71C1792213DDCE9F52A@BL0PR11MB3410.namprd11.prod.outlook.com>
	 <SJ0PR11MB67179F9E3E4E35904C1AD27DDC52A@SJ0PR11MB6717.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 14:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103146

On Tue, 2023-06-06 at 13:47 +0000, Sanjaykumar kantibhai Chitroda -X
(schitrod - E-INFO CHIPS INC at Cisco) wrote:
>=20
> Do we accept the CVE fixes which are not reported in our CVE metrics?
> https://autobuilder.yocto.io/pub/non-release/patchmetrics/cve-status-kirk=
stone.txt
> =C2=A0
> On which image we run cve_check task to generate CVE metrics? Any
> image which run for all the packages available in SDK?

Yes, we do accept such CVE fixes. I would like to understand why the
tool isn't showing them too though if possible and maybe fix that.

We don't run the checker against images, we run it against all recipes
in OE-Core so it should have shown up.

Cheers,

Richard

