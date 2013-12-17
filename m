Return-Path: <p.patat@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9D0DA60C23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2013 15:34:58 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id n12so6112444wgh.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2013 07:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=0dapnltlmxie/mJC8+Cmz3ymzA1R+RPzeRTuaeeaels=;
	b=BpwGLEohM903YY2UFI1MCp/QO2UNpn2RdzMUc8OtdLj/P/M2CGorT86QwC21vMu4eA
	lmJxkFx170MM1VBdvxcz1u3QPo+zmu32j0qEPAtsiLbxB2SQlzrNvCS0abWTozlNy08m
	v4av9BHoeTtdos1y9BEKvlM0gAdq53xXKIKL+FLU4M6Ph7gNTbhgVmoSFiYl5zarxALb
	f//+jS9iEEQYVws2+WvxA4laVAqKcLutyTockKaZTdmRzKDhl59DgVMBlAd3rx/PKTbU
	q+JNtBqMq1wexpF/y26ilyhMJTogDuIud3ozz7plez3AdZTgt44RDxr8bSYhrxXcujNK
	pHjg==
X-Received: by 10.194.95.198 with SMTP id dm6mr13045773wjb.57.1387294498709;
	Tue, 17 Dec 2013 07:34:58 -0800 (PST)
MIME-Version: 1.0
Sender: p.patat@gmail.com
Received: by 10.194.9.33 with HTTP; Tue, 17 Dec 2013 07:34:38 -0800 (PST)
In-Reply-To: <1386169150-16816-1-git-send-email-patrick.patat@innotis.org>
References: <1386169150-16816-1-git-send-email-patrick.patat@innotis.org>
From: patrick patat <patrick.patat@innotis.org>
Date: Tue, 17 Dec 2013 16:34:38 +0100
X-Google-Sender-Auth: 5Bh-CaHmS_CSYQ73037VWsaGGlA
Message-ID: <CAF+NyK5patvnud=V=DUC28y4b8BKEXL1vc67brY8FNir7T5d_g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-perl][PATCH V2] add libcrypt-openssl-rsa-perl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Dec 2013 15:34:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

ping


On Wed, Dec 4, 2013 at 3:59 PM, Patrick Patat <patrick.patat@innotis.org>wrote:

> This recipe build cpan module Crypt-OpenSSL-RSA
>
> Signed-off-by: Patrick Patat <patrick.patat@innotis.org>
> ---
>  .../libcrypt/libcrypt-openssl-rsa-perl_0.28.bb     |   24
> ++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-perl/recipes-perl/libcrypt/
> libcrypt-openssl-rsa-perl_0.28.bb
>
> diff --git a/meta-perl/recipes-perl/libcrypt/
> libcrypt-openssl-rsa-perl_0.28.bb b/meta-perl/recipes-perl/libcrypt/
> libcrypt-openssl-rsa-perl_0.28.bb
> new file mode 100644
> index 0000000..f0c610f
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "Crypt Openssl RSA cpan module"
> +SECTION = "libs"
> +LICENSE = "Artistic-1.0 | GPL-1.0+"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=385c55653886acac3821999a3ccd17b3"
> +
> +SRC_URI = "
> http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-RSA-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "86217a5036fc63779c30420b5fd84129"
> +SRC_URI[sha256sum] =
> "5357f977464bb3a8184cf2d3341851a10d5515b4b2b0dfb88bf78995c0ded7be"
> +
> +DEPENDS += "openssl"
> +
> +RDEPENDS_${PN}="libcrypt-openssl-random-perl"
> +
> +EXTRA_CPANFLAGS = "INC='-I${STAGING_INCDIR}' LIBS='-L${STAGING_LIBDIR}
> -lssl -L${STAGING_DIR_TARGET}${base_libdir} -lcrypto'"
> +
> +S = "${WORKDIR}/Crypt-OpenSSL-RSA-${PV}"
> +
> +inherit cpan
> +
> +do_compile() {
> +    export OTHERLDFLAGS='-Wl,-rpath'
> +    cpan_do_compile
> +}
> --
> 1.7.10.4
>
>

