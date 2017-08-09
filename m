Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id CC2F56011B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 02:28:29 +0000 (UTC)
Received: by mail-ua0-f181.google.com with SMTP id k43so23234672uaf.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 19:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6QuIILn8XkyJdjEG32sGgtS2fEp4faJUjP+oBd+Z3Jo=;
	b=MCpM5c0hYDs7oVO0uMBBeD13uTAYsZLNDL4utkcxuSonvHXTa/eDWrpxOmglpmB9pw
	on0B2BrULc+KYg7CG7Wk0K0vT1Pf4ALFiQLu1P+uaWo9n+YRDL6urf8ClWBqh4x2BCzY
	yq0i9SkBHn0S9a1PN94ebVpJScKRrS2oUkWlWqFi41wQaS+XiVh371dUQryNJaIJP1XC
	n2fqe8C87yfRv8/lycV+rASvxoKQsOdDwn1IQD2V9d+7G2V5zDqSY4RkmY2ciigsdyQJ
	4F5KKv7ql46Wn3vOn98Mep0QFjmw5UGrnJNw0w6MZP2SsFrnG7df2FqmGMJFShQgCpYC
	nDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6QuIILn8XkyJdjEG32sGgtS2fEp4faJUjP+oBd+Z3Jo=;
	b=hffUQciUpLO28VJZURus8ym5NYSYmcPveTVGxiIwcZSLu7F0rgHlfg728VM5vA3bwB
	noe/Z8cZ8tER5XBpFbV46BxIbN/9jGG1dgmce7j9QvwOtujJ7gzNvUVi2zLFuAAk6CCJ
	FGvbRSZLRdhc0PHwyWr0cSpea8V/BtUQHsVXJSgdsQFGK1RF5hFdb9HjQoF1dC+amVT0
	7thuc3y+Uzvez9P/HFXtTydZnB9gxz/ejIozNwJa9NEu5700Ofh3DhKAKVBaRvtWjzYJ
	4ekraEviyloer8yilshMqlHHx0SSrxvE9HYzmZWstRwHFt84f3idysnOGQi5KRksisHT
	hniA==
X-Gm-Message-State: AHYfb5iUivPed/8dKWB+e/wALvR4ywQl8EIC13D6QyKPkOdspn/KtgeZ
	6SETtR8WXbtVG5RPb79GlUHAN9xDsw==
X-Received: by 10.176.17.228 with SMTP id q36mr4804716uac.199.1502245710651;
	Tue, 08 Aug 2017 19:28:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.64.100 with HTTP; Tue, 8 Aug 2017 19:28:30 -0700 (PDT)
In-Reply-To: <9ec26f7f-f87b-b470-ee15-459ac5712bfd@windriver.com>
References: <20170801170152.94586-1-Randy.MacLeod@windriver.com>
	<olqm6a$87a$1@blaine.gmane.org>
	<4aaa2c14-284f-71b4-47d2-fc7e8e27beef@windriver.com>
	<BFE10A87-CF18-46BA-88E4-A795FB20506E@dominion.thruhere.net>
	<f3b1d5bc-6d6f-4fdd-8076-5d856af4b8cf@windriver.com>
	<CAMKF1srRkN_vfF5HkMQy4YM5aa8bUCC+HOX0zALdbweUeT8dCQ@mail.gmail.com>
	<9ec26f7f-f87b-b470-ee15-459ac5712bfd@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 9 Aug 2017 04:28:30 +0200
Message-ID: <CALbNGRQQHqg-qWOxJim5Do08VSUCt_F8kSA-75LXeDx=SoDbqA@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] imagemagick: upgrade from 7.0.5 to 7.0.6p4
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
X-List-Received-Date: Wed, 09 Aug 2017 02:28:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 9, 2017 at 4:02 AM, Randy MacLeod
<randy.macleod@windriver.com> wrote:
> On 2017-08-08 08:42 PM, Khem Raj wrote:
>>
>> I am seeing
>>
>> downloads
>> 'http://www.imagemagick.org/download/releases/ImageMagick-7.0.6-4.tar.xz'
>> --progress=dot -v failed with exit code 8, output:
>> --2017-08-08 15:05:59--
>> http://www.imagemagick.org/download/releases/ImageMagick-7.0.6-4.tar.xz
>> Resolving www.imagemagick.org... 198.72.81.86
>> Connecting to www.imagemagick.org|198.72.81.86|:80... connected.
>> HTTP request sent, awaiting response... 404 Not Found
>> 2017-08-08 15:05:59 ERROR 404: Not Found.
>>
>>
>> ERROR: imagemagick-7.0.6-r0 do_fetch: Fetcher failure for URL:
>> 'http://www.imagemagick.org/download/releases/ImageMagick-7.0.6-4.tar.xz'.
>> Unable to fetch URL from any source.
>> ERROR: imagemagick-7.0.6-r0 do_fetch: Function failed: base_do_fetch
>> ERROR: Logfile of failure stored in:
>>
>> /mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/imagemagick/7.0.6-r0/temp/log.do_fetch.17282
>
>
> Ugh, the imagemagick devs have moved on to:
>  http://www.imagemagick.org/download/releases/ImageMagick-7.0.6-5.tar.gz
>
> and deleted the 7.0.6-4 tarball already!
> I'll send a patch in the morning and also talk to upstream about their
> archiving policy. I don't see a directory for that at the moment.
>
> Thanks for the heads up.
>
> ../Randy
>
Yes and they will do it again until 7-0.7.x comes up :(

Andreas

