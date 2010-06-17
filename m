Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1OPIbe-0003a6-HA
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 19:10:34 +0200
Received: by pwi8 with SMTP id 8so74337pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 10:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=PvG4gUFdjdnSn7M371lnshwSWRN94fGmmz1XZO0K284=;
	b=vFNQT27zztWpSclyKZ1KzvYCgcRVg/JGkkHGOzwgrBCUFosicFnahTnIt7YztyFogw
	E39vkEetFHMTya7vtYdduVTyrhbol6l9qOQKimMM8ioj5H6mT+Gf1BYx+CD52VUpctdn
	AQITLZeyEN1/J+u/uH9Z14J9nQKFLaP/mpI7g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=MfCoEKcAasW3baInxLcIfWrWPz3jlsRTAMPnThmO5QtGcJjix90uXS/bUyuVjDTgBD
	aTPm+5o2DOFkwzICjwCNh+Y4vDTXEzpzTztLZFMvQkIn7BXGzGripsfbEIFns6ElRpPH
	st9oPQeg0Dx8kxUOYWxXumUoScjumbo6O8BKU=
MIME-Version: 1.0
Received: by 10.229.97.5 with SMTP id j5mr5100519qcn.133.1276794347573; Thu, 
	17 Jun 2010 10:05:47 -0700 (PDT)
Received: by 10.229.224.129 with HTTP; Thu, 17 Jun 2010 10:05:47 -0700 (PDT)
In-Reply-To: <AANLkTimG439FroM6HmVePh9WeX2nlxdkn1RVtBqI1y96@mail.gmail.com>
References: <AANLkTimG439FroM6HmVePh9WeX2nlxdkn1RVtBqI1y96@mail.gmail.com>
Date: Thu, 17 Jun 2010 10:05:47 -0700
Message-ID: <AANLkTikfSbTGXqwIhfRrZgZ-vCd8ds7B_pK9Zn1kqzqz@mail.gmail.com>
From: Hans Henry von Tresckow <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: hvontres@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] purge recipes/linux-kexecboot and move to recipes/linux
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
X-List-Received-Date: Thu, 17 Jun 2010 17:10:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jun 17, 2010 at 5:24 AM, Andrea Adami <andrea.adami@gmail.com>wrote:

> Hello,
>
> I plan to move soon the kernel recipes of linux-kexecboot in the
> standard recipes/linux location.
>
> Being that the kernel directory is already overpopulated I was
> thinking to remove some obsolete versions before moving the recipes.
> I know that obsolete != unused, that's why I'm asking:
>
> Who is using linux-kexecboot kernels?
> Which machines apart some Zaurus are needing older 2.6.2x kernels?
>
> If it's only about Zaurus I'd *only* keep an older version (still to
> decide if 2.6.24 or 2.6.26) for a while and the latest 2.6.34.
>
> Please make your comments.
>
> Thanks
>
> Andrea
>
> Poodle still only works with 2.6.24. I would vote to keep that one and I'll
try to get 2.6.34 working... at least it has early_printk :)


-- 
Henry von Tresckow (hvontres)

