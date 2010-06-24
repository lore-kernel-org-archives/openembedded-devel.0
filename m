Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1ORkax-0001t1-3x
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 13:27:47 +0200
Received: by fxm1 with SMTP id 1so1956778fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 04:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ChA9dOp0Z8TctxnXb28XE0dqCS24HhKcfn1IXqd1uxw=;
	b=BEBeMcpqlztijFc4tGZk6UEL5egRBiW3VFKD4PfGSayf+OWj9RSgWlxaGXd+Yjfrsw
	BWlZrqH3P8KVFG/4g1bdD+yvf2GQHCBt+diaD5d1w1/4PQptky8BAxz5UoFZPbx9GHdA
	C/KrXLGJEJ+D8Oii/CItuzbAyuIZAChVYf/L4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=P9TXWWPBhFKJXLNgQ+tprFSR56jSHS6OtAu6ZDVOdeZqe73tYWM/RmsyPou2OUMzZs
	wkKPjHwXjSpr77mr36pRnUhnC1MDF92GZSkpbzNWKrToOiV+PH3iGLvO8hmiPvz6AB0n
	RcLQ+6K2ToFaCY0pOzaqzNJIsbwYIIawt0zM4=
MIME-Version: 1.0
Received: by 10.204.154.207 with SMTP id p15mr4990886bkw.178.1277378589667; 
	Thu, 24 Jun 2010 04:23:09 -0700 (PDT)
Received: by 10.204.77.132 with HTTP; Thu, 24 Jun 2010 04:23:09 -0700 (PDT)
In-Reply-To: <hvv8d5$skd$1@dough.gmane.org>
References: <AANLkTimD-uu-SpcUvHIMWE1cQ5wCSyisHRwyFfasdX90@mail.gmail.com>
	<hvl1uc$bol$1@dough.gmane.org>
	<AANLkTil2-UJTgWzmXJI6eESvqjTowq0y_kZTpm0zNAN8@mail.gmail.com>
	<AANLkTikz8wGLZKz6Z-o4YpC8C62P-whW_znpSKlV8yEx@mail.gmail.com>
	<hvsjso$8bh$1@dough.gmane.org>
	<AANLkTiltHfFZiUj-QUPhXP4CI3U2rD4QG5S157TsYeIZ@mail.gmail.com>
	<20100623172352.GC5535@gmail.com>
	<AANLkTilDhV8ILaaRvAX_RR-iG_99lMcHYj9iZ-rXCznq@mail.gmail.com>
	<hvv8d5$skd$1@dough.gmane.org>
Date: Thu, 24 Jun 2010 13:23:09 +0200
Message-ID: <AANLkTin7qT3wbMl8A-KCaEwEZYiLzcFB68xiM0nrN6uZ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: introducing a new architecture/machine; policy ? (and a 	question)
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
X-List-Received-Date: Thu, 24 Jun 2010 11:27:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/6/24 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 23-06-10 22:04, Frans Meulenbroeks wrote:
>
>> I can pin in sane-toolchain, but only a few distro's seem to use that.
>> For now I think it is probably best to have gcc-nios recipes and
>> define virtual/gcc in the machine configurations. (haven't really seen
>> objections to that,
>
> I object to that. Nios is no more special than avr32 or blackfin in this
> regard.

objection noted.
btw: avr and bfin are supported gcc architectures, whereas nios2 isn't.

Frans


