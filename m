Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OvL6P-00052Q-Kq
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 04:18:34 +0200
Received: by iwn2 with SMTP id 2so5717117iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 19:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Wlcf5KIvwXld7/VDrWcyPgbNnXKHgjFOZXkmNcO0reI=;
	b=CvonBmx5a5BTuBtYtcecBCtjLfHxFrHR9PfaJ+ONoqVtS5buXm6+ZaL+ciysLomeVA
	4i1QqwmIBuSCMWDmeeTRfkYXxxKFlmhgSBzqf+pn9wY8WEbL1BgE7hZxoSOR2qKvlFgV
	+0OV3mg6CAIEcIQnsU1fvNifPOgmdoKcwbpto=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=d0qVt+Yu0NTKC1SaYRH36RdaN2Ub5zKzXYS2BR/5QyBOVM3PBAKY4aOXlDRDfx3GG0
	Cbd9Wq4A4C1ZiIfEUDQqaaHkUpFah9RstrUTxNF2IsZ1OTnXRCXviycsc+H8xfv8IfKm
	SkRJM3oZWewrlAYOkgfSvPSffkLtu5xMk3/DE=
Received: by 10.231.157.212 with SMTP id c20mr7058034ibx.186.1284430666273;
	Mon, 13 Sep 2010 19:17:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Mon, 13 Sep 2010 19:17:26 -0700 (PDT)
In-Reply-To: <AANLkTi=TtH=_PpjNDT9sm+P7aS=AWeeseBguU7WCQXMY@mail.gmail.com>
References: <AANLkTi=TtH=_PpjNDT9sm+P7aS=AWeeseBguU7WCQXMY@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Sep 2010 19:17:26 -0700
Message-ID: <AANLkTinJgtuhQAnhEs1M9GS43BWkksFhCGkXqDCcsjsP@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: fftw question
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
X-List-Received-Date: Tue, 14 Sep 2010 02:18:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2010 at 2:06 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Hi,
>
> For mythtv I need fftw with threads enabled.
> There is a configure option for this: --enable-threads
>
> Currently there are three variants of the recipe for different data types
> fftw_3.2.2.bb =C2=A0fftwf_3.2.2.bb =C2=A0fftwl_3.2.2.bb
>
> What would be the preferred way to add this?
> Just add =C2=A0--enable-threads to these recipes?
> Or create three additional recipes that support threads?
>

I dont see any issue if you enable threading support in them.

> Frans
>
> PS: I could not identify the maintainer for this recipe. If there is
> one, please voice your opinion (or make the patch)
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
-Khem


