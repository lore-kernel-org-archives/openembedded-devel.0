Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 10E2460123
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Apr 2017 17:30:07 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id g19so4639637wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 10:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UL6kMUzXI0wBMQInEy0V5AhaUubUwwIIApaPrfQLKBA=;
	b=d9C6KYvce6/gfxDkUzG4bsUl29lsMbUE8lbkieI2+AVJ59LZBke1MNhEP6tP5qI8in
	6ElbVXDRV5cR/XoRGxcnVwchDgPBMJi1EHO3PYIWMywQB6u6bFyW/AGfxOjIhe0Cwbbj
	agA3QK3j04uNppQ5BQysQ4kL6u7hw7W9mylI3HRzytFuT92s9m0pBmGTO1G3UeibtOe3
	MH20//Bm5Zj298XVAXzlmd82MdHgKFpnBy1g8XH4p7x8hRB//h65R/Re/6HTC6P/8Yfm
	vzUwbNceFjyqqSyAJK8+PDeCHKoE2iIKw7XVCPih7PRNm+8PtusxYKjeKLT/P+Yc95+p
	TgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UL6kMUzXI0wBMQInEy0V5AhaUubUwwIIApaPrfQLKBA=;
	b=F7b5of3tGRzABivfc/4kpFL5zRjrbvwlA84MuNi9YCy6uUf42NkUWTzBKcph0p7HE8
	fiOmC28cYS61oLqgjKc+WFwOS0be2rbCZ0vFoF00cjsq48jAl49yrB6YGrViBh3nGBI8
	Qq5v5gT0+bneoq3kMOmMqEYoOGtfubqIqxnGGt3RUvMsntj9+E1niA29X99rrsRkX9SG
	z0YED9NqRwBvVI36j4pNSeAKJGXBryp1MIKF+C5ZrPJfkrc+wEzb2KzkImXQjAcUN/+/
	zv+t5DjDlRphpRMVRfZC1GS1S/LKUJGXGFCMFLsnRdK4F+/uor20SYVSBQ4K0Xdyiw6x
	NRYg==
X-Gm-Message-State: AFeK/H1ECm6D2fEXMGWNMRw38AZJYrbVuhET+Zb8kgy5whP59Auqy4J7NGZvfnryDM5p6cNuhPsCxmgxSP9PqQ==
X-Received: by 10.223.138.225 with SMTP id z30mr26933463wrz.26.1491413408639; 
	Wed, 05 Apr 2017 10:30:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Wed, 5 Apr 2017 10:29:38 -0700 (PDT)
In-Reply-To: <1491396806-3521-1-git-send-email-benjamin.gaignard@linaro.org>
References: <1491396806-3521-1-git-send-email-benjamin.gaignard@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Apr 2017 10:29:38 -0700
Message-ID: <CAMKF1sqmN=uUotOH7sKF4LfYVoEkBzhggT+17GjQqH9-MLb8+g@mail.gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] tinyproxy: Add recipe
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
X-List-Received-Date: Wed, 05 Apr 2017 17:30:08 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 5, 2017 at 5:53 AM, Benjamin Gaignard
<benjamin.gaignard@linaro.org> wrote:
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> ---
>  .../tinyproxy/tinyproxy/tinyproxy.service          | 14 ++++++++++
>  .../recipes-support/tinyproxy/tinyproxy_1.8.4.bb   | 32 ++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
>  create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
>
> diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
> new file mode 100644
> index 0000000..800d2ad
> --- /dev/null
> +++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
> @@ -0,0 +1,14 @@
> +[Unit]
> +Description=Tinyproxy, Lightweight http(s) proxy daemon
> +RequiresMountsFor=/var
> +
> +[Service]
> +User=root
> +ExecStartPre=/bin/mkdir -p /var/log/tinyproxy
> +ExecStartPre=/bin/chown -R nobody.adm /var/log/tinyproxy

There could be a problem if this user/group does not exist

> +ExecStartPre=/bin/mkdir -p /var/run/tinyproxy
> +ExecStartPre=/bin/chown -R nobody.adm /var/run/tinyproxy
> +ExecStart=/usr/sbin/tinyproxy -d
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
> new file mode 100644
> index 0000000..76cec63
> --- /dev/null
> +++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
> @@ -0,0 +1,32 @@
> +SUMMARY = "Lightweight http(s) proxy daemon"
> +HOMEPAGE = "https://tinyproxy.github.io/"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> +
> +SRC_URI = "https://github.com/tinyproxy/tinyproxy/releases/download/1.8.4/tinyproxy-${PV}.tar.gz"
> +SRC_URI += "file://tinyproxy.service"
> +
> +SRC_URI[md5sum] = "3b60f7d08e0821ed1a3e2cf1e5778cac"
> +SRC_URI[sha256sum] = "8234c879a129feee61efa98bac14a1a3e46e5cf08f01696a216940872aa70faf"
> +
> +EXTRA_OECONF += " \
> +       --enable-filter \
> +       --enable-transparent \
> +       --disable-regexcheck \
> +       --enable-reverse \
> +       --enable-upstream \
> +       --enable-xtinyproxy \
> +       "
> +
> +inherit autotools systemd
> +
> +SYSTEMD_PACKAGES += "${PN}"
> +SYSTEMD_SERVICE_${PN} = "tinyproxy.service"
> +SYSTEMD_AUTO_ENABLE_${PN} = "enable"
> +
> +do_install_append() {
> +       install -d ${D}${systemd_system_unitdir}
> +       install -m 0644 ${WORKDIR}/tinyproxy.service ${D}${systemd_system_unitdir}
> +}
> +
> +FILES_${PN} =+ "${systemd_system_unitdir}/tinyproxy.service"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

