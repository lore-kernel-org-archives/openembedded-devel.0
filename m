Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id C5E7060118
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2016 12:43:00 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id h129so22143258lfh.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2016 05:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:organization:user-agent;
	bh=2N4dPWHEAZpVJ+m69Ac8kpkvcB3zWuSYkNX7EDR5ygg=;
	b=Y0ekdi0hsebd/M+Pk8/dJ9kpficbNQsaDW9bCIdEa2uNTM1ZglYralNMpaEB1LHgxZ
	BuNSG0jyms+Zb+7Hq/q/nrHAK+TgSqgpDR6nUiWLwgzsXGO4JJ9HiKMKbh1tG69pQZUk
	Y7VpAHvht/kr2ospZR2wh52EX8e4FZ4JOZ4A3NXbh2KOtMCXpjknzIzeUK4PcC4qRLOx
	gECEUAJ3GKxUCTt/tpmkueNNvBW+3dFZQXDbg/c3vugKtzs2kXO5u2NN/VCDBe8my3ZI
	TfxrpklxEoDnrpmUoUjLCC+74P6n17A8XHm8KPUgHsAJDeG83AZtBMRowWbeSxhcGn12
	O//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:organization:user-agent;
	bh=2N4dPWHEAZpVJ+m69Ac8kpkvcB3zWuSYkNX7EDR5ygg=;
	b=a+poQVcWUCpk0JaA8Z2XtLwFq4l/mWqYZRXhkk0Is28Luq7+OnHh5FfrtohP9jbT8n
	f/tK0e4c1RrHs/hcrYOPnGWC8NCA+wH3wRcdF2Tmlrp4C7qdUvEaQUbs6q7E0PhEvOuv
	W5t4YZWpM+YzV5cSx9DoCP7h7+k0uhsDeciTANM8BfGminOmKCQyjTVb1Nx/2qVt7euG
	oBslzsQkpRdYr6Dpp2E5+0+9Sr1lVeWm08tDjAGw2lJBaG21RWuoAA20mcu7um+W1dPE
	JWMZ5C+cRybDbib7s0/eIiUQA9ye4cvmLPO85I2Qf/wdQ5cPHsvcL/9oPHC69OKIVJ2o
	mOhg==
X-Gm-Message-State: ALyK8tKJy3lG3ChGT4MM0fngBHhXxOsUWdMJbqU2C6E6nAuKQYJisibFWy1U76zr8nCZRw==
X-Received: by 10.25.17.210 with SMTP id 79mr5130071lfr.113.1466512980125;
	Tue, 21 Jun 2016 05:43:00 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-218-130-no126.business.telia.com.
	[213.64.218.130]) by smtp.gmail.com with ESMTPSA id
	g24sm4134270ljg.20.2016.06.21.05.42.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2016 05:42:59 -0700 (PDT)
Date: Tue, 21 Jun 2016 14:42:57 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160621124257.GB20646@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <7fb5e28e-d153-a396-58ae-c4d656835524@emagii.com>
	<6c3c2d7a-0b1e-fb20-1be9-679b3a728dcb@smile.fr>
	<01564453-efa0-c067-83bc-67f995a86452@emagii.com>
	<8646f486-90f9-738d-9daf-6ba1644c83ba@smile.fr>
	<16a6d5ea-a179-f36b-6a64-2a8c790e662f@emagii.com>
	<496a4384-fb09-36f9-f945-ad52aee9e978@smile.fr>
	<a807ca01-806e-3505-db34-7e3c195fe977@emagii.com>
MIME-Version: 1.0
In-Reply-To: <a807ca01-806e-3505-db34-7e3c195fe977@emagii.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: Using EXTERNALSRC in practice
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
X-List-Received-Date: Tue, 21 Jun 2016 12:43:03 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Ulf Samuelsson <openembedded@emagii.com> [160621 13:24]:

> Den 2016-06-21 kl. 09:27, skrev J=E9r=E9my Rosen:

> > ${THISDIR} should be what you want, if I understand correctly...

> Tried that, but that ended up in the build tree.

> The <kernel>.bb file is located in the build tree, and the <kernel>.bbapp=
end
> is somewhere else.
> Don't ask me why, LOL...

> I need the directory of the bbappend file.

Yes, ${THISDIR} is exactly what you're looking for. Your issue is that
you're probably using it like:

SOMEVAR =3D "${THISDIR}/.."

Using bitbake and OE, all variables on the right hand side are expanded
and evaluated at towards the end of the processing. At that point in
time, THISDIR is correct to point to the directory with the .bb-file.

You need to immediately expand ${THISDIR} by using:

SOMEVAR :=3D "${THISDIR}/.."

See for instance the discussion at
http://www.yoctoproject.org/docs/2.1/ref-manual/ref-manual.html#var-FILESEX=
TRAPATHS

Cheers,
Anders
--=20
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

