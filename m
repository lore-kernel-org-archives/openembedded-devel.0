Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f170.google.com (mail-ot0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id D010E78F37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 10:05:42 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id q1-v6so2268191oth.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 03:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=exArzxyBlWVgc8eksId0tQxAlzL9zp6T0q4mr/SW3D0=;
	b=AzYCMFTiSEQfzvQpzEcxMqmDtZDxG4wOY35BO/5t641MzYQuf1pu6TjOkZ3BCyVhZW
	xM1NzF2e/ckUrYIMXbOCR+RcM7JZhO+urY5wQWNBMnOUOlRV/yxIcA/2oLOBElYXfXM3
	ZY/dfMV35y4jOP7WbHZO03kr3s2EWJnROZ+22DJ7Sgb62F0+5UGMMh5d67m1yuol+lDj
	eh0crRVT17AT1DgztDkb2KlrML3HUENwK/NP9Z6TXcMEvWv2hxAzm41ScgDuHwZpjgV3
	ksKBZhUi1Eqe+r+MWwxr76CKYguJ6wNWz/j4VjkOMSfdGRlsi6jc6JAUmMNPP3JQ9fsp
	uH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=exArzxyBlWVgc8eksId0tQxAlzL9zp6T0q4mr/SW3D0=;
	b=hkbpQF8psrAq1D+hPPevryGmNxgHJ1qP8PZMoBR88giUzAwhZ5JRxEax8DS0pt9IE5
	6MArCAd6LtnqXt4LWGQWNlXEs/jsLCwgVU0GG9hH/GH7gpMTZbGcuXxgvkIntnmmcin6
	fWIKZd2PKKiPZGkXtfLJJXprwO3gvXcIOW+2mheYaaU5FvnYGIvEL/m/tipeyXlgK7Pi
	nttUQzO+v7wKM2pr4rmxAVsGGlrAD7AqtRP3srCsucL9kh2lxGlIgoSqWA/i6N7D1FbQ
	TYkdYCjrmsqTHNtC+kIHJqsXWhqQ7yyihq/lqrIn2JjF+STqgbZsQ2QQlHZiXzygV1KO
	YuzQ==
X-Gm-Message-State: APt69E1ScbQJ+A0mxg3Muvl91+ArTsfcX+Xu13q0qXFD35owM7mDdk+H
	V+Mkb9ep9FOpBpgyXuXNQhizfITMmm2PjQfw0dpCUA==
X-Google-Smtp-Source: ADUXVKJu7IB5L0XekYXnrSibIZuZelUsxECJZefHbZS7hhXYfupLjLUG9Jh3YwQUx8/WG+3yjPiPLMrpg7GAysnKRmY=
X-Received: by 2002:a9d:307:: with SMTP id 7-v6mr2845459otv.300.1528884343843; 
	Wed, 13 Jun 2018 03:05:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Wed, 13 Jun 2018 03:05:22
	-0700 (PDT)
In-Reply-To: <32bd0cdd-2148-ff0b-feaa-64a4cbc21e38@skidata.com>
References: <10630413.xVAl2E7OaH@yow-masselst-lx1>
	<20180606204244.GA16170@mail.itconsulting-heinold.de>
	<fcaab484-d381-92f7-04d7-2a7edca6f903@skidata.com>
	<20180607132234.GA19704@mail.itconsulting-heinold.de>
	<91e19a88-1a03-b772-b6be-bf6bf27037c8@skidata.com>
	<CAP9ODKrFomJ2Rvp5mku81Op-rYCNt-AXm4TVV2-aSg6QSfEoFQ@mail.gmail.com>
	<d8462836-e655-4bb4-7b03-bce18cb3e24c@skidata.com>
	<20180611113035.GA17777@mbabyjoh-desk.ger.corp.intel.com>
	<20180611120847.GB16619@mail.itconsulting-heinold.de>
	<22daefda-78eb-98bc-b344-ab8f93aa795d@skidata.com>
	<CADfgfoY2fJOBt0ayVUfvyt1X079kDk=pc=7pswDmV=uPvuSA_A@mail.gmail.com>
	<32bd0cdd-2148-ff0b-feaa-64a4cbc21e38@skidata.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Jun 2018 11:05:22 +0100
Message-ID: <CAJTo0LaxjPJROD8fFt24qKwuSQzM_SM0GTeHc5xfziupdFS96w@mail.gmail.com>
To: openembedded-devel-bounces@lists.openembedded.org
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-java] maintainer status
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jun 2018 10:05:43 -0000
Content-Type: text/plain; charset="UTF-8"

On 13 June 2018 at 06:42,
<openembedded-devel-bounces@lists.openembedded.org> wrote:
> Another question just came to my mind:
> How should I deal with my own patches?
> Am I "allowed" to apply them myself or should another maintainer do
> this? If I should do it on my own: How long should they "stay" on the
> mailinglist before?

If they're trivial I can't see a problem with post-and-push.  For
anything that isn't pretty obvious, they should have a bit of time on
the list.

Ross

