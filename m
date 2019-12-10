Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
	[209.85.222.169])
	by mail.openembedded.org (Postfix) with ESMTP id BAD0E7FC5D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 19:23:00 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id d202so17458236qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 11:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7EjFOipTS7URbuTWXuQ70njsWXoHYN6cyLOqu6KcZiw=;
	b=RXqCzll9RUtXVrugJPOxc73ZmpOIy7bIKtt5ZMAfE3B+dYqGi1wHPzRKOdt301hLny
	RcQRjkcV/n0KIUGl3699CMcogbkZ8StfO/LL0ChTS/87NapA1P/timMPyccvU6NkwJZ1
	rtUUr2mX0IVHawB9MSrbunx/lKNN2OZnqNhfUCmMo9imdTw6XHrxHVXphhS23JrJfHXP
	D5SUNHaSjl6+TNt9mPWjeuG9PCWSa2VWB0bWAvc71ZJdNflW+V99fwkIZq4zOe6SZIEZ
	jnHj02fkJjMHbFbeXAhkIRSuWEklvGNz1pE4GdWVY1HAiBs73GKnYJ1KGklOwVd0LNit
	0iEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7EjFOipTS7URbuTWXuQ70njsWXoHYN6cyLOqu6KcZiw=;
	b=JA+7lp+sNBaJwTYIP5EEkO2W4Yg3qnQksXHw7H0VihjtepaKeEa1wLkrxE7sPQt0Fv
	dI+xGXle9U1qIoDE8w68wcx3LoRw2iNbKFdZtFx8Jq10YoEKXxvqCL3EgpT23pqv2xb6
	8yuratTEUwv7aCRystnJZZdh2Iha7/42Mxk8KcJx7cZXmtzuvfPj1+xCMflg3c2wLUF3
	8w1BWqNBqnKB5s3drDGuuZWEslAuW9lt/Wyy50VL67XxBredHE4ibQ3ZrBjwggxxNec7
	c4OI+7jqkwotG3HkytzEZQjzs2UcYB+aOE/jv1tAbRmPP/mbFhccUigT1SFlvJlowYeP
	LG6A==
X-Gm-Message-State: APjAAAV8YI4u4ODIodzxjTTgUu2ItpxX678K0YBl/ZoCOZcKGMR/VwQi
	eLoWNL0IKUMNY/BHzlJkVR+ZAzISb/LatTUKZj8=
X-Google-Smtp-Source: APXvYqyXNqqjQTt4ZvY8t4HNPTpAgVSR6uECPIrk0sgjZygnuNfH9/8dTANQaIqVMh+5WXIZ0eWB3TekFL3qQuRsmXA=
X-Received: by 2002:a37:de05:: with SMTP id h5mr7059686qkj.474.1576005781259; 
	Tue, 10 Dec 2019 11:23:01 -0800 (PST)
MIME-Version: 1.0
References: <1574350178-22957-1-git-send-email-marek.belisko@open-nandra.com>
	<CAAfyv36j-iyxtdvjFL0kLpJ-KhpEFXfxiJri54=snjSm2xjRrg@mail.gmail.com>
In-Reply-To: <CAAfyv36j-iyxtdvjFL0kLpJ-KhpEFXfxiJri54=snjSm2xjRrg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Dec 2019 11:22:34 -0800
Message-ID: <CAMKF1so5So8kZ1ry-7-R6hM6F=_Kzg8_BSwOLqE8pu6LYhYY0g@mail.gmail.com>
To: Belisko Marek <marek.belisko@gmail.com>
Cc: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] multimedia: janus-gateway: Added new recipe
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
X-List-Received-Date: Tue, 10 Dec 2019 19:23:01 -0000
Content-Type: text/plain; charset="UTF-8"

Can you resend instead of forwarding. patchwork is not catching this.

