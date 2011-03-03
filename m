Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pv0Ob-0001hL-BE
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Mar 2011 05:44:13 +0100
Received: by iwn10 with SMTP id 10so682411iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2011 20:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=AVAvmlE8+F8CkXVMyyhSIrdeinhOE9ulI1sverLth1Q=;
	b=g0gQe2i+YfP6aHjHc//qdyVOWztYdhOXAUtsFRq6tf8Kc+7mYccixxVQBoI1gq7eGL
	xZuorhutA2VWMw1xBPI7vrq9ybStfg+t41G5xa7BwdZRnUJSUH16wkF3O1l702lNbysQ
	HOeojd84rJuAZJ4OuraHV/oh7e+rNhqwP01Z4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	b=itY+nMrv6wNfwJXVt+lRuQmjK+M13fjaITIJ6krSLbScHKs4L4uZvZxwtT/cfbyfXc
	WQj2AmGDnLHIQ+Ut6PwT/pMiLD5nB60KEP4KIIImetPHRwoBcFmvudVipeEEE/JLDz95
	6/8dieri4yZt7Cc//LAky1Q70k0yl/WYmUGfs=
Received: by 10.231.12.68 with SMTP id w4mr620030ibw.50.1299127364821;
	Wed, 02 Mar 2011 20:42:44 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id z4sm558352ibg.13.2011.03.02.20.42.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 20:42:43 -0800 (PST)
Date: Wed, 2 Mar 2011 20:42:39 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110303044239.GC2692@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1299076864.3857.46.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1299076864.3857.46.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: minimal-uclibc: alsa-utils_1.0.24.2: task compile fails with `warning: incompatible implicit declaration of built-in function 'exp10'`
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
X-List-Received-Date: Thu, 03 Mar 2011 04:44:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On (02/03/11 15:41), Paul Menzel wrote:
> Dear OE folks,
>=20
>=20
>=20
> task compile of `alsa-utils_1.0.24.2` committed in 679b4bb0 [1] fails
> with the following error message using `minimal-uclibc` for
> `MACHINE=3D"beagleboard"`.
>=20
> 	arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/buil=
d-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DH=
AVE_CONFIG_H -I. -I../include    -I/oe/build-minimal-uclibc/minimal-uclibc-=
dev/sysroots/i686-linux/usr/include -I/oe/build-minimal-uclibc/minimal-ucli=
bc-dev/sysroots/i686-linux/usr/include/ncurses -DCURSESINC=3D"<ncurses.h>" =
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe=
 -I/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucl=
ibceabi/usr/include -MT utils.o -MD -MP -MF .deps/utils.Tpo -c -o utils.o u=
tils.c
> 	arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/buil=
d-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DH=
AVE_CONFIG_H -I. -I../include    -I/oe/build-minimal-uclibc/minimal-uclibc-=
dev/sysroots/i686-linux/usr/include -I/oe/build-minimal-uclibc/minimal-ucli=
bc-dev/sysroots/i686-linux/usr/include/ncurses -DCURSESINC=3D"<ncurses.h>" =
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe=
 -I/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucl=
ibceabi/usr/include -MT volume_mapping.o -MD -MP -MF .deps/volume_mapping.T=
po -c -o volume_mapping.o volume_mapping.c
> 	volume_mapping.c: In function 'get_normalized_volume':
> 	volume_mapping.c:112:15: warning: incompatible implicit declaration of b=
uilt-in function 'exp10'
> 	volume_mapping.c: In function 'set_normalized_volume':
> 	volume_mapping.c:147:14: warning: incompatible implicit declaration of b=
uilt-in function 'exp10'
> 	mv -f .deps/mixer_widget.Tpo .deps/mixer_widget.Po
> 	arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/buil=
d-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DH=
AVE_CONFIG_H -I. -I../include    -I/oe/build-minimal-uclibc/minimal-uclibc-=
dev/sysroots/i686-linux/usr/include -I/oe/build-minimal-uclibc/minimal-ucli=
bc-dev/sysroots/i686-linux/usr/include/ncurses -DCURSESINC=3D"<ncurses.h>" =
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe=
 -I/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucl=
ibceabi/usr/include -MT widget.o -MD -MP -MF .deps/widget.Tpo -c -o widget.=
o widget.c
> 	mv -f .deps/utils.Tpo .deps/utils.Po
> 	mv -f .deps/volume_mapping.Tpo .deps/volume_mapping.Po
> 	mv -f .deps/widget.Tpo .deps/widget.Po
> 	mv -f .deps/mixer_display.Tpo .deps/mixer_display.Po
> 	arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/buil=
d-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -I/=
oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/i686-linux/usr/include =
-I/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/i686-linux/usr/inclu=
de/ncurses -DCURSESINC=3D"<ncurses.h>" -fexpensive-optimizations -fomit-fra=
me-pointer -frename-registers -Os -pipe -I/oe/build-minimal-uclibc/minimal-=
uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/include  -Wl,-O1 -Wl,--h=
ash-style=3Dgnu  -L/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/arm=
v7a-oe-linux-uclibceabi/usr/lib -o alsamixer card_select.o cli.o colors.o d=
evice_name.o die.o mainloop.o mem.o mixer_controls.o mixer_display.o mixer_=
widget.o proc_files.o textbox.o utils.o volume_mapping.o widget.o -L/oe/bui=
ld-minimal-uclibc/minimal-uclibc-dev/sysroots/i686-linux/usr/lib -lform -lm=
enu -lpanel -lncurses -ltinfo -lasound -L/oe/build-minimal-uclib
> c/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/lib -lm -ldl=
 -lpthread
> 	/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucl=
ibceabi/usr/lib/libasound.so: warning: gethostbyname is obsolescent, use ge=
tnameinfo() instead.
> 	volume_mapping.o: In function `get_normalized_volume':
> 	volume_mapping.c:(.text+0x124): undefined reference to `exp10'
> 	volume_mapping.c:(.text+0x154): undefined reference to `exp10'
> 	volume_mapping.o: In function `set_normalized_volume':
> 	volume_mapping.c:(.text+0x2d4): undefined reference to `exp10'
> 	collect2: ld returned 1 exit status

exp10 and pow10 are unimplemented in uclibc

-Khem


