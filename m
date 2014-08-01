Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 688A165DB3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 18:35:04 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id h15so2049447igd.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Aug 2014 11:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=6zBbd8zQeECGVzo2r4fQnXtthQ6ItfogmB6C349mf9g=;
	b=TWbew182Bs5lW/ZKGYEhpPO5slEmvdXGGH/6OBMOELPoUewn04w8edOsKfFYwSVszf
	s4grjKgb3t+9va2nN1SDxO+gWXxqLOhL8A8I3q+7oXnl/ARmB2lYPGQE0Yozm5hjV14P
	PeWL3/agviapOTRmJaQpsS5uGvuuLGxlaxgATyt8sQvQT91Annx8skjWRnAGDD3dJtG+
	92/3pDIgcu9OZF42iq7v4iow3xOMpsWdGUBLejKP5MsZmPrdnfZ2foEvRFQANyot0soU
	x5mX6ON+1GU/XdcJWvmgWTnY1j5aPm6hHMOIEubec3+G4feTGkeN8dXTSSEAeDGxGZz8
	CjGQ==
MIME-Version: 1.0
X-Received: by 10.42.90.74 with SMTP id j10mr9442717icm.29.1406918104885; Fri,
	01 Aug 2014 11:35:04 -0700 (PDT)
Received: by 10.50.78.105 with HTTP; Fri, 1 Aug 2014 11:35:04 -0700 (PDT)
In-Reply-To: <BLU436-SMTP146A07F73D628D357FEB9C0D6E70@phx.gbl>
References: <BLU436-SMTP146A07F73D628D357FEB9C0D6E70@phx.gbl>
Date: Fri, 1 Aug 2014 11:35:04 -0700
Message-ID: <CAMKF1sqP2SqZW9fMOwGXncLM+Om6LXEMawoWPxgN8WDJT4uR_g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] 'meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb'
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
X-List-Received-Date: Fri, 01 Aug 2014 18:35:11 -0000
Content-Type: text/plain; charset=UTF-8

On Friday, August 1, 2014, lchristina26 <lchristina26@hotmail.com> wrote:

> Signed-off-by: lchristina26 <lchristina26@hotmail.com <javascript:;>>
> ---
>  .../recipes-connectivity/cyassl/cyassl_3.1.0.bb    | 26
> ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/cyassl/
> cyassl_3.1.0.bb
>
> diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> new file mode 100644
> index 0000000..accc144
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "CyaSSL Embedded SSL Library"
> +DESCRIPTION = "CyaSSL is a lightweight SSL library written in C and \
> +               optimized for embedded and RTOS environments. It can be \
> +               Up to 20 times smaller than OpenSSL while still supporting
> \
> +               a full TLS 1.2 client and server."
> +HOMEPAGE = "http://www.yassl.com/yaSSL/Products-cyassl.html"
> +BUGTRACKER = "http://github.com/cyassl/cyassl/issues"
> +SECTION = "libs/network"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +PR = "r1"
> +


Drop PR


> +SRC_URI = "http://www.yassl.com/cyassl-${PV}.zip"
> +
> +
> +SRC_URI[md5sum] = "72477eb50697e759d309c49cb1aef18a"
> +SRC_URI[sha256sum] =
> "85a79009d2a7468910dfb1e4b975e0b00a42c695f4f1a2adc16d2507b5d0b03e"
> +
> +S = "${WORKDIR}/${PN}-${PV}"
> +
> +inherit autotools
> +
> +# Detect and build with correct endianness
> +# CFLAGS += "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '',
> '-DBIG_ENDIAN_ORDER', d)}"
> +


Drop those comments

> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

