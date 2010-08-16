Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Okw2D-0005sC-Pz
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 11:31:14 +0200
Received: by iwn38 with SMTP id 38so1457209iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 02:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=8FH5zDrKw8BeGmHOouaLU1ktLQBo2XE44G8WUcjAlOM=;
	b=n3V4kWQZJfzUaiNnkPTmuinK4sUeO3h0THWwHrbPR6kLtBzK2pIASanaayhYJfLBZE
	YC5UzbB4QKF7ExB/ZSQeUMMDpm5EhMeaR7tZlqXOq/HHJu234SgfhqEoUVPNilAgACnt
	PcuZfvN4nzOZ96b1r5X1kW5oYOdUBf9/imWjk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=YSoyTvhplpewj4DJy24Y5UiZAslWcjFd5Zfmjhhm9B/NpvkAZTw504Nb22S2jkJuPh
	I8qhzu+Hn/AYt4CCBhvLDWA1+u0WDshqtMS5cUhSryozgwbBATs1qwqdRJatyMpNGVim
	+Ss+bY7ZuKvURunutkjLPYwp0H/UHx59YLJik=
MIME-Version: 1.0
Received: by 10.231.31.71 with SMTP id x7mr5770049ibc.33.1281951058286; Mon,
	16 Aug 2010 02:30:58 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Mon, 16 Aug 2010 02:30:58 -0700 (PDT)
In-Reply-To: <AANLkTimpAxxt7GR=1VV9ZrAWubMp63sX771+PfhLjWTu@mail.gmail.com>
References: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>
	<i4auje$u5g$1@dough.gmane.org>
	<AANLkTimpAxxt7GR=1VV9ZrAWubMp63sX771+PfhLjWTu@mail.gmail.com>
Date: Mon, 16 Aug 2010 11:30:58 +0200
Message-ID: <AANLkTi=pVCajY==ZdehO_Bw33xsrYcvBnYHfN4s2Vne=@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cleaning recipes
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
X-List-Received-Date: Mon, 16 Aug 2010 09:31:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/16 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2010/8/16 Koen Kooi <k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> You removed the default openssl version (0.9.8) without bumping PR for
>> recipes using that, so now my autobuilder is quite red due to do_rootfs
>> failures (among other build errors related to these removals).
>
> I will reinstate openssl 0.9.8
> conf did not show any pinning but i missed the DEFAULT_PREFERENCE = "-1' in 1.0
> seems a good plan to upgrade to 0.9.8o though as it fixes some
> security vulnerabilities
>

reverted the commit for removal of 0.9.8
I was unaware that a PR bump of recipes using another recipe needed to be done.

Best regards, Frans


