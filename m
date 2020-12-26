Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.16992.1608947136725779312
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Dec 2020 17:45:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bShHcIXZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id t22so3165468pfl.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Dec 2020 17:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KWtQjrOZu7MoQPwFYeGELIuYhjRaGrIxXHCrc9q6mDQ=;
        b=bShHcIXZSBc10IIwc4JN+9S8u4Z44JtuHEuNExRCQXMAzfPll0TLdgrQpGXjd+UiI6
         Pp4gA75aNFbkqxzyAaPZv5mDpE+jAVtr/JtIFXWtpd+MH4JmNX9bw+LOPEP/tam07jtl
         1NZ9GT0/ANf2vrqysX3M9D10tPu7GPBYOOWwgS+lbEgyo2pih5nVE7WuQ62YRGyI+Azs
         QWl5jy9kbHfCgB2hDTzuEs55Y/r9SnkBFjnSW2dEcjEsGH9sYo1+RMDCVwuaSdl/2nCa
         WTitvnkQEznhf/W0r7o3opxNV8cWVHY0/b4ljlKNRE9nEu9ZwAeV2ZF77HcgKwUjqQYw
         30wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=KWtQjrOZu7MoQPwFYeGELIuYhjRaGrIxXHCrc9q6mDQ=;
        b=AGCsHSxkiMojzRCI8PusKZMuSfoNRIhKZsiyCArfgQ9ZVSbFcyW/En21lQn32fisH9
         /RqJ0wCMfLTfaWzPfOrpnaRcUKPm4GnQJ4txK/Af2UNbdqSCeHrNxgseV3dQtx9eVQfw
         9QSz5tM7O9shmqkvQu2yfmEoMUdbSfCphHYzb7w1Hf8sixvY3WwW+00JVjrECGV1J0zP
         jzR7jOcVr/cf38oDS8VgyghZACXhIBeTP/IReIghOVqAnxzBsjpfE73K36tqshREUZe6
         ARgqeVPqIHnjw7OwSrcVR5G94DdlG0cJCzoAiphDhoVK8FFZ7o2emUCn63gyq00O5Z6f
         ySuQ==
X-Gm-Message-State: AOAM533/qZfssVYAwkNUMEIoAu+0ynqDfP7IWcFfxVh3OVWT9Vg6hLhL
	zZRw8oIumze4FvDMdZg5uKkiGc6FzKoQuw==
X-Google-Smtp-Source: ABdhPJwBEdwd6SSImr3Wr2WpxWN4H+atvVskuwG2dbr5vaKFhiiaGYq/uzKIiOXQ+gbchCprpiN7mA==
X-Received: by 2002:a05:6a00:14d1:b029:19d:d135:bacf with SMTP id w17-20020a056a0014d1b029019dd135bacfmr11994661pfu.12.1608947135688;
        Fri, 25 Dec 2020 17:45:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:b0c9:252c:272f:4617? ([2601:646:9200:a0f0:b0c9:252c:272f:4617])
        by smtp.gmail.com with ESMTPSA id ck20sm6424997pjb.20.2020.12.25.17.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Dec 2020 17:45:35 -0800 (PST)
Subject: Re: [oe] [meta-oe][PATCH] linuxconsole: Add recipe for version 1.7.0
To: Fabio Berton <fabio.berton@ossystems.com.br>,
 openembedded-devel@lists.openembedded.org
References: <20201208182629.3651761-1-fabio.berton@ossystems.com.br>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <c89ffb57-c4e9-1dc0-35db-fea5f3e0142d@gmail.com>
Date: Fri, 25 Dec 2020 17:45:34 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201208182629.3651761-1-fabio.berton@ossystems.com.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 12/8/20 10:26 AM, Fabio Berton wrote:
> Add linuxconsole and inputattach-config recipes. The inputattach-config
> recipe is intend to use as machine configuration file for inputattach.
> 
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>   .../inputattach-config/inputattach-config.bb  | 12 +++
>   .../inputattach-config/inputattach.conf       |  8 ++
>   .../51-these-are-not-joysticks-rm.rules       | 83 +++++++++++++++++++
>   .../linuxconsole/60-joystick.rules            |  7 ++
>   .../linuxconsole/inputattach.service          | 11 +++
>   .../linuxconsole/linuxconsole/inputattachctl  | 16 ++++
>   .../linuxconsole/linuxconsole_1.7.0.bb        | 83 +++++++++++++++++++
>   7 files changed, 220 insertions(+)
>   create mode 100644 meta-oe/recipes-extended/inputattach-config/inputattach-config.bb
>   create mode 100644 meta-oe/recipes-extended/inputattach-config/inputattach-config/inputattach.conf
>   create mode 100644 meta-oe/recipes-extended/linuxconsole/linuxconsole/51-these-are-not-joysticks-rm.rules
>   create mode 100644 meta-oe/recipes-extended/linuxconsole/linuxconsole/60-joystick.rules
>   create mode 100644 meta-oe/recipes-extended/linuxconsole/linuxconsole/inputattach.service
>   create mode 100644 meta-oe/recipes-extended/linuxconsole/linuxconsole/inputattachctl
>   create mode 100644 meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.0.bb
> 


