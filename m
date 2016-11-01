Return-Path: <randy.mort@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 023F871A69
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Nov 2016 02:27:00 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id i127so264461451oia.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 19:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=z7kBk8Cvk1B6wUJlrN+hglgZgLkjUgKQFFRJx7pEfSw=;
	b=GbyNkq/R/dsNixU/SzLnNnAAMEylYMXPzFpc7Vc2kL7ecSiMWqqrTcShM81PRLHz0G
	QAASeR56EIk3sQIOmD0PLDSxFN/1rLsReqaMs7Y/v3/i8UG8YzTz5b4+Td4EzacO6dNz
	b2YyLirkv2Gua2GcZsXWbL6QhaaOH6/7bV3b/ANBaeTHXKE420QAZ0iAXYPeRCUa1GsB
	CqpqPV55JxSbeiP4UuNjjtqDia+7+BasGuDAePO5soh0Vsp6Am3l/wIxV2LhjTnFdNIX
	1HAhq/nYQWUyHvGWba45r3jtF3OVUf6/hBGN2X7JM70m1xJ2aDoHRQQ5l+A0Aq3rUIDT
	NlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=z7kBk8Cvk1B6wUJlrN+hglgZgLkjUgKQFFRJx7pEfSw=;
	b=NUFNjhn6APIrp9ag68m1gf5WX1Y9weacvRoYdnDMdVXYXm232EltvwH/u8jWh52bwR
	DCCpr9iWDlR2Ociax1zXkviaIOVnvZQA30n/lgmrCItw0TXbh1LAacaZt6RaxLRbq3ZR
	8Q0x04Pf01wI/oQ0bzX3JbRF69n9LQUbEw50W8m9tu/FOadAr2otq2bmzdRDcH4xfunp
	3Xftd/d1shAiZ17uK1FPta+4qXXK5gWbfwZ2uBpBw7YND6wdlj10NOtKTUT2/NnaPFWJ
	Kzpmp5DQtxDp7iaxYf+f22hLUARzLlNzyLI7AgliQu7TtPOTz7VwEwvJcncsmbGNe4po
	1gtQ==
X-Gm-Message-State: ABUngvdZpkqb4duXUf/ORXw+k1cIHSn2Tk9w/aIXGWvGwb58E4JpOj8DtgUHHUyfKYs9VA==
X-Received: by 10.36.25.213 with SMTP id b204mr10379226itb.93.1477967219607;
	Mon, 31 Oct 2016 19:26:59 -0700 (PDT)
Received: from [192.168.0.19] (S0106f0f249854203.ss.shawcable.net.
	[174.2.14.158]) by smtp.gmail.com with ESMTPSA id
	y189sm11584738ioy.28.2016.10.31.19.26.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Oct 2016 19:26:58 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: Randy Mortensen <randy.mort@gmail.com>
In-Reply-To: <6137B5D0-B8F8-4137-B822-D555F003E385@gmail.com>
Date: Mon, 31 Oct 2016 20:26:57 -0600
Message-Id: <CD365EAE-3FBD-4361-B8AB-33143EDFF4D6@gmail.com>
References: <6137B5D0-B8F8-4137-B822-D555F003E385@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3251)
Subject: Re: openjdk-8 runtime failure with x11
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
X-List-Received-Date: Tue, 01 Nov 2016 02:27:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Oct 23, 2016, at 7:01 PM, Randy Mortensen <randy.mort@gmail.com> =
wrote:
>=20
> Using yocto jethro and meta-java to build openjdk-8 but when running a =
java swing app, it fails with the following:
>=20
> Exception in thread "main" java.awt.AWTError: Toolkit not found: =
sun.awt.X11.XToolkit followed by a stack trace.
>=20
> It seems openjdk-8 is being built without X11 support?
> Is there a fix or known workaround?

do you have 'x11' in your DISTRO_FEATURES as well as PACKAGECONFIG for
openjdk ? if not then it wont enable this support

may be you can add a little bbappend in your layer to add x11 to
PACKAGECONFIG or via local.conf

PACKAGECONFIG_append_pn-openjdk =3D " x11"

- - - - - - -
Thanks for the response. x11 is in the distro but I=E2=80=99ve had no =
luck in getting openjdk to honour x11 as a build option.=20
I=E2=80=99ve tried your suggestion (but the build failed) and setting =
EXTRA_OECONF +=3D =E2=80=9C =E2=80=94with-x =E2=80=94disable-headless =
=E2=80=9C
The EXTRA_OECONF options appear in log.do_configure but they seem to be =
overridden by later options which disable headful.
It seems I need to somehow remove the =E2=80=9C=E2=80=94disable-headful=E2=
=80=9D option that is baked into openjdk somewhere but my attempts have =
failed.

Any other suggestions or guidance are welcome.

> Thanks
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


