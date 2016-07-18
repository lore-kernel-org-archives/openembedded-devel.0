Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id B3CC4606D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 08:16:13 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id q11so6720606qtb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 01:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=6EyF+sy3fnfIOYRCXNTBh+XROQt5lhDy//YcT7Py+SM=;
	b=qgc217Zn9+/+7mVCaUuW+tIwCpitaSRzwMa4mnbjhMOdnf3ESPUou12q5RFdJWfXtA
	DWGVvVcd6nMKERuPfJdj/kaIjEgnJ34tbWldS4i+7T/1Ormnb0PNtJyLPulXFWqguN7n
	/FpKvlba3wvwdgpoGToZHXpyl+TJblJbprtTzlAVlUdJrJM8pp4CNqq2RRJataqEk83f
	Z+VEQVUT988m6QvvDOyOoE3dLmVD0UK6UwfWWhtH3vKyMr1X2DpRrqUsMwouQkWrFlt3
	KGVSFbL9UDryKVwgQ4nGkqZiU9XXBwiheZ5Hos3NFXkwYrdPWYVu3sfPRF/3J85DW7n8
	2rIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=6EyF+sy3fnfIOYRCXNTBh+XROQt5lhDy//YcT7Py+SM=;
	b=fMkXsJdEwpuxqZsmoROr2qyXaTi/YpPUsIC2xF3RzYVjLsYkKlXi5vX/gbx1hAmCKW
	TRByNi6Vnp806IKaTg4qs1DV3V42OUeoGW0KcEhlv+8ckrgxebDteVB0798DSLjOE07G
	6oEyIKy199Z5q+ZcO6X2UrFdoPZJMFUV3+r4yM1EQk4vloIJbIO9fDUHK7UTp/+OjzZe
	lXr+Atq5K9RbFSF+/vyvgkjz4isoGVY7Vsf5fSHOrOP+yl1cwkIydxdp63wo7uq9yms6
	63CITcpXOXoU30PsZqT7ifUnGX60mOp9k6IHKfkL1/0xv18VXfm2STPT8HcfEciGom49
	90+A==
X-Gm-Message-State: ALyK8tJIjbEwsFAxqtMYAOBfxoReB18ANe5BktfVVZ7fyJfMbgm4p27J38BpXYGzoI31sM2Rnf3Nvt6PlOGTyw==
X-Received: by 10.200.53.103 with SMTP id z36mr48899958qtb.5.1468829773654;
	Mon, 18 Jul 2016 01:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <1468828968-19388-1-git-send-email-git@andred.net>
	<1468828968-19388-2-git-send-email-git@andred.net>
In-Reply-To: <1468828968-19388-2-git-send-email-git@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Jul 2016 08:16:04 +0000
Message-ID: <CAMKF1spStNbUubBvO1DLq86wdHRVbGvOVB7LRUVa2be0Mdes3Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH v2 2/2] meta-networking: override SECURITY_CFLAGS for c-ares
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
X-List-Received-Date: Mon, 18 Jul 2016 08:16:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 18, 2016 at 1:03 AM <git@andred.net> wrote:

> From: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>
> c-ares doesn't build if the distro has enabled usage of the
> security_flags.inc file as it is picky about what is placed
> into CPPFLAGS and CFLAGS. It complains and errors out if any
> preprocessor options appear in CFLAGS.
>
> Fix this by providing an additional include file that is
> require'd from conf/layer.conf which for c-ares moves the
> defines added by security_flags.inc from CFLAGS to CPPFLAGS.
>
> Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
> ---
>  .../conf/distro/include/meta_networking_security_flags.inc          | 6
> ++++++
>  meta-networking/conf/layer.conf                                     | 3
> +++
>  2 files changed, 9 insertions(+)
>  create mode 100644
> meta-networking/conf/distro/include/meta_networking_security_flags.inc
>
> diff --git
> a/meta-networking/conf/distro/include/meta_networking_security_flags.inc
> b/meta-networking/conf/distro/include/meta_networking_security_flags.inc
> new file mode 100644
> index 0000000..06802d6
> --- /dev/null
> +++
> b/meta-networking/conf/distro/include/meta_networking_security_flags.inc
> @@ -0,0 +1,6 @@
> +# configure righteously complains:
> +# | configure:3479: using CFLAGS:  -O2 -pipe -g
> -feliminate-unused-debug-types -fstack-protector-strong -pie -fpie
> -D_FORTIFY_SOURCE=3D2
> +# | configure:3485: CFLAGS error: CFLAGS may only be used to specify C
> compiler flags, not macro definitions. Use CPPFLAGS for: -D_FORTIFY_SOURC=
E=3D2
> +# | configure:3516: error: Can not continue. Fix errors mentioned
> immediately above this line.
> +TARGET_CFLAGS_remove_pn-c-ares =3D "${lcl_maybe_fortify}"
> +TARGET_CPPFLAGS_append_pn-c-ares =3D "${lcl_maybe_fortify}"
>

will

lcl_maybe_fortify_pn-c-area =3D ""

work ?


> diff --git a/meta-networking/conf/layer.conf
> b/meta-networking/conf/layer.conf
> index 5fd636a..c09ba4a 100644
> --- a/meta-networking/conf/layer.conf
> +++ b/meta-networking/conf/layer.conf
> @@ -21,3 +21,6 @@ LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>
>  # used by waf-samba.bbclass
>  WAF_CROSS_ANSWERS_PATH =3D "${LAYERDIR}/files/waf-cross-answers"
> +
> +# Override security flags
> +require conf/distro/include/meta_networking_security_flags.inc
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

