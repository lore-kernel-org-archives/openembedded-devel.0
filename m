Received: from [209.85.216.183] (helo=mail-px0-f183.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1N8yi2-0003rk-0p
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 17:09:17 +0100
Received: by pxi13 with SMTP id 13so2348093pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 08:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=xpPcvXAylZfvBxQzyvHGaYGY7eGKDhpExROd7/g9cT4=;
	b=frnyP6EC3Xwdi9xxXP58/qv6Q9PE8mZ3tURnkunOG/eymoSXYp/mTSlhPadwyd4JGV
	MH0Q5IUbo8rKKhVRcvPS7eoymtGItnt+45+QJ5gyrLf1e7tS2jKzk7tuzAr66gEf+a2D
	ta9EjRT8YirY9pSfIpF5QuqCXN9FkoLTfiKMo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=oYSdiMB2cKmL65G3VqaEoRn1d6YFiQ9TxULNAWQ7SeS/rZ9flkWdVmcp0jx8XATXMM
	Vy5Y2c2lC83PDxQw9hey1V3Ojz8hah657Is0MsqQmMMJ33kiqr58TPYwg/WXChckVZ8j
	ew5RRIZ1G5PDML8l4FW5d/vM81VJJhClC0Vgc=
MIME-Version: 1.0
Received: by 10.115.114.18 with SMTP id r18mr8120591wam.24.1258126884202; Fri, 
	13 Nov 2009 07:41:24 -0800 (PST)
In-Reply-To: <20091113131926.GE32004@ibawizard.net>
References: <alpine.LFD.2.00.0911130443520.1157@localhost>
	<4AFD4DD6.70509@balister.org>
	<alpine.LFD.2.00.0911130732220.17745@localhost>
	<4AFD5440.6080202@balister.org> <20091113131926.GE32004@ibawizard.net>
Date: Fri, 13 Nov 2009 09:41:24 -0600
Message-ID: <d1ded4380911130741q571d3978i64862c9e09561861@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.183
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: build breakage: python-native-2.6.1
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
X-List-Received-Date: Fri, 13 Nov 2009 16:09:17 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

I workaround python-native-2.6.1 segfault by un-comment

readline readline.c -lreadline -ltermcap

in the file

work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1/Modules/Setup

I'm also under Fedora 12 beta, hope this help;



2009/11/13 Petr =A9tetiar <ynezzor@gmail.com>

> Philip Balister <philip@balister.org> [2009-11-13 07:42:40]:
>
> > I'm on F11 fwiw.
> >
> > I got this from gsb and a core file:
> >
> > http://pastebin.ca/1669812
> >
> > Philip
>
> I had problems building lot of native packages on Ubuntu 8.10, so I've
> tried
> to update to 9.04 and voal=E1, beagleboard-demo-image builds now without =
any
> problem.
>
> What I'm trying to say here, is that there should be some prebuilt chroot
> environment with sane host tools everyone can use. Or we can build
> everything
> from scratch using OE, so we don't need to use anything from the host
> system.
>
> It's simply impossible to have same result on different systems,
> distributions.
>
> -- ynezz
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Saludos
Adrian Alonso
http://aalonso.wordpress.com
Fedora Project Contributor
https://fedoraproject.org/wiki/User:Aalonso

