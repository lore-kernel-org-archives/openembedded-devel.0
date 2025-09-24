Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA242CAC5A7
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 08:07:34 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.7404.1758701250628718487
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 01:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=o0eIkxot;
 spf=pass (domain: linaro.org, ip: 209.85.208.170, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-368348d30e0so33339221fa.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 01:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758701249; x=1759306049; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aL8rqdZZRFWI/tk59I6CZ6n0N2XRZN73y4dR0JZRIMo=;
        b=o0eIkxotZ9KF/TD1BUZ6YuCmZjHrqCv14sLgORBiPyVuAYw7KujvTnyhsIOPV/I+6F
         aPF8Yn9QQAwo+KziSY9ZtUpNTaRM8k85h4qzD/YYxvkr2rt0jsUeD7VtxOluGuHw0mx8
         n9iNlOvRTVDcFaX5bVKmYJcNmj7vsKvXTemPu+8yF4i3oKKR3FbbJf0Eue/SaxghlZ5X
         T3EkX0TQwNppfwri/cZgNZn3ZsMBk49MwSsxkKTP43ZUUehvQqjZcfrSX0gGPSweaMhs
         V3FvbOgMlntR0gyxCKmAepdjNuoUilwaGZ9SaircLpSFoG6sFUB2stz57fgvowzzSaBv
         g3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758701249; x=1759306049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aL8rqdZZRFWI/tk59I6CZ6n0N2XRZN73y4dR0JZRIMo=;
        b=wxU28aPcSL7XbgCj3CSSg8PDNZpXM9FKfEpcgmCp3HqvmAsTrDpcM+bHzS59M4kmEy
         oFVaZFOWeZ+9V1L3XbCxjWwlDeXC4pavTcCC/A2RVh9KMsU+SE/YkUuy+9NBfLc50m81
         aao+JOF5n36tN33vST88W5G9E4oQoBIIWSQXulgvPA95QeHig77QfNUG4Cw0fZqzqHV7
         jBIx25/lJS5ndFmhXKdm0pQi15XO5+BbvgphiSC/IAdQOQgJZkIPmkwv3YowEzF9DEBq
         0Jxyp9USMX+lo5lERDnEA/h81zCxeMsqKYmo3109wRDuHZ595QY90TSWUKBkbyqH3R/r
         CWLw==
X-Gm-Message-State: AOJu0Yx8r0QYpiruvv4f14pmetAY6N1W7QLp7bSHAo4UY/WWPWG1Ve0u
	I+AlSkvArftJnAiLJjf2AsAr9yEje8mS3A5uCAIIw1nc/7iLHLnIbXfBfu2oRkUBu2Q=
X-Gm-Gg: ASbGncuoGVN+7zQSOn0EgtM/K+eMuul9G2upQRJjGilgMD4SHFuVYnWfsXJ0iwOsxpS
	EPiSNWZpIMmo1z3vlxTBjF2AJMkSwMSWDanhleB9wtb0eeF9YpAjHK6iryherA42Z7Jhy6eFiZn
	xHr6fOt/LGZeQW+4ddv6U5kBoTSZun5pkbdwTArpsn0toVJVtuAk0igaGAQcfEsWJ6bgqEe3I6+
	cya+Fp4jEfJnwGsbkVCqtbcueiCL/qAwzpewOl/Y17RXrRh/Kwq/CjGq4BVZz843VJMZA2rqpwX
	5Zk9eJCX3UlKtACGx/2v6P0726ux2n4NIVLjabmrNd16pSgIygisw7lvpye6v99DcHWmBvgpmY5
	P+S6hD+hnaJmAMuogOIBTpqC79fvYwlWajqdDoJxS7ylkCzwwSh84xPNf
X-Google-Smtp-Source: AGHT+IFHlIIizoJ+yqtLpI473mhcRnBQ701E/3ctMN/p05rSwTuPakxEhyKEuw02q/FlN9KE1FfibQ==
X-Received: by 2002:a05:651c:20db:20b0:360:7f42:a99f with SMTP id 38308e7fff4ca-36d16bf79b4mr15355911fa.22.1758701248715;
        Wed, 24 Sep 2025 01:07:28 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a8f564a3sm42623761fa.41.2025.09.24.01.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 01:07:28 -0700 (PDT)
Date: Wed, 24 Sep 2025 11:07:26 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe][meta-oe][walnascar][PATCH 0/6] cherry-picks from master
 branch
Message-ID: <aNOmviT5mxV1tTKU@nuoska>
References: <20250924075643.2047506-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924075643.2047506-1-ankur.tyagi85@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 08:07:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119763

Hi,

Please take "fwupd: set vendor_ids_dir" from master branch
as well to fix build issues with fwupd.

Cheers,

-Mikko

