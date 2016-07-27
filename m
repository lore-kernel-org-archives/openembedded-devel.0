Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id DE108606BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 22:34:13 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id l89so2757198lfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 15:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=aHVnYjvimnXuwdnXU3IqEUMM1YIrKpEcuBwiWwIj7is=;
	b=vr4gwpxDIs2vpjd2ddBXdLhEqV+U6lDz5ITMq+9eIemyYA2/Q48XS+xNnNUmXzi9oK
	TAfv1FaQBtEk0OXQtYcQZpkTelxAqjki+xCj6afMlpZLUps9piizwmEDtxwom4LxngoS
	MGgFZmaRtX+2++hviMbmsqTGf21VvbxpULx/0Y9pQGDS8IUHFypbNoTD1mcxSgxMNEJt
	cEhV8BUufvxBkDdouP7FU1CH+hSJkPsNPBz8pZODoj6LgtLIaH/UPl46siCbGP7Z4iGm
	nGJW9cMJ09lw1s9ZGMDKPXkzHB/igJ/SnuIq9EH4Qf7mh9g9Bfw3mds/EgFdxa6piFbH
	oHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=aHVnYjvimnXuwdnXU3IqEUMM1YIrKpEcuBwiWwIj7is=;
	b=gsRuUzjnwY+tYhh8t5MYQKxeH27wVaooi38yjkSi+2YufUS8USoPMXvVdk+HB+I1a4
	2lrqwnHMSx8AHMH1wtJWZc2SEZvEGJyVSmpUiGEHe4byDhvyYNLss/sloSyJimPF1+If
	fT8UGwdmt9NR0xa1DAu5GpQle6Jt7gDzWPU/kgmvwHIO/0Dt9tgVJWfQfth6LU+CfLgj
	y047mkYxum1yEQepWU4ro8uFzXsDW/L8irYvai4HptbYQBAvUX0VrMNcsgtroDNQS26c
	QXIeQrLydZ+oTU9bC82DucgKAm33g5pO1pt7SjJ4PqFy/8yeNILIcW73zfmZ2Mg+jWM6
	Ngog==
X-Gm-Message-State: AEkoouuYwXgtZbjC/yl55K+xIBuHtuqdExSPMj8yuyVqrhYiURXeFzG/PPTGPqukJMBI/ipYmVBTtW0azi4kyQ==
X-Received: by 10.25.213.20 with SMTP id m20mr13559256lfg.61.1469658853359;
	Wed, 27 Jul 2016 15:34:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Wed, 27 Jul 2016 15:34:12 -0700 (PDT)
In-Reply-To: <1469653666-11180-2-git-send-email-derek@asterius.io>
References: <1469653666-11180-1-git-send-email-derek@asterius.io>
	<1469653666-11180-2-git-send-email-derek@asterius.io>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 28 Jul 2016 00:34:12 +0200
Message-ID: <CA+chaQepTdrOfc8L9VkcqnabiDOryOy3+-h_cKiy4ZDPAqN_MQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 2/2] libssh2: update to version 1.7.0
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
X-List-Received-Date: Wed, 27 Jul 2016 22:34:14 -0000
Content-Type: text/plain; charset=UTF-8

Duplicates the same change recently sent by Jackie Huang <
jackie.huang@windriver.com>, I'll take only 1/2.

On Wed, Jul 27, 2016 at 11:07 PM, Derek Straka <derek@asterius.io> wrote:

> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  .../recipes-support/libssh2/{libssh2_1.6.0.bb => libssh2_1.7.0.bb}    |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/libssh2/{libssh2_1.6.0.bb =>
> libssh2_1.7.0.bb} (84%)
>
> diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
> b/meta-oe/recipes-support/libssh2/libssh2_1.7.0.bb
> similarity index 84%
> rename from meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
> rename to meta-oe/recipes-support/libssh2/libssh2_1.7.0.bb
> index ad0f677..155d3d4 100644
> --- a/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
> +++ b/meta-oe/recipes-support/libssh2/libssh2_1.7.0.bb
> @@ -8,8 +8,8 @@ LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca"
>
>  SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz"
> -SRC_URI[md5sum] = "00aabd6e714a5f42a4fb82ace20db1dd"
> -SRC_URI[sha256sum] =
> "5a202943a34a1d82a1c31f74094f2453c207bf9936093867f41414968c8e8215"
> +SRC_URI[md5sum] = "b01662a210e94cccf2f76094db7dac5c"
> +SRC_URI[sha256sum] =
> "e4561fd43a50539a8c2ceb37841691baf03ecb7daf043766da1b112e4280d584"
>
>  inherit autotools pkgconfig
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

