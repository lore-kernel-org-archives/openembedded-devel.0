Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id D0FF460D8B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 23:14:13 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id j7so2134144qaq.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 16:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Lky7rAez1tQ3eHdCLyPwuKPaqqMrYQHNWBRiaif4B/c=;
	b=rwF0vgnT9gYMvd4m6wUBa2cVNDDfGLxDf1U6jQ53eR3MYSa97fK2ORvn7VEdxV75U0
	zgPB9z5OZMYk41k7PN0mNSSMF8L1ekZ0UgaJ9Wqslwv7AKs81ojqe3X1SfrwhoS1AQyP
	DnzyL70ec/k6t28K8xY0eCFqi4iynG49qdsYYwro4/cHRkeSHxh7T+KfMtGOKkSW4yRU
	xQIFZP2AIiCdqBSN9uIE4a95PCIB+sNuaZXimEbbwEbmI+9ZIuwGfLe3rXK70Gxafn28
	TM3JQv49/Rd/znqSv5EPzBDrPcek7cymPawhHgalgQ+jxDHOfcVWVDYM4Yba6jckY/o3
	w3Og==
X-Received: by 10.140.86.147 with SMTP id p19mr15868038qgd.66.1403738054283;
	Wed, 25 Jun 2014 16:14:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.112 with HTTP; Wed, 25 Jun 2014 16:13:54 -0700 (PDT)
In-Reply-To: <20140625185504.GD1580@denix.org>
References: <53AA0672.7070606@balister.org>
	<2894594.Bns9GHPWX5@peggleto-mobl5.ger.corp.intel.com>
	<53AB1718.7000608@balister.org> <20140625185504.GD1580@denix.org>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Wed, 25 Jun 2014 20:13:54 -0300
Message-ID: <CAMCfZKEOYwA=9CtEVVccXASOJXHsh5agvPWvG6imOJXXCEv8Zw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: State of the art for creating an image that you can dd to an SD card
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
X-List-Received-Date: Wed, 25 Jun 2014 23:14:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Denys,

On Wed, Jun 25, 2014 at 3:55 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> http://cgit.openembedded.org/openembedded-core/tree/scripts/wic
>
> But indeed, better documentation would be most appreciated.


I didn't have a chance to take a look and test wic tool.
Do you know if it can be used to generate sdcard images for TI's Sitara
SoCs?
The _problem_ for creating a sdcard image for Sitara is the configuration
of Heads, Sectors and Cylinders that should be passed to sfdisk and needs
to be done as root.


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

