Received: from [74.125.44.152] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1KvY44-0000Xk-Rl
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Oct 2008 14:59:56 +0100
Received: by yx-out-1718.google.com with SMTP id 4so243544yxp.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2008 06:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=olqjxga0xn0x5X1XtjjQF/Hw62I3L3fvr1ExJDoqLkc=;
	b=OCoyw7P5OP4hRa0CBH930ROgl6VVnhJOagluJJHEM1CcBgnXDUJPVF3iyG6R/gNARq
	UvXixx0tQ2pL1B0Y3ibXH8cTeHTV1xTLNKePhaJyZvAtMFZEe+WUbvbCUJgam08E9XBC
	qOEgkOSHcOei73Q5bYn7jE8UbKqKAsf6EIRzQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=JGIlZiYvXK9igD30MAm7vE462rYhdNs3Fuj8R57uVa1JJzyN6+VnBRHw+TpnY6uQob
	dT5cD49+ZfbOlLp3kXqHcBJvyqsFpYHG8U7tBNvCgpRYxFxAOqxtHQIAN7VWrwD/3nMd
	XUtyPecmLUMB2GCotvmG3ZcjuwZLYhdyTBHfw=
Received: by 10.100.151.14 with SMTP id y14mr726041and.117.1225375135021;
	Thu, 30 Oct 2008 06:58:55 -0700 (PDT)
Received: by 10.100.202.19 with HTTP; Thu, 30 Oct 2008 06:58:54 -0700 (PDT)
Message-ID: <bdb0025f0810300658o3f87d628yd0de397bd38165b2@mail.gmail.com>
Date: Thu, 30 Oct 2008 10:58:54 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4909B954.3090101@smartlink.ee>
MIME-Version: 1.0
References: <20081030101903.GA8716@walkingice> <49099314.5030909@smartlink.ee>
	<200810301239.18157.zecke@selfish.org>
	<4909B954.3090101@smartlink.ee>
Subject: Re: A patch for autotools.bbclas which correct .la file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Oct 2008 13:59:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

+1

We have a similar patch on mamona tree, but this one seems more complete.

On Thu, Oct 30, 2008 at 10:40 AM, Kalev Lember <kalev@smartlink.ee> wrote:
> Holger Freyther wrote:
>> On Thursday 30 October 2008 11:57:24 Kalev Lember wrote:
>>
>>> I think it might not be a good idea to do it in do_install_append(),
>>> because lots of recipes which inherit autotools bbclass also define
>>> do_install_append(). So the current approach would fix some, but break a
>>> set of other packages.
>>>
>>
>> why? got an example?
>>
>
> Seems I was wrong about how _append is exactly handled. Please disregard
>  my earlier mail.
>
> Sorry for the noise.
>
> --
> Kalev
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Rodrigo Vivi
INdT - Instituto Nokia de Tecnologia
Blog: http://blog.vivi.eng.br
GPG: 0x905BE242 @ wwwkeys.pgp.net


