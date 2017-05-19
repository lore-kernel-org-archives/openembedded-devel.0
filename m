Return-Path: <moritz.fischer@ettus.com>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 67410780BE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 19:00:47 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id 99so5674772lfu.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 12:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=oLwH7rxxvEj2ZgB0xMFPBxQkhe0O+nCUi2EahpIE2iU=;
	b=Gk5iX6AvbIqRf6lH9LSdQ5hfgTKKTBtGkAuVUJOltR9GWTT1XNoE25U4KBajtpmGXS
	nfvwvDTcrY7+BjLa9ZEtZ2fhHz/y2AG1QNboAZcBxpkMyWRVYoaAkPl4aro5eOheUxna
	laC4h+xbP477DW9mk4y70BanXSrUE0OKBi1L6RpvXTkMwM5ymposJotUk4WZ6Pnls0Tx
	d0n25QDUJlMDN8HWFKjWb8PTzWXxpoZtePfobtfqop8TJEF7xwLtTw9M2MFp8b/XLHkt
	xJH5ElQelafePpduMyyQ/AsIRvBBMrdCYEEZ5ZigrF2bZRl8ZqXxwR3y4mXfHA2bHkqZ
	fItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=oLwH7rxxvEj2ZgB0xMFPBxQkhe0O+nCUi2EahpIE2iU=;
	b=Q/4ggWW8OKbvG2K7QSP+517h6HX71/jBte9DCShC24j11O14WrQZp8VcWk2fggiOd5
	0WHRPnggaRIgONviSKJ8yvhL5lGRmVpSqftDgH3wP7YakGwAx+4pcdzKodIrjINj7DUL
	2ICb9HOUrFaeF5adUpe/EX7zgGpbYNcyskei0VNBvUWltGvVWLBOR208u7Tz+RkHEnqs
	sdNB79NoEqB3MW4lwIAu9/wkhA4n3D989ORYawuzb12AEENBf/D1jBX8LcemPs1277Wb
	cAwdup+ROh7+4A12raAIPrq6qGsQBgwQXjeiBQokAkP6V+9EK865K+62Ad98Uli9vAWa
	waOQ==
X-Gm-Message-State: AODbwcAA/4Rb02rkIkEJntP/sELJQIpYWN3DYrrBysuq3d+sxR70WKhG
	PTSFda16YDQFpnO6G8uqMQi0gUBtrjJH13A=
X-Received: by 10.25.23.201 with SMTP id 70mr2446198lfx.113.1495220448659;
	Fri, 19 May 2017 12:00:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.70.2 with HTTP; Fri, 19 May 2017 12:00:48 -0700 (PDT)
In-Reply-To: <1495220184-15697-1-git-send-email-moritz.fischer@ettus.com>
References: <1495220184-15697-1-git-send-email-moritz.fischer@ettus.com>
From: Moritz Fischer <moritz.fischer@ettus.com>
Date: Fri, 19 May 2017 12:00:48 -0700
Message-ID: <CAAtXAHc6VTxWRamesZbeBUS=Nkfh6ocRnJ+zwjTipTuppXTVTQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] python-sdnotify/python3-sdnotify: Add new recipe
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
X-List-Received-Date: Fri, 19 May 2017 19:00:48 -0000
Content-Type: text/plain; charset="UTF-8"

Sorry for the noise, I fatfingered that one ... resending ...

On Fri, May 19, 2017 at 11:56 AM, Moritz Fischer
<moritz.fischer@ettus.com> wrote:
> python-sdnotify/python3-sdnotify is a pure python implementation for
> systemd's sd_notify mechanism.
>
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
>  .../python-sdnotify/python-sdnotify_0.3.1.bb       | 22 ++++++++++++++++++++++
>  .../python-sdnotify/python3-sdnotify_0.3.1.bb      | 22 ++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-sdnotify/python-sdnotify_0.3.1.bb
>  create mode 100644 meta-python/recipes-devtools/python/python-sdnotify/python3-sdnotify_0.3.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-sdnotify/python-sdnotify_0.3.1.bb b/meta-python/recipes-devtools/python/python-sdnotify/python-sdnotify_0.3.1.bb
> new file mode 100644
> index 0000000..e63560c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-sdnotify/python-sdnotify_0.3.1.bb
> @@ -0,0 +1,22 @@
> +HOMEPAGE = "https://github.com/bb4242/sdnotify"
> +SUMMARY = "A pure Python implementation of systemd's service notification protocol (sd_notify)"
> +
> +DESCRIPTION = "\
> +  sdnotify is a pure Python implementation of the systemd sd_notify protocol. \
> +  This protocol can be used to inform systemd about service start-up completion, \
> +  watchdog events, and other service status changes. \
> +  Thus, this package can be used to write system services in Python that play nicely with systemd. \
> +  "
> +
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cc572ccc4b18a4b7d13be5d01bc8213e"
> +
> +SRC_URI[md5sum] = "a182c1ef47e1c6c965771aa3029da16f"
> +SRC_URI[sha256sum] = "e69220d4f6cbb02130f43f929350a80cf51033fde47dcb056fbda71e2dff2d5a"
> +
> +inherit setuptools pypi
> +
> +do_install_append() {
> +       rm -r ${D}/${datadir}
> +}
> diff --git a/meta-python/recipes-devtools/python/python-sdnotify/python3-sdnotify_0.3.1.bb b/meta-python/recipes-devtools/python/python-sdnotify/python3-sdnotify_0.3.1.bb
> new file mode 100644
> index 0000000..57c7e5d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-sdnotify/python3-sdnotify_0.3.1.bb
> @@ -0,0 +1,22 @@
> +HOMEPAGE = "https://github.com/bb4242/sdnotify"
> +SUMMARY = "A pure Python implementation of systemd's service notification protocol (sd_notify)"
> +
> +DESCRIPTION = "\
> +  sdnotify is a pure Python implementation of the systemd sd_notify protocol. \
> +  This protocol can be used to inform systemd about service start-up completion, \
> +  watchdog events, and other service status changes. \
> +  Thus, this package can be used to write system services in Python that play nicely with systemd. \
> +  "
> +
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cc572ccc4b18a4b7d13be5d01bc8213e"
> +
> +SRC_URI[md5sum] = "a182c1ef47e1c6c965771aa3029da16f"
> +SRC_URI[sha256sum] = "e69220d4f6cbb02130f43f929350a80cf51033fde47dcb056fbda71e2dff2d5a"
> +
> +inherit setuptools3 pypi
> +
> +do_install_append() {
> +       rm -r ${D}/${datadir}
> +}
> --
> 2.7.4
>

