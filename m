Received: from mx194.callplus.net.nz ([202.180.66.194]
	helo=mxi2.callplus.net.nz) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roystonvasey@slingshot.co.nz>) id 1SUlPy-0003SK-Cy
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 23:05:58 +0200
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AlQJABUUtE/LYgoS/2dsb2JhbABEhXysagOCKIIVAQEBAQIBAQEBBQIZBUYXAQMCBgMRBAEBAwIjAwICGQ4BHgkIAgQTCwWHeQQMqGOScxSBEoltaoFKgg6BFQOTTIM/iEeGaIJ+
X-IronPort-AV: E=Sophos;i="4.75,605,1330858800"; d="scan'208";a="264598732"
Received: from smtp.connexionz.co.nz (HELO mikepad) ([203.98.10.18])
	by ismtp2.tranzpeer.net with ESMTP; 17 May 2012 08:55:37 +1200
From: "R U Local" <roystonvasey@slingshot.co.nz>
To: <openembedded-devel@lists.openembedded.org>
References: <CADZ6=asJ+xLvpodv=u9duDuWs=dp8mLamv=Sj6yJc6B5sjWMrw@mail.gmail.com>	<jove3h$7qg$1@dough.gmane.org>
	<CADZ6=auuzv9dF1p58wVXPFdckBUmgk6nmucnarWpqdxMbyHpaw@mail.gmail.com>
In-Reply-To: <CADZ6=auuzv9dF1p58wVXPFdckBUmgk6nmucnarWpqdxMbyHpaw@mail.gmail.com>
Date: Thu, 17 May 2012 08:55:33 +1200
Message-ID: <009001cd33a6$3cc91050$b65b30f0$@slingshot.co.nz>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQNCniPQ45elePvZ7lmoneye1+S/0QHqZoimAqsPj6WTvWLNwA==
Subject: Re: Where do I override DISTRO_FEATURES?
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
X-List-Received-Date: Wed, 16 May 2012 21:05:58 -0000
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-nz

Dear Thilo, Anyone else,
How did you get oe-core/Angstrom-v2012x to build a working system using =
a 2.6.37 kernel?
I'm in a similar position using TI AM3517. The latest angstrom is built =
around systemd which requires a 2.6.38 or better kernel.
I've had to reluctantly revert back to oe-classic and angstrom 2011.03.
Any hints on getting oe-core/Angstrom-v2012x working with a 2.6.37 =
kernel would be great.

Cheers Mike.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of =
Thilo Fromm
Sent: Wednesday, 16 May 2012 20:38
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Where do I override DISTRO_FEATURES?

Hello Koen,

>> I'm trying to remove an element from DISTRO_FEATURES (specifically=20
>> "ld-is-gold"), but I am unable to find the right spot to do it. The=20
>> distribution we're using (Angstrom, as it happens) sets this in=20
>> conf/distro/angstrom-v2012.x.conf.
>
> Why aren't you using the angstrom release? That isn't using gold.

We're using angstrom-v2012.x.conf from the git HEAD since we want to =
stay with latest and greatest for now. angstrom-v2012.x.conf is using =
gold. It's OK, really, I think I can handle the gcc-4.5 configure build =
problem.

Regards,
Thilo

--
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect DResearch =
Fahrzeugelektronik GmbH Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228   mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77    http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



