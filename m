Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1PLhxB-0006xK-0B
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 20:58:01 +0100
Received: by fxm17 with SMTP id 17so187163fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 11:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=aG7OWD2ykRWWkMxGQeMJCqsgaNhlyzT/rl68yVgnAcU=;
	b=BtFtm6ib/NqFnYs7OhZ2qnbDkyT2HxMM2mm+GE33seKykusvmTE1p0LpzEt6UGauYu
	W2RoXTUX8I88x28rcnWa4Zs5LqcJW0ncvPdn5e15ZQKXcnoWV2B/O4QaZv5WGGhS8y/m
	UOgA1AiD3aKwoBRVzg/6w2P6QTsXKloifF7uo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=rtsYjCGBJK+oJ7YJgL9oFixOvoNV/O0hb5REYL4Pj8ZrwfK1ydKxJzRkvWRIjbvhjC
	gG0OuLTMqhMSM+fzy6+5BOYp9KmxegAKzHuyy7ZX10hnkJKiBdIKVuaOYXlbtaUExbBE
	CQ9Z7+X5r66BA9ve8AT/7KbLUg6FJ5l+V4KYY=
Received: by 10.223.101.196 with SMTP id d4mr1206312fao.23.1290715005564; Thu,
	25 Nov 2010 11:56:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.125.138 with HTTP; Thu, 25 Nov 2010 11:56:25 -0800 (PST)
In-Reply-To: <AANLkTi=LXoE99ae4VdBt1BgHdsDh8h8nYddOacU3LGpv@mail.gmail.com>
References: <AANLkTi=aMYQXCUQLzTAfAPeNmvV38Emtckaw_EmXzBmL@mail.gmail.com>
	<AANLkTi=LXoE99ae4VdBt1BgHdsDh8h8nYddOacU3LGpv@mail.gmail.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Thu, 25 Nov 2010 12:56:25 -0700
Message-ID: <AANLkTimy_yXt-RydUPfmAmRe0T_La68BpYk5gwdx1HSM@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: any reason to not cache `opkg list`?
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
X-List-Received-Date: Thu, 25 Nov 2010 19:58:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

> root@quokka:~# time opkg list > /dev/null
> real    0m 2.78s
> user    0m 2.50s
> sys     0m 0.26s
>
> Ok, so its not the quickest. Opkg has to read in the package info and
> parse it each time.
>
> What is your use case for needing to call 'opkg list' so frequently
> that this becomes painful?
>

I often search for packages available in the Angstrom repo before
bitbake-ing my own with OE.

My gumstix overo I use like a regular development server.
It has a faster processor, but my results are much slower than yours.

time opkg list > /dev/null

real    0m5.206s
user    0m4.914s
sys    0m0.227s