also add it to test packagegroup in 
meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb

> diff --git a/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb b/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb
> new file mode 100644
> index 000000000..68beec670
> --- /dev/null
> +++ b/meta-oe/recipes-extended/inputattach-config/inputattach-config.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "inputattach configuration file"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> +
> +SRC_URI = "file://inputattach.conf"
> +
> +do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
> +
> +do_install() {
> +    install -Dm 0644 ${WORKDIR}/inputattach.conf ${D}${sysconfdir}/inputattach.conf
> +}
> diff --git a/meta-oe/recipes-extended/inputattach-config/inputattach-config/inputattach.conf b/meta-oe/recipes-extended/inputattach-config/inputattach-config/inputattach.conf
> new file mode 100644
> index 000000000..86c421012
> --- /dev/null
> +++ b/meta-oe/recipes-extended/inputattach-config/inputattach-config/inputattach.conf
> @@ -0,0 +1,8 @@
> +#
> +# Configuration for inputattach
> +#
> +# Every line of this file are inputattach arguments, see 'inputattach --help'.
> +# An inputattach instance will be started for each element.
> +#
> +# --microsoft /dev/ttyS0
> +# --baud 9600 --w8001 /dev/ttyS1
> diff --git a/meta-oe/recipes-extended/linuxconsole/linuxconsole/51-these-are-not-joysticks-rm.rules b/meta-oe/recipes-extended/linuxconsole/linuxconsole/51-these-are-not-joysticks-rm.rules
> new file mode 100644
> index 000000000..3e0ab4018
> --- /dev/null
> +++ b/meta-oe/recipes-extended/linuxconsole/linuxconsole/51-these-are-not-joysticks-rm.rules
> @@ -0,0 +1,83 @@
> +# /etc/udev/rules.d/51-these-are-not-joysticks-rm.rules
> +#
> +# This file is auto-generated. For more information:
> +# https://github.com/denilsonsa/udev-joystick-blacklist
> +
> +SUBSYSTEM=="input", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c30a", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c30a", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="a0df", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="a0df", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0010", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0010", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0011", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0011", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0012", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0012", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0013", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0013", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0014", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0014", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0015", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0015", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0016", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0016", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0017", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0017", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0018", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0018", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0019", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0019", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="00d1", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="00d1", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="030e", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="030e", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="054f", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="054f", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="1410", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="1410", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="3043", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="3043", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="31b5", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="31b5", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="3997", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="3997", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="3f8b", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="3f8b", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="51f4", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="51f4", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="5589", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="5589", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="7b22", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="7b22", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="7f2d", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="7f2d", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="8090", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="8090", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="9033", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="9033", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="9066", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="9066", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="9090", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="9090", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="90c0", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="90c0", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="f012", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="f012", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="f32a", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="f32a", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="f613", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="f613", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="f624", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="09da", ATTRS{idProduct}=="f624", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b3c", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="1b3c", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="1d57", ATTRS{idProduct}=="ad03", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="1d57", ATTRS{idProduct}=="ad03", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="1e7d", ATTRS{idProduct}=="2e4a", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="1e7d", ATTRS{idProduct}=="2e4a", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="20a0", ATTRS{idProduct}=="422d", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="20a0", ATTRS{idProduct}=="422d", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="001f", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="001f", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0028", ENV{ID_INPUT_JOYSTICK}=="?*", ENV{ID_INPUT_JOYSTICK}=""
> +SUBSYSTEM=="input", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0028", KERNEL=="js[0-9]*", RUN+="/bin/rm %E{DEVNAME}", ENV{ID_INPUT_JOYSTICK}=""
> diff --git a/meta-oe/recipes-extended/linuxconsole/linuxconsole/60-joystick.rules b/meta-oe/recipes-extended/linuxconsole/linuxconsole/60-joystick.rules
> new file mode 100644
> index 000000000..24b009be2
> --- /dev/null
> +++ b/meta-oe/recipes-extended/linuxconsole/linuxconsole/60-joystick.rules
> @@ -0,0 +1,7 @@
> +# Restore any stored calibration for the device
> +ACTION=="add", KERNEL=="js*", RUN+="/usr/bin/jscal-restore %E{DEVNAME}"
> +
> +# Set PS3 controller leds to the same value bluez will choose for it.
> +# IMPORT{parent} used because $parent did not appear to be working; we
> +# don't need the devpath of the js device for this so it is OK to overwrite.
> +ACTION=="add", KERNEL=="js*", IMPORT{parent}="DEVPATH", ATTRS{name}=="Sony PLAYSTATION(R)3 Controller", RUN+="/lib/udev/js-set-enum-leds /sys/%E{DEVPATH}/device/leds/ $number"
> diff --git a/meta-oe/recipes-extended/linuxconsole/linuxconsole/inputattach.service b/meta-oe/recipes-extended/linuxconsole/linuxconsole/inputattach.service
> new file mode 100644
> index 000000000..2ec902c09
> --- /dev/null
> +++ b/meta-oe/recipes-extended/linuxconsole/linuxconsole/inputattach.service
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=Attach serial input devices to kernel input subsystem
> +After=syslog.target
> +
> +[Service]
> +Type=forking
> +ExecStart=/usr/bin/inputattachctl start
> +ExecStop=/usr/bin/inputattachctl stop
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-oe/recipes-extended/linuxconsole/linuxconsole/inputattachctl b/meta-oe/recipes-extended/linuxconsole/linuxconsole/inputattachctl
> new file mode 100644
> index 000000000..c6da4e68f
> --- /dev/null
> +++ b/meta-oe/recipes-extended/linuxconsole/linuxconsole/inputattachctl
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +
> +do_start() {
> +    grep -v '^#' /etc/inputattach.conf | while read -r line; do
> +        inputattach --daemon $line || exit 1
> +    done
> +}
> +
> +case "$1" in
> +    start)
> +        do_start
> +        ;;
> +    stop)
> +        killall -9 inputattach || true
> +        ;;
> +esac
> diff --git a/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.0.bb b/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.0.bb
> new file mode 100644
> index 000000000..c4cd1d609
> --- /dev/null
> +++ b/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.0.bb
> @@ -0,0 +1,83 @@
> +SUMMARY = "Linux Console Project"
> +DESCRIPTION = "This project maintains the Linux Console tools, which include \
> +utilities to test and configure joysticks, connect legacy devices to the kernel's \
> +input subsystem (providing support for serial mice, touchscreens etc.), and test \
> +the input event layer."
> +HOMEPAGE = "https://sourceforge.net/projects/linuxconsole"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +DEPENDS = "libsdl2"
> +DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> +
> +SRC_URI = "\
> +    ${SOURCEFORGE_MIRROR}/linuxconsole/linuxconsoletools-${PV}.tar.bz2 \
> +    file://51-these-are-not-joysticks-rm.rules \
> +    file://60-joystick.rules \
> +    file://inputattachctl \
> +    file://inputattach.service \
> +"
> +
> +SRC_URI[sha256sum] = "95d112f06393806116341d593bda002c8bc44119c1538407623268fed90d8c34"
> +
> +S = "${WORKDIR}/linuxconsoletools-${PV}"
> +
> +inherit systemd pkgconfig
> +
> +EXTRA_OEMAKE = "DESTDIR=${D} PREFIX=${prefix} -C utils"
> +EXTRA_OEMAKE += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'SYSTEMD_SUPPORT=1', '', d)}"
> +
> +SYSTEMD_PACKAGES += "inputattach"
> +SYSTEMD_SERVICE_inputattach = "inputattach.service"
> +SYSTEMD_AUTO_ENABLE_inputattach = "enable"
> +
> +do_compile() {
> +    oe_runmake
> +}
> +
> +do_install() {
> +    oe_runmake install
> +
> +    install -Dm 0644 ${WORKDIR}/51-these-are-not-joysticks-rm.rules ${D}${base_libdir}/udev/rules.d/51-these-are-not-joysticks-rm.rules
> +    install -Dm 0644 ${WORKDIR}/60-joystick.rules ${D}${base_libdir}/udev/rules.d/60-joystick.rules
> +
> +    install -Dm 0644 ${WORKDIR}/inputattach.service ${D}${systemd_system_unitdir}/inputattach.service
> +    install -Dm 0755 ${WORKDIR}/inputattachctl ${D}${bindir}/inputattachctl
> +}
> +
> +PACKAGES += "inputattach joystick"
> +
> +# We won't package any file here as we are following the same packaging schema
> +# Debian does and we are splitting it in 'inputattach' and 'joystick' packages.
> +FILES_${PN} = ""
> +
> +FILES_inputattach += "\
> +    ${bindir}/inputattach \
> +    ${bindir}/inputattachctl \
> +    ${systemd_system_unitdir}/inputattach.service \
> +"
> +
> +FILES_joystick += "\
> +    ${bindir}/evdev-joystick \
> +    ${bindir}/ffcfstress \
> +    ${bindir}/ffmvforce \
> +    ${bindir}/ffset \
> +    ${bindir}/fftest \
> +    ${bindir}/jscal \
> +    ${bindir}/jscal-restore \
> +    ${bindir}/jscal-store \
> +    ${bindir}/jstest \
> +    ${datadir}/joystick \
> +    ${base_libdir}/udev/rules.d/51-these-are-not-joysticks-rm.rules \
> +    ${base_libdir}/udev/js-set-enum-leds \
> +    ${base_libdir}/udev/rules.d/60-joystick.rules \
> +    ${base_libdir}/udev/rules.d/80-stelladaptor-joystick.rules \
> +"
> +
> +RDEPENDS_inputattach += "inputattach-config"
> +
> +RDEPENDS_joystick += "\
> +    bash \
> +    gawk \
> +"
> 
> 
> 
> 
> 
