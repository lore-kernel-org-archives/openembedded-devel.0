Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 92A6D7327F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2016 11:22:08 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id x130so12197477vkc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Aug 2016 04:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=DmnD9mt3bQc44M29jpmM9SMH9Y+qAl0YbpYE32Vzg5k=;
	b=Y27udQopDaefyX70N1yRZKqRz5TdLVopuxwiyrKfMQwbO0HBGTNF/d2uieVdb+bUC0
	PVx45N8jD1q9kdT2IYCgu8rr+YI9XI1rWC8Konc1mP19frDt/P7yNaDivI//yeCDMevN
	irM+ju4u15pM81Zby7fH/MawPzx8M/46fO1b2eRg30UlhMWRcDCng9A3LulcFvevzVGL
	Bduq43XIlLeqefir4Os46NdqzivWLC/mN7Q5kMVD/C6gulAZTULNWaa2IV+T4IWwGgp4
	lrdm1n2DIUy5N3y+4B88eBOqbJg3CIqn7ygQAThYlk1iWALXf/ZLLPRI+R09HtMkTZ8O
	IjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=DmnD9mt3bQc44M29jpmM9SMH9Y+qAl0YbpYE32Vzg5k=;
	b=XdpBjPdBrX52WgQreq6T/desjpJhv9WsQ547DyfG0rs6kw5jfX5G1WCL0Psdao+hbV
	0+pZu2FzCSPZpnIRxCnLwngeIIe/yLna8Hp6TnA/UkhqzV1mK3uwon98g0aJcFcaw6jv
	RoXkGLLzVJBUKYFa8DGoQS5WKcFxV1BWxjBxB+CPW57CrsRclmkdZ7kaRLsRuV7CIqR4
	Hi5uPdbSgiHpEs5x7aw5DXaMlOIcHEMEFY0qgnI/PX4vOwg7Xeke5CHzPA6Op4egN6ai
	03/QUBaBpFvGhEhXv4HX+8WqGKtkyaX3VaGKHSaUsmYiqnFsP5Oi9YyY7IjFJwRkTcdq
	okgg==
X-Gm-Message-State: AEkoouv/paRo7i+Y7DzqO3aF23RUn7YaxzgDd9aaI80ZzjbGh5WFK8aGx6iWbFGAioIQAIHSQ+z6ALSs0D9VhQ==
X-Received: by 10.31.56.73 with SMTP id f70mr39647244vka.135.1470396129335;
	Fri, 05 Aug 2016 04:22:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.66.66 with HTTP; Fri, 5 Aug 2016 04:22:08 -0700 (PDT)
In-Reply-To: <20160805102605.C658350173@opal.openembedded.org>
References: <20160805102559.8258.90195@opal.openembedded.org>
	<20160805102605.C658350173@opal.openembedded.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 5 Aug 2016 13:22:08 +0200
Message-ID: <CALbNGRTU4aQO2A6Hwz5BSSA4XTk6FOGKgwrCiiOTYoiRtnWEcQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	"fan.xin" <fan.xin@jp.fujitsu.com>
Subject: Re: [oe-commits] [meta-openembedded] 24/39: qpdf: add new recipe
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
X-List-Received-Date: Fri, 05 Aug 2016 11:22:09 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 5, 2016 at 12:26 PM,  <git@git.openembedded.org> wrote:
> martin_jansa pushed a commit to branch master-next
> in repository meta-openembedded.
>
> commit 183ecb3a05823343525d7acc1a650d4b2a0e4183
> Author: fan.xin <fan.xin@jp.fujitsu.com>
> AuthorDate: Mon Aug 1 18:46:35 2016 +0900
>
>     qpdf: add new recipe
>
>     QPDF is a command-line program that does structural,
>     content-preserving transformation on PDF files.
>
>     Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-extended/qpdf/qpdf_6.0.0.bb | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/qpdf/qpdf_6.0.0.bb b/meta-oe/recipes-extended/qpdf/qpdf_6.0.0.bb
> new file mode 100644
> index 0000000..d5645d7
> --- /dev/null
> +++ b/meta-oe/recipes-extended/qpdf/qpdf_6.0.0.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "QPDF is a command-line program that does structural, content-preserving transformations on PDF files"
> +DESCRIPTION = "QPDF is capable of creating linearized files and encrypted files. It is also capable of \
> +converting PDF files with object streams to files with no compressed objects or to generate object streams \
> +from files that don't have them. QPDF also supports a special mode designed to allow you to edit the content \
> +of PDF files in a text editor."
> +HOMEPAGE = "http://qpdf.sourceforge.net/"
> +
> +PR = "r0"
^ Nit
> +
> +RDEPENDS_${PN} = "libpcre zlib"
> +
> +LICENSE = "Artistic-2.0"
> +LIC_FILES_CHKSUM = "file://${WORKDIR}/qpdf-${PV}/Artistic-2.0;md5=7806296b9fae874361e6fb10072b7ee3"
> +
> +SRC_URI = "http://nchc.dl.sourceforge.net/project/qpdf/qpdf/${PV}/qpdf-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "e014bd3ecf1c4d1a520bbc14d84ac20e"
> +SRC_URI[sha256sum] = "a9fdc7e94d38fcd3831f37b6e0fe36492bf79aa6d54f8f66062cf7f9c4155233"
> +
> +inherit autotools-brokensep pkgconfig
> +
> +EXTRA_OECONF += "--with-random=/dev/urandom"
> +
> +do_configure_prepend() {
> +      sh autogen.sh
> +}
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

