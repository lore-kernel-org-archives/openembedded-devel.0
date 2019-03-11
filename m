Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 354556B7C2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Mar 2019 04:21:36 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id b16so2554558qtt.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Mar 2019 21:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UzbhXjLVSBtekw1yOHQnWAwNnJIITV9iwDEka1/wrcE=;
	b=BSaK+uO1DqzP2+0QtOIGeeGu6YFPBj+qyaTx4vG1095JJELOlGFw6K06bBZ4nLryHW
	A2vy8I+i/6+1PlfcOMhaXmWGe7HwT39gu/FsLqCVywx2lTX1dAquzeIM5be5vcIHHZue
	0Mb4AXPS26RL9BVJYmPF2S47EcZgjVe01CvLVpJiGWpDQaKiRvd5VXfw5eSyclUQJ3pc
	ZZfubCwCKAhWxszoX8ScrKPamHf8haUiPILFbvSwGnQqocSDxS/gWNtIRjJaM/MJc1Vv
	rDObG4Iv4GbkvNyFzKvjPM83G7KV3So+ONw55/kIOLujXoosRDWAsLg291rIaPOnuyNY
	7aKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UzbhXjLVSBtekw1yOHQnWAwNnJIITV9iwDEka1/wrcE=;
	b=mObxO12bgC71SwN6dVUaEYIUwUO+8sGyPGotkuglf/AJIAVYoxFFUmwleSGpKW3WEe
	1sNTEuBHslftJm3ORueOK81KDIlGq1VI/AweOVpBfsMwY1ySC+unLwj8WwhuA7Jfv46h
	SD+PepFx2u94AxoeZpqjNmIiHpQe3o3QoC7v8uhvu3TUA74wNIfAPV6hMWvZ3uvANbDQ
	ZV1T3C8U0fQQGdd5X/QizLjw7sUbWBthP3UnLErV6QOK2eIoeoLnWRqp58OjgcC+wCcc
	NRwY695mY0mNGbyxLuNi3JnC/I+ib45ZWap1DLV1YxCZjLRwaALfIAYsnZS8nVKG168u
	AGuw==
X-Gm-Message-State: APjAAAWJQ3VRGn+eunalSvrE/JWCuccB9Rrw99/lgn2wFd0Y9CG4jnQt
	M5nbGt0LeIFAF2nuvX0QakWWRyM5cwqizRdZSCIC9nk8
X-Google-Smtp-Source: APXvYqyqPQabGGyiYdy1JbRVbVKUwYff9baMMkLev8MahHsoDI4C+OPlLiOAkKWOdPDjxmJzMqIp8645gkgVx0SWWqM=
X-Received: by 2002:ac8:2c51:: with SMTP id e17mr23391346qta.254.1552278096895;
	Sun, 10 Mar 2019 21:21:36 -0700 (PDT)
MIME-Version: 1.0
References: <1552092251-25129-1-git-send-email-bassem.boubaker@actia.fr>
In-Reply-To: <1552092251-25129-1-git-send-email-bassem.boubaker@actia.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 Mar 2019 21:21:11 -0700
Message-ID: <CAMKF1sp04ydKq7A1jjLcR6Los_nk8g5nPWj1ZUcMN6Erjcw7Vg@mail.gmail.com>
To: BOUBAKER Bassem <bassem.boubaker@actia.fr>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cpulimit: introduce support for this package
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
X-List-Received-Date: Mon, 11 Mar 2019 04:21:36 -0000
Content-Type: text/plain; charset="UTF-8"

fails to build
https://errors.yoctoproject.org/Errors/Details/232382/

On Sat, Mar 9, 2019 at 2:55 AM BOUBAKER Bassem via Openembedded-devel
<openembedded-devel@lists.openembedded.org> wrote:
>
>     * Now, cpulimit recipe is put under recipes-support. Binary will be installed by the recipe under /usr/sbin
>
>         # cpulimit -h
>         Usage: cpulimit [OPTIONS...] TARGET
>                 OPTIONS
>                 -l, --limit=N          percentage of cpu allowed from 0 to 100 (required)
>                 -v, --verbose          show control statistics
>                 -z, --lazy             exit if there is no target process, or if it dies
>                 -i, --include-children limit also the children processes
>                 -h, --help             display this help and exit
>                 TARGET must be exactly one of these:
>                 -p, --pid=N            pid of the process (implies -z)
>                 -e, --exe=FILE         name of the executable program file or path name
>                 COMMAND [ARGS]         run this command and limit it (implies -z)
>
>                 Report bugs to <marlonx80@hotmail.com>.
>
> Signed-off-by: Bassem Boubaker <bassem.boubaker@actia.fr>
> ---
>  meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
>
> diff --git a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
> new file mode 100644
> index 0000000..2ac82b8
> --- /dev/null
> +++ b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "cpulimit is a tool which limits the CPU usage of a process"
> +HOMEPAGE = "http://cpulimit.sourceforge.net"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=86c1c0d961a437e529db93aa3bb32dc4"
> +SRCREV ?= "f4d2682804931e7aea02a869137344bb5452a3cd"
> +
> +SRC_URI = "git://git@github.com/opsengine/cpulimit.git;protocol=https"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools
> +
> +do_install() {
> +        install -d ${D}${sbindir}
> +        install -m 0755 ${B}/src/${PN} ${D}${sbindir}/
> +}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

