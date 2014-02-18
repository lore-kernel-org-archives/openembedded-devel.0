Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9ACB36E8E1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 13:54:03 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id i17so25246078qcy.25
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 05:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=howBmMakBVIIwprws2q7rJoWtpGqCpvLQEb4BYc7t2M=;
	b=rKbxV3ZnAdQKoHSLa0lMXgh/oKJVnJRz0znItB2pmUVvIu9K3RaDQdh8oLsd5fnncs
	dAhfvXmXE/g26tu8dqCqp+n+WKN/wZVZrV0x891rzAIr7piEV7fo1HrBmzNQec73qFg1
	rMmOlfYrjBmZmMBZigfiZl/7jiBlDQ+Lo4XHoNQUXO8XAEACdIe/trI8mtxrvbfnOE4H
	k/oUWhd6p8ikRU0RKJ9NX6oxwEURDZ4H7hyaQg1J6ViFxaGOw3FjWsAmnf61fQ9VMeQa
	wSBLpH9f5Q0+BCQbc6LrKHuPPD+DKg9ge74zLs7N6VVIbKLDPazVBREbhKm44rF815rD
	l7NA==
X-Received: by 10.224.5.136 with SMTP id 8mr43369742qav.42.1392731644396; Tue,
	18 Feb 2014 05:54:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Tue, 18 Feb 2014 05:53:44 -0800 (PST)
In-Reply-To: <1392731525-6096-1-git-send-email-diego.sueiro@gmail.com>
References: <1392731525-6096-1-git-send-email-diego.sueiro@gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 18 Feb 2014 10:53:44 -0300
Message-ID: <CAMCfZKHfhkeu79f50-gFoVB5gzLSsYYdcgNpHHVwwgSnOHkgBA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [dora][meta-openembedded][PATCH] libao: Add PACKAGECONFIG for esound support
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
X-List-Received-Date: Tue, 18 Feb 2014 13:54:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 18, 2014 at 10:52 AM, Diego Sueiro <diego.sueiro@gmail.com>wrote:

> ibao compiling is failing because of a dependency on esound.
> Adding PACKAGECONFIG to fix the issue.
>
> Signed-off-by: Diego Sueiro <diego.sueiro@gmail.com>
> ---
>  meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb |    3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bbb/meta-multimedia/recipes-multimedia/libao/
> libao_1.1.0.bb
> index efd5ec3..1ca140a 100644
> --- a/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
> +++ b/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
> @@ -23,3 +23,6 @@ python populate_packages_prepend () {
>      do_split_packages(d, rootdir, '^(.*)\.so
> , output_pattern='${BPN}-plugin-%s', description='AO %s plugin')
>      do_split_packages(d, rootdir_dbg, '^(.*)\.so,
> output_pattern='${BPN}-plugin-%s-dbg', description='AO %s plugin debug
> data')
>  }
> +
> +PACKAGECONFIG ?= ""
> +PACKAGECONFIG[esound] = "--enable-esd,--disable-esd,esound"


The email subject is wrong. Sorry about that.
I'm going to send another one.

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

