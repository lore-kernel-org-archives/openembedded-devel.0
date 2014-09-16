Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id C380B609BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 01:01:01 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id a13so4963340igq.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Sep 2014 18:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=0Bm3Inita+c/G6raINqm2/8ZlnE9U03pq2tcSaLOTxM=;
	b=MytI9D2Bc1pc7JtEnETwR9nDMahAgJwkz7L0IFtXP75dq2NFrpe8e84rlxAEhwd+IB
	vzDizGyYR2yIiuQ05z+V78Bygu/+PH8g/bNmQewzoBa3g5yUqr+mmB6pMH72Hv04/qrr
	p5a82p1g7ZV7d/JDrELUnh837nbADoooDfqYZKmaCPxAH2TtsvSvSdMNUBE6fKppgIXk
	OdhqSzBBDYx1uR/4bsol0rV67BzXKK/jG0A6zQeq4nClwE1rUB422/rxSwUfWIXgHeoU
	zT9EHEBz65UjoM/W7UxkBgJcmtb/PVQ2wSbAQyY8I6ZKsfX0SRkDX/Tay7eAVg3dmKv/
	OQNA==
X-Received: by 10.50.18.42 with SMTP id t10mr25021288igd.30.1410829262463;
	Mon, 15 Sep 2014 18:01:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Mon, 15 Sep 2014 18:00:32 -0700 (PDT)
In-Reply-To: <BLU436-SMTP33002726F1A5BBA17F19CBD6C80@phx.gbl>
References: <BLU436-SMTP33002726F1A5BBA17F19CBD6C80@phx.gbl>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Sep 2014 18:00:32 -0700
Message-ID: <CAMKF1srne=jbjtzKrhdM6Q0bpNVDKVSBgoE+f7SPAYRjdy=YwA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cyassl: version 3.2.0 release
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
X-List-Received-Date: Tue, 16 Sep 2014 01:01:10 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 15, 2014 at 3:00 PM, lchristina26 <lchristina26@hotmail.com> wrote:
> This release includes bug fixes and several new features
> which we think will be beneficial to our user and customer base.
>

Patch subject line should have said [meta-networking] instead of [meta-oe]
see the readme for the layer.

Secondly, you should be deleting the old 3.1 recipe along with this new recipe.


> Signed-off-by: Leah Thompson <lchristina26@hotmail.com>
> ---
>  .../recipes-connectivity/cyassl/cyassl_3.2.0.bb        | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb
>
> diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb b/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb
> new file mode 100644
> index 0000000..0c0cac2
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.2.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "CyaSSL Embedded SSL Library"
> +DESCRIPTION = "CyaSSL is a lightweight SSL library written in C and \
> +               optimized for embedded and RTOS environments. It can be \
> +               Up to 20 times smaller than OpenSSL while still supporting \
> +               a full TLS 1.2 client and server."
> +HOMEPAGE = "http://www.yassl.com/yaSSL/Products-cyassl.html"
> +BUGTRACKER = "http://github.com/cyassl/cyassl/issues"
> +SECTION = "libs/network"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "http://www.yassl.com/${BP}.zip"
> +
> +SRC_URI[md5sum] = "72477eb50697e759d309c49cb1aef18a"
> +SRC_URI[sha256sum] = "85a79009d2a7468910dfb1e4b975e0b00a42c695f4f1a2adc16d2507b5d0b03e"
> +
> +inherit autotools
> +
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

