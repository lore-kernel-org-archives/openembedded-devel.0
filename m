Return-Path: <pespin.shar@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 60E2371B04
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2016 15:51:03 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id 98so19371946lfs.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2016 07:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ER5OKplZ6pnSmUwPgHgPYJMLs9vsNzh8J79Hb6ZpY34=;
	b=wnvIldRwMlhPo3V+i0iWneb3XxxQ6Igxgmt3aazn7R39NWLAy4jzDm3rrdh3YBl6TN
	TsNvtOrxDfj5kTyYmIX+KbZS4KxMfD1Pu3AE0JqYEsI5kvosAV7iWGInyPQE91J/bhXn
	hLX0n9ImO36p2ll5mmrPpgpR3tRKJNxhDHo7iANFUhGE2D4TGoy6suEumVuj1x3bVHl9
	GYrswzS0HJBCeRPyB3j1fOXet1wXitjC2QsVSnEMSZ+7wUPfmv96fd/KmvkDvVjESsg6
	MczgOnZgoPWhSu4lC7bLTysNj7AE0nqaFvnb5EZLSZXE5cmHDP/3VK1XqTfELzPi83XW
	t42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ER5OKplZ6pnSmUwPgHgPYJMLs9vsNzh8J79Hb6ZpY34=;
	b=HB1w5IKWo3K2DCUsT5tp/92IbOAJI0P2+87ZUjcS3z5QpYQNZ/sZ6i//xaR+nvSF+C
	o0GnhTZtz9Lw6G30Zh7J990sNhBCIjpuJMhuNT7W3vTd+PaEgXrZKjczD4ThXf2ILX8H
	rU0O5gTIe7UKyJzyLLohVpv95neW2cOtPqdRfY1osd4yXBqcZiZcqrb/Wu8PKORotBrO
	pTH4MfVPcaiyz5w9kuFW20PXShtOZA9+AVQyMPciPYyYKo1hPJJqWV0hwwUJLXHgvF94
	Mtzvmzf6F9iSpbyzEU0pcQj4SYt9T5UFw8f1PnyUT87iqC9wlLxmBA8UIH+x2VBwl4yi
	6ufw==
X-Gm-Message-State: AKaTC00RncUtjJkqsc4o6x1GlTExsHCIm5RecvQnylCr5uJgaAxiy7ZXNEWSOfzoNv01R10MQ45T9+MD7KkY8w==
X-Received: by 10.46.9.21 with SMTP id 21mr19815091ljj.4.1480607464015; Thu,
	01 Dec 2016 07:51:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.155.135 with HTTP; Thu, 1 Dec 2016 07:51:03 -0800 (PST)
In-Reply-To: <1480352388-7733-2-git-send-email-frank@meerkoetter.org>
References: <1480352388-7733-1-git-send-email-frank@meerkoetter.org>
	<1480352388-7733-2-git-send-email-frank@meerkoetter.org>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
Date: Thu, 1 Dec 2016 16:51:03 +0100
Message-ID: <CAEGpDubhHbvKC-DHAHPjEz-KWtjyv8CT2n7gOjiX7M96r9dcrA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Frank Meerkoetter <frank@meerkoetter.org>
Subject: Re: [meta-oe][PATCH 1/5] Add a systemd service file for redis
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
X-List-Received-Date: Thu, 01 Dec 2016 15:51:05 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Please use "${systemd_system_unitdir}" instead of
"${systemd_unitdir}/system".

Pau Espin Pedrol

2016-11-28 17:59 GMT+01:00 Frank Meerkoetter <meerkoetter@googlemail.com>:

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

