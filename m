Return-Path: <dominik.holland@pelagicore.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id A4BD5615B0
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Dec 2013 17:57:45 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id k10so8275288eaj.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Dec 2013 09:57:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=FFq7hglRuGTsn+md7/Ffjt2/sBq2UAsIzMwUFdbyoDE=;
	b=gRfuVpaVFm/cVPTU/fWInDEXK0hgunuHRp6vuQ+Fb8bz/QMK6BaHKmROBo1L+3TCrk
	OlY0lN+DudOB6ZNlGqTTBrXyy9OkV9eZXZ4oZLO60xgcWnkZmPqFSy7tZ5RgK/OrAe1P
	d2T8geg1IazAYiwwaPkk70LWgDEnupgIvX3UNHkwmv0JGGuBtgxClawxU0lwP2wXPX/r
	Z3US6YtWOC+7BJvtJWcUHTbgSp5xLFtxQQQzRji4TDZGON5hPpgYZBrNwmCigfyc47mX
	N7kIgpuNJYNRc0snTK84E/sF3tmy2Fw9O4HeQyj7V20huafnJ1PBRBS7BZtoEAKA7ttG
	5Lvw==
X-Gm-Message-State: ALoCoQkCfKk/4r2taCskE8eyNJ4av0p/7ERD+Rwj8oMn5adcOCzZrZS9yHAJpBwC02xqso322Ya5
X-Received: by 10.15.74.200 with SMTP id j48mr62786eey.102.1385920664460;
	Sun, 01 Dec 2013 09:57:44 -0800 (PST)
Received: from [10.30.83.200] (tmo-101-165.customers.d1-online.com.
	[80.187.101.165]) by mx.google.com with ESMTPSA id
	j46sm62695978eew.18.2013.12.01.09.57.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 01 Dec 2013 09:57:43 -0800 (PST)
Mime-Version: 1.0 (1.0)
From: Dominik Holland <dominik.holland@pelagicore.com>
X-Mailer: iPhone Mail (11B554a)
In-Reply-To: <20131201180745.1e760279@e6520eb>
Date: Sun, 1 Dec 2013 18:57:42 +0100
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-Id: <75C87698-A40E-4AE5-9F78-BC5A4B5D178F@pelagicore.com>
References: <548EF836-E57E-42CC-8E0A-0D77045DE0AE@gmail.com>
	<20131127214440.GR2870@jama>
	<34764D13-4A13-431F-B39D-E1B61004BBE9@gmail.com>
	<CAP9ODKq8McmPkA1_P_xo4pJYF-gUU8FB3AZZMqr+LQH=D7SHhA@mail.gmail.com>
	<001701ceee91$423a03d0$c6ae0b70$@gmail.com>
	<20131201180745.1e760279@e6520eb>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Meta-qt5 sdk
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
X-List-Received-Date: Sun, 01 Dec 2013 17:57:46 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Simone, you have two options. On the wiki page there are 2 links.

The first goes to a merge request from a github fork. If you clone from that=
 fork using the SDK branch it should be bring you Qt5 libs and tools when bu=
ilding a SDK

The second goes to a thread of this mailing list containing patches. If you a=
pply these onto your meta-qt5 git checkout you should be able to build a SDK=
 which contains qt5 libs and tools

Dominik

> Am 01.12.2013 um 18:07 schrieb Eric B=C3=A9nard <eric@eukrea.com>:
>=20
> Hi Simone,
>=20
> Le Sun, 1 Dec 2013 13:31:24 +0100,
> "Simone" <cjb.sw.nospam@gmail.com> a =C3=A9crit :
>> I already saw the link posted by Martin, but I really do not understand w=
hat
>> I have to do.
>> I tried to clone the url https://github.com/meta-qt5/meta-qt5.wiki.git wh=
ich
>> I found on this webpage, but I got only some text files....
>> I didn't saw any recipes to clone.. surely it is due to my lack of
>> experience..
>>=20
>> I would really appreciate if someone have a couple of minutes to explain
>> what are the first steps to build the SDK...
>>=20
> the wiki page says that :
> - meta-qt5 doesn't have recipes to build a SDK
> - several peoples are interested in a SDK
> - Martin is not working on a SDK as he has no interest in a SDK
>=20
> So at the moment : you can't build a SDK using meta-qt5 (but you can
> contribute it of course).
>=20
> Eric
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

