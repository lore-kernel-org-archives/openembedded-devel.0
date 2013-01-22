Received: from mail-ea0-f179.google.com ([209.85.215.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TxZHE-0007hM-Uh
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 09:32:53 +0100
Received: by mail-ea0-f179.google.com with SMTP id d12so1962364eaa.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 00:16:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=KbcdYkhW8/CMIJCQInAsyYvdd76xNUImaFTQdvR+vm0=;
	b=NBBLWyGKfiSJNsZrRI9UbdY0TRBfdwrgwCC5fMuOmZOPahcQMXm5MgMDKLO6fWZzWD
	HnemagsCrFCsE+95snS9oNNxdHwTUypP9jbHCmBd5zFGq71B28VuyqGfFTGMxtXv31dC
	+oRJfRDK1+bfyz+Jd1Y9vitWycGvGe1VFhv0+CZBRHESkdcrmz6gYLkjFdoAyoe0zHr2
	TQUbNPvoVvLYUGRqB8baqMyviwG+RV3y4jKvHu7vVQu6XGQrfz+Iwg4E6OQAIyxGWhQp
	Ls8Tu/SNvVgLa1VaEUCii2B8si9/MCwaqOIZXZUnBqrcQrts0OX3jW/lxLc+IayXEIUk
	kRRg==
X-Received: by 10.14.174.198 with SMTP id x46mr69884350eel.23.1358842607193;
	Tue, 22 Jan 2013 00:16:47 -0800 (PST)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id g2sm3179064eep.16.2013.01.22.00.16.44
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 00:16:46 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20130121102520.GM29386@jama.palm1.palmone.com>
Date: Tue, 22 Jan 2013 09:16:43 +0100
Message-Id: <32A56019-9BB6-4E54-874B-7F56D95006BA@dominion.thruhere.net>
References: <1358681528-19761-1-git-send-email-koen@dominion.thruhere.net>
	<1358681528-19761-2-git-send-email-koen@dominion.thruhere.net>
	<20130121102520.GM29386@jama.palm1.palmone.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQnNx8saGdGCU14rf4oY21fr9ddh6RmBnM+4xAGHxWPFhlPoclt4r4pq2f1o/s8CtTI0A5C7
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-multimedia][PATCH v2 2/7] x264: add git version
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
X-List-Received-Date: Tue, 22 Jan 2013 08:32:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 jan. 2013, om 11:25 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:

> On Sun, Jan 20, 2013 at 12:32:03PM +0100, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta-oe/recipes-multimedia/x264/x264_git.bb | 38 =
+++++++++++++++++++++++++++++
>> 1 file changed, 38 insertions(+)
>> create mode 100644 meta-oe/recipes-multimedia/x264/x264_git.bb
>>=20
>> diff --git a/meta-oe/recipes-multimedia/x264/x264_git.bb =
b/meta-oe/recipes-multimedia/x264/x264_git.bb
>> new file mode 100644
>> index 0000000..8199a83
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
>> +                --cross-prefix=3D${TARGET_PREFIX} \
>> +                --sysroot=3D${STAGING_DIR_TARGET} \
>> +                --enable-shared \
>> +                --enable-static \
>> +                --disable-lavf \
>> +                ${X264_DISABLE_ASM} \
>> +               '
>=20
> Did you forget to initialize X264_DISABLE_ASM?
>=20
> | You specified a pre-ARMv6 or Thumb-1 CPU in your CFLAGS.
> | If you really want to run on such a CPU, configure with =
--disable-asm.
> | ERROR: Function failed: do_configure (see
> =
/OE/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/x264/r2230+git-r0/t=
emp/log.do_configure.369
> for further information)

What's the TARGET_ARCH for that one? I'll add the arch overrides for =
disabling the asm, but I'll need some help figuring out what those archs =
are :)

regards,

Koen=


