Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 595D2719B0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 20:55:08 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i88so998943pfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 12:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-transfer-encoding:mime-version:subject:date:references
	:to:in-reply-to:message-id;
	bh=s5Pf401nFwsouqtHW7AQpM3z74i/wTBKAbMT3AKWr5g=;
	b=dhdZZ80xo2nXnHRhAMF4SmfZf1k7Xy2t4AkDPnlKuedXFjzDKHv3syl+n2qkn2GQJZ
	tMASV9Xnc+Xrsy4jD5Xdr20KsCDLYgjNkavy9dzHe6+c20uA01MVNe+KlZTuVSE1dYQq
	mhMD7tNoWljwkWI07Cfyn5YuPlCZfd7tVMGCIyCrJSdTazyitRfXmY/SaYo5osMvio86
	2zbq9fzFHmTQm2epOoOSXNsF8MBvhPRVBnRJYw2vNIeUasK45Dv4XvI7J/lXJ8Hrks3c
	zIoF84ByZdb4KqMXJlAKy+mfcVQQy7T/lXHAkNWXpV+NUxBosSAL31ig/0XlV+mw3vRq
	ERBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:date:references:to:in-reply-to:message-id;
	bh=s5Pf401nFwsouqtHW7AQpM3z74i/wTBKAbMT3AKWr5g=;
	b=iUotOx/PVsb/3cophg+HF+AA4D+5J7Z1vUsNaXcbK5U7k7TbhbF73hm1k9OOsq49H9
	LG2Ei4wxdEcEs7c+vZY5/LTFcQQTGUEtSjHSpqU4Y+cIDxM4y+fug4gdGAYreUtsElwR
	uExLJjeSZXpCnU0DW+4hfKyWwRGnMI+8TSL2QpAxeazvUpYGwQ2PowAu+Cuk2Gqa+iXB
	3AWLEvpskY8bClQUDSy6QHH52cshTsxBsymhM/hPOxTQYjP4M6AMTqAf/1xEr1krsWgU
	4WE3hquCdcnyN6Wfaa/yM10CEnQWLDiSaHxKArYTusPh8nE1hY23TiZ5SM/8R34c/sXi
	qn0g==
X-Gm-Message-State: AKaTC00FwWhH8vue3ebd5lCk87UVqxOT40SiOgUHlr6lHkVeQwOqwpvyAxxKzm+AZZI7bg==
X-Received: by 10.99.140.77 with SMTP id q13mr8475870pgn.109.1479934510083;
	Wed, 23 Nov 2016 12:55:10 -0800 (PST)
Received: from [192.168.0.130] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	s3sm54771401pfg.14.2016.11.23.12.55.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 12:55:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Date: Wed, 23 Nov 2016 12:55:07 -0800
References: <alpine.LFD.2.20.1611231326510.15876@localhost.localdomain>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LFD.2.20.1611231326510.15876@localhost.localdomain>
Message-Id: <5E80B6DC-66EC-499B-84D0-41A5D4F1A1BC@gmail.com>
X-Mailer: Apple Mail (2.3251)
Subject: Re: mozjs/unhandled signal 11/64k page patch/__powerpc64__ ???
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
X-List-Received-Date: Wed, 23 Nov 2016 20:55:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

can you reproduce it on version 24 as well ?

> On Nov 23, 2016, at 10:34 AM, Robert P. J. Day <rpjday@crashcourse.ca> =
wrote:
>=20
>=20
>  i know nothing about this issue, i'm asking on behalf of a colleague
> who has allegedly tracked down a bug in wind river linux, and
> comparing sources, it *appears* the very same thing would happen in
> OE.
>=20
>  the symptom running "poweroff" in a qemuppc session;
>=20
> ... snip ...
> polkitd[680]: unhandled signal 11 at 00000000 nip 0fa69198 lr =
0fa69174code 30001
> ... snip ...
>=20
> further investigation shows the very same thing happening with:
>=20
> # systemctl start httpd
> polkitd[680]: unhandled signal 11 at 00000000 nip 0fa69198 lr =
0fa69174code 30001
> Error getting authority: Error initializing authority: Error calling
> StartServiceByName for org.freedesktop.PolicyKit1: Timeout was reached
> (g-io-error-quark, 24)
> Failed to start httpd.service: Connection timed out
> #
>=20
>  to make a long story short, said colleague followed bug reports and
> ended up here:
>=20
> https://bugzilla.redhat.com/show_bug.cgi?id=3D1289432
>=20
> eventually, he got the problem to go away by tweaking the patch
> "0005-aarch64-64k-page.patch" for mozjs with the following adjustment:
>=20
> @@ -113,7 +113,7 @@ struct Cell
> #if defined(SOLARIS) && (defined(__sparc) || defined(__sparcv9))
> const size_t PageShift =3D 13;
> const size_t ArenaShift =3D PageShift;
> -#elif defined(__powerpc__)
> +#elif defined(__powerpc__) || defined(__aarch64__)
>               ^^^^^^^^^^^ change that to __powerpc64__
> const size_t PageShift =3D 16;
> const size_t ArenaShift =3D 12;
> #else
>=20
>  as my colleague reads it, the original patch above is necessary for
> PPC64, but *breaks* PPC32. i haven't followed the logic, but does any
> of this make sense? by making that change, the error went away and
> things work fine.
>=20
>  thoughts?
>=20
> rday
>=20
> --=20
>=20
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, =
CANADA
>                        http://crashcourse.ca
>=20
> Twitter:                                       =
http://twitter.com/rpjday
> LinkedIn:                               =
http://ca.linkedin.com/in/rpjday
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


