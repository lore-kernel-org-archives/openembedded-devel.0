Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5A2F3608BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2013 17:28:27 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz10so3766630pad.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Aug 2013 10:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=nvFGe7SpsKkGEcXGAGjT2x01IpX0XLTeP1Pe8hqalH4=;
	b=L/QiG+Si+OZwLEiKSfRFbwROsztJKHE0JuKQKgEjK3ENX6L1vb53dyybgQhPfGQgR6
	q66jyaEZSw8oOGsSqkKwEbmeo45HchvCYhvHkMbghMZxGU4Z4buV8pBj4PQ7jys6sm7q
	Df/FUvFu75sz72G3gRMxIfYCMZ+tTuKgoA6SKNN9FLPm/wpxU4W32fFOzURG5RFkqqaL
	wqRjwsUPvEb2aiXctCmAxnz7/vSCyxZ0ngeQjyzoV83ttkR0hTLqB/G/yUg99jpelYX8
	YBv/xqpD/qoez/kXm6PfEmhcuAT+j8khvFDgcO9Sf0YyX/Y+BpmGIo57V8NtfpK1VAig
	Fo7g==
X-Received: by 10.68.134.202 with SMTP id pm10mr7140576pbb.106.1375982908310; 
	Thu, 08 Aug 2013 10:28:28 -0700 (PDT)
Received: from gourish-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	bg3sm15314546pbb.44.2013.08.08.10.28.26 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 08 Aug 2013 10:28:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAGNsrLASK8YrYCgibnA-tZR5cecOzr_WW41QjB87b+E1rY-QLw@mail.gmail.com>
Date: Thu, 8 Aug 2013 10:28:29 -0700
Message-Id: <C3C519DD-1E4E-49C0-8C6C-B50BFFA89A5C@gmail.com>
References: <BE65E360-0A4E-432B-9020-A3BCA9E05AF9@gmail.com>
	<CAGNsrLASK8YrYCgibnA-tZR5cecOzr_WW41QjB87b+E1rY-QLw@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: parsing errors with angstrom/meta-linaro
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
X-List-Received-Date: Thu, 08 Aug 2013 17:28:27 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Aug 8, 2013, at 9:00 AM, Fathi Boudra <fathi.boudra@linaro.org> =
wrote:

> Hi,
>=20
> On 8 August 2013 08:48, Khem Raj <raj.khem@gmail.com> wrote:
>> Hi
>>=20
>> Often I see this error when parsing angstrom-next, has anyone seen =
something similar or delved into the reason behind
>> it ?
>>=20
>> NOTE: Started PRServer with DBfile: =
/builds1/angstrom/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 45141, PID: =
6728
>> Parsing recipes...ERROR: ExpansionError during parsing =
/builds1/angstrom/sources/meta-linaro/meta-aarch64/recipes-kernel/linux/li=
nux-linaro_git.bb: Failure expanding variable SRCPV, expression was =
${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError: =
Fetcher failure: Fetch command failed with exit code 128, output:
>> fatal: read error: Connection reset by peer
>>=20
>> ERROR: Command execution failed: Exited with 1
>>=20
>> Summary: There were 2 ERROR messages shown, returning a non-zero exit =
code.
>=20
> I'm seeing a similar issue[1] on another recipe (libhugetlbfs[2] for =
instance).
> It's worth mentioning:
> - only on my local machine (it doesn't happen on daily builds using
> EC2 instances)
> - also from meta-linaro/meta-aarch64
> - also code pull from git, using SRCPV/AUTOREV
>=20
> [1] Failure expanding variable SRCPV, expression was =
${@bb.fetch2.get_srcrev(d)}
> [2] =
https://git.linaro.org/gitweb?p=3Dopenembedded/meta-linaro.git;a=3Dblob;f=3D=
meta-aarch64/recipes-extended/libhugetlbfs/libhugetlbfs_2.16.bb;hb=3Dmaste=
r

if I pull out meta-aarch64 from the bblayers all works ok. I don't hit =
this error at all
so somethins is fishy with this layer

>=20
> Cheers,
> Fathi


