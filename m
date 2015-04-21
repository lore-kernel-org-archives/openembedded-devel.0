Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id CE82E605D2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2015 16:14:34 +0000 (UTC)
Received: by pdbqd1 with SMTP id qd1so246468148pdb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2015 09:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=NcFAs5l8Wo04gQWBceygTtAE+4RZMZ8nXTRHtobpux0=;
	b=0nh8soU+HJJxNQmNo6EpGFg29zxowZewaCYuFVpTZeCtPHlziSyDLw16P7+QjllR8s
	HLNrF3WVIHjjqtQ2V3FxG/CztMVN+4HYjBaJtnWGIZq7datnL74pbk25xt6VOS+5qo1I
	bS8V62nCufw4BBD839Gc6gWJ4E3EMTiMdnY9R3boBuUXFOtRBg3us8TvwH6yqqC0xHzy
	eT9Vl/0w+yLDRK7LS+f6KCY+RDxjkMfeZ6+3uqWrpXZkt2oB4WzBE+JGcJ2NCBZ+iyRf
	zQeghtRrn/toyJ1b2hUIbdNWRFDNXM0bpu7VXPxwruN4Lyto8KWnuTUYOn+O8GS4rdps
	V5FA==
X-Received: by 10.70.33.67 with SMTP id p3mr38828066pdi.126.1429632875561;
	Tue, 21 Apr 2015 09:14:35 -0700 (PDT)
Received: from ?IPv6:2600:1012:b114:8e66:486e:a716:4db6:7b1a?
	([2600:1012:b114:8e66:486e:a716:4db6:7b1a])
	by mx.google.com with ESMTPSA id a12sm2450381pbu.21.2015.04.21.09.14.33
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 21 Apr 2015 09:14:34 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Akuster808 <akuster808@gmail.com>
X-Mailer: iPhone Mail (12F70)
In-Reply-To: <20150421110033.GA2725@jama>
Date: Tue, 21 Apr 2015 09:14:31 -0700
Message-Id: <132AC2E0-2BED-4731-8100-3089DA189B09@gmail.com>
References: <20150421110033.GA2725@jama>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: Richard Bevan <rbevan@restdeveloper.com>
Subject: Re: [rbevan@restdeveloper.com: meta-ruby / compiling gems on the target machine]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Apr 2015 16:14:37 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Richard,

Thanks for the fix. I will take a look into later when time permits ( on hol=
iday).

armin



> On Apr 21, 2015, at 04:00, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> I'm not a ruby expert forwarding to ML where it belongs.
>=20
> ----- Forwarded message from Richard Bevan <rbevan@restdeveloper.com> ----=
-
>=20
> Date: Tue, 21 Apr 2015 11:06:35 +0100
> Subject: meta-ruby / compiling gems on the target machine
> From: Richard Bevan <rbevan@restdeveloper.com>
> To: Martin.Jansa@gmail.com
>=20
> Hello Martin,
>=20
> Sorry for the direct email.
>=20
> Thanks for your work on meta-ruby. I have found a small problem and also
> have a suggestion but don't know how to fix it in the .bb file.
>=20
> The --sysroot=3D/ is set to the host path, when using ruby on a target
> machine.
>=20
> This only becomes a problem with compiling native support using gems.
>=20
> eg.....
>=20
> gem install thin
>=20
> The makefile will fail when run on the target machine. I have been running=

> the below command to sort the --sysroot out on my target machine before
> running gem install.
>=20
> /bin/sed -i "s/sysroot=3D[0-9a-z\/\-]*/sysroot=3D\//g"
> /usr/lib/ruby/*/*/rbconfig.rb
>=20
> The above replaces --sysroot=3D/path/on/my/host/machine/ to --sysroot=3D/ i=
n
> the rbconfig.rb file.
>=20
> Then gem install with native supports works after running the above.
>=20
> Can we add this into the .bb file?
>=20
> Thanks,
>=20
> Richard
>=20
> ----- End forwarded message -----
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

