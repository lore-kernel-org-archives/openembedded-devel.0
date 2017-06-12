Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f181.google.com (mail-yb0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id C872778255
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jun 2017 18:53:54 +0000 (UTC)
Received: by mail-yb0-f181.google.com with SMTP id 202so29268962ybd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jun 2017 11:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WacZafhqInP8kh6h16zKvPHC9wy7dVSPDQGgteAwg/M=;
	b=eKHKfV3Qr3mjVO7ozX0w6im7bKFVaj3n4onK7Y2l07OQnlK06T0wdGF7BMLKG+WMr4
	0rE6e8SdCdA5yOd8j6ApjVkDgz5fTY3uzF3+4HPFfr0avCGto3n0G3urro4UoVqs9KM6
	qUfjc14Mw8OaS5fHn60/HvMOd4rkKCYXgzabr/wsW67OlngI63YYQBUPKF8yNyqX/GGA
	B+xiSHbGWm4MXtfZrtaHWwxuzeUhcrHOTBVCRFxb5XVVgts+NHQF22tViLpGRIVOXhOR
	KuFiFiYWIKzEE49l2CHqXOcp/+g0OOeycAocGY66p+SEi8TE9K9+afMokPexk4ce7SV8
	Id9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WacZafhqInP8kh6h16zKvPHC9wy7dVSPDQGgteAwg/M=;
	b=alRvMeBJeKXcdpbEr5lWWNyFkGljyoMtO4aKgjjtRq2niqbpFkdvB2/aFQejdVZ4MI
	d9YYLG7UOemXimEFS6QSZ25WMSr0U6zLeT6WNDyU0TWnWellVA4AV4uaqJUApwaz6tmf
	/WhnGbX/M/xMqPcUj12bLunmhrOE6jkZfsZk4chw2sIm7Sm6ZFgS5txMm4k4DnvtesRp
	NKRkDcbSixKhJ2a5745BkNTv/UkMBAbCmvwd+RKPRGM18b6mRYICXOkmMRxLR7zdaSU6
	pjEbzpj4WmU62xizzG61XPtkeZ68t3SU5JWjiw17BtBRRZzK3PN2SnuVdClg6cu4k1dY
	H4vQ==
X-Gm-Message-State: AKS2vOyKvi2do65eqQ0ycymcsyW/WssCCc+a+cvZe4vdwCY7vMZTPjyE
	nSgE5yBBkcQ8ysgOnv7qeKZuASZydA==
X-Received: by 10.37.228.69 with SMTP id b66mr339617ybh.28.1497293635935; Mon,
	12 Jun 2017 11:53:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Mon, 12 Jun 2017 11:53:55 -0700 (PDT)
In-Reply-To: <1497185642-1678-1-git-send-email-liu.ming50@gmail.com>
References: <1497185642-1678-1-git-send-email-liu.ming50@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 12 Jun 2017 20:53:55 +0200
Message-ID: <CA+chaQfAjd5Zgm5wYE+w9nmTLHUQyRqnv37_Czo7kzym_j+9yg@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] dos2unix: add recipe
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
X-List-Received-Date: Mon, 12 Jun 2017 18:53:55 -0000
Content-Type: text/plain; charset="UTF-8"

Please pass LDFLAGS to resolve following QA warning:

ERROR: QA Issue: No GNU_HASH in the elf binary:
dos2unix/7.3.4-r0/packages-split/dos2unix/usr/bin/dos2unix'
No GNU_HASH in the elf binary:
'dos2unix/7.3.4-r0/packages-split/dos2unix/usr/bin/unix2dos' [ldflags]

On Sun, Jun 11, 2017 at 2:54 PM, <liu.ming50@gmail.com> wrote:

> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> The Dos2unix package includes utilities dos2unix and unix2dos to
> convert plain text files in DOS or Mac format to Unix format and
> vice versa.
>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta-oe/recipes-support/dos2unix/dos2unix_7.3.4.bb | 34
> ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 meta-oe/recipes-support/dos2unix/dos2unix_7.3.4.bb
>
> diff --git a/meta-oe/recipes-support/dos2unix/dos2unix_7.3.4.bb
> b/meta-oe/recipes-support/dos2unix/dos2unix_7.3.4.bb
> new file mode 100644
> index 0000000..f3d5173
> --- /dev/null
> +++ b/meta-oe/recipes-support/dos2unix/dos2unix_7.3.4.bb
> @@ -0,0 +1,34 @@
> +SUMMARY = "Convert text file line endings between CRLF and LF"
> +DESCRIPTION = "The Dos2unix package includes utilities dos2unix and \
> +unix2dos to convert plain text files in DOS or Mac format to Unix \
> +format and vice versa."
> +HOMEPAGE = "http://waterlan.home.xs4all.nl/dos2unix.html"
> +SECTION = "support"
> +
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=1b78fca784db24f4a40e30b300787f
> 3f"
> +
> +SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix"
> +
> +# Release 7.3.4
> +SRCREV = "8381ba4e1c4cd5ce98ebd9c24726d51cb203cde0"
> +
> +S = "${WORKDIR}/git/dos2unix"
> +
> +inherit gettext perlnative
> +
> +# The dos2unix NLS relies on po4a-native, while po4a recipe is
> +# provided by meta-perl layer, so make it optional here, you
> +# need have meta-perl in bblayers.conf before enabling nls in
> +# PACKAGECONFIG.
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[nls] = "ENABLE_NLS=1,ENABLE_NLS=,po4a-native"
> +
> +EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS}"
> +EXTRA_OEMAKE_class-native = "ENABLE_NLS="
> +
> +do_install () {
> +    oe_runmake DESTDIR="${D}${base_prefix}" install
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

