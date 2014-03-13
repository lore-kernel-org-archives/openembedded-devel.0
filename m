Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id A37E86EEFA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 11:09:21 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hm4so3383221wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 04:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=fQpgKwqBQWb6DPrMeS3QjdgzYs2FwEEJCl8ry7E+dxY=;
	b=EjiqPFHY7SH0nkHT4la4/JUl0vvnA4xi6a+9RWZ+4jO7D96H1/H33+JpQsxTSA7lS9
	/SzWNMFdCFnk923IirGnoEODJxfZV05+kX00irx7pt7GLHBg3RCYBiqkQYE+qY77yrgk
	XogmCE3zz4W046sM0NwcqS+66c73VyV5FW5GNRsvhyugHqxegyXQtNJAcJr8sbOCcsF9
	VS3HRZC0YzZN/wSnvQZjrUqEUWc9etmcOq+3yIVXnKSTmhW5AraJUwzcOpYMv1mOmkS4
	f46M+6ijgZLkQUcwCP/AR4jdtAH5tT6augF+46ofgzOrNRASw9N3gVc7ijziIn923noo
	xiMg==
X-Gm-Message-State: ALoCoQkx/m+XI7Wa5J10Cw9wNve3/PW8Dc98Uey0AnbVeck7R1Sv8jkxki4ju5PjNmNkIdhZyEwv
X-Received: by 10.180.185.197 with SMTP id fe5mr1105313wic.56.1394708962337;
	Thu, 13 Mar 2014 04:09:22 -0700 (PDT)
Received: from ?IPv6:2001:610:612::35b0:c6f0:381c:cf59?
	([2001:610:612:0:35b0:c6f0:381c:cf59])
	by mx.google.com with ESMTPSA id jd2sm6484527wic.9.2014.03.13.04.09.21
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 13 Mar 2014 04:09:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <23248607.unOJTkLeyP@peggleto-mobl5.ger.corp.intel.com>
Date: Thu, 13 Mar 2014 12:09:21 +0100
Message-Id: <F1A43237-A560-4EC6-A29B-699952F92F6B@dominion.thruhere.net>
References: <20140313100833.1910da0b@pcnovotny-t.fit.vutbr.cz>
	<lfrvgd$3bd$1@ger.gmane.org>
	<23248607.unOJTkLeyP@peggleto-mobl5.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Correct versioning of unversioned source in git
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
X-List-Received-Date: Thu, 13 Mar 2014 11:09:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 mrt. 2014, om 11:45 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Thursday 13 March 2014 10:59:38 Koen Kooi wrote:
>> Tomas Novotny schreef op 13-03-14 10:08:
>>> there is a recipe sunxi-board-fex in meta-sunxi layer. That recipe
>>> fetches sources from unversioned git which contains definitions of =
some
>>> boards (in fact it is something like a store). I'm not sure with =
correct
>>> versioning in OE. Is that: PV =3D "1.0+git${SRCPV}" SRCREV =3D
>>> "<some_gitrev_I_want>" correct? Will be change of SRCREV (only) =
catched
>>> by build system (I'm curious how OE handles age of the rev in git)? =
Or do
>>> I need to raise PV to 1.1 and so on with every change to SRCREV?
>>=20
>> The answer changes if you have more than one buildhost. If you have =
only one
>> buildhost and don't care about other people rebuilding the exact same
>> versions, 1.0+git${SRCPV} will work.
>>=20
>> If you have more than one buildhost and/or care about other people
>> rebuilding the exact same, you'll need to increase PR (or PV) =
everytime
>> SRCREV changes. That will still cause some discrepancies if someone =
rebuilds
>> after >1 SRCREV change, but upgrade paths should work when increasing =
PV
>> (not with PR!).
>=20
> Why not with PR?

because SRCPV in in PV, not PR

>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
>=20


