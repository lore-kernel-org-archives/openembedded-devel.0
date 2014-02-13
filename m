Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 216D76E3EB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2014 18:27:37 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id uq10so13647474igb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2014 10:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=SIZnfsqdTNhGoyAm9Ju8UieIw6wdwiQsStIjIOgsgVY=;
	b=v0yvGKGSVqMqnsNlReXMxfmgDIhTbcDLCPQ4vhurQMNeoMBX/MWEnSmH8l8lUtGAKf
	xlEvwKxYTccmK523dbjSXz1zlHHfbPzvR2MqYngfQEjgxVAsxqZ9HDB04faxk2RJjeK3
	Sl/id8LfAdQ0LLXBT0GjmixXhak2bNqkP4aKldpB5xSbALCnLT4A6Bu2hKT2Na7nT+xu
	FIwjgWuYHz0MdiEON6SV/E2waYhWHb8LaCc3ziTYyukqbmXouNLj0gbGjoEZjQw4+H7y
	+IFZX/jC15155v25bLftTnmxryOyJBaAswFaSunXkRhQfNPYZcrqXXemhq2sagIQ3E1K
	QbLg==
X-Received: by 10.43.153.68 with SMTP id kz4mr2334825icc.29.1392316057934;
	Thu, 13 Feb 2014 10:27:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Thu, 13 Feb 2014 10:27:07 -0800 (PST)
In-Reply-To: <30942504.aDmGqzKfcz@peggleto-mobl5.ger.corp.intel.com>
References: <1392270611-7344-1-git-send-email-raj.khem@gmail.com>
	<30942504.aDmGqzKfcz@peggleto-mobl5.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Feb 2014 10:27:07 -0800
Message-ID: <CAMKF1sryMX-yX=Kw+BJmG9msEjCzD1qcZ8C-ufgGcm0cNiCB=w@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libmicrohttpd: add recipe
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
X-List-Received-Date: Thu, 13 Feb 2014 18:27:37 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 13, 2014 at 10:21 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday 12 February 2014 21:50:11 Khem Raj wrote:
>> libmicrohttpd is needed by systemd-journald-gatewayd
>
> meta-oe already contains libmicrohttpd:
>
> meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.bb
> meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb
>
> We should probably replace the old versions assuming there isn't a good reason
> to keep them around.
>

ah yes I will send a patch to remove them and may be bundle it with this one

> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

