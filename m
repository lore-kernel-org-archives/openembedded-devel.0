Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PuBao-00005n-91
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 23:29:26 +0100
Received: by bwz10 with SMTP id 10so4113221bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 14:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=VY80/yx0JqvjqfH4G8u6P4KgKNB6v+lvP4EI3btRcXY=;
	b=ahZTRS0y+SV+jnHqlCwZNjcuI4IcN3k6mwddyYWdxjbKe60nn9A7sFrZQbVhyrxEZK
	HGLEr2AbYhwowZEC5Yuw4GhCNGiCu96l8vdmA6vxvkfZtWabgRXSNWWju0em3Cb5iLQQ
	EsY+I/AlO5tcPyQcJJo5bQEVCB5oF9j6vZICI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=cCYI5HyRAtD9uFx3ksxWGL0MoYLF3HD4sBAyRtrlGBfAFBYkCY8aePeokzpSlIAkoR
	tL8dKEjrbKjLSNbJeYSNe4BLLkXFM36+mI6J2LGTLLzH2TTVXm/MEhU7Z74Mxg3G3Awk
	riTI4+4jc4QsHqLLHo6b7v5x4DCfmpvgbJzDY=
MIME-Version: 1.0
Received: by 10.204.48.93 with SMTP id q29mr1633657bkf.124.1298932078176; Mon,
	28 Feb 2011 14:27:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Mon, 28 Feb 2011 14:27:58 -0800 (PST)
In-Reply-To: <AANLkTikRm=aL7sgc2wNftMGhNsOiXbSyoaht4Yk_2uqZ@mail.gmail.com>
References: <AANLkTiknqQ6xLj8LFv4=17ymwSbVhD3C9kVe2qkviXhX@mail.gmail.com>
	<1298664057.3818.0.camel@lenovo.internal.reciva.com>
	<AANLkTin2WuKF=f_aOzi=28FmVTaxFVJa0uNb9TjfL2SB@mail.gmail.com>
	<1298666406.3818.4.camel@lenovo.internal.reciva.com>
	<AANLkTinUjtis22ZnLaP7uc0fa9nzxvhWod2uv43ZcJH=@mail.gmail.com>
	<1298669695.3818.5.camel@lenovo.internal.reciva.com>
	<AANLkTi=afktV1HC4Jdq_ammNdA+h4iMAWdJT809s+LMv@mail.gmail.com>
	<1298905700.23547.6.camel@phil-desktop>
	<AANLkTimyU4bSm9tM2LO5bMoqiFQqZXxt5Js7fg0B_HhJ@mail.gmail.com>
	<1298913422.23547.20.camel@phil-desktop>
	<AANLkTimomznky1rBn5QTqzS16O6Lk3VxHUx1pG+ULe3v@mail.gmail.com>
	<AANLkTikRm=aL7sgc2wNftMGhNsOiXbSyoaht4Yk_2uqZ@mail.gmail.com>
Date: Mon, 28 Feb 2011 22:27:58 +0000
X-Google-Sender-Auth: S8tJug0iKRHy7G5dTLMCmIhCphw
Message-ID: <AANLkTin2MszEwNwiNQuZ+uWBFE5Gd_Coq08AfRLF1dqc@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Missing GLIBC_<version> tags on binaries
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
X-List-Received-Date: Mon, 28 Feb 2011 22:29:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2011 at 22:19, Khem Raj <raj.khem@gmail.com> wrote:
...
> Does -pthread get passed to linking step too or not. if it does then
> it might the order at which libpthread appears and linker picks the
> symbols from.

It is done as suggested by gcc docs. It is passed on CFLAGS and
supposely gcc ought to take care of adding it to linking flags
automatically. No?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


