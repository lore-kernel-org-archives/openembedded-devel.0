Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1NmoHF-0002Rk-QE
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 14:06:29 +0100
Received: by fxm20 with SMTP id 20so1380947fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 05:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=+C83lzNz1sRTpZfYFf9VXeobCMREZ1fSnQ8Ih9RT9vk=;
	b=nvppqFgI509XNnC+CmysfG/0nHdrf9wCPvMVuWcPlNmwe2nml+FYIF32MrRghL1V3v
	M171UAlXKyArPLBxcKtf7Q3jIntxzgf6fdQSPWUFLgwojK3DwfqhdpDKyAQweJvakS3l
	WHEZh8FIzN5mt5NB0WBLGI7Pp+wsYmij7Ac0c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=vr2/pUiqiPiYxigAXXwkEplYadV3VslcpVMG0gaabv7exOv9Ic72t6rsJzV5gvF436
	9diH4W0V39JRyTynzCcUgsA45wB8Y60MfPa07GKqdbqJzlxwUyvcGeLzD5a1SRWZbFzG
	YQBJ0M1fTy+u6bZggk5mik3gp2s7yMu/Fg3G8=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.154.204 with SMTP id f12mr741457hbc.153.1267621400174; 
	Wed, 03 Mar 2010 05:03:20 -0800 (PST)
In-Reply-To: <ac9c93b11002271040i221bdb10o22cad1cf1551b6fb@mail.gmail.com>
References: <ac9c93b11002270725t46beb56dx5c4dc63c0f6485ca@mail.gmail.com>
	<20100227165600.GD30145@xora-desktop.xora.org.uk>
	<ac9c93b11002270921rb738980ye29c6fd93913107a@mail.gmail.com>
	<201002271904.22479.marcin@juszkiewicz.com.pl>
	<ac9c93b11002271040i221bdb10o22cad1cf1551b6fb@mail.gmail.com>
Date: Wed, 3 Mar 2010 10:03:19 -0300
X-Google-Sender-Auth: 12430b186da9d0cd
Message-ID: <be7a9f3d1003030503oaa0927byc87b25720c227b8c@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] recipes/images/${distro}
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
X-List-Received-Date: Wed, 03 Mar 2010 13:06:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

2010/2/27 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

> (and yes, I also think it makes sense to remove old orphaned unused
> 5-year-old recipes, but guess I'm alone here too).
>

You're not alone. :-)

This makes metadata processing faster, easier testing since we ought to deal
with less versions, increase possibility of merging of patches in upstream
since they'd be more up to date and so on.

IMO if someone wants a non-changing distro, stable is there for it. dev
ought to be clean.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br

