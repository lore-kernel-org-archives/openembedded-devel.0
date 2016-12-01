Return-Path: <pespin.shar@gmail.com>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5276371B0B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2016 15:52:38 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id c13so174504825lfg.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2016 07:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZWtSi0+35gcwaACUELaihVlC4iCqCds8SZE/Ff2zTB8=;
	b=wiYzhC2/fxns5aLcprzB9NQIWCfvTFK+pG8q3Q2kGe9iA+i3w+2SirrNKMFJTDzyRC
	mD1Vt6unOVjZUqFApokjy+GiPA/evXNNMotK07qrUuoQwjo14YLm54zbnxMaKWul42o8
	9re63r5mpxym/vo9PdBdFd1Kbr3ngB48/x5j5sN4DN7XexZlBTJNoftFnzIAYLnYSWO6
	f1R3o2KTsD0jWVM01OhOoSZSKpIcS5ioOaPyvlKaphusEBXRF0QKXsBwT8DuChZPj9GO
	GmX6L8ghguZ9GWeeozvHc+k8JjIWiw2CKjbYoOws3n479OdhA26GQj4S+eekAIdve/kM
	/fdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZWtSi0+35gcwaACUELaihVlC4iCqCds8SZE/Ff2zTB8=;
	b=WlEELUwWv07uBYY2kGVG3wUXvb17fEWBM0nnvuBW+dwj8KwoCpcSj9TCJs7+d/tuvx
	BCRutV4K4bSawdSqh2iSnkKvM/qI2BKP8Yf2PeOlnFooNTyU1Tr5Jma3Myede5nihuVD
	Q/QNXtc2gRxzyDbh5rJUPJUk+z057BUWf6TwiQbhW0r2LS2ft08OnhE1IpZIMe9IYwbc
	c5bp3TpeDZPUSaYORiJTwRcMMd3L3dTKjFnZMIQXY/3n0z7IoRS8SVR2uibwLj43yXSp
	bE3x1BBNrUc8o1R1eJ/uT3bwyeAH6YSl5sI4ipP03GbmgglieNM7axovGT4rlyFetf0H
	Fzaw==
X-Gm-Message-State: AKaTC03OE+xbQa99ZS5bf4y2s+rPDZCp+jiQnzj4h+Q/eqp3fNUlddrdRYTp65wocUr+RVypNXXpdgi7muIlgA==
X-Received: by 10.25.35.6 with SMTP id j6mr14716161lfj.137.1480607559241; Thu,
	01 Dec 2016 07:52:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.155.135 with HTTP; Thu, 1 Dec 2016 07:52:38 -0800 (PST)
In-Reply-To: <1480413866-25885-2-git-send-email-frank@meerkoetter.org>
References: <1480413866-25885-1-git-send-email-frank@meerkoetter.org>
	<1480413866-25885-2-git-send-email-frank@meerkoetter.org>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
Date: Thu, 1 Dec 2016 16:52:38 +0100
Message-ID: <CAEGpDubDpkvHh2oZ=EZKXi9XykKJWyavBN8FZ3WLFZQZer7MpQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Frank Meerkoetter <frank@meerkoetter.org>
Subject: Re: [meta-oe][PATCHv2 1/5] redis: add a systemd service file
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
X-List-Received-Date: Thu, 01 Dec 2016 15:52:41 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Please use "${systemd_system_unitdir}" instead of
"${systemd_unitdir}/system".

Pau Espin Pedrol

2016-11-29 11:04 GMT+01:00 Frank Meerkoetter <meerkoetter@googlemail.com>:

> The redis.conf is changed on the fly to not daemonize redis.
> The reason for that is that with this appraoch we don't need
> special permissions to write to /var/run/.
>
> Signed-off-by: Frank Meerkoetter <frank@meerkoetter.org>
> ---
>  meta-oe/recipes-extended/redis/redis/redis.service | 14 ++++++++++++++
>  meta-oe/recipes-extended/redis/redis_3.0.2.bb      | 15 ++++++++++++++-
>  2 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-extended/redis/redis/redis.service
>
> diff --git a/meta-oe/recipes-extended/redis/redis/redis.service
> b/meta-oe/recipes-extended/redis/redis/redis.service
> new file mode 100644
> index 0000000..e2dc6a7
> --- /dev/null
> +++ b/meta-oe/recipes-extended/redis/redis/redis.service
> @@ -0,0 +1,14 @@
> +[Unit]
> +Description=Redis In-Memory Data Store
> +After=network.target
> +
> +[Service]
> +User=root
> +Group=root
> +ExecStart=/usr/bin/redis-server /etc/redis/redis.conf
> +ExecStop=/usr/bin/redis-cli shutdown
> +Restart=always
> +
> +[Install]
> +WantedBy=multi-user.target
> +
> diff --git a/meta-oe/recipes-extended/redis/redis_3.0.2.bb
> b/meta-oe/recipes-extended/redis/redis_3.0.2.bb
> index 2e4b760..89b79d4 100644
> --- a/meta-oe/recipes-extended/redis/redis_3.0.2.bb
> +++ b/meta-oe/recipes-extended/redis/redis_3.0.2.bb
> @@ -12,13 +12,16 @@ SRC_URI = "http://download.redis.io/
> releases/${BP}.tar.gz \
>             file://oe-use-libc-malloc.patch \
>             file://redis.conf \
>             file://init-redis-server \
> +           file://redis.service \
>             file://hiredis-update-Makefile-to-add-symbols-to-staticlib.patch
> \
>  "
>
>  SRC_URI[md5sum] = "87be8867447f62524b584813e5a7bd14"
>  SRC_URI[sha256sum] = "93e422c0d584623601f89b956045be
> 158889ebe594478a2c24e1bf218495633f"
>
> -inherit autotools-brokensep update-rc.d
> +inherit autotools-brokensep update-rc.d systemd
> +
> +REDIS_ON_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> 'true', 'false', d)}"
>
>  do_install() {
>      export PREFIX=${D}/${prefix}
> @@ -28,9 +31,19 @@ do_install() {
>      install -d ${D}/${sysconfdir}/init.d
>      install -m 0755 ${WORKDIR}/init-redis-server
> ${D}/${sysconfdir}/init.d/redis-server
>      install -d ${D}/var/lib/redis/
> +
> +    install -d ${D}${systemd_unitdir}/system
> +    install -m 0644 ${WORKDIR}/redis.service ${D}${systemd_unitdir}/system
> +    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${systemd_unitdir}/system/
> redis.service
> +
> +    if [ "${REDIS_ON_SYSTEMD}" = true ]; then
> +        sed -i 's!daemonize yes!# daemonize yes!'
> ${D}/${sysconfdir}/redis/redis.conf
> +    fi
>  }
>
>  CONFFILES_${PN} = "${sysconfdir}/redis/redis.conf"
>
>  INITSCRIPT_NAME = "redis-server"
>  INITSCRIPT_PARAMS = "defaults 87"
> +
> +SYSTEMD_SERVICE_${PN} = "redis.service"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

