Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 789FC71A6E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2016 06:10:00 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 144so3788218pfv.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 22:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:mime-version:subject:date:references:to:in-reply-to:message-id; 
	bh=OhexUGkN0GW3gSFctfewCQ2p/Gc6iajsHkR2O+Hs/W0=;
	b=Jqi/1X343KkEaQZU/QQ6UoT0V40xpjHf3jX37h83cxUY1XlNcv+im4sEYlWsefhUXj
	w+sz1+1NCtFUdZlYjVPVzafXXjc2NG8PR2tDq5ysycgiFUVUoVM7A5FV9G8ZaR7LlSLd
	8jzXLOdczxYjSEi+6v/8d3a8YATCTx2khlIkv7OT7FbNtpVne2S03GWJiVtnHxLbtRgp
	OcjmKgpggqesU+hYh8hAyzRSKJBZJkbMMIQxBCAEhR4BPPnHgC1SbX5syNnAdl67+Aea
	6Lb743iDsbhCjTxWkUi/SytJkJttzqgXumZOI6r7yPlE/ojuxURE7aHwMvN1Z77xwm85
	HhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:subject:date:references:to
	:in-reply-to:message-id;
	bh=OhexUGkN0GW3gSFctfewCQ2p/Gc6iajsHkR2O+Hs/W0=;
	b=Hh7tyEJEQGYRoVQpPL8d2Jel7aLozBthN2leycGZ5KOk8mL0orfCJoxrY5FTzuUcJ9
	KCCs1ZGDQXRgeAmwF9D2XteqtjlKjX0plQH1ze5/ptYv6i/mmdnQnn6/hQRbvjSJkzIE
	hpGnciWu7Qnx2agrHXnffC7lglPm+urzJcueZiI1o8IyW89jh33ioKSQVyxbIXU0eaWs
	JUO5GqglvvQV8ofT2VFf6hLJBQiGh5H9ua443EJlgCGvhlrLLdhGlrqb//57cQwAuhru
	393bkD8hnO9cYwXhA/Zul0Vfnr/j9XFo9Sy96AHMI15JvuAY+jwlphFaIKOpMSVsZOLO
	mkiA==
X-Gm-Message-State: AKaTC00qJc7LGhrG5+GUVFNirQ69KrGMpoWqx3+afoFBLsDMqYxh20ReSDdz1aL9i3ofgQ==
X-Received: by 10.99.222.85 with SMTP id y21mr20892899pgi.119.1480140601055;
	Fri, 25 Nov 2016 22:10:01 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:e574:db7a:d1a9:c4a6?
	([2601:646:8882:b8c:e574:db7a:d1a9:c4a6])
	by smtp.gmail.com with ESMTPSA id 74sm53864801pge.2.2016.11.25.22.10.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Nov 2016 22:10:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Date: Fri, 25 Nov 2016 22:09:59 -0800
References: <20161123092209.23699-1-raj.khem@gmail.com>
	<20161123092209.23699-18-raj.khem@gmail.com>
	<20161126001213.GA8369@jama>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20161126001213.GA8369@jama>
Message-Id: <0998B2AE-AD19-4AB2-A3D3-43F164935753@gmail.com>
X-Mailer: Apple Mail (2.3251)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH V2 18/49] breakpad: Upgrade to latest
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
X-List-Received-Date: Sat, 26 Nov 2016 06:10:00 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 25, 2016, at 4:12 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Wed, Nov 23, 2016 at 01:21:38AM -0800, Khem Raj wrote:
>> Switch to using git
>> Gets aarch64 support
>>=20
>> Define PV and use SRCPV
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> .../breakpad/{breakpad_svn.bb =3D> breakpad_git.bb}  | 22 =
+++++++++++++++++++---
>> 1 file changed, 19 insertions(+), 3 deletions(-)
>> rename meta-oe/recipes-devtools/breakpad/{breakpad_svn.bb =3D> =
breakpad_git.bb} (86%)
>>=20
>> diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb =
b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
>> similarity index 86%
>> rename from meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
>> rename to meta-oe/recipes-devtools/breakpad/breakpad_git.bb
>> index b573ea5..c0e306c 100644
>> --- a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
>> +++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
>> @@ -13,9 +13,25 @@ inherit autotools
>>=20
>> BBCLASSEXTEND =3D "native"
>>=20
>> -SRCREV =3D "r1435"
>> -SRC_URI =3D =
"svn://google-breakpad.googlecode.com/svn;module=3Dtrunk;protocol=3Dhttp"
>> -S =3D "${WORKDIR}/trunk"
>> +PV =3D "1.0+git${SRCPV}"
>=20
> This is still going backwards:
> =
breakpad-1.0+gitAUTOINC+2f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4=
ef5f_1549d20f6d:
> Package version for package breakpad-dbg went backwards which would
> break package feeds from (0:svn-r0.37 to
> =
0:1.0+git0+2f6cb866d6_d8cb47f77d_f7d03d2734_ec44c6c167_cb6dd4ef5f_1549d20f=
6d-r0.0)
> [version-going-backwards]


will bump PE and send v3

>=20
> =
http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/1=
10050.html =
<http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/=
110050.html>
>=20
>> +
>> +SRCREV_FORMAT =3D "breakpad_glog_gmock_gtest_protobuf_lss"
>> +
>> +SRCREV_breakpad =3D "2f6cb866d615d6240a18c7535c994c6bb93b1ba5"
>> +SRCREV_glog =3D "d8cb47f77d1c31779f3ff890e1a5748483778d6a"
>> +SRCREV_gmock =3D "f7d03d2734759ee12b57d2dbcb695607d89e8e05"
>> +SRCREV_gtest =3D "ec44c6c1675c25b9827aacd08c02433cccde7780"
>> +SRCREV_protobuf =3D "cb6dd4ef5f82e41e06179dcd57d3b1d9246ad6ac"
>> +SRCREV_lss =3D "1549d20f6d3e7d66bb4e687c0ab9da42c2bff2ac"
>> +
>> +SRC_URI =3D "git://github.com/google/breakpad;name=3Dbreakpad \
>> +           =
git://github.com/google/glog.git;destsuffix=3Dgit/src/third_party/glog;nam=
e=3Dglog \
>> +           =
git://github.com/google/googlemock.git;destsuffix=3Dgit/src/testing;name=3D=
gmock \
>> +           =
git://github.com/google/googletest.git;destsuffix=3Dgit/src/testing/gtest;=
name=3Dgtest \
>> +           =
git://github.com/google/protobuf.git;destsuffix=3Dgit/src/third_party/prot=
obuf/protobuf;name=3Dprotobuf \
>> +           =
git://chromium.googlesource.com/linux-syscall-support;protocol=3Dhttps;des=
tsuffix=3Dgit/src/third_party/lss;name=3Dlss \
>> +"
>> +S =3D "${WORKDIR}/git"
>>=20
>> COMPATIBLE_MACHINE_powerpc =3D "(!.*ppc).*"
>>=20
>> --=20
>> 2.10.2
>>=20
>> --=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org =
<mailto:Openembedded-devel@lists.openembedded.org>
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel =
<http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com =
<mailto:Martin.Jansa@gmail.com>
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org =
<mailto:Openembedded-devel@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel =
<http://lists.openembedded.org/mailman/listinfo/openembedded-devel>

