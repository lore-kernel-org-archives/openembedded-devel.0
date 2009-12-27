Received: from mail-px0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1NOoPs-0003jl-Qr
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Dec 2009 09:24:00 +0100
Received: by pxi12 with SMTP id 12so5391587pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Dec 2009 00:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=byt5R584rgbjpgfDWxWn9Gd4kIPDpoNxwtpI/U20SF0=;
	b=E5lae+z3hlWp8vDpsfjBsSLX0BUbWwLcQbXUNhbW4SY9jndtYjiu7fUC+ERpMKXbTt
	JiioKopyyn3IbrtVqxF9aDoT1BERcAfVHPfnWdKmrQwJelClZcaI7ntifpTlmcEge4rf
	gDoQsomdWY5PZ6kFgZXEuWmSiNRbHFVj6uTgg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=r/6Mo/oYnQ5yUrDXZ6P1Xzzb/SMVTrPC1DJ1Xar4kpSLNIe+MU+QmnuJTjJkp7YRFM
	RVLn75zHFJdBSCtdZztTrUF4Hc6L6tqKQDlN6Q2xchsEOTmaXu02AOPWmN7ee7ELay9R
	hMte1qtnoT9IgeDxPGOdjjcRIb6zhp8eZRA3c=
MIME-Version: 1.0
Received: by 10.142.4.17 with SMTP id 17mr9695576wfd.85.1261902119497; Sun, 27 
	Dec 2009 00:21:59 -0800 (PST)
In-Reply-To: <20091227022411.GA10352@gmail.com>
References: <4B0C2825.2070001@gmail.com> <4B0C3B50.8010901@gmail.com>
	<6ec4247d0911241319j364e424asfe231aeb6c5738a0@mail.gmail.com>
	<20091227022411.GA10352@gmail.com>
Date: Sun, 27 Dec 2009 18:51:59 +1030
Message-ID: <6ec4247d0912270021v22c7c46ay408c68f2d626d915@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: opkg-sdk_svn build failure
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
X-List-Received-Date: Sun, 27 Dec 2009 08:24:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

2009/12/27 Khem Raj <raj.khem@gmail.com>:
> On (25/11/09 07:49), Graham Gower wrote:
>> sizeof returns long unsigned int on x86_64. This is fixed in r365.
>
> sizeof return size_t which is a type in itself so if you want
> portability between 32-bit and 64-bit systems you should probably
> use 'z' length modifier in printf formats. '%zd' would work correctly
> irrespective of word lenght of the processor. You need C99 compliant
> compiler though.
>
> Thanks
>
> -Khem

You're right. r365 casts it to an int instead, in an attempt to
maintain portability.


