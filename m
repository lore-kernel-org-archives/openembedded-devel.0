Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id C7239606A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 01:21:50 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id uq10so16137616igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 18:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Eq2p4iUxoQGJSwvrpz9hgsAm5UrwiCokAoSLQD74cUc=;
	b=TT+VfESBS0K56PNfx11buFT9mnjr1VUxVgv36j7QqFTrUV7c2NZ54zFiaLji+G7oBg
	jfJiZU+TDI9C7VF8reWdBsKtnzA6MzIeX4agtS0miU3OoAysygqiAiM6/ojNAcITOUAC
	RU1UaUj9PrWdkErYCFOi9I50x59s2DUkHMLEtiqRnbPPyIIOG1TEnQjr/LXJnR+rK/9J
	Mvkup92p/7d4GXvGxPkHtsEVad69idSTsZdDfTZ5JOe6fkrt8OU/DfCu/0jy/KQ+OCqW
	qrPR4p5Lwu/vYTIG6tqbJwT6gwD8fxySiMtOtCqhGJ+vHOsY+tuDt3jz9ka4IjsEYK9u
	itkQ==
X-Received: by 10.50.143.69 with SMTP id sc5mr33299430igb.2.1394673711085;
	Wed, 12 Mar 2014 18:21:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Wed, 12 Mar 2014 18:21:15 -0700 (PDT)
In-Reply-To: <5320FF05.1050007@mlbassoc.com>
References: <1394599581-26844-1-git-send-email-raj.khem@gmail.com>
	<5320F473.1010509@mlbassoc.com>
	<CAMKF1somffWCEn-AKfdEbd+ddvTghW8PD2Es5N+ysmyNjXSNwQ@mail.gmail.com>
	<5320FF05.1050007@mlbassoc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Mar 2014 18:21:15 -0700
Message-ID: <CAMKF1spDHOpApWe=UxiY2AgWfPR16G5m_WrV-Ga8kx00K5ksdw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][RFT][PATCH] chromium: Upgrade 29 -> 35
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
X-List-Received-Date: Thu, 13 Mar 2014 01:21:51 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 12, 2014 at 5:42 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> Yes, the failing machine is 32bit.  'ulimit -m' shows unlimited, so my
> 3G of RAM + 5G of swap _should_ be the same.

if you take a look here
https://code.google.com/p/chromium/wiki/LinuxBuildInstructionsPrerequisites

it asks for 4G RAM/8G swap/10 GB storage

your system looks like is not sufficiently resourced to build chromium
and its 32bit

that sort of limits the memory linker can use too,  --no-keep-memory
as Martin said could help a bit but only if you are hoverning around
borders at the expense of speed

may be your option is to use larger swap space + --no-keep-memory

better one is to just buy a new 64bit machine with 8G of RAM :)

