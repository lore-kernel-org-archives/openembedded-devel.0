Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RjTpt-0002LN-Rb
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jan 2012 11:49:17 +0100
Received: by lami14 with SMTP id i14so745180lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Jan 2012 02:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=j7ZvTJ+yMKtMS582vM9CwCK/9CFyw7z2UEQyxKnwRKk=;
	b=Htn5+u9cDakxv9SV/5ZMshtkaMF+T7Q2zY2cQeu6s6pKotfUVhpdmXe/jlloFXNWw3
	tVLY9RNXNLdB5498FP/FShNCjBHJti9R13exD/drI5oSHkEXVaVI61Or/JtZD4qleRae
	w540ptFdeSPKmDmHf8T8jnZgklnNJZ7XuxWwI=
MIME-Version: 1.0
Received: by 10.152.112.42 with SMTP id in10mr3702363lab.21.1325932911211;
	Sat, 07 Jan 2012 02:41:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.48.69 with HTTP; Sat, 7 Jan 2012 02:41:51 -0800 (PST)
In-Reply-To: <je8ucj$vub$1@dough.gmane.org>
References: <1325894128-26110-1-git-send-email-andrea.adami@gmail.com>
	<je8ucj$vub$1@dough.gmane.org>
Date: Sat, 7 Jan 2012 08:41:51 -0200
X-Google-Sender-Auth: 6LyZBuSj3KoN65a-zNuMtNSF23c
Message-ID: <CAP9ODKqFPd2GX6bw1_a0Fi2U+q5=_pcd4=OoHvYjVvPSLNf7RQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe] [PATCH] xserver-common: remove extraneous BSP customizations
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
X-List-Received-Date: Sat, 07 Jan 2012 10:49:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jan 7, 2012 at 06:05, Koen Kooi <koen@dominion.thruhere.net> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 07-01-12 00:55, Andrea Adami schreef:
> > * delete patches meant for BSP layers * bump PR
>
> With a recipe like xserver-common I don't see a point in going all out BSP
> on it. This patch just moves things to layers just for the sake of moving
> it
> to layers. I strongly suspect that applying this patch will be a net burden
> on device maintainers instead of a gain.
>

I agree this is going to be bad at first but those kind of improvements
always cause some problems for a later gain. Dropping things that ought to
be in BSP layers is a good thing but only after the "fix other layers" time
window.

I think this is worth it however it might be better to instead port the
needed changes to OE-Core and ask other layers to adopt x11-common allowing
us to remove this later on. This makes the change easier and avoid some
problems for users IMO.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

