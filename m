Return-Path: <koen.kooi@linaro.org>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id DF3626FDA6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 14:07:49 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id mc6so3668490lab.38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 07:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=f+ccdFnqcjgzLpeF1Q4J0OL57wymRd6kCL4llybPbuA=;
	b=muTy32oJZZcmqrnHh4Wiw0XZXJDSLic3IQ6a1KCeiT1MnveLSTGueY+MxFEr5mBez4
	TpfXg+/5LmZk8RLefAOPL832XA9ICQsUuXyNWtnTxwT5O5jOF3v5rgS97xEv7AAVbghg
	PKJgohkUwxP+cR1ApsH+xyMM32PrRRjk6OszvcO1U+BEeM0VJBZomKZTIssnS06ZRewj
	38nQ+W9hRrRdAqb1/0FCVW7YBaapUTUjyCWcoZ+G4JpDKElTUH+zvV92yRpcDrnvjBB/
	Dsi6qXblLBRCNmMIxmNXoTfwtpFnz2pQ6D5i6kPphnzqPBqOPFRuSEQYKuN0Ck0/UGrw
	wb5A==
X-Gm-Message-State: ALoCoQkOC2YVHmIX27HKQd4PbtnAiwEenLCIuGQ3dnw0X7R2GbG1M1Gc5h8MpxNKiVGTrd8jymb4
MIME-Version: 1.0
X-Received: by 10.152.10.207 with SMTP id k15mr1412744lab.76.1403014069850;
	Tue, 17 Jun 2014 07:07:49 -0700 (PDT)
Received: by 10.114.28.67 with HTTP; Tue, 17 Jun 2014 07:07:49 -0700 (PDT)
In-Reply-To: <1402997798-28328-1-git-send-email-koen.kooi@linaro.org>
References: <1402997798-28328-1-git-send-email-koen.kooi@linaro.org>
Date: Tue, 17 Jun 2014 16:07:49 +0200
Message-ID: <CAP0W-RkK1BtV1wo17HjMHOkpTG=6V94rDL4s2pRU=q2Ry058bQ@mail.gmail.com>
From: Koen Kooi <koen.kooi@linaro.org>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [meta-oe][PATCHv2] php 5.4.14: use pkg-config for libxml2 detection
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
X-List-Received-Date: Tue, 17 Jun 2014 14:07:58 -0000
Content-Type: text/plain; charset=UTF-8

On 17 June 2014 11:36, Koen Kooi <koen.kooi@linaro.org> wrote:

> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  ...cinclude-use-pkgconfig-for-libxml2-config.patch | 89
> ++++++++++++++++++++++
>  meta-oe/recipes-devtools/php/php_5.4.14.bb         |  4 +-
>  2 files changed, 92 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch
>
> diff --git
> a/meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch
> b/meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch
>

Looks like a v3 will be needed. Php-native builds and works, but php fails
to build with xml errors:

|
/build/linaro/build/build/tmp-eglibc/work/armv7at2hf-vfp-neon-oe-linux-gnueabi/php/5.4.14-r5.0/php-5.4.14/ext/wddx/wddx.c:1042:58:
error: unknown type name 'XML_Char'

