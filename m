Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id DF2A07821C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Sep 2017 16:25:36 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id v66so5601953pgb.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Sep 2017 09:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zurDEZ8+Q6WlFIDqDtGE4LHZqqmNmXCVWacpzIP/PvY=;
	b=Q3A5y9cOagzSUtEC3jwuiT4wqIwdmzVCAtzwNMUPyxMBFNNH/c4I6k4k/dlc2W8OEd
	VCLM9eP0mKTIvJECheQJm9dX+XCOnXMCvAzuPHTnJJIDpqlF0Mt3xPBrfyVmup6PxMuJ
	BNtQEC/UxxRtN4xaOgbLyhquW9UoLhK/Mb/xWAZ5+D6Z3aFvUKEbsBgeHqHSrj/MJJx+
	ZH1/itRaTRs5Oint4iYKon2wuFWizBbgSGoKlWJha20i2ee0x42BAl3MlLGQrYAVxUPg
	W1vOZMWwTAFaFdMoYuhYHTwN0ncapN91YBbFnzgYaW497c8Av7nvr4GFxSsnthfwPadT
	58vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zurDEZ8+Q6WlFIDqDtGE4LHZqqmNmXCVWacpzIP/PvY=;
	b=iySdAkW6GagwO/GPjP9SevlooNZHHMhRfR/FDTGEsaGF9JfmkXJr+289qes9oGKUDD
	FxB28rfUDWuWi5O8gBLd++DsvVqoTtHwwuSxLRrHgI6uAMnn8pA+Qn4Kj53k5JiuT83i
	xC+6YnhtpoBj0YIUUp3moaRlGb6bCOkoC/kDncrT3rySpJ7j+3omZUp1Veg+R2ZRtPi7
	xt9+9wcCBIjMHzVFlYj8YeFHu3WU/GS3W7YtIXR2CViZyVbA3JMppnmMCcZhT9cpm9Aw
	lSnxlF+u6dYtSjbMCTsmcbAe65NUFuQSvphheK13fNYZaDkBxrgbprsp6XjGUkDlL25I
	CEzw==
X-Gm-Message-State: AHPjjUjPaLBTikkpy6676sKfLIRX0p2Xz1aJgdA8/27DwTl9VLwn6M5+
	RbGi69hXUjNvmRcyfrkYUbghftT1F2byVmyS2oYaNg==
X-Google-Smtp-Source: ADKCNb7m59DR2S7xB3WZCIhtgUwjIECL6TYP72jJW8ylVUkY8HrnRkcZfFrSPdHYSaknKDi+b9ir/C1SbauPL5UZTWc=
X-Received: by 10.98.8.92 with SMTP id c89mr3630947pfd.255.1504887937872; Fri,
	08 Sep 2017 09:25:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.189.8 with HTTP; Fri, 8 Sep 2017 09:25:07 -0700 (PDT)
In-Reply-To: <20170908133415.15293-1-fabien.lahoudere@collabora.co.uk>
References: <20170908133415.15293-1-fabien.lahoudere@collabora.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Sep 2017 09:25:07 -0700
Message-ID: <CAMKF1sq1KxJSqW=JNYi_zJk70JcFTv3Gp2WWGkHJcLfEz_-qxw@mail.gmail.com>
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] gerbera: Add recipe
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
X-List-Received-Date: Fri, 08 Sep 2017 16:25:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 8, 2017 at 6:34 AM, Fabien Lahoudere
<fabien.lahoudere@collabora.co.uk> wrote:
> Gerbera is a UPnP media server which allows you to stream your digital media
> through your home network and consume it on a variety of UPnP compatible devices.
>
> Gerbera is based on MediaTomb 12.1 which is dead upstream, so this is an attempt
> to kick it back into life.
>
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> ---
>  .../gerbera/files/gerbera.service                  | 13 +++++++++
>  .../recipes-multimedia/gerbera/gerbera_git.bb      | 34 ++++++++++++++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/gerbera/files/gerbera.service
>  create mode 100644 meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/gerbera/files/gerbera.service b/meta-multimedia/recipes-multimedia/gerbera/files/gerbera.service
> new file mode 100644
> index 000000000..1b5a3ad3e
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gerbera/files/gerbera.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=Start Gerbera, an UPnP media server
> +After=multi-user.target network-online.target
> +Wants=network-online.target
> +
> +[Service]
> +ExecStart=/usr/bin/gerbera
> +Environment='HOME=/root'
> +Type=simple
> +RemainAfterExit=yes
> +
> +[Install]
> +WantedBy=multi-user.target
> \ No newline at end of file
> diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb
> new file mode 100644
> index 000000000..2bbedc0d1
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb
> @@ -0,0 +1,34 @@
> +Description = "Gerbera - An UPnP media server"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"
> +
> +SRC_URI = "git://github.com/v00d00/gerbera.git;protocol=https \
> +          file://gerbera.service "
> +
> +
> +# Modify these as desired
> +PV = "1.0+git${SRCPV}"
> +SRCREV = "4435b165d121195aefd67d0287f7f9349e181d45"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "expat zlib curl libupnp e2fsprogs sqlite3 taglib "
> +RDEPENDS_${PN} = "expat zlib curl libupnp e2fsprogs taglib "

we we need all of these explicitly specified for rdeps ?

> +
> +SYSTEMD_SERVICE_${PN} = "gerbera.service"
> +SYSTEMD_AUTO_ENABLE = "enable"
> +

this is default you can delete it.

> +inherit cmake systemd
> +
> +EXTRA_OECMAKE = "-DWITH_JS=FALSE -DWITH_TAGLIB=FALSE -DWITH_MAGIC=FALSE -DWITH_EXIF=FALSE -DLIBUUID_INCLUDE_DIRS=${WORKDIR}/recipe-sysroot/usr/include -DLIBUUID_LIBRARIES=-luuid"

Here taglib is  disabled but its added in DEPENDS, it would be better
to create packageconfig for this
use -DLIBUUID_INCLUDE_DIRS=${STAGING_INCDIR}
> +
> +do_install_append() {
> +       install -d ${D}/root/.config/

this assumes the rootfs is rw, I think it will cause issues with ro images.

> +       install -d ${D}${systemd_system_unitdir}
> +        install -m 0644 ${WORKDIR}/gerbera.service ${D}${systemd_system_unitdir}/
> +}
> +
> +FILES_${PN} += " /root/.config/ \
> +                ${systemd_system_unitdir}/* \
> +"
> \ No newline at end of file
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

