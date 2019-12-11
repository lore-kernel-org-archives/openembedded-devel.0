Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6EAE47F8BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 15:40:27 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id v2so6598499qtv.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 07:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NYUuYo+MRcm7WFT67A6QmxtuF1eu8BO9R82ZnK77b5M=;
	b=RNV6ULcNRqtvbHkVDXQ9GzG9FYBWsG9ZGZ1qDsrfddvsUcDNB+AMdhkqqf9yNSQ/FC
	ROZrpiB9wPhd2+GvdE3sDvAWdFIAp+eQ3Ro6XVDiBJ9LiHrwHH+2kir3VzgSgprtDvYI
	wp08VYnrfanw0dm2xZIfpSQmgww/mrWEYQhTx9Zaco0VckT6xOuJNwOi6X88NeNjpnyA
	kvM5NiactUHvh+o+xygAQCDREU5rZU1V9SILiytiPMQ97dNG3VkDODxhWsNfJRwpesaO
	Eo/yqYjze9322YuhwQPpxjoSopFbVnd02JoS1lQgG2a1aPJTUBI/F6V00m1J8jJVRVnj
	uTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NYUuYo+MRcm7WFT67A6QmxtuF1eu8BO9R82ZnK77b5M=;
	b=TobbEHWiVmZaQeI8YRbDGQaxb6eu+2KFmJt+RtvM7Q0F8o3tqtQbkVWYT0uEVOsjMf
	GTQ2il5KILuxOghIjpLXYwt3+kjby1IqlWVYsxObTOBAwxciWrPL524/AXyrWt9+52fo
	/kdvsQvsULURf844TVhGVTWRj7KAW1YrnB0O6sXA2v7MxHY2JJWkrQM1ImJCUXh9Yy/8
	iwWzFvq+Y0nB6oAX5gvUXXGfTCLlyXGO/kEBHhYSfUfe+NUZRhIFkfcnk66ON8xmB6Ye
	Cls8owvINgNhuVJrrng2Fc0dLiw2r8lVdq/Jp5TTqQNMDyHZKbFzhzlUW+y2KdmH6E1x
	n4zg==
X-Gm-Message-State: APjAAAVzXxCYYK9vXqxvHRz7XsqBOm+u8fTLFLu2oApQIDqVsHEr2Ie5
	xlkcsrya+76cLGo0KWehxKGwl2q8j2dOPdxKupGI+RImsNM=
X-Google-Smtp-Source: APXvYqyxmq5Md7xgNZbeUI/Q82q25xrWTGiUlhCnw6+Urz7zCqTi/XuxWcWkIpobcC36DmYnWtCXkpMdTt2qaCNgb+M=
X-Received: by 2002:ac8:145:: with SMTP id f5mr3253102qtg.194.1576078827846;
	Wed, 11 Dec 2019 07:40:27 -0800 (PST)
MIME-Version: 1.0
References: <1576010126-10738-1-git-send-email-marek.belisko@open-nandra.com>
In-Reply-To: <1576010126-10738-1-git-send-email-marek.belisko@open-nandra.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Dec 2019 07:40:01 -0800
Message-ID: <CAMKF1soG7eMOapj95JrMQobJj3vxZTL8i=55iMKbu+KhixXUxA@mail.gmail.com>
To: Marek Belisko <marek.belisko@open-nandra.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Jake Withecombe <jake@ruggednetworks.co.uk>
Subject: Re: [PATCH] multimedia: janus-gateway: Added new recipe
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
X-List-Received-Date: Wed, 11 Dec 2019 15:40:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 10, 2019 at 12:36 PM Marek Belisko
<marek.belisko@open-nandra.com> wrote:
>
> Added recipe for janus-gateway
>
>
> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> Signed-off-by: Jake Withecombe <jake@ruggednetworks.co.uk>
> ---
>  .../janus-gateway/files/janus-gateway.service      | 14 +++++++
>  .../janus-gateway/janus-gateway_0.7.4.bb           | 48 ++++++++++++++++++++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/janus-gateway/files/janus-gateway.service
>  create mode 100644 meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/janus-gateway/files/janus-gateway.service b/meta-multimedia/recipes-multimedia/janus-gateway/files/janus-gateway.service
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
> diff --git a/meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb b/meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb
> new file mode 100644
> index 0000000..bca716f
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/janus-gateway/janus-gateway_0.7.4.bb
> @@ -0,0 +1,48 @@
> +DESCRIPTION = "Janus is an open source, general purpose, WebRTC server designed and developed by Meetecho"
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
> +SRC_URI[sha256sum] = "01ddaf204203a1219dd46a5ce70b548bab75bc494c9ba05429f8fb1e786b2995"
> +
> +inherit autotools-brokensep pkgconfig systemd
> +
> +DEPENDS = "libsrtp jansson libconfig libnice openssl glib-2.0 gengetopt-native"

gengetopt-native provider is not anywhere in meta-openembedded. So
either make it a packageconfig
and keep it disabled or remove the dependency,

> +
> +PACKAGECONFIG ?= "rest_api rest"
> +#PACKAGECONFIG[disablewarnings] = "--disable-warnings-as-errors,,"
> +#PACKAGECONFIG[inet] = "--enable-inet,--disable-inet,"
> +#PACKAGECONFIG[inet6] = "--enable-inet6,--disable-inet6,"
> +PACKAGECONFIG[rest_api] = "--enable-turn-rest-api,--disable-turn-rest-api,curl"
> +PACKAGECONFIG[rest] = "--enable-rest,--disable-rest,libmicrohttpd"
> +PACKAGECONFIG[unix_sockets] = "--enable-unix-sockets,--disable-unix-sockets,"
> +PACKAGECONFIG[post_processing] = "--enable-post-processing,--disable-post-processing,"
> +PACKAGECONFIG[plugin_echo] = "--enable-plugin-echotest,--disable-plugin-echotest,"
> +PACKAGECONFIG[plugin_videocall] = "--enable-plugin-videocall,--disable-plugin-videocall,"
> +PACKAGECONFIG[plugin_nosip] = "--enable-plugin-nosip,--disable-plugin-nosip,"
> +PACKAGECONFIG[plugin_videoroom] = "--enable-plugin-videoroom,--disable-plugin-videoroom,"
> +PACKAGECONFIG[plugin_voicemail] = "--enable-plugin-voicemail,--disable-plugin-voicemail,"
> +PACKAGECONFIG[plugin_recordplay] = "--enable-plugin-recordplay,--disable-plugin-recordplay,"
> +PACKAGECONFIG[plugin_textroom] = "--enable-plugin-textroom,--disable-plugin-textroom,"
> +
> +FILES_${PN}_append = " ${libdir}/janus/plugins/* ${libdir}/janus/transports/* ${libdir}/janus/events"
> +FILES_${PN}-demo = "${datadir}/janus/*"
> +
> +PACKAGES_append = " ${PN}-demo"

you could use PACKAGES += "..."

> +
> +INSANE_SKIP_${PN} = "dev-so"

why is this needed.

> +
> +SYSTEMD_SERVICE_${PN} = "janus-gateway.service"
> +
> +do_install_append() {
> +       # Install the systemd service so we can kick start on boot
> +       install -d ${D}${systemd_unitdir}/system
> +       install -m 644 ${WORKDIR}/janus-gateway.service ${D}${systemd_unitdir}/system/
> +}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

