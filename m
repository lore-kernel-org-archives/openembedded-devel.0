Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OzHRe-0007Om-4G
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Sep 2010 01:12:46 +0200
Received: by iwn2 with SMTP id 2so974486iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 16:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Trjx/7O2cBZAI8FhIg9V+qevZ0Ymvac3BmFB6+5WxEw=;
	b=k3dg9Y1hjdMerMC+OAXLcybvePsf/JqfwxBSzMmhyr2BEq6tOZrfL/KPsi4DmSwBW4
	HZeSR52D2e0YBjKRN2SbTLU1ZFBB3xehQwcIuiDje5ZsoYdwGPqFJqJ9FnjgOyv4gnN0
	o+bdN0hhylDaK6qQsFzlWtoE8I53OjrirzGII=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=wV1lhnJSqe/FXf7/I/KXudJ80JcX6t1wHpAEHh0PpAyTmJziHQTB/7Vk2d33oerGGW
	QWzg7vzNaHATu5cvjMde1aHNvvnB5m5wetaCjH/B6CenqekqhRGE53K7YU7yxNTNGo3M
	Mnj5aDg9hX1fSW9tOEMKchLSmsUjW2nPH44+I=
Received: by 10.231.33.73 with SMTP id g9mr4270509ibd.117.1285369958536; Fri,
	24 Sep 2010 16:12:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Fri, 24 Sep 2010 16:12:18 -0700 (PDT)
In-Reply-To: <1285365372-13498-1-git-send-email-iwamatsu@nigauri.org>
References: <1285365372-13498-1-git-send-email-iwamatsu@nigauri.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Sep 2010 16:12:18 -0700
Message-ID: <AANLkTi=hAYRVMX9xNsPXXiuDC3536An1jX_tFmP1PLf3@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] machine/sh7785lcr: Add new machine for Renesas SH7785 reference board
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
X-List-Received-Date: Fri, 24 Sep 2010 23:12:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 24, 2010 at 2:56 PM, Nobuhiro Iwamatsu <iwamatsu@nigauri.org> w=
rote:
> * Machine config for Renesas SH7785 reference board.
> * Add kernel config for 2.6.32 and 35.
>
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> ---
> =C2=A0conf/machine/include/tune-sh4.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0conf/machine/sh7785lcr.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 20 +
> =C2=A0recipes/linux/linux-2.6.32/sh7785lcr/defconfig | 1833 +++++++++++++=
+++++++++
> =C2=A0recipes/linux/linux-2.6.35/sh7785lcr/defconfig | 1927 +++++++++++++=
+++++++++++
> =C2=A0recipes/linux/linux_2.6.32.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 +
> =C2=A0recipes/linux/linux_2.6.35.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 +
> =C2=A06 files changed, 3784 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 conf/machine/sh7785lcr.conf
> =C2=A0create mode 100644 recipes/linux/linux-2.6.32/sh7785lcr/defconfig
> =C2=A0create mode 100644 recipes/linux/linux-2.6.35/sh7785lcr/defconfig
>
> diff --git a/conf/machine/include/tune-sh4.inc b/conf/machine/include/tun=
e-sh4.inc
> index 5d43e41..56c75a8 100644
> --- a/conf/machine/include/tune-sh4.inc
> +++ b/conf/machine/include/tune-sh4.inc
> @@ -1,3 +1,5 @@
> +# If you want to optimize to sh4a, you need to change
> +# from -m4 to m4a.
> =C2=A0TARGET_CC_ARCH =3D "-ml -m4"
> =C2=A0FEED_ARCH =3D "sh4"
> =C2=A0BASE_PACKAGE_ARCH =3D "sh4"

you could add another tune file for sh4a called
tune-sh4a.inc and include that for appropriate
machines. rest of patch looks good to me.

Thx
-Khem


