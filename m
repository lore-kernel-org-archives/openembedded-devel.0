Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A00D6ED0F
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 11:35:32 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.8794.1732188925587781827
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 03:35:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=GXvQdwBR;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53da2140769so819821e87.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 03:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732188923; x=1732793723; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6EJKpqGCxtud2DAGWp1jd/rCXIsi1qIDcVQqqLwJ4Z0=;
        b=GXvQdwBRakDo5qOhBd0KeRRucZhO4V5NlG6dJtP+HXbGW5GEctVnHc2gMjclpFHdb8
         WAB6KgiWYRSbiEXNUh7lf1Yr2xbKptLSRZFt3TyuCLyQ1R4f008Ng+0tUKzT3mUk1AuE
         FobeDOmghooS26RB+CWHBXoTwqIhnEEgHBafo4h+ORAUU42zy3KPMHYFYT5DuiUTDiOX
         zMSq2Iv/4WD73537RE2SxNGm6fC4fXiIu4vkKYfg5WktN9Dxl3qzPLxlWCe578R2QKUb
         fyj8zTcn+xbs5v18Obwpj+uFD45iplP86eE1P/mrX9kX2uIAIJQs1gvrVuBLilYbtBzd
         efcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732188923; x=1732793723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EJKpqGCxtud2DAGWp1jd/rCXIsi1qIDcVQqqLwJ4Z0=;
        b=JlN6WDv9bgChsf02ne1QXiHz9HjDIPl7VsZcHy4n9vCxfmQOeOesKDg2x2yq2xCVyu
         ntx6F4OibvEgJQ5fKYx+hrWaqOq8FO6fLKazw4CFaz327h9Z6kW7Bkn4qgZgKzc8byCt
         H7fYCf0FqqRlObTcWZsXBvebvLgDtWkhjTnByVc/FG3NOk6hYhjXp2OwX9KdyplLd57p
         tW5FbZofpF2UgeMBi8UJXW7/M7glcD0wETEyFYCbSQLN72LLRmcW/ubIVhT0wziPhpIL
         lVubn+x1PwMPDqLkuV0ecxePmxzkIGx0ec3epkCOgHslvn9yQWc+Qk0oNawhMjEa+MAG
         kIxA==
X-Gm-Message-State: AOJu0Yw5NDEFFNdcF+Z1fre2NSXb8syOG/8OzP0+X63V3MnCDmUIAHRl
	Rxe3YTFn81D2EixdDDJRVhNF6oVSFShVYFkFaDR5gXKwsjiIK3dQxUqlM33+7Ls=
X-Google-Smtp-Source: AGHT+IFRLcSozliOtw1bnf7VvfcAu0qHf9kfp8yQur1nJlGfsxdJX8ZQaqaTE9kdovTS/pfwvHG4Cg==
X-Received: by 2002:a05:651c:90a:b0:2fb:3e01:b2bd with SMTP id 38308e7fff4ca-2ff8dc716f0mr36785801fa.21.1732188923463;
        Thu, 21 Nov 2024 03:35:23 -0800 (PST)
Received: from nuoska (2001-14ba-7452-eb00--183.rev.dnainternet.fi. [2001:14ba:7452:eb00::183])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff69959a25sm18682741fa.47.2024.11.21.03.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 03:35:22 -0800 (PST)
Date: Thu, 21 Nov 2024 13:35:20 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: antonin.godard@bootlin.com
Cc: openembedded-devel@lists.openembedded.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [oe] [meta-oe][PATCH] cryptopp: add a recipe for version 8.9.0
Message-ID: <Zz8a-A4l-GJDtOJ-@nuoska>
References: <20241121-add-cryptopp-v1-1-36382a60cecb@bootlin.com>
 <D5RTGU2DZLNI.IOI1OVBS2LOS@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D5RTGU2DZLNI.IOI1OVBS2LOS@bootlin.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 11:35:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113968

Hi,

Would be nice to have the reason why this is needed in oe-core in the
commit message. As dependency to some usecase or recipe, for example.

Cheers,

-Mikko

