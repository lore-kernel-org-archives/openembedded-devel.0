Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id C7DA47D19E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 14:23:08 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n9so8321504pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 07:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=fjNkmHez8E6P4quPO2BzSdFOYfiIiJWxQUNIHMr2HsE=;
	b=C/+m59yoTQB4mT8RHMPXKCUwGUG/+xuv34x1hPkG/209pAWhoA8G/ZqgcTPfWNlDa8
	wwzeI+KBG8TycqzsrTiPxESVH+gA2AAof9cdkiEHriCaPinJ0wznsj0EQyjxiKk5x20D
	+wziSsOEdqmuGCQiZ98kcu/Si+7CT7ffjVhPsmGjdKL+9Hztr4v5EpJkHAaYEY1iVN5t
	wQoClnxFyHWJaL0OyMECS9CQB7qX2hWdG2/0VOQb4qfLPK0u9nIqhv4/sufX1V+eJZT7
	g0JhgEtc3rZbm8XEnpEkK9x3lEnAs6IE97Dx2Q7qxWeQdGGlv5QvuOH/aZ0PwHZh/s3X
	mm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=fjNkmHez8E6P4quPO2BzSdFOYfiIiJWxQUNIHMr2HsE=;
	b=lLskQHEOuS5XTkDQtIGvwtWbGL9VcYRfyKDF4xR7wv0M/epU65ZnCtaZtRRmPto8/7
	c0HvW7RWrQ1YtC1x8WlCIUAnZXvTkusZRr2N6BJLnbz1DH3085AtLRO3jZ2FOKkRlvdr
	XMaDDed99WUcQV/9xxvFCxNkTakBCFzFGZOVRrMFfv5nM8HpKIOB9r9h5IzpnQOJ5C+k
	2ogGci2jcSnBAtXEBtVKhyzgvm7RxUF36rbHfUBkAZjjgEOBpZDwJC/Bt1mD9uWw/v2D
	ufIo3LcajvTrjfhXoByrAj/dcXc46q6GVLb9yu/bJY5TOzsanwNsB+ZtGjMLFgOKBr0r
	bsKQ==
X-Gm-Message-State: APjAAAWsvQQsNbQFuczFYdJsiRuBqV5+g7UK5KHUGEEIU5SGJQULujsF
	Ehl3+NGzlc1PpdrsMbby1efRcenzXg4=
X-Google-Smtp-Source: APXvYqzruZen4qQURaEgJoaSrMXPIhEw9fBQ2Di4fijjwEOfoHlCDjAijmvn2go5jQevbCk8PnFAVw==
X-Received: by 2002:a17:90a:898e:: with SMTP id
	v14mr58113718pjn.119.1563546189109; 
	Fri, 19 Jul 2019 07:23:09 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::be55? ([2601:646:8500:6bc6::be55])
	by smtp.gmail.com with ESMTPSA id
	u1sm29920483pgi.28.2019.07.19.07.23.08
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Jul 2019 07:23:08 -0700 (PDT)
To: "Chan, Aaron Chun Yew" <aaron.chun.yew.chan@intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1563505477-77594-1-git-send-email-aaron.chun.yew.chan@intel.com>
	<AA9B40170ABA1047B45E714CB2B866B706BBFD0D@PGSMSX103.gar.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
Message-ID: <107f5a10-e1d0-c7e1-dc8f-fe44ef79d326@gmail.com>
Date: Fri, 19 Jul 2019 07:23:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <AA9B40170ABA1047B45E714CB2B866B706BBFD0D@PGSMSX103.gar.corp.intel.com>
Subject: Re: [meta-python][PATCH] python3-pyatspi: Add Dbus ATSPI recipe
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
X-List-Received-Date: Fri, 19 Jul 2019 14:23:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/18/19 8:27 PM, Chan, Aaron Chun Yew wrote:
> From: Aaron Chan <aaron.chun.yew.chan@intel.com>
>
> pyatspi provide python3 support for Assistive Technology Service Provider Interface (AT-SPI2) protocol over Dbus.
>
> This is useful not only for Accessibility (a11y) but also provides a medium for automation of GUI testing (such as with python3-dogtail)
>
> Signed-off-by: Aaron Chan <aaron.chun.yew.chan@intel.com>
> ---
>   .../recipes-devtools/python/python3-pyatspi_2.32.1.bb   | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb b/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
> new file mode 100644
> index 0000000..5899744
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "Python bindings for DBus AT-SPI2 accessibility"
> +DESCRIPTION = "AT-SPI2 is a protocol over DBus, toolkit widgets use to
> +provide \ content to screen readers such as Orca"

it seems that newline and escape are misplaced. Can you fix and send a v2

> +SECTION = "devel/python"
> +HOMEPAGE = "https://www.freedesktop.org/wiki/Accessibility/AT-SPI2/"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886 \
> +                    file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
> +DEPENDS = "python3-dbus-native glib-2.0 dbus-glib libxml2 atk gtk+ python3-pygobject"
> +
> +SRC_URI = "git://github.com/GNOME/pyatspi2.git;protocol=https;branch=gnome-3-32"
> +SRCREV = "dc4565208fca00da06b972915a080ad3c63f640d"
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig autotools python3native
> +
> +FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/pyatspi/*"
> --
> 2.7.4
>

