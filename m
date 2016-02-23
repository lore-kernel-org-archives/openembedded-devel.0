Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 27C31731A1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 18:47:58 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id g203so222703218iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 10:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=IQwt8mGRB8YaHRAfFkU5sjFp0SCh7ZmQEJLpX+7x1Tg=;
	b=v4KETBq9SHfVy4/lz/Av40Bh7qcUV3t3m2zswR9IdxCzODpc0VAF1K2Sdvun1fIoWn
	8kFQQ47/Jcx2wd92yFxCMXPNmBVOz96AYdAnMzVM2SG3PR12bwRgcWhtRJr3Htgb+351
	E8jpFGo1w1D3YYFaMZNy6cnYAlIEoxnTMy1+dVMKFLwpf+zx4sVIYaw377Jkz6Dcp+mr
	ekAeKa4vT+uIVX1eOZUmm2KVlP0BvrJml9zBim4oj27CiLfPEU2xOFYH0xUqBBJ5iZ5C
	UQMAQRe7aoIQOIhvPfZRffoEitz6DsyF7PT9z+CVUCRTKsOFJ8wu4ppgGJPAL1dgtfjz
	mwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=IQwt8mGRB8YaHRAfFkU5sjFp0SCh7ZmQEJLpX+7x1Tg=;
	b=YZl4G1Iy4bJdssyWWbLFQNADUfpDJRBaeH9w0vmsCe0ifA06312bn2cnc5XQlYxkoR
	2Kf0/15f/FYW+0kEhlx+IR1BDq+iKKvfQJy6mcQAD4pN2Phm/F32EBZkAKwm004fbVcz
	sRnzPG69S2dGHebVfeVb3GdXQ8yp7tYLZi5nhlP27veaYhoIRD8SiYU3jkWYwHHzpRcT
	btuVgOTsV+sS+adaYHsUWsfjR0mX+nVz32NepSmygK0W2Z/SwvWv0OXhtG8+iBM1klZh
	Wsu8XieIGdkF3zGbtScHlnMroy4rEtXKlOEfqAEL4Lxyr15uFkJTkHU7WZpAnqOKhjHO
	Nxgg==
X-Gm-Message-State: AG10YORpshGUl6a2YRK5rlh0RvZ7asWHcA5cep9YQw8Om31W+q7n+R479nOYa/irRa3kIHUYYUg/qGwkI4ieTw==
MIME-Version: 1.0
X-Received: by 10.107.164.15 with SMTP id n15mr32265610ioe.148.1456253279241; 
	Tue, 23 Feb 2016 10:47:59 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Tue, 23 Feb 2016 10:47:59 -0800 (PST)
In-Reply-To: <20160223162227.GB2564@jama>
References: <1453809321-10937-1-git-send-email-schnitzeltony@googlemail.com>
	<1453809321-10937-3-git-send-email-schnitzeltony@googlemail.com>
	<20160223162227.GB2564@jama>
Date: Tue, 23 Feb 2016 19:47:59 +0100
Message-ID: <CALbNGRS8r8+dO9SVWoK88DrDwzxkLJ-tANBAx3fZiznwjjqT-g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/3] geis: initial add 2.2.17
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
X-List-Received-Date: Tue, 23 Feb 2016 18:47:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2016 at 5:22 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Tue, Jan 26, 2016 at 12:55:21PM +0100, Andreas M=C3=BCller wrote:
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  .../canonical-multitouch/geis_2.2.17.bb            | 52 +++++++++++++++=
+++++++
>>  1 file changed, 52 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/canonical-multitouch/geis_2.=
2.17.bb
>>
>> diff --git a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb=
 b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
>> new file mode 100644
>> index 0000000..9403bdf
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
>> @@ -0,0 +1,52 @@
>> +SUMMARY =3D "An implementation of the GEIS interface"
>> +DESCRIPTION =3D "An implementation of the GEIS (Gesture Engine Interfac=
e and Support) \
>> +interface\
>> +GEIS is a library for applications and toolkit programmers which \
>> +provides a consistent platform independent interface for any \
>> +system-wide input gesture recognition mechanism."
>> +
>> +HOMEPAGE =3D "https://launchpad.net/geis"
>> +
>> +LICENSE =3D "GPLv3 & LGPLv3"
>> +LIC_FILES_CHKSUM =3D " \
>> +    file://COPYING;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
>> +    file://COPYING.GPL;md5=3Df27defe1e96c2e1ecd4e0c9be8967949 \
>> +"
>> +
>> +inherit autotools pkgconfig python3native lib_package
>> +
>> +DEPENDS +=3D "grail dbus-glib python3"
>
> Fails to build without XCB (building in DISTRO without x11 in DISTRO_FEAT=
URES)
>
> | configure: error: XCB development libraries not found
>
>
>> +
>> +SRC_URI =3D "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BPN}-=
${PV}.tar.xz"
>> +SRC_URI[md5sum] =3D "2ff9d76a3ea5794516bb02c9d1924faf"
>> +SRC_URI[sha256sum] =3D "8a60f5683852094038904e690d23cc5a90a980fc52da67f=
0f28890baa25c70eb"
>> +
>> +EXTRA_OECONF =3D "--disable-integration-tests"
>> +
>> +FILES_${PN}-bin =3D "${bindir}"
>> +RDEPENDS_${PN}-bin =3D " \
>> +    python3-compression \
>> +    python3-core \
>> +    python3-crypt \
>> +    python3-ctypes \
>> +    python3-fcntl \
>> +    python3-misc \
>> +    python3-pickle \
>> +    python3-shell \
>> +    python3-stringold \
>> +    python3-subprocess \
>> +    python3-textutils \
>> +    python3-threading \
>> +"
>> +
>> +FILES_${PN} +=3D " \
>> +    ${datadir}/geisview \
>> +    ${libdir}/${PYTHON_DIR}/site-packages/geis* \
>> +    ${libdir}/${PYTHON_DIR}/site-packages/_*.so \
>> +"
>> +
>> +FILES_${PN}-dbg +=3D "${libdir}/${PYTHON_DIR}/site-packages/.debug"
>> +
>> +FILES_${PN}-dev +=3D "${libdir}/${PYTHON_DIR}/site-packages/_*.la"
>> +
>> +FILES_${PN}-staticdev +=3D "${libdir}/${PYTHON_DIR}/site-packages/_*.a"
>> --
>> 2.5.0
>>
>> --
Will check if is possible to be modified to build x-less (unlikely) or
add REQUIRED_DISTRO_FEATURES in a lollow up.

Andreas

