Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id BFF3A71AB4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 May 2017 14:09:26 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id z52so45810798wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 May 2017 07:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qi2CMj5PvvS0n2Vrr3jA75ko2UMRNANLvtyqyqFth5Y=;
	b=SbX1UavXIHU2tvnb2bQW8Fsw0KvP1qbNwxTpy26KFU8zlMh+buZJcGWeJx2ykj1oMN
	xAD1CPE48rS/kgZaA1TFBKgMTPEf5zbPb4jLumk5csC8zwdPti0G5clPh+tmiEvkMj3p
	jHiZaNDkUS02YPOODZ0bEy1V94S1pC/B479i3RlCa5vEPfvATCSojIZScxMC0szeCWtI
	4TC1Jc7ug6XpuZZ7QG1D3OU1dWFSdnjmABamo6aqi75VxLDsBa/qiPxWWU6NwPa+eAFW
	DYYS6XhJ98EHKcIohNp6aH0A8OObLP6T6T/FOTGzIl56HZBJpe/egUhITWL6UrRKj+BA
	Lf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qi2CMj5PvvS0n2Vrr3jA75ko2UMRNANLvtyqyqFth5Y=;
	b=kjjHHm0dqKTA2b3JrtQ0RPX0AXmR27YI7HgtYWQ7lI4sizX8ixscBwl2ejDIUwspAZ
	1irF6O/ejbUBEA/SGIzMSn9torqmtB2IVeguSOFR7R4hnxwtT2BsZ5SFJvu5flLOi1+Y
	FV4EP9PJOzOpBKg49N6E7ge6PabZshRXwYV6qrgjCeAMbda3j6lAJfwjlkuMRgkwnOwX
	nNjUdkWy2FMYZtwZfHNbyKm46uPIB1jsNR1W2ws2ExTrGYTU5ilOoTvCQOa45OjNu/6B
	w3Sc/tUzH0Pr1zijykYdPHfRdLzsKsuAA7Ay5tejxHs9BFEZhK2uFBCkjsWrzE51yh9I
	c/5Q==
X-Gm-Message-State: AODbwcDvzEP6pvz/ELS6CqgeZPVHqah9mhB8GQ1gjZliwnFKlcB+Nki1
	FLzSvsS1MiqXzh+QCb2MYYsobtVwg3Y6
X-Received: by 10.80.149.209 with SMTP id x17mr4375302eda.175.1494425367178;
	Wed, 10 May 2017 07:09:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.213.154 with HTTP; Wed, 10 May 2017 07:09:26 -0700 (PDT)
In-Reply-To: <42E26C7E-8B61-464E-9473-3A901588EF9A@titv.se>
References: <42E26C7E-8B61-464E-9473-3A901588EF9A@titv.se>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 10 May 2017 16:09:26 +0200
Message-ID: <CA+chaQdY=sGZBFzrqSbm4hEndiMUi=Bd8--1Y1dhv9uqyRZ+cg@mail.gmail.com>
To: =?UTF-8?Q?Jens_B=C3=A4ckman?= <jens@titv.se>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5] Configure error when enabling SQlite
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
X-List-Received-Date: Wed, 10 May 2017 14:09:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

use openembedded-devel ML for generic questions like this.

The error you're seeing isn't even related to SQlite, but caused by the way
how you modify PACKAGECONFIG, read the manual about how the overrides work.=
.

What you wanted to do is:
PACKAGECONFIG_append_pn-qtbase =3D " sql-sqlite"

You can use bitbake -e qtbase to compare what's the difference in these 2.

Regards,

On Wed, May 10, 2017 at 2:20 PM, Jens B=C3=A4ckman <jens@titv.se> wrote:

> Hi!
>
> I'm trying to build a Morty version of qtbase with SQlite support
> enabled, and can't make it past the configure step. SQlite was
> enabled in local.conf like this:
>
> local.conf:
> PACKAGECONFIG_pn-qtbase_append =3D " sql-sqlite"
>
> Attached the configure log.
> --
> Jens
>
>

