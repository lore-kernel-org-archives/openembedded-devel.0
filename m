Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B08CC3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 12:50:21 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.13613.1720615819972402271
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jul 2024 05:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b+/CdL1n;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4255fa23f7bso42141295e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 05:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720615818; x=1721220618; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uu4/lwf+rRz26unzqWhtOWn81SCv7FyVDWNSZJzP6iA=;
        b=b+/CdL1nPPe0vNfftC9i01IqZGh9rkQi6T/nr08J2pWwXOJ3mFBvD2xkOFCf+jTLk2
         WMnRwkrfdluTSwK22ScDx/WeWinnCyjn8kFi3JHykkeSbOEvC7A5zuU8n3TQ3N+vnez5
         HSz6MakRnEFXfRw3uc0c5ubvQLme945ne/YIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720615818; x=1721220618;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uu4/lwf+rRz26unzqWhtOWn81SCv7FyVDWNSZJzP6iA=;
        b=XQVxoRM71n/OAzebCF3/FAlyxCcpCQpqLwBrum44gtTE1DnhS2plSfLLRbJlk0FmPP
         3MbBydpTbFp7JKP2sBfYzEgtoXIRJ3z5LF09HdYnmSSL6UDf0rHxcmH3EIcxcrDPGAe6
         q6KlHWi743j1LtsupbAIBc88bFXSHRyxwTHz0ME8h/iniad4YcoeEU5TpPeFfGlO7SDU
         weJKE42SJT9Rzvu5N8IuedchJZ7qsU17bTwqlWY65nZee4SUHs6L7GWQOxqr4vf7HYxc
         qF306DEtrchiwOXisQsOhjVaG4Bb8fTwZZN191oL2mwJCCjpJGZHVpEGzzY8eOs31n0c
         jpSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUioDTgsZ74w86eU/tVbyhX27WUNB1cZ209IGs0E0gE6falbgvvujmie/vCIPJGucwadE49IUcb1+nWYoaVvrFEKThWl2Xp6/13y1RdjjvSUi5+VSpe+k6BIw==
X-Gm-Message-State: AOJu0YzlRrbbSTxW1sjJtd7FQXRFeFMOOnfTJNL00RGs3BhobGBDbTKo
	wWW21YklgPf+1lUKLpAYi/Zrkkyn+9SmKDd5jBDI06sedNTTAeLaRuFlnoNCKaQ=
X-Google-Smtp-Source: AGHT+IE8vUgRibQLTpvBr1uJ/nucJFiFksiM/qHByeeyzhoM5hN7vLLRsiYHSndWV36E95qIpUtldw==
X-Received: by 2002:a05:600c:4e8a:b0:426:686f:cb4c with SMTP id 5b1f17b1804b1-426707f9067mr34285235e9.32.1720615818256;
        Wed, 10 Jul 2024 05:50:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:40c6:a25f:553:e199? ([2001:8b0:aba:5f3c:40c6:a25f:553:e199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6f1ff9sm81873475e9.18.2024.07.10.05.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 05:50:17 -0700 (PDT)
Message-ID: <4272f43ca7ff59832c643c60cd1ecb4f0e78513a.camel@linuxfoundation.org>
Subject: Re: [oe] Reports for CVE triage
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jacoba@thehoodiefirm.com, openembedded-devel@lists.openembedded.org
Cc: Engineering <engineering@neighbourhood.ie>, Ross Burton
	 <ross.burton@arm.com>
Date: Wed, 10 Jul 2024 13:50:17 +0100
In-Reply-To: <CANgaEnLXUKjX-V65zJ3mhugd2f5CKJpBzvgLzPeaLvOPYoF9Kg@mail.gmail.com>
References: 
	<CANgaEnLXUKjX-V65zJ3mhugd2f5CKJpBzvgLzPeaLvOPYoF9Kg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 12:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111298

Hi,

On Thu, 2024-07-04 at 11:02 +0200, Jacoba Brandner via lists.openembedded.o=
rg wrote:
> This email contains a review of the remaining CVEs from the status
> list:=C2=A0https://autobuilder.yocto.io/pub/non-release/patchmetrics-meta=
-
> oe/cve-status-master.txt
> This work is done as part of "Milestones 3, 4, 5 and 6. Triage CVEs"
> as stated in the Scope of Work with Sovereign Tech Fund (STF)
> (https://www.sovereigntechfund.de/).
>=20
> The reports are saved as HTML files here:
> - Milestone 3:=C2=A0https://clients.neighbourhood.ie/yocto/81-120.html
> - Milestone 4:=C2=A0https://clients.neighbourhood.ie/yocto/121-160.html
> - Milestone 5:=C2=A0https://clients.neighbourhood.ie/yocto/161-200.html
> - Milestone 6:=C2=A0https://clients.neighbourhood.ie/yocto/201-221.html
>=20
> The reports contains a review of the CVEs including the following:
> - Package versions affected
> - Current package version on 'meta-openembedded'
> - Notes on how the CVE can be addressed
>=20
> Please note that for the CVEs marked as 'invalid', separate patch
> status updates have been sent to this mailing-
> list:=C2=A0openembedded-devel@lists.openembedded.org.
>=20
> The collection of all emails we've sent to NIST are saved
> here=C2=A0https://clients.neighbourhood.ie/yocto/NIST.html
>=20
> We can also provide this in any other format that might be convenient
> for you. Please let us know.

I had a look into this. Firstly, I wanted to say a huge thanks for
working through this, you're doing a great job! Getting the status of
CVEs sorted out, particularly the older ones makes a huge difference to
the clarity of the security situation of our codebase.

We can see the status of our codebase here:

https://autobuilder.yocto.io/pub/non-release/patchmetrics-meta-oe/

You can see we've gone from around 271 CVEs at the start to having 136
currently listed.

When I looked at the list of open CVEs, a few did catch my eye,
particularly the 24 still open against imagemagick.

I can see many were already excluded in the recipe, based upon the CPE
needing an update and I appreciate you've sent emails to get the NVD
entry tweaked:

https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support=
/imagemagick/imagemagick_7.1.1.bb

In your report for milestone 4, I see CVE-2014-9822 has a CPE sent for
it:

https://clients.neighbourhood.ie/yocto/121-160.html

but it is listed as being an open issue in the metadata. Was there a
reason we don't have the CVE_STATUS[CVE-2014-9822] set in the recipe?

There are a few others that are probably in a similar state to this.

I suspect there are a few details we need to tweak just to fully ensure
the reports reflect all the good work you've done?

Thanks again for the work though, there is some really great data here,
I just want to ensure our metrics fully reflect it.

Cheers,

Richard


