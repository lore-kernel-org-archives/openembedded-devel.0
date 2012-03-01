Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S35P0-0005Ji-7L
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Mar 2012 13:46:34 +0100
Received: by lagw12 with SMTP id w12so692127lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2012 04:38:04 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.112.29.34 as permitted sender)
	client-ip=10.112.29.34; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.112.29.34 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.112.29.34])
	by 10.112.29.34 with SMTP id g2mr2358009lbh.40.1330605484549 (num_hops
	= 1); Thu, 01 Mar 2012 04:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=UruqcxXI9XeyGI2Wq/OXP92loe195DWO8mdH5/iJwWA=;
	b=HvRuEJl9HCnu4h7DXve2L2AJV7ZkuDD7JUcEvBwAG5YoLEt9LP5XtkIxrT8KCwcHc9
	nPTdHT+S4jG902gE5pXgSwS6S9Ma+ecZHbofpoNJrK3dbRRE5J8ptfp3K46nPaT9uTlx
	iDgf6zEDbTS/MvI4e/BT9Fpmv1f3PHBANe8/E=
MIME-Version: 1.0
Received: by 10.112.29.34 with SMTP id g2mr1919930lbh.40.1330605484400; Thu,
	01 Mar 2012 04:38:04 -0800 (PST)
Received: by 10.112.29.74 with HTTP; Thu, 1 Mar 2012 04:38:04 -0800 (PST)
In-Reply-To: <FA3D8228-A311-4588-90C8-0A12F89723AC@dominion.thruhere.net>
References: <CALbNGRSc52k3sqGsh+T93ex2X2+62DCoVq8RB4dk-Ooy-j3qRg@mail.gmail.com>
	<FA3D8228-A311-4588-90C8-0A12F89723AC@dominion.thruhere.net>
Date: Thu, 1 Mar 2012 13:38:04 +0100
Message-ID: <CALbNGRQBCeQj=0dHAwAddM5cvJZhKLzyk8J5+WLAh7QFQBx_rg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Buildhistory, was Re: [OE-core] do rootfs does not create log files
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
X-List-Received-Date: Thu, 01 Mar 2012 12:46:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 6, 2012 at 8:46 AM, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
>
> Op 5 feb. 2012, om 23:16 heeft Andreas M=FCller het volgende geschreven:
>
>> Hi,
>>
>> is it a bug or a feature that do_rootfs does not create the package
>> information (packed_files / packages ..) in a deploy sub-folder did I
>> miss a switch for this?
>
> It's this one: http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta=
-angstrom/commit/?id=3D370a884b2372b7ddd5f0876119b5f28a2b20074f
>
> The matching commit it missing, but you can add something like this to yo=
ur local.conf:
>
> INHERIT +=3D "buildhistory"
> BUILDHISTORY_COMMIT =3D "1"
> BUILDHISTORY_DIR =3D "/data/ssd/OE/buildhistory/"
>
> That will create a tree that looks like https://github.com/Angstrom-distr=
ibution/buildhistory/. It it's missing a feature that you were using in tes=
tlab, let us know and Paul or I will try to add it to buildhistory.

Would it be big effort to have the package scripts (pre-/postinst,
postrm) handled by buildhistory?

Andreas


