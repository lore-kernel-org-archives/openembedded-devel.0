Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TLE7G-00047t-0I
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Oct 2012 16:15:30 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so2508773eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Oct 2012 07:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=GP8zx7Z+n1NKhLmTobsaRBk1r6N+A1HPmzqI5iFte2k=;
	b=JwoetSJCi52ANSI1Q1O42evmO47Qe/5t3sKBHDEqUeQlgqrY02NPF4QK0AceyYyssi
	j9M8O+/FtS7gao/kKS7KZPgpxREvOl6vY7RQl0pnrDmlZiym82XnF51PEnkEuWOpspBT
	vPAnCcsgQbeqAWvETtX2D/hZYw/Bn7iTlScHwS6SIQ2J2PRgivIoFbSDK3WD3fLjbQw1
	IutpKmCXEtxlut9f1lCt0+swAY9FUCj2r4NBkY6PNK2LwxahbWiTWnuM0PhnYpon/fFh
	mbtoOeMkkqhapsqQIB9E1oymSyrx5ahblXefI9E4wSa+A0owvDVGZJZDNsh+Q2yvYAN6
	GvzQ==
Received: by 10.14.221.132 with SMTP id r4mr22460262eep.29.1349704943642; Mon,
	08 Oct 2012 07:02:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.66 with HTTP; Mon, 8 Oct 2012 07:01:53 -0700 (PDT)
In-Reply-To: <5072847C.7@dresearch-fe.de>
References: <5072847C.7@dresearch-fe.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Oct 2012 07:01:53 -0700
Message-ID: <CAMKF1soS0oBnwSUGVcJ1csgNGFdjPLY9qxW0-sZMr52TB=wOxw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: pango-native build problem (and solution idea)
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
X-List-Received-Date: Mon, 08 Oct 2012 14:15:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 8, 2012 at 12:45 AM, Steffen Sledz <sledz@dresearch-fe.de> wrot=
e:
> After upgrading my build host to openSUSE 12.2 i hit a build problem with=
 pango-native (from oe-classic).
>

heh keeping the build going with newer distros is going to be a
challange with time.

> It seems that the libXrender version at the build host now misses the _XG=
etRequest symbol.
>
> Would it be an acceptable solution to add libxrender-native to DEPENDS_vi=
rtclass-native?
>

seems ok to me.

> Regards,
> Steffen
>
> --
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
> Fax: +49 30 515932-299
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


