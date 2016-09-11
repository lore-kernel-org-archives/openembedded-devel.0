Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5701D77166
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 12:05:37 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id v189so4462369vkv.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 05:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=MzzXZt47X3nENABb0GnJ02jygP/FQYt60FH/u0J10ME=;
	b=gvD7HIy/f+h3iCrZPxk9UfTI3tfXG+EJANakKSEUDxDd8QO5LtnAfu2WFZjwBecBpX
	zsPiIYo9ms4Z8HU0LWDC0YGBJE1tS8ovN2Bn007/M8DAa9TRz3QWkrDYETctTPHK6zNv
	h63KBe6vWKd43Y1dltz3HqNKIsKbBR8TxH9vboe6wbnKpTx8wUdbjwY5tNYE85xZCc3o
	5q9syYPB8Hc4yqZMdZrzfWrM36zBVc5VQ60g5b4t25tRVpivR4t5WFli3OZIBnnpoYdA
	DZxD/wWTlZoetEXtcEdhQtG9WG1baf5nkg4IdQwgzEzrRH6l2DqTu+MUGV4VHhdgE/rk
	PqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=MzzXZt47X3nENABb0GnJ02jygP/FQYt60FH/u0J10ME=;
	b=hirQiwdxx7mnlXQaAbDtZQBT5/lOHAVg1QTBO6yM/HEnjS1ucbl4N7R/I6PAE13dEr
	vEorc9eXWkmkzCGRuHN23RStTeEufBDUFliNEXbONdssPcDoep5Uj5/qMLnIHga9b5k8
	DzREI9xlga2xuOkmj1JfvKhLJA66FiSXgVPcFUkk8b2Kxaaj7FS0hcXWJr7+dAe6dMtb
	WXTwIAp/BWHTRODuLlPnWjQ0yo7DftoNXRcEn9O0As6/orn7+4gm6v2hbPFm0fSPP0IJ
	07dqCwJxmvOoNdO6ttgntlF8q59sboGRtA5jl2g8KQ2THKtJVI0id7IawAjsY3/rPmav
	/OcQ==
X-Gm-Message-State: AE9vXwMlYAMB723Z46CJe4grDgLX9C/yQsL7Jl3yDlny/p0Pn84XppHO2eEcR8+Q7uyWN/HCwf94m5DrdcUrtQ==
X-Received: by 10.31.199.67 with SMTP id x64mr7962493vkf.124.1473595538481;
	Sun, 11 Sep 2016 05:05:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Sun, 11 Sep 2016 05:05:38 -0700 (PDT)
In-Reply-To: <1473020112-25797-5-git-send-email-schnitzeltony@googlemail.com>
References: <1473020112-25797-1-git-send-email-schnitzeltony@googlemail.com>
	<1473020112-25797-5-git-send-email-schnitzeltony@googlemail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Sun, 11 Sep 2016 14:05:38 +0200
Message-ID: <CALbNGRQ_gPdw6O53fVeX5gUnpppM7GreKxy2Q02iovJukV_YCQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 5/5] samba: fix build by linking with bfd instead of gold
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
X-List-Received-Date: Sun, 11 Sep 2016 12:05:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 4, 2016 at 10:15 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Use this workaround as long as there is no better (upstream) fix
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/=
meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> index e35d527..3205c5d 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> @@ -88,7 +88,7 @@ EXTRA_OECONF +=3D "--enable-fhs \
>                  "
>  DISABLE_STATIC =3D ""
>
> -LDFLAGS +=3D "-Wl,-z,relro,-z,now"
> +LDFLAGS +=3D "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES'=
, 'ld-is-gold', ' -fuse-ld=3Dbfd ', '', d)}"
>
>  do_install_append() {
>      if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', 'false',=
 d)}; then
> --
> 2.5.5
>
1. This did not make it into master but is still in master-next.
2. Jackie Huang has sent a patch only blacklisting on arm [1] =3D> seems
only arm has this bug

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2016-Septemb=
er/109036.html

=3D> I would like to send a patch changing to bfd linker only on arm.
Against which branch shall I create this patch?

Andreas

