Return-Path: <ulf@emagii.com>
Received: from mxf5.bahnhof.se (mxf5.bahnhof.se [213.80.101.29])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB9875CF1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 22:08:11 +0000 (UTC)
Received: from localhost (mxf5.local [127.0.0.1])
	by mxf5-reinject (Postfix) with ESMTP id B3EA89CDDA9;
	Thu,  1 Oct 2015 00:08:09 +0200 (CEST)
X-Virus-Scanned: by amavisd-new using ClamAV at bahnhof.se (MXF1)
X-Spam-Score: 0.306
X-Spam-Level: 
X-Spam-Status: No, score=0.306 tagged_above=-99 required=5
	tests=[DNS_FROM_AHBL_RHSBL=0.306]
Received: from mxf5.bahnhof.se ([127.0.0.1])
	by localhost (mxf5.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zyccrIW0YdPu; Thu,  1 Oct 2015 00:08:02 +0200 (CEST)
Received: from smtp-auth2.bahnhof.se (smtp-auth.bahnhof.se [213.136.33.6])
	by mxf5.bahnhof.se (Postfix) with ESMTP id 485E09CDDCB;
	Thu,  1 Oct 2015 00:08:01 +0200 (CEST)
Received: from [10.175.196.191] (h-169-62.a454.priv.bahnhof.se [37.123.169.62])
	(Authenticated sender: mb782575)
	by smtp-auth2.bahnhof.se (Postfix) with ESMTPA id D429128443;
	Thu,  1 Oct 2015 00:08:00 +0200 (CEST)
Mime-Version: 1.0 (1.0)
From: Ulf Samuelsson <ulf@emagii.com>
X-Mailer: iPad Mail (12B410)
In-Reply-To: <6121338.U6CHxlbeKO@peggleto-mobl.ger.corp.intel.com>
Date: Thu, 1 Oct 2015 00:08:00 +0200
Message-Id: <06BF52C6-946E-4474-B7CB-7EEA269202D5@emagii.com>
References: <1443601616-25650-1-git-send-email-ulf@emagii.com>
	<3684850.Dr1EhiOegx@peggleto-mobl.ger.corp.intel.com>
	<560BCD24.7090403@emagii.com>
	<6121338.U6CHxlbeKO@peggleto-mobl.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] Use GFDL-1.1 instead of GFDLv1.1
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
X-List-Received-Date: Wed, 30 Sep 2015 22:08:14 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Right now, it gives a warning during build.
Just because some think we should support both, it does not mean we have to *=
use* both.
Applying the patch should fix the warning message, which should be priority o=
ne.


Best Regards
Ulf Samuelsson

> 30 sep 2015 kl. 13:58 skrev Paul Eggleton <paul.eggleton@linux.intel.com>:=

>=20
> Yes I'm aware of that. What I was pointing out is that usually we have an=20=

> SPDXLICENSEMAP setting to map e.g. GPLv2 -> GPL-2.0; there is no such mapp=
ing=20
> for GFDL; I guess the assumption was that there was.
>=20
> Cheers,
> Paul
>=20
>> On Wednesday 30 September 2015 13:53:08 Ulf Samuelsson wrote:
>> There is no GFDLv1.1 file in the license directory
>> -------------------------------------------------------------------------=
---
>> ------ openembedded-core/meta/files/common-licenses$ ls GFDL*
>>=20
>> GFDL-1.1  GFDL-1.2  GFDL-1.3
>> -------------------------------------------------------------------------=
---
>> ------
>>=20
>> It does not make sense to have a duplicate file.
>>=20
>> Incidently, the GFDL-1.1 file contains the GFDL-1.2 license, not the 1.1
>> license.
>>=20
>> /Ulf
>>=20
>>> Den 2015-09-30 kl. 13:05, skrev Paul Eggleton:
>>>> On Wednesday 30 September 2015 03:10:56 Khem Raj wrote:
>>>>> On Wed, Sep 30, 2015 at 1:26 AM, Ulf Samuelsson <ulf@emagii.com> wrote=
:
>>>>> -LICENSE =3D "GPLv2 & LGPLv2 & GFDLv1.1"
>>>>> +LICENSE =3D "GPLv2 & LGPLv2 & GFDL-1.1"
>>>>=20
>>>> IIRC both are correct
>>>=20
>>> I don't think we have an SPDXLICENSEMAP entry for this though, so it won=
't
>>> be being mapped (unlike GPLv2 -> GPL-2.0).
>>>=20
>>> Cheers,
>>> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre

