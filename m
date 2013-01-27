Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TzZEq-0003pd-Oo
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jan 2013 21:54:04 +0100
Received: by mail-ee0-f43.google.com with SMTP id c50so1022195eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jan 2013 12:38:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=o/IjiRMPuogHw71/cwnPr1ow/LNcIhe1Te9rC2+7GQE=;
	b=A4QsEEiDJgYAQAbBzPo9pV0xgtyKRChXQtY23JMGX0S+/ouZdhZllI5iaoMUh0TCs/
	KSRpmesPxnZiw4j+X4Z035p70S1Bxm58ifNUM7ZmKEtqGLuBn5xmk0L9iVLzsoeyyzoH
	Sl7GEgWifB9x08LZV5LC2bOortyCCNfLkLf96/syhdqpekA2DbuJmU3mC7yIW/BNmxYk
	I2IXGFquh3CxwQqIuJlLiJq2egO9m3bjQkP8y7i9AqP9QBCnGO/TkW0hiJeUJu49MNRr
	W0JBUY2Sat+nB1QJWAbwbYXefjHWpMRghUVw4vdmNlmjwWxArGk+TK3QEtZsHkMwqhjQ
	NP5g==
X-Received: by 10.14.214.67 with SMTP id b43mr43763150eep.33.1359319107372;
	Sun, 27 Jan 2013 12:38:27 -0800 (PST)
Received: from ?IPv6:2001:610:612::1c07:3abe:32b3:815c?
	([2001:610:612:0:1c07:3abe:32b3:815c])
	by mx.google.com with ESMTPS id f6sm12953158eeo.7.2013.01.27.12.38.24
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 27 Jan 2013 12:38:25 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20130127191927.GM16904@jama.palm1.palmone.com>
Date: Sun, 27 Jan 2013 21:38:23 +0100
Message-Id: <328BB083-E45B-457F-BD2B-30873D552E5E@dominion.thruhere.net>
References: <1359301282-5470-1-git-send-email-koen@dominion.thruhere.net>
	<1359301282-5470-4-git-send-email-koen@dominion.thruhere.net>
	<20130127191927.GM16904@jama.palm1.palmone.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQkg2bhciXUAWo6l43ngl8XlzPh99gzzVkGT6OR9KQVENxx5hU7vhBkZfOhwFJebPFKrONsf
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 4/7] x264: add git version
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
X-List-Received-Date: Sun, 27 Jan 2013 20:54:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 jan. 2013, om 20:19 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:

> On Sun, Jan 27, 2013 at 04:41:19PM +0100, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta-oe/recipes-multimedia/x264/x264_git.bb | 43 =
+++++++++++++++++++++++++++++
>> 1 file changed, 43 insertions(+)
>> create mode 100644 meta-oe/recipes-multimedia/x264/x264_git.bb
>>=20
>> diff --git a/meta-oe/recipes-multimedia/x264/x264_git.bb =
b/meta-oe/recipes-multimedia/x264/x264_git.bb
>> new file mode 100644
>> index 0000000..ba8e979
>> --- /dev/null
>> +++ b/meta-oe/recipes-multimedia/x264/x264_git.bb
>> @@ -0,0 +1,43 @@
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
>> +X264_DISABLE_ASM =3D ""
>> +X264_DISABLE_ASM_armv4 =3D "--disable-asm"
>> +X264_DISABLE_ASM_armv4t =3D "--disable-asm"
>> +X264_DISABLE_ASM_armv5te =3D "--disable-asm"
>=20
> Can we use more generic overrides?
> meta/conf/machine/include/arm/arch-armv5.inc:MACHINEOVERRIDES .=3D =
"${@bb.utils.contains("TUNE_FEATURES", "armv5", ":armv5", "" ,d)}"
> meta/conf/machine/include/arm/arch-armv4.inc:MACHINEOVERRIDES .=3D =
"${@bb.utils.contains("TUNE_FEATURES", "armv4", ":armv4", "" ,d)}"
>=20
> I'll update it in jansa/in-test, but send me your ack.

Thanks!

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

>=20
> PKG_ARCH is not in default OVERRIDES IIRC and with different distro
> settings for default tune it could be also xscalete or arm926ejste =
etc.

I hadn't thought about that, thanks for noticing!

>=20
> Cheers,
>=20
>> +
>> +EXTRA_OECONF =3D '--prefix=3D${prefix} \
>> +                --host=3D${HOST_SYS} \
>> +                --cross-prefix=3D${TARGET_PREFIX} \
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
>> 1.8.1
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



