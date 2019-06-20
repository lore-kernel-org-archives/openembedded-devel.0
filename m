Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5E6E87E7DE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2019 18:14:28 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id u19so214257ior.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2019 11:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZM5+mR4himpkTMkaDtMGJSzAqhAyeWLULU15M1Lt8Fs=;
	b=efYjZCUS1KrAcedkmXUYSXqGcRCIiVa3HnEGVQy7vb74Jzek2EDkIexp28dOdgD3br
	xS8O9/tTZQ/BtWh7CQZ3VeqzMkMQV/c5bCbMuEbNEKRc96InaZS9hpr3HxsokjTuei8w
	KHcOhg3AkdJtDhgzQEpb9s67QBNxVuBwx/v0lOIFp+LHGzMUHKW3D07mUOAVyKUW9+DE
	pRGOox7yIDwqCretLUEiIwg2AlLa1kmDFY2h6cSMQS00wQTdJl6SICpPwgomsPQBmDY6
	Dd07sYbt9fB2Srj9uUHVYhgW9pNxY8LeTOKZ36ibGZjJGr8Lkz881TVioCDDSeVHMKud
	k8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZM5+mR4himpkTMkaDtMGJSzAqhAyeWLULU15M1Lt8Fs=;
	b=uPiBt3Exsih6klfjdeuO+CwUwHMtJsYlyesTsn2kExpsOZFV6rg+2uXb/iEEEYHpQi
	In+a8jhA2GbOfp6hrNTZji2kyYzo4OUHEPcuycEwG1h4ljKh3PE+QbWIUtOnPZyF+Pc6
	I1ElD8ll2VplghJKsOyEmbqGMF96D5MCkkDTkXG0W7f5e4uZqtJfKdKnY+TzzmHJMI78
	/dxkle4IDFAcM4LFR0FTlXUDfNDCG+pF6E1iQZzi2flhEig9XWs6nw4i/614/e290+/d
	OrgloZdXmxsaHwDSc6GX5QnzbYKBV1cdWJ2+hExS1nOjb5/DvfzXeDeR9QMmL87YQ7M1
	o01g==
X-Gm-Message-State: APjAAAVulkj1O1Myb1sSw+3zOj00wprSTxzodCmygp/iaUdqLJGz73xs
	UwwPvv7uApZ5PD6h4XXYFQeakcqE7D5a9me6mlniWprNbOM=
X-Google-Smtp-Source: APXvYqxPJZuPttP0fayN4xMW+ZqJARYMr6m6TcBf3660WOScIlbQkNcm19wEZM8mRGvFEwb4NrSNI361XVJU7yLSAUg=
X-Received: by 2002:a02:a806:: with SMTP id f6mr2426178jaj.74.1561054469153;
	Thu, 20 Jun 2019 11:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190316144936.4768-1-open.source@oleksandr-kravchuk.com>
	<CAB2nKc9OS+c5MYdCbjjTTNcg0Qh-nrEXZ-T+cZ36Wy_O0qUBtg@mail.gmail.com>
	<6fcc4e72-0ff0-7048-5a8d-69da48c6c484@oleksandr-kravchuk.com>
In-Reply-To: <6fcc4e72-0ff0-7048-5a8d-69da48c6c484@oleksandr-kravchuk.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Thu, 20 Jun 2019 20:14:17 +0200
Message-ID: <CAB2nKc_W9n0rsMBq1MqZoSUZh65Oz5EX0JnSAJq0_qf4D_tjbQ@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] openconnect: update to 8.02
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
X-List-Received-Date: Thu, 20 Jun 2019 18:14:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for reply,

For now I added those lines to gitconfig to get rid of proxy issue:

[url "https://gitlab.com/openconnect/openconnect.git"]
    insteadOf =3D git://git.infradead.org/users/dwmw2/openconnect.git

Regards

Le mer. 19 juin 2019 =C3=A0 00:23, Oleksandr Kravchuk <
open.source@oleksandr-kravchuk.com> a =C3=A9crit :

> I do not know how Yocto mirrors work, but according to
> http://downloads.yoctoproject.org/mirror/sources/ last copy of the repo
> was made in November 2018, while 8.02 was released in January 2019, so it
> does make sense that 6487ee8763e1b63 isn't in it.
>
> Perhaps someone can force Yocto mirrors to fetch the latest version?
> On 18/06/2019 10:01, Vincent Prince wrote:
>
> Hi all,
>
> After this update I have some difficulties to populate my download
> pre-mirror with bitbake runall=3Dfetch universe, warrior branch.
>
> I can't access infradead.org in my company but it seems yocto mirrors
> does not contain following revision, this command fails:
> git -c core.fsyncobjectfiles=3D0 branch --contains
> 6487ee8763e1b6345718684909aca970befbc49d --list master
>
> For now, I just ignore the error as I don't use openconnect, anyone have
> same issue with it?
>
> Best regards,
> Vincent
>
> Le sam. 16 mars 2019 =C3=A0 15:50, Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com> a =C3=A9crit :
>
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>  .../openconnect/openconnect_git.bb                 | 14 ++++++++++----
>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-networking/recipes-connectivity/openconnect/
>> openconnect_git.bb b/meta-networking/recipes-connectivity/openconnect/
>> openconnect_git.bb
>> index c944144e2..050a2833c 100644
>> --- a/meta-networking/recipes-connectivity/openconnect/openconnect_git.b=
b
>> +++ b/meta-networking/recipes-connectivity/openconnect/openconnect_git.b=
b
>> @@ -2,7 +2,11 @@ SUMMARY =3D "Open client for Cisco AnyConnect VPN"
>>  LICENSE =3D "LGPLv2.1"
>>  LIC_FILES_CHKSUM =3D
>> "file://COPYING.LGPL;md5=3D243b725d71bb5df4a1e5920b344b86ad"
>>
>> +SRC_URI =3D "git://git.infradead.org/users/dwmw2/openconnect.git"
>> +SRCREV =3D "6487ee8763e1b6345718684909aca970befbc49d"
>> +
>>  DEPENDS =3D "vpnc libxml2 krb5 gettext-native"
>> +RDEPENDS_${PN} =3D "bash python"
>>
>>  PACKAGECONFIG ??=3D "gnutls lz4 libproxy"
>>
>> @@ -14,10 +18,7 @@ PACKAGECONFIG[libproxy]  =3D
>> "--with-libproxy,--without-libproxy,libproxy,"
>>  # not config defaults
>>  PACKAGECONFIG[pcsc-lite] =3D
>> "--with-libpcsclite,--without-libpcsclite,pcsc-lite,"
>>
>> -PV =3D "7.08"
>> -
>> -SRCREV =3D "9697bea0e50952cab57063238b43a7099e498cbb"
>> -SRC_URI =3D "git://git.infradead.org/users/dwmw2/openconnect.git"
>> +PV =3D "8.02"
>>
>>  S =3D "${WORKDIR}/git"
>>
>> @@ -25,3 +26,8 @@ inherit autotools pkgconfig
>>
>>  EXTRA_OECONF +=3D
>> "--with-vpnc-script=3D${SYSROOT_DESTDIR}${sysconfdir}/vpnc/vpnc-script \
>>                   --disable-static"
>> +
>> +do_configure_append() {
>> +    # script has /usr/bin/python2 path hardcoded
>> +    sed -i -e 's=3Dpython2\.*=3Dpython=3Dg' ${S}/trojans/tncc-wrapper.p=
y
>> +}
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

