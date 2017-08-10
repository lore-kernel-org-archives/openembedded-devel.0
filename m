Return-Path: <behanw@converseincode.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id B6198781E9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 18:11:39 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id h68so6152078pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 11:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=converseincode.com; s=google;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=y8jTo7ZWO1ululF2xLRbI3z+BGwiGyHoDVPLnTIpO5Q=;
	b=tA0nmBnfwkDETLKpNAyjQTk98leRuZ66Mcck3OG3ajB76qsdpGf5trLc2eRl9v65GS
	H67wNr1RqIwI4iVbnAzRT1/yIef9aqae9K4W46pxT+4GqLa8AnsRNpY/shPqdIFbiwrc
	9I8OSxJI6xkljC/h+PtClPDrMkUuX1/t7iJdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=y8jTo7ZWO1ululF2xLRbI3z+BGwiGyHoDVPLnTIpO5Q=;
	b=oqD2CQPgxY7d0Ct0iNkffpYqs58Y9tvnFnPrxXqOqZ6gr03nwnycrgv/kaj/BEFYQm
	dvwyz7wxGcz3rZa0qrHIl0gVdgpivjlBVTUnYcSm5Ffvt+3405h9J8IxkvBm6fvn6rtN
	qwCPiTiF1rFMZpfQZm+NExGNdRKh/oTYh1FFwKlKM9Umy8S/VoP1x2/hsQwUWVlSVayg
	w6eKJWhi1Rk6Z3T5wxd6T9Mzce/VXnL1l5t3ubDfE1wv4bp290KgedrBmoJPp1wB0CJ+
	WFjrtAl95OrqGhtIzuocutHuzmec6feCCiSzquzHGtW27UBt3CDeRLdfw4I6RYbVLdoF
	WWjQ==
X-Gm-Message-State: AHYfb5jYdO6SG48gl916t4LQVtKiae++NNL+4VU+kR9Fjl6UFB0u1oYg
	636p+4F+38Xv1eLp
X-Received: by 10.84.216.30 with SMTP id m30mr15072675pli.218.1502388700887;
	Thu, 10 Aug 2017 11:11:40 -0700 (PDT)
Received: from [192.168.120.225] (d207-6-122-147.bchsia.telus.net.
	[207.6.122.147]) by smtp.gmail.com with ESMTPSA id
	d3sm12353607pgf.75.2017.08.10.11.11.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Aug 2017 11:11:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Behan Webster <behanw@converseincode.com>
In-Reply-To: <1502375212.29285.17.camel@linux.intel.com>
Date: Thu, 10 Aug 2017 11:11:38 -0700
Message-Id: <3BCB6A17-C135-491F-9767-1073C12A18FE@converseincode.com>
References: <73F79297-B92A-4F4D-A3F1-A3F43CD39DAE@converseincode.com>
	<1502288526.1934.39.camel@linux.intel.com>
	<879E7479-CCE4-47D5-BB40-E789BA93185C@converseincode.com>
	<1502375212.29285.17.camel@linux.intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: Apple Mail (2.3273)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Alpha release of check-requirement.sh
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Aug 2017 18:11:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Aug 10, 2017, at 7:26 AM, Leonardo Sandoval =
<leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>=20
> On Wed, 2017-08-09 at 21:40 -0700, Behan Webster wrote:
>>> On Aug 9, 2017, at 7:22 AM, Leonardo Sandoval =
<leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>>>=20
>>> in my opinion, this fits nicely into the oe-core, into the
>>> scripts/contrib folder.
>>=20
>> Keeping it in script/contrib seems odd to me (horse before the cart). =
One of the requirements for OE is git (or tar) to actually get OE in the =
first place.
>>=20
>> I see this as more something some one would run before cloning OE or =
Poky. It=E2=80=99s a replacement for needing to read a long HOWTO on a =
webpage to get started with OE or YP.
>=20
>=20
> this installation way can help
>=20
> $ curl <path to the script inside git repo> | sh

Well, it would have to be bash (not sh), but that already works. I=E2=80=99=
m just not happy with that way of doing things. Piping arbitrary =
commands into bash has always been a terrible practice IMHO.

Again, remember there is more than one grouping of requirements, so =
parameters need to be passed in which is problematic with that style of =
running a script.

One of the reasons I have an =E2=80=94install option is so people have =
more control over what is done to their machine. I have people download =
it and run it because quite often people need to fix things and then =
rerun the script.

Behan=

