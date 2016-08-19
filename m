Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id D1A1976806
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 15:11:49 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id u13so5793098uau.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 08:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-transfer-encoding;
	bh=SM/Jm5lPnf41tHbVT3S8Ug6LwlQT7+GhmDx0n/Kafwo=;
	b=nwVPqmGiVR7ViZofrVuCAOtVpbhfLWsf5ZGRivmML8HFhsJn72zrg8wkg59xODF56j
	kC8IzswkIbggoE/4UHJeHlgLrP8Dv1rbZ+LVUyI11XYbKrswnpRWR5oQvqrn1DhtLMYH
	//35U6TKTBk9RZjZIeiAmBV+7jFzZcU4Mcz7MS/rTSQBnvwTRcFfaXRQ6tae+DLHw0lj
	3+wGE38ZWfENMFBjuS4cDUNFItd/gW/BPZquibGyKs+uNs6QS3UYFflPxGsASnw4FwNT
	JiM2p9Yu0oHTSB9x81NI3tF96SCL0SGJ6p0I6QaKPGNir5Cxbun0MyoUpLQ/GGp7hNtA
	kuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-transfer-encoding;
	bh=SM/Jm5lPnf41tHbVT3S8Ug6LwlQT7+GhmDx0n/Kafwo=;
	b=ifNZD8NyLFu8maac9w1aFA9gpq8lHT/vxAbJG816dSFKELMTajdwrhGCW3C4nUgWsA
	z7UJTFbbD6Y30gYjBj1vW8aYigGaRaEe7kBctgNpuWsQOD5x9w/d4jDvzUcMXb8/CioS
	E3ZqKTuhBEXe4fyPZJC1LzkYIlAXow+NzlICZ4ipz6ZnbtoOJVLtMUIDx2qTdRHoe4kS
	KBQ55Qldbk8YTgu/bIUZE2eakedtsoGXEz+jbLH17vrAydVLw3MxH1qhUJnbbqY+IUvv
	qERAxAJef9dQdTWFtxxHwC9B1A9Jo1Mfa8C2kqR3oui/3/gHphC4/132mk/WYC01Jkj0
	RW0Q==
X-Gm-Message-State: AEkoouvMO7IjktBnfdpcD6dwlSt0wBWRXVuvpd7uaClQOhGFIF7TqQwyGHHJAXOBjjejLg==
X-Received: by 10.176.65.40 with SMTP id j37mr3562692uad.116.1471619509426;
	Fri, 19 Aug 2016 08:11:49 -0700 (PDT)
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com.
	[209.85.217.179]) by smtp.gmail.com with ESMTPSA id
	c194sm1399570vkf.24.2016.08.19.08.11.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Aug 2016 08:11:48 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f179.google.com with SMTP id 97so84748168uav.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 08:11:47 -0700 (PDT)
X-Received: by 10.31.161.137 with SMTP id k131mr4278102vke.122.1471619507494; 
	Fri, 19 Aug 2016 08:11:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.138.78 with HTTP; Fri, 19 Aug 2016 08:11:46 -0700 (PDT)
In-Reply-To: <1471613076-15965-1-git-send-email-erkka.kaaria@intel.com>
References: <1471613076-15965-1-git-send-email-erkka.kaaria@intel.com>
Date: Fri, 19 Aug 2016 12:11:46 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrRrS01jGAZu_sKHxM3P_hTf05bgHfCbTU6ti_m4aVGFg@mail.gmail.com>
Message-ID: <CAP9ODKrRrS01jGAZu_sKHxM3P_hTf05bgHfCbTU6ti_m4aVGFg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] openjdk-8-cross.inc: Fix QA error caused by missing hash
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
X-List-Received-Date: Fri, 19 Aug 2016 15:11:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2016 at 10:24 AM, Erkka K=C3=A4=C3=A4ri=C3=A4 <erkka.kaaria=
@intel.com> wrote:
> Some openjdk makefiles (e.g. vm.make) only use CFLAGS as their linker
> flags. This means that the oe-specific linker flags are lost. This in
> particular causes issues with the recent oe-core commit a98a81808, which
> intentionally poisons the linker hash style, so that any recipes that do
> not use the oe LDFLAGS fail to build.
>
> Signed-off-by: Erkka K=C3=A4=C3=A4ri=C3=A4 <erkka.kaaria@intel.com>
> ---
>  recipes-core/openjdk/openjdk-8-cross.inc | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/open=
jdk/openjdk-8-cross.inc
> index 11e94ce..6097afc 100644
> --- a/recipes-core/openjdk/openjdk-8-cross.inc
> +++ b/recipes-core/openjdk/openjdk-8-cross.inc
> @@ -39,21 +39,23 @@ SRC_URI_append =3D "\
>      file://jvm.cfg \
>  "
>
> +# Some makefiles pick the linker flags from the CFLAGS variable, so add
> +# the LDFLAGS to CFLAGS
> +CFLAGS_append =3D " \
> +  ${LDFLAGS} \
> +"
> +

Fine.

>  EXTRA_OECONF_append =3D "\
>      --with-jobs=3D${@get_jdk8_native_jobs(d)} \
> -    \
>      --with-sys-root=3D${STAGING_DIR} \
>      --with-tools-dir=3D${STAGING_DIR_NATIVE} \
>      --with-boot-jdk=3D${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native \
>      --with-cacerts-file=3D${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native/=
jre/lib/security/cacerts \
> -    \
>      --disable-precompiled-headers \
>      --disable-zip-debug-info \
> -    \
>      --with-extra-cflags=3D'${CFLAGS}' \
>      --with-extra-cxxflags=3D'${CXXFLAGS}' \
>      --with-extra-ldflags=3D'${LDFLAGS}' \
> -    \
>      ${@jdk_configure_options(d)} \
>  "

Not related, please drop this change.

> --
> 2.7.4
>
> ---------------------------------------------------------------------
> Intel Finland Oy
> Registered Address: PL 281, 00181 Helsinki
> Business Identity Code: 0357606 - 4
> Domiciled in Helsinki
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

