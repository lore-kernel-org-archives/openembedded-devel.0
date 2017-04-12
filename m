Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id F23CE60589
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:45:37 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id z109so16711804wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 05:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kwZBwOFWWtJbQsVZmwny1Kn19PPcLJvd7M4yFzc9tJk=;
	b=XXyLy5BAHRVhxqG0FFP3VA2erPybkPCy8H36pcgvXfS1XgLYScouJavLE78QV0reaY
	YbE0PoLgdM+/4BTGvNI3Yy1X83QzaYkcN5H/8D9gHkMxyNS3AJveIOagC/MNHctqTTVc
	Twp4VJBH8l1NpzhduWL1531/8b0mbL28VE7KLgfP8RF8yhBZLQy0QaReQEl+/QiUp4ae
	QGC9xhcqeB4Tymywhg/ZJqDRzMpGf6K3YBPPojeFtIDcrjflvIEQOgxnnksIRKWQQdjO
	tqMHilw9iZOTC5OHTP91uvJKE2RODqLtY5hzXbhA/XLE8wa9OmWEFWIEqwXd0Y41Ertc
	yOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kwZBwOFWWtJbQsVZmwny1Kn19PPcLJvd7M4yFzc9tJk=;
	b=lV/Dt8ZveB7zNBbsD7Ab399d/v1gZQ/b0VibJw1hcshBrnY1isjz+ZRsdV1rroSSL8
	lmfuy7j/PfbzeqeEKpLk5mwJCYJXx4dBsSVNgtVJ3BcisXnmHv4t+dr0EhoIaEi0RDj3
	qVFAMkvojUgBcU860an4Z601da3XsQ/88z6SuLl3KXyfaffS6T3e836zRjpEivl4CQzh
	nzYJneig854geyjSe3GaOiZF0xYCzkF9BAZdLrk3kq26GtmRU+to2uM9F2SVoJQnXVbS
	ys40RYSFb7WXaPzLT87TlCbDmCDbU3i43/pom56t9brHC4uPxt7HRM35vJNIN6uBllwW
	kDlA==
X-Gm-Message-State: AN3rC/5NKEdCq7W8gRRtjokWWVIRczDyN29it+v+IUYoRzkVYZalLxFF9At5UEZfD9r5vShwKO6Il2A5j+HUPw==
X-Received: by 10.223.136.66 with SMTP id e2mr2969267wre.14.1492001138295;
	Wed, 12 Apr 2017 05:45:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Wed, 12 Apr 2017 05:45:37 -0700 (PDT)
In-Reply-To: <1491486145-30397-1-git-send-email-benjamin.gaignard@linaro.org>
References: <1491486145-30397-1-git-send-email-benjamin.gaignard@linaro.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 12 Apr 2017 14:45:37 +0200
Message-ID: <CA+chaQfVWLdyBnf8ewW3OFV=tmFT6D-5YZDJnrvihSEpAdGmiQ@mail.gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [[meta-networking][PATCH v2] tinyproxy: Add recipe
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
X-List-Received-Date: Wed, 12 Apr 2017 12:45:49 -0000
Content-Type: text/plain; charset=UTF-8

Still fails to build:
http://errors.yoctoproject.org/Errors/Details/140323/

On Thu, Apr 6, 2017 at 3:42 PM, Benjamin Gaignard <
benjamin.gaignard@linaro.org> wrote:

> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> ---
> version 2:
> - create user and group for tinyproxy
> - only install the service if systemd is present in DISTRO_FEATURE
> - add dependency on asciidoc-native
>  .../tinyproxy/tinyproxy/tinyproxy.service          | 14 ++++++++
>  .../recipes-support/tinyproxy/tinyproxy_1.8.4.bb   | 41
> ++++++++++++++++++++++
>  2 files changed, 55 insertions(+)
>  create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/
> tinyproxy.service
>  create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy_1.
> 8.4.bb
>
> diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
> b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
> new file mode 100644
> index 0000000..ea079f9
> --- /dev/null
> +++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/
> tinyproxy.service
> @@ -0,0 +1,14 @@
> +[Unit]
> +Description=Tinyproxy, Lightweight http(s) proxy daemon
> +RequiresMountsFor=/var
> +
> +[Service]
> +Group=tinyproxy
> +ExecStartPre=/bin/mkdir -p /var/log/tinyproxy
> +ExecStartPre=/bin/chown -R nobody.tinyproxy /var/log/tinyproxy
> +ExecStartPre=/bin/mkdir -p /var/run/tinyproxy
> +ExecStartPre=/bin/chown -R nobody.tinyproxy /var/run/tinyproxy
> +ExecStart=/usr/sbin/tinyproxy -d
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
> b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
> new file mode 100644
> index 0000000..ef2a2d8
> --- /dev/null
> +++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
> @@ -0,0 +1,41 @@
> +SUMMARY = "Lightweight http(s) proxy daemon"
> +HOMEPAGE = "https://tinyproxy.github.io/"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> +
> +SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/$
> {BP}.tar.gz \
> +                  file://tinyproxy.service"
> +
> +SRC_URI[md5sum] = "3b60f7d08e0821ed1a3e2cf1e5778cac"
> +SRC_URI[sha256sum] = "8234c879a129feee61efa98bac14a1
> a3e46e5cf08f01696a216940872aa70faf"
> +
> +DEPENDS = "asciidoc-native"
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
> +inherit autotools systemd useradd
> +
> +#User specific
> +USERADD_PACKAGES = "${PN}"
> +USERADD_PARAM_${PN} = "nobody"
> +GROUPADD_PARAM_${PN} = "--system tinyproxy"
> +
> +SYSTEMD_PACKAGES += "${BPN}"
> +SYSTEMD_SERVICE_${PN} = "tinyproxy.service"
> +SYSTEMD_AUTO_ENABLE_${PN} = "enable"
> +
> +do_install_append() {
> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
> 'false', d)}; then
> +               install -d ${D}${systemd_system_unitdir}
> +               install -m 0644 ${WORKDIR}/tinyproxy.service
> ${D}${systemd_system_unitdir}
> +       fi
> +}
> +
> +FILES_${PN} =+ "${systemd_system_unitdir}/tinyproxy.service"
> --
> 1.9.1
>
>

