Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Olxye-0001gg-Lw
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 07:47:49 +0200
Received: by iwn38 with SMTP id 38so1437507iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 22:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=4PJrl/8RXnZ55XkvZy1ZRk0I5DrT6G9ZDfFgHx4PpuI=;
	b=kzjz0WDqDqqprkKhpt7Yv/9YoeRSlQKcIdK3UJT38xhwB1mfnk1+GwYL/xDgRWUB3E
	fbTGY5xHsKFkL2eLKG0tm36HUGS3C1XraOAf5ZbXKIcejpD7E2voWqs3K6I/snjnGR+q
	1gC3CdS3QCR/TeeoKdXWxeh26v49K3CF+khQA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=hM5n+dkF6a7EXDr6riN/u8VD/Mc1+s1FoX7250ZUjXu6wlu9eaghLFXyG+0D0ZNZL+
	TKaFbDYDwD/IF+QBOnNklaDrxga8eDBkrE6TJ1uWX7oXiUZZpFSVwcwUuaQFlkPPloJF
	+/8bTDRpRo8vGLzF3LMkEKUb2UAI2SMuMDnAs=
Received: by 10.231.36.77 with SMTP id s13mr10105462ibd.190.1282196850375;
	Wed, 18 Aug 2010 22:47:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.199 with HTTP; Wed, 18 Aug 2010 22:47:09 -0700 (PDT)
In-Reply-To: <811234B8-DFDF-42A4-9064-757210CE3CE5@chumby.com>
References: <811234B8-DFDF-42A4-9064-757210CE3CE5@chumby.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Aug 2010 22:47:09 -0700
Message-ID: <AANLkTimMOkX_oRmKZxEq2JxWfvTEoPEL4jcxHh0jTNsE@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] Add falconwing machine config
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
X-List-Received-Date: Thu, 19 Aug 2010 05:47:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 18, 2010 at 4:03 PM, Sean Cross <sean@chumby.com> wrote:
>
> Signed-off-by: Sean Cross <sean@chumby.com>
> ---
> =A0conf/machine/chumby-falconwing.conf | =A0 24 ++++++++++++++++++++++++
> =A01 files changed, 24 insertions(+), 0 deletions(-)
> =A0create mode 100644 conf/machine/chumby-falconwing.conf
> diff --git a/conf/machine/chumby-falconwing.conf b/conf/machine/chumby-fa=
lconwin
> g.conf
> new file mode 100644
> index 0000000..ed48cdb
> --- /dev/null
> +++ b/conf/machine/chumby-falconwing.conf
> @@ -0,0 +1,24 @@
> +#@TYPE: Machine
> +#@Name: chumby Falconwing machine config.+#@DESCRIPTION: Machine configu=
ration for chumby Falconwing-based boards, such a
> s the chumby One
> +
> +TARGET_ARCH =3D "arm"
> +
> +MACHINE_GUI_CLASS =3D "smallscreen"
> +MACHINE_DISPLAY_WIDTH_PIXELS =3D "320"
> +MACHINE_DISPLAY_HEIGHT_PIXELS =3D "240"
> +
> +PREFERRED_PROVIDER_virtual/kernel =3D "linux-chumby-falconwing"
> +PREFERRED_PROVIDER_virtual/bootloader =3D "bootstream-chumby-falconwing"
> +
> +require conf/machine/include/tune-arm926ejs.inc
> +
> +# used by sysvinit_2
> +SERIAL_CONSOLE =3D "115200 ttyAM0"

should this be ttyAMA0 ?

-Khem


