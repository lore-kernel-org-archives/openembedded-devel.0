Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
	[209.85.161.173])
	by mail.openembedded.org (Postfix) with ESMTP id C286B62133
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 18:37:54 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id i12so77567767ywa.1
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 11:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=subject:to:references:cc:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=kbo2m+Ga5s7IeotcZkScVpVNz56sM952xmyQwCAMdmM=;
	b=dXVvi7DjseicLbpsvCx0htqvObjsP+e/xSMchcMfvKlxrc1vjEc+VZBUVFGLRPs21f
	kbbDcFk1sTOt/ohG+Fr5N7F9noQYMnrIxQiihAjN8T+k1+2MmXZ75Hzp/+NZRkCxw5uv
	gVtQUklSDdgDHniZUg6WdYBZKE6Q4br2I3LaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to;
	bh=kbo2m+Ga5s7IeotcZkScVpVNz56sM952xmyQwCAMdmM=;
	b=lA3MIwsb3reLd6+gkWzIN5y+Ip2AgRRTr4CfYXEvvyHxfITpkG1v1RygxT2qBWy0Ce
	1W3mnowM+mkJ5WTPvaoIp5/Sxz3Jig5CpZUtp91uevEV4FAxdu0/SiYcUaj1U0wp4bAJ
	vSzj7UVdJChwsUYZZhz1Tcay5UIBr1AsqqJ19rx9ljwapWhmi2/N4pig6fn7zqyHNGq2
	VdE1iyBXykTeYXT/iEOiBMTLftIswGKcqQxCxu2I2CETtEnQDgGv1Qx33sNgHI7PYyYn
	DP0xAK+rOzESBMSwoqJBa8zN9j76aSRIDRkQKSpaCCYM09Hf/a9z9bTKrXDZn6YKG9NK
	DSrA==
X-Gm-Message-State: ALyK8tJgR5xxdjs4jHQWAEAo18dNnC4CXM1y55XzLWk8zQY6jHSQcf+NV9STMVih0DWkfnws
X-Received: by 10.129.108.143 with SMTP id h137mr14643383ywc.273.1466707075072;
	Thu, 23 Jun 2016 11:37:55 -0700 (PDT)
Received: from [192.168.3.43] (97-90-78-42.static.mdfd.or.charter.com.
	[97.90.78.42]) by smtp.gmail.com with ESMTPSA id
	y127sm757349ywy.47.2016.06.23.11.37.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jun 2016 11:37:53 -0700 (PDT)
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
	Openembedded-devel@lists.openembedded.org
References: <13986bd3-af12-4768-0a4c-78447c33c8b6@linuxfoundation.org>
	<0802a526-88ae-fd76-f024-77cb42509f8c@linux.intel.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Openpgp: id=D1F2407285E571ED12A407A73373170601861969
Message-ID: <b2583513-a7d4-deb3-8ec7-cc0ff70a3438@linuxfoundation.org>
Date: Thu, 23 Jun 2016 11:37:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <0802a526-88ae-fd76-f024-77cb42509f8c@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jose Lamego <jose.a.lamego@intel.com>
Subject: Re: [OE-core] Patchwork users: Help test new version
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
X-List-Received-Date: Thu, 23 Jun 2016 18:37:55 -0000
X-Groupsio-MsgNum: 61955
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="xod58qRMeL8Tur66u04enHE9pngC4nCS0"

--xod58qRMeL8Tur66u04enHE9pngC4nCS0
Content-Type: multipart/mixed; boundary="pTUxS5Om4mEvfGS7eqBDKCqP0xMJ1gRRc"
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
 Openembedded-devel@lists.openembedded.org
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
 Jose Lamego <jose.a.lamego@intel.com>
Message-ID: <b2583513-a7d4-deb3-8ec7-cc0ff70a3438@linuxfoundation.org>
Subject: Re: [OE-core] Patchwork users: Help test new version
References: <13986bd3-af12-4768-0a4c-78447c33c8b6@linuxfoundation.org>
 <0802a526-88ae-fd76-f024-77cb42509f8c@linux.intel.com>
