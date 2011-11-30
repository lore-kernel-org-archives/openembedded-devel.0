Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVtWx-0003rr-UO
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 00:25:36 +0100
Received: by ggnh1 with SMTP id h1so1231719ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 15:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=3Y3X6AgzkybpPkxBIKp7gLqBndXH7v1YA+j57Pw2BrA=;
	b=tn93yHY8i+e2uXDLeFlSiDGyzfA+n1zBqe46jo21XHonhkNwYJMMYbr8+R19VxHf05
	79sM/TL1efB08UVgFEBW3dp8AaGXXlvKf7m6XCgyyTp17Usy24a8n1Ix9T59QAA5mFw5
	aP5zqOYk1YlJaw+tUr+y750uu55R/jnyjk3dk=
MIME-Version: 1.0
Received: by 10.236.154.166 with SMTP id h26mr7506220yhk.88.1322695134925;
	Wed, 30 Nov 2011 15:18:54 -0800 (PST)
Received: by 10.146.97.36 with HTTP; Wed, 30 Nov 2011 15:18:54 -0800 (PST)
In-Reply-To: <20111130143236.2A06010331@opal>
References: <20111130143236.2A06010331@opal>
Date: Thu, 1 Dec 2011 00:18:54 +0100
Message-ID: <CA+chaQctkMN+3h6zjmjXxYMvH_bqqL8UXc7akAE=cx7hnxH+kg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Koen Kooi : pixman: update to 0.24.0
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
X-List-Received-Date: Wed, 30 Nov 2011 23:25:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2011 at 3:32 PM,  <git@git.openembedded.org> wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: 80e3a0c42db89fa2716b0a839b8ef71d6d6349db
> URL: =C2=A0 =C2=A0http://git.openembedded.org/?p=3Dmeta-openembedded.git&=
a=3Dcommit;h=3D80e3a0c42db89fa2716b0a839b8ef71d6d6349db
>
> Author: Koen Kooi <koen@dominion.thruhere.net>
> Date: =C2=A0 Wed Nov 30 15:27:26 2011 +0100
>
> pixman: update to 0.24.0
>
> * All patches that went upstream are removed
>
> Tested on beagleboard/angstrom
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>

FYI: this break my armv5t build, I'll try to test pixman-0.24.0 from
oe-core or debug it tomorrow.

| arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc
-march=3Darmv5te -mthumb -mthumb-interwork -mtune=3Dxscale
--sysroot=3D/OE/shr-core/tmp-eglibc/sysroo
ts/spitz -O2 -pipe -g -feliminate-unused-debug-types -Wall
-fno-strict-aliasing -fvisibility=3Dhidden -Wl,-O1 -Wl,--hash-style=3Dgnu
-Wl,--as-needed -o .libs/pdf-op-test pdf-op-test.o  ./.libs/libutils.a
../pixman/.libs/libpixman-1.so
/OE/shr-core/tmp-eglibc/sysroots/spitz/usr/lib/libpng12.so
/OE/shr-core/tmp-eglibc/sysroots/spitz/usr/lib/libz.so -lm
| ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wsl=
ldi'
| ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wor=
'
| ../pixman/.libs/libpixman-1.so: undefined reference to
`__builtin_arm_wunpckilb'
| ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wsr=
ldi'
| ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wad=
dbus'
| ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wad=
dhus'
| ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wsr=
lhi'
| ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wxo=
r'
| ../pixman/.libs/libpixman-1.so: undefined reference to
`__builtin_arm_wpackhus'
| ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wan=
d'
| ../pixman/.libs/libpixman-1.so: undefined reference to
`__builtin_arm_wunpckihb'
| ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wze=
ro'
| ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wal=
ign'
| ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_wmu=
lul'
| collect2: ld returned 1 exit status
| make[2]: *** [a1-trap-test] Error 1

The same for region-test and pdf-op-test.

Cheers,


