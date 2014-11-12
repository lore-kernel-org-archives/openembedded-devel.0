Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id E2A4462252
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2014 05:32:20 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id fa1so12079097pad.25
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 21:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=nl7ztHqnlIynEyUJfb1QbSUDcbQESl0Ai306eqDbAww=;
	b=Qx11WfRjD/FkVO9zraLpkIGqAdOI1CjbW4Yv/LJfjYroDLEDxMt62xaMlIWhgDBsd7
	bxERUPnZFZDt2tOCvBrQnzdhhAl9OKpyRHGnJwMT90TxpNIWO5CLsU1syq4j725BJWQQ
	n6a+mLypYEbBmZdvKCGFEe1ynYXq2Nf3JAbced82F/m5ptofcUURWriKyOdmzBH3rQqk
	CAbcZJk/CnFylY+EyXy2pleY5hZUCzQ2RJZXxJQSYjISB3bv3S331OPxa9FGrDXkAPKj
	jXsqbBwLZ/wE15tTXdSSe97unenTC7xVwc5iOq4JD3X/TTwhxXZY5I7cu6Bw3yzS93nC
	ftuQ==
X-Received: by 10.68.68.137 with SMTP id w9mr45402376pbt.71.1415770341242;
	Tue, 11 Nov 2014 21:32:21 -0800 (PST)
Received: from Akusters-laptop-3.local ([2601:c:9380:601:690d:7097:5fbe:a5bc])
	by mx.google.com with ESMTPSA id
	oh5sm20862603pbc.76.2014.11.11.21.32.19 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Nov 2014 21:32:19 -0800 (PST)
Message-ID: <5462F0E1.1020308@gmail.com>
Date: Tue, 11 Nov 2014 21:32:17 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: qianl.fnst@cn.fujitsu.com
References: <1415353882-20874-1-git-send-email-qianl.fnst@cn.fujitsu.com>
In-Reply-To: <1415353882-20874-1-git-send-email-qianl.fnst@cn.fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] tomoyo-tools: Add new recipes
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
X-List-Received-Date: Wed, 12 Nov 2014 05:32:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Do we need two TOMOYO solutions?

Meta-security has ccs-tools 1.8.3.

- Armin

On 11/7/14, 1:51 AM, Qian Lei wrote:
> TOMOYO Linux is a Mandatory Access Control (MAC) implementation for
> Linux that can be used to increase the security of a system, while also
> being useful purely as a system analysis tool.
>
> Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> ---
>   .../tomoyo-tools/tomoyo-tools_2.5.0.bb             | 29 ++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
>   create mode 100644 meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
>
> diff --git a/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb b/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
> new file mode 100644
> index 0000000..bb2676b
> --- /dev/null
> +++ b/meta-oe/recipes-support/tomoyo-tools/tomoyo-tools_2.5.0.bb
> @@ -0,0 +1,29 @@
> +SUMMARY = "TOMOYO Linux tools"
> +DESCRIPTION = "TOMOYO Linux is a Mandatory Access Control (MAC) implementation \
> +for Linux that can be used to increase the security of a system, while also \
> +being useful purely as a system analysis tool."
> +HOMEPAGE = "http://tomoyo.sourceforge.jp/"
> +SECTION = "System Environment/Kernel"
> +
> +SRC_URI = "http://jaist.dl.sourceforge.jp/tomoyo/53357/${PN}-${PV}-20140601.tar.gz"
> +SRC_URI[md5sum] = "888869b793127f00d6439a3246598b83"
> +SRC_URI[sha256sum] = "118ef6ba1fbf7c0b83018c3a0d4d5485dfb9b5b7f647f37ce9f63841a3133c2a"
> +
> +S = "${WORKDIR}/${PN}"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING.tomoyo;md5=751419260aa954499f7abaabaa882bbe"
> +
> +FILES_${PN}     += "${libdir}/tomoyo"
> +FILES_${PN}-dbg += "${libdir}/tomoyo/.debug"
> +
> +DEPENDS = "linux-libc-headers ncurses"
> +CFLAGS_append += "-D_GNU_SOURCE"
> +
> +do_compile () {
> +	oe_runmake 'CC=${CC}'
> +}
> +
> +do_install() {
> +	oe_runmake install INSTALLDIR=${D}
> +}
>

