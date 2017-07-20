Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6E94178317
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 21:24:43 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id t8so3692203pgs.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 14:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=5Z1kkPHAHzJBPDVrrhbIegSdVerd/U/dChk7KXs1Ymw=;
	b=nZo5iHas/faNl0qhPM9UcuOdi7j6Cg4kMnRpPTB5jRnDXKVoOx67JJQgE6DIYm+nLt
	O8TJKo8bgahDWJLjynfPT1uzaf/Fz0Mu9E8WPKSchZO5H19tUbzT8ri9PC/7LZ4xyJdA
	PfbUxsS9wDiUd3uuP43i5xV6aplLNjD9TryEssvFp9Oy9Fep6m8ATAOFPB2tuGzScH7b
	C5thl0NSbMVTB0G89GPX9JHzKfU0SF9ntDhYQMzf/YekhX8wiFdOC19yyIxHUlfUZrwx
	DK5o4BiVMjQ1R1HddKrmVtmb/9CrB0BtYc3WxREpTpCOzN6++PVffnEexZZDVXlrSlX3
	5Rdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=5Z1kkPHAHzJBPDVrrhbIegSdVerd/U/dChk7KXs1Ymw=;
	b=I3AL2gD3IXu9/AFItP6G9rRC2ClcSp5zngacHzWJQdXmu77HVILMUgcE89PGRzOuBm
	BA+13Sm8CP8PI1EKZrD6tQT7aCPyNWjkxI+oxQMORH6YdzgHYsHy6fz8oya3TfUNeEsL
	ULVl0okCTibEAmUXRbogCQhX0/Goi05cK6KY7i2uM1lXgYH6Un/TcqlBsZFR72HZHHUf
	UPbi88Urg7Ym0/Ufxer20kNlUsyApLCYxBFMuMK8X80wGAm8uZosxGC/12Rq/SRUkmxN
	LR8Fx4giWN5IaHSzCNv1zv6omhHlCyWVSB86/w2YXke8EAEGPm5pn5TSsxrj0u6Tui2R
	qiuA==
X-Gm-Message-State: AIVw113YODhWYgGOID03LWgFhhe7ED9FwB+GRDWpobDAJVSewaPAK6OW
	h+PMmeUfYtwLcQ==
X-Received: by 10.98.28.71 with SMTP id c68mr5271519pfc.116.1500585884597;
	Thu, 20 Jul 2017 14:24:44 -0700 (PDT)
Received: from [10.43.100.234] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156])
	by smtp.gmail.com with ESMTPSA id l9sm5786496pfg.92.2017.07.20.14.24.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jul 2017 14:24:43 -0700 (PDT)
To: Jason Liu <jason.liu@gumstix.com>,
	openembedded-devel@lists.openembedded.org
References: <1500579093-29708-1-git-send-email-jason.liu@gumstix.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <6930f0a2-4d9e-a862-5184-e532435fc800@gmail.com>
Date: Thu, 20 Jul 2017 14:24:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1500579093-29708-1-git-send-email-jason.liu@gumstix.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][morty][PATCH] libvdpau: Add recipe
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
X-List-Received-Date: Thu, 20 Jul 2017 21:24:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 07/20/2017 12:31 PM, Jason Liu wrote:
> From: Koen Kooi <koen@dominion.thruhere.net>
>
> Needed for x86 machines
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Sorry, I am not going to a new package to a stable branch.

- armin
> ---
>   meta-oe/recipes-graphics/vdpau/libvdpau_git.bb | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
>   create mode 100644 meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
>
> diff --git a/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb b/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
> new file mode 100644
> index 0000000..31f4df4
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "Video Decode and Presentation API for UNIX"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=83af8811a28727a13f04132cc33b7f58"
> +
> +DEPENDS = "virtual/libx11 libxext dri2proto"
> +
> +PV = "1.1.1+git${SRCPV}"
> +
> +SRCREV = "a21bf7aa438f5dd40d0a300a3167aa3d6f26dccc"
> +SRC_URI = "git://anongit.freedesktop.org/vdpau/libvdpau"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +do_install_append() {
> +    rm -f ${D}${libdir}/*/*.la
> +}
> +
> +FILES_${PN}-dbg += "${libdir}/vdpau/.debug"
> +FILES_${PN}-dev += "${libdir}/vdpau/lib*${SOLIBSDEV}"
> +FILES_${PN} += "${libdir}/vdpau/lib*${SOLIBS}"