On Tue, Dec 10, 2019 at 10:24 AM Belisko Marek <marek.belisko@gmail.com> wrote:
>
> Forwarded to correct ML.
>
> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> Signed-off-by: Jake Withecombe <jake@ruggednetworks.co.uk>
> ---
>  .../janus-gateway/files/janus-gateway.service      | 14 +++++++
>  .../janus-gateway/janus-gateway_0.7.4.bb           | 48 ++++++++++++++++++++++
>  2 files changed, 62 insertions(+)
>  create mode 100644
> meta-multimedia/recipes-multimedia/janus-gateway/files/janus-gateway.service
>  create mode 100644
> meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/janus-gateway/files/janus-gateway.service
> b/meta-multimedia/recipes-multimedia/janus-gateway/files/janus-gateway.service
> new file mode 100644
> index 0000000..5b4d4f2
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/janus-gateway/files/janus-gateway.service
> @@ -0,0 +1,14 @@
> +[Unit]
> +Description=Janus WebRTC Server
> +After=network.target network-online.target
> +Wants=network-online.target
> +
> +[Service]
> +Type=simple
> +ExecStart=/usr/bin/janus -o
> +Restart=always
> +RestartSec=60
> +LimitNOFILE=65536
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb
> b/meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb
> new file mode 100644
> index 0000000..bca716f
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb
> @@ -0,0 +1,48 @@
> +DESCRIPTION = "Janus is an open source, general purpose, WebRTC
> server designed and developed by Meetecho"
> +HOMEPAGE = "https://janus.conf.meetecho.com/"
> +SECTION = "libs/multimedia"
> +
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=c9e0a79f2244c2f79cda22ea5fed9135"
> +
> +SRC_URI = "https://github.com/meetecho/janus-gateway/archive/v${PV}.tar.gz \
> +          file://janus-gateway.service \
> +"
> +
> +SRC_URI[md5sum] = "b068ac2b40ae800d83f471b8189bc87c"
> +SRC_URI[sha256sum] =
> "01ddaf204203a1219dd46a5ce70b548bab75bc494c9ba05429f8fb1e786b2995"
> +
> +inherit autotools-brokensep pkgconfig systemd
> +
> +DEPENDS = "libsrtp jansson libconfig libnice openssl glib-2.0 gengetopt-native"
> +
> +PACKAGECONFIG ?= "rest_api rest"
> +#PACKAGECONFIG[disablewarnings] = "--disable-warnings-as-errors,,"
> +#PACKAGECONFIG[inet] = "--enable-inet,--disable-inet,"
> +#PACKAGECONFIG[inet6] = "--enable-inet6,--disable-inet6,"
> +PACKAGECONFIG[rest_api] = "--enable-turn-rest-api,--disable-turn-rest-api,curl"
> +PACKAGECONFIG[rest] = "--enable-rest,--disable-rest,libmicrohttpd"
> +PACKAGECONFIG[unix_sockets] = "--enable-unix-sockets,--disable-unix-sockets,"
> +PACKAGECONFIG[post_processing] =
> "--enable-post-processing,--disable-post-processing,"
> +PACKAGECONFIG[plugin_echo] =
> "--enable-plugin-echotest,--disable-plugin-echotest,"
> +PACKAGECONFIG[plugin_videocall] =
> "--enable-plugin-videocall,--disable-plugin-videocall,"
> +PACKAGECONFIG[plugin_nosip] = "--enable-plugin-nosip,--disable-plugin-nosip,"
> +PACKAGECONFIG[plugin_videoroom] =
> "--enable-plugin-videoroom,--disable-plugin-videoroom,"
> +PACKAGECONFIG[plugin_voicemail] =
> "--enable-plugin-voicemail,--disable-plugin-voicemail,"
> +PACKAGECONFIG[plugin_recordplay] =
> "--enable-plugin-recordplay,--disable-plugin-recordplay,"
> +PACKAGECONFIG[plugin_textroom] =
> "--enable-plugin-textroom,--disable-plugin-textroom,"
> +
> +FILES_${PN}_append = " ${libdir}/janus/plugins/*
> ${libdir}/janus/transports/* ${libdir}/janus/events"
> +FILES_${PN}-demo = "${datadir}/janus/*"
> +
> +PACKAGES_append = " ${PN}-demo"
> +
> +INSANE_SKIP_${PN} = "dev-so"
> +
> +SYSTEMD_SERVICE_${PN} = "janus-gateway.service"
> +
> +do_install_append() {
> +       # Install the systemd service so we can kick start on boot
> +       install -d ${D}${systemd_unitdir}/system
> +       install -m 644 ${WORKDIR}/janus-gateway.service
> ${D}${systemd_unitdir}/system/
> +}
> --
> 2.7.4
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

