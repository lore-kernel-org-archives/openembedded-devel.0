Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1FF5260F26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 19:34:30 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id n5so2726420oag.41
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 12:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=th6J+opO1QVsVFbo8QaFFV2illWR0sz82xA3//VdrKU=;
	b=hrW6ipCt5D3wgernAoJMePK+6WHWqeFPnbQEOuCcWFJrZ0CWVkC7lpFoiDBV+jY/ZE
	3vJrt4yfIwEUFMKO95FrhNrifOyhH1FZN9w/JS+DEIx0sr5Yl/KDFqbxziGB2hRtGbMb
	4jC2XbQPfnG3Jo5j9WwQXmTenFCxn1xmJjilReb9+u14eVQFJoul2qNhx6W5IFssuv7k
	xHsNxTIrEOzPR3CJYo8H7WADxBl4If5nQ+Z4tUSQioUFrp/Q1cR+nHSGibQlC+XijPoN
	H6Rny4svKOhqG91tnf3nscmHpiC1uRkH801mujvgbHY40kIjHUvemPPTr1VMvRmA5yeF
	OmHg==
MIME-Version: 1.0
X-Received: by 10.182.81.65 with SMTP id y1mr37720obx.89.1380051271676; Tue,
	24 Sep 2013 12:34:31 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 24 Sep 2013 12:34:31 -0700 (PDT)
In-Reply-To: <4d10a88842bea1905ac7e924d85978a4d4aabaf3.1377791378.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
	<4d10a88842bea1905ac7e924d85978a4d4aabaf3.1377791378.git.Martin.Jansa@gmail.com>
Date: Tue, 24 Sep 2013 16:34:31 -0300
X-Google-Sender-Auth: NNIV0jzFYiUeYwwsFg0V17BFXkg
Message-ID: <CAP9ODKpPDTU7vmOAzP3hnO2CDViRE+2+DGdjZ5H2vUUjTCKf1Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Lauren Post <lauren.post@freescale.com>
Subject: Re: [WIP][PATCH 39/66] v4l-utils: Add libx11 dependency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Sep 2013 19:34:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 29, 2013 at 12:51 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * configure doesn't allow to explicitly disable it
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
...
> +DEPENDS = "jpeg virtual/libx11"
...

This should be done depending on DISTRO_FEATURES setting.

This broke non-X11 builds here :-(

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

