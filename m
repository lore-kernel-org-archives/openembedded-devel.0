Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UKwKt-0003TV-Of
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Mar 2013 20:48:40 +0100
Received: by mail-ee0-f53.google.com with SMTP id c13so1718319eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2013 12:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=90gj0Hpu7UecJwYgiVDqsS03zpHm+NV01DjPG+EoHX8=;
	b=ZdQ6ohAvNTxewjmtbPe76WBx4u2aQBMootfihRbNWvR7nAsmssGnKV1jiq9NiBtcPT
	v5knWewgaCgKXbcAEUsGxYACLwPrhqmgjGDVVqk0gRqmTu8SYX3QlbwfmmQ/652VyvyG
	k8E4//BAv0cz/QhwWUfUrmVeBMaPvUbp3tz18zaGlaR9aHHPXc3rYmdpAbgrBpZllSVL
	UjreV2KfzLzE9O9NG/qMtfUooemwYVsn+psSfOd8OVs8o+GIov8p4tvgEdAPJ1R3v5bV
	AypNNDjf6B+PhePqEzQsDZDnbPYGkUlzLihBqfXx4UYoTVbJcCDmwknJ2IEjPS43BL7y
	e74g==
X-Received: by 10.15.32.67 with SMTP id z43mr41105982eeu.24.1364412698348;
	Wed, 27 Mar 2013 12:31:38 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id q5sm33296817eeo.17.2013.03.27.12.31.35
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Mar 2013 12:31:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <EA95FDCC-620F-4ABD-85B1-221410785370@gmail.com>
Date: Wed, 27 Mar 2013 20:31:36 +0100
Message-Id: <B41CDD43-D49D-4D6E-924F-97827805752B@dominion.thruhere.net>
References: <1364378833-16237-1-git-send-email-koen@dominion.thruhere.net>
	<EA95FDCC-620F-4ABD-85B1-221410785370@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQk372oiyPZQIPSwj8mUn2xJiUhkIXec4QPk/diWtZTeaqreHxghKpN4ALHm3wq/XPmuDoHo
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] multipath-tools: add recipe for git version
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
X-List-Received-Date: Wed, 27 Mar 2013 19:48:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 mrt. 2013, om 18:43 heeft Khem Raj <raj.khem@gmail.com> het =
volgende geschreven:

> Hi Koen
>=20
> On Mar 27, 2013, at 3:07 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>=20
>> Multipath-tools hasn't seen a release in 3 years, so grab latest git.
>>=20
>> 'kpartx' is subpackaged since that's the tool most people want.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> .../multipath-tools/multipath-tools_git.bb         | 34 =
++++++++++++++++++++++
>> 1 file changed, 34 insertions(+)
>> create mode 100644 =
recipes-support/multipath-tools/multipath-tools_git.bb
>>=20
>> diff --git a/recipes-support/multipath-tools/multipath-tools_git.bb =
b/recipes-support/multipath-tools/multipath-tools_git.bb
>> new file mode 100644
>> index 0000000..1b83f49
>> --- /dev/null
>> +++ b/recipes-support/multipath-tools/multipath-tools_git.bb
>> @@ -0,0 +1,34 @@
>> +DESCRIPTION =3D "The upstream project used to drive the Device =
Mapper multipathing driver."
>> +
>> +DEPENDS =3D "lvm2 libaio"
>=20
> as I read it also depends on libreadline

OK, fixed that in v2

>=20
>> +
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D7be2873b6270e45abacc503abbe2aa3d"
>> +
>> +
>> +SRC_URI =3D =
"git://git.opensvc.com/multipath-tools/.git;protocol=3Dhttp"
>> +SRCREV =3D "15fc23ffb2bd1bac6990eda3e23c3e8980e6cfa5"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +PV =3D "0.4.9+git"
>> +
>=20
> Is current release 0.4.9 ? I wonder if it will this be ok for upgrade =
path when a release happens=20

It is, so upgrade path is safe=


