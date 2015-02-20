Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id C3C6273605
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2015 11:10:58 +0000 (UTC)
Received: by pabkx10 with SMTP id kx10so7369338pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2015 03:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=4DiRS3xxToPPIiB1Us1ZkZ3T1FVPfViljQmx9NuOJHM=;
	b=QtkiJpo7ozuF+wZ6U4sintPC7T0BPSrbMz21pdBl8XLIBjVthwK6MeD3BFdjn6ML8n
	BhAavqBdKYKeZnBdaGafzOpIlLQPYtp5pqfALLh7a6N94Vl/tGcqCjjr0yH5qyTBUb4p
	NFPc6fBockVuIBdPc2Id4pioSNfKC3mkyO8lK/ZvwZy8oHmOQAklOvwScB2+ZnKMZTrW
	ALkmCSErlr3sgKpMEB6vse9sC7kG3TGkENBsjbSRYsPwH+qNWAQaa0PdKxBU+vC5Y4SZ
	o/8/KtDbXoa8cmU7wMW2WFISulY+NqewX+h5Chsx9IC5DDtqDpO1yktSVPL3A/cmgFZN
	0H7A==
X-Received: by 10.66.154.162 with SMTP id vp2mr6422285pab.73.1424430659513;
	Fri, 20 Feb 2015 03:10:59 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:852e:3540:d404:25e3?
	([2601:9:3580:84c:852e:3540:d404:25e3])
	by mx.google.com with ESMTPSA id
	hd4sm26441973pbc.86.2015.02.20.03.10.58
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 20 Feb 2015 03:10:58 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <alpine.LFD.2.11.1502200603100.28632@localhost>
Date: Fri, 20 Feb 2015 03:10:57 -0800
Message-Id: <A21D923B-21A3-428D-A49D-250221761B5A@gmail.com>
References: <BB19F3C7-2950-4E41-BF62-70BFE4FB9C9B@gmail.com>
	<alpine.LFD.2.11.1502200603100.28632@localhost>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Mailer: Apple Mail (2.2070.6)
Cc: yocto <yocto@yoctoproject.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core@lists.openemebedded.org
Subject: Re: [yocto] [RFT] gcc 5.0 recipes available for testing
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
X-List-Received-Date: Fri, 20 Feb 2015 11:10:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Feb 20, 2015, at 3:04 AM, Robert P. J. Day <rpjday@crashcourse.ca> =
wrote:
>=20
> On Fri, 20 Feb 2015, Khem Raj wrote:
>=20
>> Hi All
>>=20
>> Encouraged by help received on testing out glibc 2.21, now  I have =
put together OE recipes for gcc-5
>>=20
>> GCC 5.0 is in prerelease stage 4 ( open for regression and doc fixes =
only)
>>=20
>> https://gcc.gnu.org/ml/gcc/2015-01/msg00156.html
>>=20
>> The recipes are available here
>>=20
>> =
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/gcc-5.=
0
>>=20
>> you just need the topmost commit and then set
>>=20
>> GCCVERSION =3D "5.0"
>> SDKGCCVERSION =3D "5.0"
>>=20
>> in local.conf
>=20
>  i assume this new layer should be used *in place* of the current OE
> layer for testing purposes?

Not really, you can do following to grab just the patch on top of your =
working branch ( of course OE-Core master snapshot don=E2=80=99t try on =
older releases)

git remote add contrib =
git://git.openembedded.org/openembedded-core-contrib
git fetch contrib
git cherry-pick 85cf9c0e77378ca8f93868e9f91001214c8d8f3e

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


