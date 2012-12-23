Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TmrYK-0000hX-Se
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 20:49:43 +0100
Received: by mail-ea0-f171.google.com with SMTP id n10so2699733eaa.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 11:34:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=lMPodicqsHGfU1QvMT7yhpS1HpyXuF1SPbb7kpk/lnE=;
	b=YOn9UqRL3RgLZwwjUoy4Nj0fuKSI7GY6YQkDbiOt3cujOl4RpDYl1vZCQu4K9i32WI
	QQUiqPlP0IhAWrJipFzCZpkQ8WGf6tGFzxSK4W3vJd3ZwP7JxbJFhzsGmNIPVazwuy+u
	ff0T1MdNCdL5x9MRL9n0YZWtnHsbBWtAKGigkx3gnRyHWYzABMv6B0o5x9zYC/HFEMwU
	kjfq5LCF7EMvUo8KtLRdwc95W2P23KlGVTZKr23giWCel6Wji0i4q9NFV/n4CZ8eC64d
	zyVBffnr3IuHJjWIril47xMHLCBN6EJZzWIP6L4e2tX7255UYMIFDARnKsGtgzxAkdqV
	C6uQ==
X-Received: by 10.14.215.194 with SMTP id e42mr50028286eep.32.1356291292069;
	Sun, 23 Dec 2012 11:34:52 -0800 (PST)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id 44sm36647755eek.0.2012.12.23.11.34.50
	(version=SSLv3 cipher=OTHER); Sun, 23 Dec 2012 11:34:51 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20121223104231.GG8988@jama.palm1.palmone.com>
Date: Sun, 23 Dec 2012 20:34:51 +0100
Message-Id: <347E1932-2556-44F8-85E9-17C2B3C76CF8@dominion.thruhere.net>
References: <1356172826-24392-1-git-send-email-koen@dominion.thruhere.net>
	<20121223104231.GG8988@jama.palm1.palmone.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQnw6ECpaOpWCpeaYB3VvpmIHmtrScWGCg5yuOQHTXfa9yOqKGrJ7bvCjGknl8n4pq4oLqcc
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-multimedia][PATCH 1/2] x264: add git version
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
X-List-Received-Date: Sun, 23 Dec 2012 19:49:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 dec. 2012, om 11:42 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:

> On Sat, Dec 22, 2012 at 11:40:25AM +0100, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>=20
> This depends on yasm-native from meta-intel, can we get yasm somewhere
> else?

I'll import it into meta-oe for the time being, but I think it should go =
into oe-core.

> And please fix tabs in EXTRA_OECONF (--cross-prefix=3D line).

I'll fix that in v2, thanks for noticing!

regards,

Koen

>=20
> Cheers,
>=20
>> ---
>> meta-oe/recipes-multimedia/x264/x264_git.bb |   38 =
+++++++++++++++++++++++++++
>> 1 files changed, 38 insertions(+), 0 deletions(-)
>> create mode 100644 meta-oe/recipes-multimedia/x264/x264_git.bb
>>=20
>> diff --git a/meta-oe/recipes-multimedia/x264/x264_git.bb =
b/meta-oe/recipes-multimedia/x264/x264_git.bb
>> new file mode 100644
>> index 0000000..79e4988
>> --- /dev/null
>> +++ b/meta-oe/recipes-multimedia/x264/x264_git.bb
>> @@ -0,0 +1,38 @@
>> +SUMMARY =3D "x264 is a free software library and application for =
encoding video streams into the H.264/MPEG-4 AVC format"
>> +HOMEPAGE =3D "http://www.videolan.org/developers/x264.html"
>> +
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f"
>> +
>> +DEPENDS =3D "yasm-native"
>> +
>> +SRC_URI =3D "git://git.videolan.org/x264.git"
>> +SRCREV =3D "1cffe9f406cc54f4759fc9eeb85598fb8cae66c7"
>> +
>> +PV =3D "r2230+git"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +inherit lib_package pkgconfig
>> +
>> +EXTRA_OECONF =3D '--prefix=3D${prefix} \
>> +                --host=3D${HOST_SYS} \
>> +		--cross-prefix=3D${TARGET_PREFIX} \
>> +                --sysroot=3D${STAGING_DIR_TARGET} \
>> +                --enable-shared \
>> +                --enable-static \
>> +                --disable-lavf \
>> +                ${X264_DISABLE_ASM} \
>> +               '
>> +
>> +do_configure() {
>> +	./configure ${EXTRA_OECONF}
>> +}
>> +
>> +# Get rid of -e
>> +EXTRA_OEMAKE =3D ""
>> +AS =3D "${TARGET_PREFIX}gcc"
>> +
>> +do_install() {
>> +	oe_runmake install DESTDIR=3D${D}
>> +}
>> --=20
>> 1.7.7.6
>>=20
>>=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



