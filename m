Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Pu6HF-0004Fd-D4
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 17:48:53 +0100
Received: by wwe15 with SMTP id 15so4310154wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 08:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=9YXw4t99GU1YR1yahHEcBSF87HrawqG4RyodRxJLFUA=;
	b=V56XqU/M9UlQ7STEpXYa2qyh5YsTceDnFcwysn/2B47HH5n9JKJKy1DaJMXuj6SeOt
	kLqJIjrXubxRSGfWw1lN40fwo+f7OxqdvKeNJbd9zBVvjCG+ITA2vu6VZhaVlgMAKeyZ
	wuMB34rFMS5rP0zi/K9h8Hc7+gnrLtSAyvDF8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	b=DrSLhkhFC0RJ0Eeqwu7c37M3dxDeRQzLZuXzP3jW2J00rdeYex+Uf6mMDuwa4v+NDL
	eCUrT3996ouu4VPbA9kh07hU90lL/iZWRJs/qR2Y24EArz6A9CoATVVlwFoK7F8AZJzG
	MwmtEuLEL9U1Synfto7gyTNfY4qPxGmCq2OUU=
Received: by 10.216.162.84 with SMTP id x62mr4747974wek.106.1298911648189;
	Mon, 28 Feb 2011 08:47:28 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.246.11 with HTTP; Mon, 28 Feb 2011 08:47:07 -0800 (PST)
In-Reply-To: <AANLkTimUqDu1nptPT9CrKrA5f8AHg3=V2OPNR2ne4ZgY@mail.gmail.com>
References: <1298049536.11289.3126.camel@rex> <4D6A5FB2.4070604@cam.ac.uk>
	<4D6A6DFA.5040305@mwester.net>
	<AANLkTinKqrKRpQd=ALYjjGOLyWmWEOGZobsHrsHxQi_j@mail.gmail.com>
	<AANLkTimUqDu1nptPT9CrKrA5f8AHg3=V2OPNR2ne4ZgY@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 28 Feb 2011 09:47:07 -0700
X-Google-Sender-Auth: 3j5B-qJOb4H0EBdl7IM7urDOCJY
Message-ID: <AANLkTikZph2WuATGjfvc_P+R=sqjJurtuzysU7OAokzj@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: Bitbake 1.12.0 released!
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
X-List-Received-Date: Mon, 28 Feb 2011 16:48:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 27, 2011 at 3:15 PM, Chris Larson <clarson@kergoth.com> wrote:
> https://github.com/kergoth/bitbake/compare/master...f12-hang
>
> https://github.com/kergoth/bitbake/commit/12d9095
>
>
> This fixes the parsing hang on Fedora 12 for me. =C2=A0Note that I'm not
> sure about the version check. =C2=A0We could just use this version of
> _bootstrap all the time, but I'd rather avoid this for future
> versions, as we could miss fixes. =C2=A0We should determine if this fix w=
as
> in python 2.6.3.

Verified that the fix is in 2.6.3.  If someone other than me could
confirm that the above commit resolves their issues, I'd appreciate it
:)
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


