Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id EDC8E60721
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 13:51:46 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id n186so95574543wmn.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 05:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=v70oYajfSot/QsLFsJJZaedMWQpZ+QtIe0UNSKOkf6c=;
	b=PwLLtbUq1nIF9oWXWJ4m3YlXVDBL0mzQ8jy17ICND4trt7yk5CCchUcGg99U38G0au
	iOHBv90z3ybm9gmp8RFNWc9TWjcLhR8WzXvzpTa1UZi0thMzAAUC5ufQYU6eXbjKvWF1
	Rnk3xCPDk5Wfqa1/gxsOFhPAh4fJsqsqHquDNdhE3m9VfNLtiiGEPFWCDLNcJVRpHQY2
	I/1C5blky5CD/yOBYiElKaz6ybnnX7a8rZ3DAYa1c4up89B0ivkeA2ppTRwuYyMjRGnU
	D9p2Wi34f7ZFntZstoehNL+PKqIvUoGyIU2VjCZUURwb9ySSxbmPShweW69VBHJKMqIM
	bt+A==
X-Received: by 10.194.85.165 with SMTP id i5mr31600646wjz.173.1450187507372;
	Tue, 15 Dec 2015 05:51:47 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	u205sm2955932wmb.12.2015.12.15.05.51.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Dec 2015 05:51:46 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAP9ODKqLsDuyxVWOOC2UJMqGpjep+LGFajQO+N7jyiRa=5ea=Q@mail.gmail.com>
Date: Tue, 15 Dec 2015 14:51:44 +0100
Message-Id: <C8645930-1FEB-4ED9-ABAB-45EA9B500B4A@gmail.com>
References: <97430B74-EFAB-4C2E-BB83-D8695FF14CB8@gmail.com>
	<CAP9ODKpFa5V__us5s+9WY7GHcyvzXT-5U_wzzp8cNmwW5UzYhw@mail.gmail.com>
	<0A579224-B53A-40F8-9C7E-270C6D9D9B4A@gmail.com>
	<CAP9ODKqLsDuyxVWOOC2UJMqGpjep+LGFajQO+N7jyiRa=5ea=Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-java][PATCH] openjdk-8: fix rewrite QA warnings
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
X-List-Received-Date: Tue, 15 Dec 2015 13:51:48 -0000
X-Groupsio-MsgNum: 59034
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C2970682-717E-4DB3-A0E8-6FDB64978A92";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_C2970682-717E-4DB3-A0E8-6FDB64978A92
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> Am 15.12.2015 um 13:50 schrieb Otavio Salvador =
<otavio.salvador@ossystems.com.br>:
>=20
> On Tue, Dec 15, 2015 at 10:40 AM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>=20
>>> Am 15.12.2015 um 13:31 schrieb Otavio Salvador =
<otavio.salvador@ossystems.com.br>:
>>>=20
>>> On Sat, Dec 12, 2015 at 7:36 AM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>>>=20
>>>> Fix bitbake warnings from variable renaming like
>>>>=20
>>>>   Variable key FILES_${PN} (${bindir}/* ${sbindir}/* =
${libexecdir}/* ${libdir}/lib*${SOLIBS} ${sysconfdir} ${sharedstatedir} =
${localstatedir} ${base_bindir}/* ${base_sbindir}/* =
${base_libdir}/*${SOLIBS} ${base_prefix}/lib/udev/rules.d =
${prefix}/lib/udev/rules.d ${datadir}/${BPN} ${libdir}/${BPN}/* =
${datadir}/pixmaps ${datadir}/applications ${datadir}/idl ${datadir}/omf =
${datadir}/sounds ${libdir}/bonobo/servers) replaces original key =
FILES_openjre-8 (    ${JRE_HOME}/bin/[a-z]*     ${JRE_HOME}/lib/[a-z]*   =
  ${JRE_HOME}/LICENSE     ${JRE_HOME}/release ).
>>>>=20
>>>> It is caused by using FILES_${PN} and FILES_{JDKPN} or =
FILES_${JREPN},
>>>> respectively. Moving FILES_{JDKPN} to openjdk-8_%.bb and =
FILES_${JREPN} to
>>>> openjre-8_%.bb to allow consequently use FILES_${PN}.
>>>>=20
>>>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>>>=20
>>> Looking at the proposed change, it seems it would be better to =
squash
>>> the JDK and JRE installation to a single recipe and do the proper
>>> split using the packaging.
>>>=20
>>> Do you think this is reasonable?
>>=20
>> I split openjdk-8/openjre-8 because of weird behavior wrt.
>>=20
>> PREFERRED_PROVIDER_java2-runtime =3D "openjdk-8-jre"
>>=20
>> but I think with all the things I learned during packaging openjdk-8
>> and nqp/perl6 I can retry.
>>=20
>> This will require lots of tests, so unfortunately it's unlikely
>> to manage it this year - maybe even not before our planned HP1 update
>> release.
>=20
> Right; it is not a problem and I think this could be merged as an
> intermediate solution, in meanwhile.

Would be great.

> However I think consolidating it
> into a single recipe would give us some benefits as: faster builds,
> single recipe to manage, removal of .inc file at all.

Dunno how reasonable it is to install openjre and openjdk on on target,
so I don't see the faster builds. However - for dev or test targets:
*shrug* - I do my best to add no conflicts for most liberal use :)

Reducing .inc's is your favorite goal, isn't it? :D

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_C2970682-717E-4DB3-A0E8-6FDB64978A92
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWcBrxAAoJEESZlq7c5QqdZlYP/i3qEK35o1uCuEabgWGEE2YD
we3eidNMuhZ8EehiPpHHrkz6l8597vFs5lkM59tONRcGb1fY1zjzXnV7q++Mi3qe
NXvlnATYzmB2vhZ8FDMPVoMcMje/3B+nhArKSyDLxbh7kitaz+3QCc2LjedZsVPa
xm6YB1Jaw+BV5c4mSnZ/Z7HX63Lleiysx83V8sbu8h+nV9iYozjKLhiMvifPVlm5
051YpMTzWr/GbCspvEyajTl5v+4ce9VkZ0ItfJihAlvrVQMgFRI/+AyrLPuZ6qhZ
q1gzqwTMXqZsyjVZLBQWs0rPDc3kX1y36E9/n+HxMdj3ufGaniiLNRaeoJ1cxeTV
mMsWyVGv+R0CYZe0Dft7ClUxTe0Jg3hfT8Ehh8yQCduu6HXKnAX5NICmNGm8Ab4q
rSN8LXAsGADM9e6kmmSivcu+caDUxSnmPOJHFhGVLZphH+zGOEnOtWiyFjB7jfet
WCfgtd+1XIEAL+vaOcptmeegY2DKox3yeTVNrU4TImiT/allHl7E0YRHTM9PaHa1
SgbKj8YyWypz20R64lBRoOEA8Q2O5UUZHg9selWQIlAzdmKrEOIad+3l3kyJVOzy
mmYUsRnBwxjUTD7EaQOyDREj2HjjOvkKdcBO0yJ3lIumISO589ht1c6tgl6JGjig
g8IzBvb/E6UFgost/xuu
=tyvO
-----END PGP SIGNATURE-----

--Apple-Mail=_C2970682-717E-4DB3-A0E8-6FDB64978A92--
