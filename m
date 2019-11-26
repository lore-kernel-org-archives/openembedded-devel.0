Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 580547FACA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 22:38:17 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id p14so17715341qkm.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 14:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eoIBHSYNsS7ofnRSB98CvlDvOL3nvg50ZBbn9Ho0c1M=;
	b=uErc+KvxP6EcVVHGjAeAC5LsWCONfUaYQ35MIWmV0jd4B+tbepU1D4mDurV85Fww5s
	nomUPpHyJFwhYdvYjLuSDuRINH6EXOoosE7dj6EYPwnTj1/+Eql0IvPRXgOV7HYtec9n
	mSsKZ2/MiR+594twwegh2V8pEVGI2QDa/OEgEqo5M/LuaTwRq8XKEg+dpstOPyDOztI7
	9bF52+sLLyxpRKUSkdSx+s7+R3t856hTr12HJrSuL5qh6Ny36FxKBWToVXoOgtJomebR
	MBHlBmUTI4ilRlzjYY5FvHViK3eTCUFRrGQTtVNiP+piovrdvRLmxe7eWbWRQMaaz+dN
	CgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eoIBHSYNsS7ofnRSB98CvlDvOL3nvg50ZBbn9Ho0c1M=;
	b=VXqYly/CNDAqIVZtzf1sK3uyAilouIJYG8FuOvgtk5kjtAUBpM0P9+IQ+AiEOEs8a8
	t4/MWJhBZKhx/K3q4TCilDSWXC+JYYyj9IFNpxp1Evi+PZ4UjsxgWISll/xTyGzU+yl1
	UBg9uUZIOxujkwZffK3bau+D1Xt8xTKx312GV3W2rDjFCM46uSbalx/SsbligPc3rqsz
	C5vGMKN7YqyDmn/zjYJ78NyM6H5BP2xlSdGmb5cXgDZhIJSQG+4zQGpnJCU7veLcTKVe
	DDqFm7OeVIkEDYg20C+LZY6RZVbEbKwKq3lk5lVzO0avkDoMSTfAgoBNnyQTGYLFmzJo
	u2lQ==
X-Gm-Message-State: APjAAAVIYtd4QbqBHosUbDh//MmF61yDEjS7ClWCMxOOSCfF+a6APqma
	cN+4Ztr4Np+BtLKpAYKKg1Y4RFe8FMbl9cAtXH0Se+LW
X-Google-Smtp-Source: APXvYqx5Uy1bk0Gkedj4OgHfdnZDokoFkrhNXjB0ka/kNrVuZt7qknOWdyB4aq49LVqGdN1LK5ybWIi+Gn/8McxyYeA=
X-Received: by 2002:ae9:ef50:: with SMTP id d77mr911191qkg.71.1574807897657;
	Tue, 26 Nov 2019 14:38:17 -0800 (PST)
MIME-Version: 1.0
References: <20191126210332.15738-1-ross.burton@intel.com>
In-Reply-To: <20191126210332.15738-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Nov 2019 14:37:51 -0800
Message-ID: <CAMKF1spPt_2fHiKSFS217dKARgsuFgr6QoKbX4mo=d-it02GVg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] jack: upgrade to 1.19.14
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
X-List-Received-Date: Tue, 26 Nov 2019 22:38:17 -0000
Content-Type: text/plain; charset="UTF-8"

thanks this is better than what I had staged, I will take this one.

On Tue, Nov 26, 2019 at 1:03 PM Ross Burton <ross.burton@intel.com> wrote:
>
> Notable because it uses Python 3 for the Waf scripts.
>
> Delete jack_control if DBus isn't enabled, as this tool uses DBus to communicate
> with the server and shouldn't be installed.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../jack/{jack_git.bb => jack_1.19.14.bb}            | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-multimedia/jack/{jack_git.bb => jack_1.19.14.bb} (87%)
>
> diff --git a/meta-oe/recipes-multimedia/jack/jack_git.bb b/meta-oe/recipes-multimedia/jack/jack_1.19.14.bb
> similarity index 87%
> rename from meta-oe/recipes-multimedia/jack/jack_git.bb
> rename to meta-oe/recipes-multimedia/jack/jack_1.19.14.bb
> index 9f7d5b0b61..cebc952661 100644
> --- a/meta-oe/recipes-multimedia/jack/jack_git.bb
> +++ b/meta-oe/recipes-multimedia/jack/jack_1.19.14.bb
> @@ -15,8 +15,8 @@ LIC_FILES_CHKSUM = " \
>  DEPENDS = "libsamplerate0 libsndfile1 readline"
>
>  SRC_URI = "git://github.com/jackaudio/jack2.git"
> -SRCREV = "37250ff470277f9947fbf3ba738f943053e30525"
> -PV = "1.9.13"
> +SRCREV = "b54a09bf7ef760d81fdb8544ad10e45575394624"
> +
>  S = "${WORKDIR}/git"
>
>  inherit waf pkgconfig
> @@ -30,6 +30,12 @@ PACKAGECONFIG[opus] = "--opus=yes,--opus=no,libopus"
>  # portaudio is for windows builds only
>  EXTRA_OECONF = "--portaudio=no"
>
> +do_install_append() {
> +       if ! ${@bb.utils.contains('PACKAGECONFIG', 'dbus', True, False, d)}; then
> +               rm -f ${D}${bindir}/jack_control
> +       fi
> +}
> +
>  PACKAGES =+ "libjack jack-server jack-utils"
>
>  RDEPENDS_jack-dev_remove = "${PN} (= ${EXTENDPKGV})"
> @@ -42,4 +48,4 @@ FILES_jack-server = " \
>  "
>  FILES_jack-utils = "${bindir}/*"
>
> -FILES_${PN}-doc += " ${datadir}/jack-audio-connection-kit/reference/html/* "
> +FILES_${PN}-doc += " ${datadir}/jack-audio-connection-kit/reference/html/*"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

