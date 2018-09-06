Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 76A707969E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 15:31:31 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id k38-v6so12697775qtk.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 08:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xYtKefMExnD6le51jVzDzSHjgRhlUWJlDUEQ3k5kvLM=;
	b=Lis1B+ouHFE4KLHxLsaAxEapi8gSOdAUfNDZewy3uiRtg6Krx5MGbEwGxGizCKFIPy
	XgNQjVjQYj20oHXXbj4bv9xg3jy1/SREmlsLd7LhtAsvf4BZoUz9Qqpzc5OFm7GKcpRA
	Yku4oqboDoArcgV44xkpiimM0jDu8TdbcuWl/sL+f9d7t3b4rwHEtS62qOPLqvBtZCtZ
	U4TaAjp3paoWeglvMi3ZVwdDOSWJ6wkO2oBySqwOtkvr2FCQwgroFi3cXnQYedYyZyo8
	1mo9gi+8e7BsgnO3Ccvz1VovhTrPsQvdDq7vmUTgC4yCTi99pcDHMUHcXSuXTug3HNiG
	5FUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xYtKefMExnD6le51jVzDzSHjgRhlUWJlDUEQ3k5kvLM=;
	b=fNH7iLGb55tO1hw1/Etzbi5/1tFjywkA3s4i4Zngli051ZkQN8lWhq9Ze9pJlNh7Qr
	M1HaP6ukOuqxaZtLtJ77bMmfKvEIc/duKo2TX3OFGXe2I70BHNJ6vvZOxfb8FfOt0sGK
	XUWyQUFTGHtVEeG3Wx8oycebSfm7dZFkuEF0edEprvskBxlRYg68g0DBbT4tSo486Ilo
	ySncJlNLMXIvmUQd7td9XafjhyX2Pm4qS2ibA1ZYxUVMPIWrEgPqRb6e0G/Y5NPJlE0s
	SALYzoKuSnGWz8cir/7HPjQaq6ttVE2Gjo3XKI4TXqjKvbmxT7GXxcL0l+pa60YA721o
	rGzA==
X-Gm-Message-State: APzg51Brs9mPA5oI3qhq+zMaDp0OhJqKriueDxhHv7WIrc7LjcUzwI+1
	Jjmql4ykkApU4GZoemg6uXbR9KX74N3ROh2lRP8=
X-Google-Smtp-Source: ANB0VdbVtxZiiknJEQA4bTD46n3Zb/zGgEUEls+D9gz+lA6kOWYO2bE04fcJfdV+H4Tww4B0W/RCPh5NzEUAqgYKrFc=
X-Received: by 2002:ac8:6c8:: with SMTP id j8-v6mr2535554qth.314.1536247892071;
	Thu, 06 Sep 2018 08:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20180906123745.26192-1-brgl@bgdev.pl>
In-Reply-To: <20180906123745.26192-1-brgl@bgdev.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Sep 2018 08:31:05 -0700
Message-ID: <CAMKF1soK0OxkEai1r0U-aZdE97u5HPoev7G7Ykes9m8BP9uSmQ@mail.gmail.com>
To: brgl@bgdev.pl
Cc: bgolaszewski@baylibre.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] networkd-dispatcher: new package
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
X-List-Received-Date: Thu, 06 Sep 2018 15:31:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 6, 2018 at 5:38 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> This adds a recipe for networkd-dispatcher.
>
> It's a simple package containing a python script that needs to be
> installed together with a systemd service and an example config
> file. There's nothing to build.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  .../networkd-dispatcher_1.7.bb                | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_1.7.bb
>
> diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_1.7.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_1.7.bb
> new file mode 100644
> index 000000000..1887c4c7a
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_1.7.bb
> @@ -0,0 +1,30 @@
> +SUMMARY = "Dispatcher service for systemd-networkd connection status changes"
> +DESCRIPTION = "This daemon is similar to NetworkManager-dispatcher, but is much \
> +more limited in the types of events it supports due to the limited nature of \
> +systemd-networkd(8)."
> +AUTHOR = "Clayton Craft and others"
> +
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
> +
> +RDEPENDS_${PN} = "systemd python3 python3-pygobject python3-dbus"
> +
> +SRC_URI = "git://gitlab.com/craftyguy/networkd-dispatcher.git;protocol=https"
> +SRCREV = "c7e25623a161b64618ea778541c064d2a1df086b"

perhaps define PV in terms of SRCPV

> +
> +S = "${WORKDIR}/git"
> +
> +# Nothing to build, just a python script to install.
> +do_compile() {
> +}

use deltask

> +
> +do_install() {
> +    mkdir -p ${D}/${sbindir}
> +    install -m 0755 ${S}/networkd-dispatcher ${D}${sbindir}/networkd-dispatcher

condense both into install -D -m 0755 ....

> +    mkdir -p ${D}/${systemd_unitdir}/system
> +    install -m 0644 ${S}/networkd-dispatcher.service ${D}/${systemd_unitdir}/system/networkd-dispatcher.service
> +    mkdir -p ${D}/${sysconfdir}/conf.d
> +    install -m 0644 ${S}/networkd-dispatcher.conf ${D}/${sysconfdir}/conf.d/networkd-dispatcher.conf

this whole section should check for systemd being in DISTRO_FEATURES

> +}
> +
> +FILES_${PN} += "${systemd_unitdir}/system/networkd-dispatcher.service"

use systemd_system_unitdir

> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

