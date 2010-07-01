Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OUDP1-0000Gk-9F
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 08:37:41 +0200
Received: by iwn34 with SMTP id 34so1733935iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 23:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=S8oDEYj4UEbL20yNPh0YROsM7E4Seql+tZa1sH67+qU=;
	b=yA0/pWaHtvideZfmvyuV8PgPA4A5h5Xxi/oJqPPLUQMxzjAt7PnQHUP3TK2ngKalnu
	drJwDA5zv0ETwm6nWTH1KnpE8yam5qela4gWJqVjghQhGMCI5XeD60JuzP+axIZfB9LT
	ghgf3BDl52qF8oP+hnjTQh8Qu0KftdI+BCpBM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=vX2kebS+amRPgTblndRw8V38qOQg3cpJ70GHCmyXyNsdeMmONydguX9Qxd4CjSipHM
	5Yx2uXL7bru3XP4j5Bm0zxfXSocyRl9lDWGxJNOSmx+uvl7Aqn2dYZfRkYWbC4FZYErr
	UrQIN49NKRIvRJWhmiFqvLDtGL5j8RwCl8Ujc=
Received: by 10.231.47.71 with SMTP id m7mr8957186ibf.154.1277965976214; Wed, 
	30 Jun 2010 23:32:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Wed, 30 Jun 2010 23:32:36 -0700 (PDT)
In-Reply-To: <4C2BD53A.40507@gmail.com>
References: <4C2BD53A.40507@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Jun 2010 23:32:36 -0700
Message-ID: <AANLkTikSK_olIOY2mmh5E2zV-XWrHf1N0UdFV2r_5dtC@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] xserver-kdrive_1.5.3.bb: add openssl to DEPENDS.
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
X-List-Received-Date: Thu, 01 Jul 2010 06:37:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 30, 2010 at 4:37 PM, Graham Gower <graham.gower@gmail.com> wrot=
e:
> The build fails without openssl.
>
> | mipsel-oe-linux-libtool: compile: =A0ccache mipsel-oe-linux-gcc -march=
=3Dmips32 -DHAVE_CONFIG_H -I. -I../include -isystem/home/grg/oe2/tmp/sysroo=
ts/mipsel-oe-linux/usr/include -DHAVE_DIX_CONFIG_H -Wall -Wpointer-arith -W=
strict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wnested-exte=
rns -fno-strict-aliasing -D_BSD_SOURCE -DHAS_FCHOWN -DHAS_STICKY_DIR_BIT -D=
DBUS_API_SUBJECT_TO_CHANGE -I/home/grg/oe2/tmp/sysroots/mipsel-oe-linux/usr=
/include/freetype2 -I/home/grg/oe2/tmp/sysroots/mipsel-oe-linux/usr/include=
/pixman-1 -I/home/grg/oe2/tmp/sysroots/mipsel-oe-linux/usr/include/hal -I/h=
ome/grg/oe2/tmp/sysroots/mipsel-oe-linux/usr/include/dbus-1.0 -I/home/grg/o=
e2/tmp/sysroots/mipsel-oe-linux/usr/lib/dbus-1.0/include -I/home/grg/oe2/tm=
p/sysroots/mipsel-oe-linux/home/grg/oe2/tmp/sysroots/x86_64-linux/usr/inclu=
de -I../include -I../include -I../Xext -I../composite -I../damageext -I../x=
fixes -I../Xi -I../mi -I../miext/shadow -I../miext/damage -I../render -I../=
randr -I../fb -I/home/
> grg/oe2/tmp/sysroots/mipsel-oe-linux/usr/include/xextproto-70 -isystem/ho=
me/grg/oe2/tmp/sysroots/mipsel-oe-linux/usr/include -fexpensive-optimizatio=
ns -fomit-frame-pointer -frename-registers -Os -MT glyph.lo -MD -MP -MF .de=
ps/glyph.Tpo -c glyph.c =A0-fPIC -DPIC -o .libs/glyph.o
> | glyph.c:30:25: error: openssl/sha.h: No such file or directory
> | glyph.c: In function 'HashGlyph':
> | glyph.c:205: error: 'SHA_CTX' undeclared (first use in this function)
> | glyph.c:205: error: (Each undeclared identifier is reported only once
> | glyph.c:205: error: for each function it appears in.)
> | glyph.c:205: error: expected ';' before 'ctx'
> | glyph.c:208: warning: implicit declaration of function 'SHA1_Init'
> | glyph.c:208: warning: nested extern declaration of 'SHA1_Init'
> | glyph.c:208: error: 'ctx' undeclared (first use in this function)
> | glyph.c:212: warning: implicit declaration of function 'SHA1_Update'
> | glyph.c:212: warning: nested extern declaration of 'SHA1_Update'
> | glyph.c:220: warning: implicit declaration of function 'SHA1_Final'
> | glyph.c:220: warning: nested extern declaration of 'SHA1_Final'
> | make[1]: *** [glyph.lo] Error 1
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>


> ---
> =A0recipes/xorg-xserver/xserver-kdrive_1.5.3.bb | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/xorg-xserver/xserver-kdrive_1.5.3.bb b/recipes/xorg-=
xserver/xserver-kdrive_1.5.3.bb
> index 7250a61..7fbdff2 100644
> --- a/recipes/xorg-xserver/xserver-kdrive_1.5.3.bb
> +++ b/recipes/xorg-xserver/xserver-kdrive_1.5.3.bb
> @@ -1,6 +1,6 @@
> =A0require xserver-kdrive-common.inc
>
> -DEPENDS +=3D "hal libxkbfile libxcalibrate pixman"
> +DEPENDS +=3D "hal libxkbfile libxcalibrate pixman openssl"
> =A0RDEPENDS_${PN} +=3D "hal"
>
> =A0DEFAULT_PREFERENCE =3D "-99"
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


