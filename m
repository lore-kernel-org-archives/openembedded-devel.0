Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1E0DA608DD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 15:04:37 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id h23so3246418qkh.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 07:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5qhHLQ7o6ZKQjBwk+/9CbFMhV/PUEHSQ6tb5z5XIzco=;
	b=DpOwstdj1aRyIMXOyZG0SuoVmTciDyVjhdvx8SKKFdaQkqGIkPS+dNUVbWqhB2OgVm
	qxmSn1WsufbH8iFHIIihbnmdjd3fgQIsWfjzyo2984Z+VwePO/caMRxtYyh+U7Tu+e/F
	arH4XUE/c4wYYAD6ER1fOWQYTI+T/paB+QuDwa3OnZ+pSkm1JBvvk1kYbpwM9yz1nE/5
	NmRJ89rY8aTA+DLr7U/t6a+1gfip7ev+vefJ+ELG1dU61NgAAwEzNL4jg3b66SLash0c
	08QmVkqFCOm5HZxl1B2XGGO7pOk42hCe3FIdC7vxu2swSTXs2h435tFoyq8Jcr5V+aGr
	Kekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5qhHLQ7o6ZKQjBwk+/9CbFMhV/PUEHSQ6tb5z5XIzco=;
	b=R/A02KO46cYBWq5Pg1xTNg4dowX9GCxW2gV+gURelA34NaOtdJ302OXI2zMOYld26X
	QiFB3/W5SsiTQt67rYBnKWEJ/xkLoe8ciJlFkpu60iwOWIzcbJ1/fnB66SDmyUa51MNj
	a4WnOOqJGkh1JuzsjDtJIKd2XfwCFkzfAfC5q31PworEhZJhG+AwDzGHxRnJGpIqL3W4
	9DMj/4hxEB2t5NqFZRiEf/hFQKro7vbOuXw6V5YzUgxGN/MYJ9NS20+mT66TEJEB34No
	P4Km8NTcDzjyHFoXhanBqw1u+NsCKPnyT4CW/uapDrs8jO5rclUAIYFAXGu2iKcuTUp8
	zQNQ==
X-Gm-Message-State: APjAAAWp2zHUbl+1jZfnJGdFJKKlSgnYYa4g/kFPVCurxDS/uQGWqmgL
	+AMciEXf4VpVBzk/AC2yzW/R5uPApCbddu5e4Tc+UZXeZgw=
X-Google-Smtp-Source: APXvYqxw0d0LXORrcPUVyhpI1XgBS5RoZOLqImY/1I6dHHnpAN+T0UyJ9wzI9DInsWuF1Zh77yxEKM9is8G0IladuAY=
X-Received: by 2002:a37:bf82:: with SMTP id
	p124mr25893050qkf.337.1580262839773; 
	Tue, 28 Jan 2020 17:53:59 -0800 (PST)
MIME-Version: 1.0
References: <1580241119-12734-1-git-send-email-marek.belisko@open-nandra.com>
In-Reply-To: <1580241119-12734-1-git-send-email-marek.belisko@open-nandra.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jan 2020 17:53:32 -0800
Message-ID: <CAMKF1spU47G4u8-Aa=0x34Oj+45vwFD-SC4bg=Yb0Ko3zCOcZQ@mail.gmail.com>
To: Marek Belisko <marek.belisko@open-nandra.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] recipes-support: Added recipe for gengetopt package
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:01 -0000
Content-Type: text/plain; charset="UTF-8"

fails to build

https://errors.yoctoproject.org/Errors/Details/308428/

perhaps it needs gettext during build.

On Tue, Jan 28, 2020 at 11:52 AM Marek Belisko
<marek.belisko@open-nandra.com> wrote:
>
> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> ---
>  meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb
>
> diff --git a/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb b/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb
> new file mode 100644
> index 0000000..a31ad0d
> --- /dev/null
> +++ b/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "skeleton main.c generator"
> +DESCRIPTION = "Gengetopt is a tool to write command line option parsing code for C programs."
> +SECTION = "utils"
> +HOMEPAGE = "https://www.gnu.org/software/gengetopt/gengetopt.html"
> +
> +LICENSE = "GPLv3+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=ff95bfe019feaf92f524b73dd79e76eb"
> +
> +SRC_URI = "${GNU_MIRROR}/gengetopt/${BPN}-${PV}.tar.xz"
> +
> +SRC_URI[md5sum] = "ea165d618640dbdecb42ae4491337965"
> +SRC_URI[sha256sum] = "b941aec9011864978dd7fdeb052b1943535824169d2aa2b0e7eae9ab807584ac"
> +
> +inherit autotools
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

