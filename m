Received: from mail-ob0-f176.google.com ([209.85.214.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1UIKC9-000447-GD
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Mar 2013 15:40:52 +0100
Received: by mail-ob0-f176.google.com with SMTP id v19so1660090obq.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Mar 2013 07:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=FrHkw6lTvziXgPq4Ln3XnBnKXVdgg1+ViUBOWmfG5Ng=;
	b=mX7pOT02odCUnkIxW2ID1xOGAccMixxV0fCuPDh0DxSDWdFdAxkrixO3nbcStE3Wrr
	LpTZwfwyE39kpAcN2I0IoGgB1LQxTndCw7oPB4CCylon/+jGUmUntO7IjjR1mC8jAKdY
	LRx7xZOBb39yh4uoiVlXGCw1XqhsLkea8Pb78RKUY/5qUjdNlF6PDMMW4rqfF1qZrJRz
	CNpKvLte19F0SJNGfDdoNFongcDBRkjFRYy4uahuT27SOk/XX9M5cw7TKzqh/RM6uvQO
	e4V/hrgeI2fiEbzqvUnFImYzpFT2k6XbT3/sseCRqxs5R690HzGNFaMsSXbHDMEtYF17
	+kvQ==
MIME-Version: 1.0
X-Received: by 10.60.169.212 with SMTP id ag20mr4099313oec.102.1363789438113; 
	Wed, 20 Mar 2013 07:23:58 -0700 (PDT)
Received: by 10.60.76.199 with HTTP; Wed, 20 Mar 2013 07:23:58 -0700 (PDT)
In-Reply-To: <67231472-D70C-4E30-B790-44F6755B507B@gmail.com>
References: <1363769468-20321-1-git-send-email-raj.khem@gmail.com>
	<51497DC8.5090006@linaro.org>
	<67231472-D70C-4E30-B790-44F6755B507B@gmail.com>
Date: Wed, 20 Mar 2013 15:23:58 +0100
Message-ID: <CAGiJk9dxmb7Ba8udc9c5jHbNPT5kXisFpEipMJsd_KOBZnbtVA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-kde][PATCH] cyrus-sasl: Make pkg_postinst/rm package specfic
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
X-List-Received-Date: Wed, 20 Mar 2013 14:41:12 -0000
Content-Type: text/plain; charset=UTF-8

2013/3/20 Khem Raj <raj.khem@gmail.com>:
>
> On Mar 20, 2013, at 2:13 AM, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> wrote:
>
>> W dniu 20.03.2013 09:51, Khem Raj pisze:
>>> ERROR: QA Issue:
>>> /b/kraj/angstrom/sources/meta-kde/recipes-misc-support/cyrus-sasl_2.1.19.bb:
>>> Variable pkg_postinst is set as not being package specific, please fix
>>> this.
>>
>> meta-openembedded has 2.1.26 in meta-networking so meta-kde copy should
>> be removed.
>
>
> earlier there was a case when meta-kde aimed to build without meta-oe or meta-networking. I will leave it to meta-kde maintainer
> weather to depend  on meta-oe or not.
>

Some dependencies do not seem to be core enough for oe-core ;)
OTOH the WindRiver devs do not seem to be concerned about meta-kde anymore.


--
Regards
Samuel


