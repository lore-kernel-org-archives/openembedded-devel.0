Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id CBAD56014F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 01:50:08 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 3so18019067pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 17:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=6Ib99jgzrHSDjNznW5xgLNui+bRgij9NGO8LiYjH3bk=;
	b=dwx61mO113aPFa7q0B6f02nj7kC00ystxbuD48rhvwN/EIFa+wqsAYyRH8NvCQOE3P
	LfMmKYj+zmKHrABDon7G94qc+FlhEAC3VKovYb0s31yIMto39XuVJpagDT5G8Jf6WXJA
	3Qq3v4YPnC4jgHntsvcN8N7iDZNoOAXYFNV3WmXEQsy8t9TmyYK/C7z345Aj3+CtIvlo
	8m7w6Q4Zorfrv5oF8LQOSlBUj7+Kh9MxLzd6ZX3pf5OaYre/SJZJoeDPZBZwHV27000m
	Ab5h1kWYax1FdEm3xOgpzdC7uz1McXW3Usy0LDTwMNNcWrOVk5kols8sX2zI+sDVoCg8
	KNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=6Ib99jgzrHSDjNznW5xgLNui+bRgij9NGO8LiYjH3bk=;
	b=L58nPKD45fvUey4zhPpl7P1p3nDdIe5/+RcIecRmpqSHSWrZg4moPNWUiK73BEA8R9
	XeYSW7nY44wSGKDbYNskwFqzWTSf1sXj/gH7grbBrbjQnLokttcJpgSLlyyCfMFXCgN5
	BipKRp5ez/Ew6ek9+ZPAm3JJ9LFAxkJrsr2lCFAyEsuv534gk3eJ6jl30R/s8Fi3q773
	/wbFwNl2kmRe7j2C/PGCgIwBFm58FtSYH4qos2AYg95NWnr1XyuAkGVBu0JZQHgEkaAQ
	yEEAGixcimLSA++Il9792LvMvMJzLsXEcM45PRjDpKXqZ8yxJvQ0EQmAjM0UClrBIUI/
	w3qQ==
X-Gm-Message-State: AKaTC02hiLMmCnnjHZEcd2mgu7VB+VqDd+XIeMCiZqueo/2yX9OREgnUQ3DDWErua1FVxA==
X-Received: by 10.98.217.67 with SMTP id s64mr30516729pfg.66.1480470610037;
	Tue, 29 Nov 2016 17:50:10 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:90b8:e559:981b:73bb?
	([2601:646:8882:b8c:90b8:e559:981b:73bb])
	by smtp.gmail.com with ESMTPSA id
	s5sm42779989pgj.19.2016.11.29.17.50.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Nov 2016 17:50:08 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <d93f4841-0154-2232-1802-2b8fcc85a81c@linux.intel.com>
Date: Tue, 29 Nov 2016 17:50:07 -0800
Message-Id: <19E9BF3F-664F-42A4-A170-5B7BB473ED80@gmail.com>
References: <4717571.f7GXZOAcRz@peggleto-mobl.ger.corp.intel.com>
	<20161129204327.GG2546@bill-the-cat>
	<d93f4841-0154-2232-1802-2b8fcc85a81c@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3251)
Cc: Tom Rini <trini@konsulko.com>, Patrick Ohly <patrick.ohly@intel.com>,
	Michael Halstead <michael@yoctoproject.org>
Subject: Re: meta-openembedded patchwork git hook
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
X-List-Received-Date: Wed, 30 Nov 2016 01:50:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 29, 2016, at 2:34 PM, Jose Lamego =
<jose.a.lamego@linux.intel.com> wrote:
>=20
>=20
>=20
> On 11/29/2016 02:43 PM, Tom Rini wrote:
>> On Wed, Nov 30, 2016 at 06:52:46AM +1300, Paul Eggleton wrote:
>>=20
>>> Hi folks,
>>>=20
>>> Martin just brought to my attention that the git hook for the=20
>>> meta-openembedded repository that's supposed to update patchwork =
still isn't=20
>>> working and hasn't done so for a very long time. I thought we'd =
fixed this so=20
>>> that merged patches get marked as "Accepted", but at least for meta-
>>> openembedded it seems like that's not the case.
>>>=20
>>> Jose / Michael - can you look into this if you haven't already? =
Please let me=20
>>> know if you need any help.
>=20
> The git hook was configured to update OE-core only, Michael will help =
us
> to include meta-openembedded.
>=20

There are more repos using patchwork beyond OE-core and meta-opemebedded
please enable it for all of them  as well.

>>=20
>> Since I brought this up on IRC, I wanted to chime in here.  First, if
>> you want to use top-of-tree patchwork you'll also want to grab
>> https://patchwork.ozlabs.org/bundle/stephenfin/post-receive%20fixes/
>=20
>=20
> Hi Tom, nice meeting you. OE-Patchwork is using a fork in [1] from
> freedesktop.org's patchwork at [2]. I will look at the hook fixes you
> mentioned at the first chance, thanks for the tip.
>=20
>> (and fwiw, I also have been setting the DJANGO part to 'dev' rather =
than
>> production for my use-case).  Second, I think part of the problem is
>> that there are just some cases where the hashing fails, which for me =
is
>> around 10% of the time.  Depending on how much one uses bundles and
>> tracks what ends up being committed this may or may not be a problem.
>> And I'm sure upstream patchwork would appreciate any changes to =
improve
>> hashing success :)
>>=20
>=20
> Regards
> Jose
>=20
> --=20
> Jose Lamego | OTC Embedded Platforms & Tools | GDC
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


