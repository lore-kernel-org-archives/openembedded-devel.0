Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 07C247FC11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 07:10:20 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id 15so3924406qkh.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 00:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bzFeIoXwh8yskKSFOUXmrF5rb0/75Mh3fHJwPfPMlwg=;
	b=uTgfjUwjQru6u4uxU/nQvxNQZel41GNwFtnMmcMy9ivIFGTl3aFf3jAkzrOh1UPIWj
	NU8JPD4PAjtirkw3DuL9vItJfLJK3vhnrVafFseejJT15GtI0ZFiGE3erznEsYlsbTV/
	wVI6GbatPKjJTTipriVuPti6bz228xHhEwSmFaO2W5S1LdSpy3yr59sw9vaHd3154+Gi
	QR4DLMBSa+T0ef4AaDghtF2k9pomiFUL7Q08brlZM7pZsnL36znXfjLa4RlCHIBEgFj/
	S0YoprXm7k/rJmdf8HZUV3S53JOq9yz2YOVFsC2pTFetQjfndekN9s3nBjBqMr7s9Cjq
	JJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bzFeIoXwh8yskKSFOUXmrF5rb0/75Mh3fHJwPfPMlwg=;
	b=ta8/GTLf6LuA2ya62v5YDIl6OEyoXQoQiLOqD0oJUuw7shrQj1qlJvXlaSD8mSwn4h
	FdZt7TGLaWo6lRFVa5iRDBRtucBXR+4ReXGWpddCWwYNTgyULf1nJJIjzM52nzgXI7tj
	KEV+LFlS2pvaa1TMJFL6BBX/1qyhAsBN7yyrxahdn/PSVr6mgoZnfMG/7rTsUUWdt+ur
	3gibpyB40ggOhh5fE/r4OOjIrEub2x7FLxV3Fr0GdjZgH9DcRw9zw140YxhEbyOxY9an
	Coroy3xDyEF5+tlLBgVdagX267bx95e6WUK+gKfu9UbQgn3sOjE2lqd4lZht72Bx6U2i
	dSJQ==
X-Gm-Message-State: APjAAAVG3Fvk0I49sPUYJyLiuxm6lNqY8sn62lyAuKy3VCjlOyU4zWzb
	LGyB/L10nrii03IBfTKcoXoHEx0vWZnsQF1KMK8=
X-Google-Smtp-Source: APXvYqwEpU+IAkT5BW5KIuL/+MOP1OlPni5kueWYlV+nOY7p+8xdrlQL9GhMQ83vgYwFBfJP3ybTJ+hGDCniorPf4yM=
X-Received: by 2002:a37:6554:: with SMTP id z81mr6597810qkb.9.1572073821271;
	Sat, 26 Oct 2019 00:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20191025191221.17914-1-luca.boccassi@gmail.com>
In-Reply-To: <20191025191221.17914-1-luca.boccassi@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Oct 2019 08:09:55 +0100
Message-ID: <CAMKF1srMp1ep=VDXEM9+KDuumdHmRb48H19zucXH3UdNx3ou0w@mail.gmail.com>
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] dbus-broker: 19 -> 21
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
X-List-Received-Date: Sat, 26 Oct 2019 07:10:21 -0000
Content-Type: text/plain; charset="UTF-8"

Luca

This fails to build on musl/x86

| ../dbus-broker-21/src/launch/launcher.c: In function 'launcher_fork':
| ../dbus-broker-21/src/launch/launcher.c:378:60: error: 'WEXITED'
undeclared (first use in this function); did you mean 'WIFEXITED'?
|   378 |         r = sd_event_add_child(launcher->event, NULL, pid,
WEXITED, launcher_on_child_exit, launcher);
|       |                                                            ^~~~~~~
|       |                                                            WIFEXITED


II think the source file needs to include <sys/wait.h>

On Fri, Oct 25, 2019 at 8:13 PM <luca.boccassi@gmail.com> wrote:
>
> From: Luca Boccassi <luca.boccassi@microsoft.com>
>
> Add /lib/systemd/catalog to the package, as snippets for the journal are
> now shipped.
>
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
>  .../recipes-core/dbus/{dbus-broker_19.bb => dbus-broker_21.bb} | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>  rename meta-oe/recipes-core/dbus/{dbus-broker_19.bb => dbus-broker_21.bb} (80%)
>
> diff --git a/meta-oe/recipes-core/dbus/dbus-broker_19.bb b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
> similarity index 80%
> rename from meta-oe/recipes-core/dbus/dbus-broker_19.bb
> rename to meta-oe/recipes-core/dbus/dbus-broker_21.bb
> index 82d8b8ba6..0b0301fe0 100644
> --- a/meta-oe/recipes-core/dbus/dbus-broker_19.bb
> +++ b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
> @@ -7,7 +7,7 @@ LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
>
>  SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/dbus-broker-${PV}.tar.xz"
> -SRC_URI[sha256sum] = "1648227f5a347d4f38d8a29bb9295a73a25c3feb4f3e79e3f04cc847343da3ed"
> +SRC_URI[sha256sum] = "6fff9a831a514659e2c7d704e76867ce31ebcf43e8d7a62e080c6656f64cd39e"
>
>  inherit meson pkgconfig systemd distro_features_check
>
> @@ -19,3 +19,4 @@ SYSTEMD_SERVICE_${PN} = "${BPN}.service"
>
>  FILES_${PN} += "${systemd_system_unitdir}"
>  FILES_${PN} += "${systemd_user_unitdir}"
> +FILES_${PN} += "${libdir}/systemd/catalog"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