In-Reply-To: <0802a526-88ae-fd76-f024-77cb42509f8c@linux.intel.com>

--pTUxS5Om4mEvfGS7eqBDKCqP0xMJ1gRRc
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 06/23/2016 06:55 AM, Leonardo Sandoval wrote:
> Hi Michael,
>
> I do not see many series on the projects, not sure if this is expected
> at this moment.
>
> 1. Is patchwork already accepting all emails that get to the
> corresponding mailing lists?
>
https://patchwork-next.openembedded.org/ and
http://patchwork.openembedded.org/ are both subscribed to the following
lists:

     openembedded-core@lists.openembedded.org
     openembedded-devel@lists.openembedded.org
     bitbake-devel@lists.openembedded.org

Only http://patchwork.openembedded.org/ is receiving mail from
meta-freescale@yoctoproject.org currently since this is coming in via an
odd route. I will fix this on the next database sync.

Are there other lists they should be subscribed to?

> 2. will older series (those that got before the new pw instance
> launched) be present on new pw instance? The latter would be nice to
> have, specially now that I am testing the test suite to be run by
> patchtest.
>
=46rom Jose Lamego:

There will be no series created for already existing patches, nor will
events be triggered for them, (for example: patch-state-change). Series
and events will be created/triggered only for patches received after the
upgrade.

We are missing some new series as well and are continuing to work on that=
=2E

> Leo
>
>
>
>
> On 06/20/2016 12:47 PM, Michael Halstead wrote:
>> Hello,
>>
>> OpenEmbedded is nearly ready to upgrade to a new version of Patchwork.=

>> The new version offers several new features that will allow OpenEmbedd=
ed
>> to improve developer workflow and automated checks on incoming patches=
=2E
>>
>> If you are a Patchwork user please visit
>> https://patchwork-next.openembedded.org/ and take a look. If you find
>> anything amiss please e-mail me directly and include patchwork in the
>> subject line.
>>
>> Thank you for your help upgrading this important system!
>>
>
> .
>

--=20
Michael Halstead
Linux Foundation / SysAdmin



--pTUxS5Om4mEvfGS7eqBDKCqP0xMJ1gRRc--

--xod58qRMeL8Tur66u04enHE9pngC4nCS0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXbCx+AAoJEGpkljW6QlqVYk4P/iPE/4pw7F5psDFjwGsTYGFc
3SG3YF77cQpMpiuqgd+i1CcyT4s9p7kN6xSKbd5rVVsEOayjrfvctxe5A3w2jmP+
5Ya5JS1Dfv4+08EeWv0K5qGpGNqWhkcU+QlZXa541iYXCkEkCN01lpRaaxy6HCyY
zaJ4e0l2DgMtp+5SlkwPjgCHYUhqG66SR0teEqvubWEHERel2yGApkW/DTKusvZF
QYemBIzziXfmwMYhoI8+cfAK2m0WEUWYkGkIL9B7xvFndAFYtWoS58IORpeBwJvN
K/qjMinHIBm4SP2rLy2wayDltAmBQSkEsO18U7SNkusTogusfmPQp7UheIn3q8rd
xDdZ/1tEJiXyzO8U+duvWXtoPcCZaNLwZxsO2Pn4tV0fBm9cfwUvcLmQh8f3FOgk
6d75LvxKnzMGRExJjGDZ/QIrBF6BnuGYd0lmskljr4Zs7fjDUrAwPoBxDhbq2nXl
H0wE6NuUvFIucIS4uTtdGhrSSeI3g3mcOJRl3QRrriW+g8IJtKqP2EB2/S2tNHYI
MnjWDcU213BfSMKpi+Kpp5PLeq6wEt+30vs1FGr1ckLpsSomWRQnJry5qrQlVZ8x
Wkw0xOTqTP3CElRyJ5EN00b0OptvGIe8eCgucGBT3NkkrM1NdUuXWt3Z5AnwkAxX
y5mmBGI4sLj4Vm4l4fOd
=y7r8
-----END PGP SIGNATURE-----

--xod58qRMeL8Tur66u04enHE9pngC4nCS0--
