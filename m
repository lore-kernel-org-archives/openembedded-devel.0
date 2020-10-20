Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.20.1603212852697669028
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2020 09:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b0dOihTH;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id 10so1516899pfp.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2020 09:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kwu9Vx1NkvN4Lg9C6jTBfuWm8dAdvbr0fv2E5S/Ux1E=;
        b=b0dOihTHyWbMkZrNZLPSMkg8nZQM1un1MmwAyCzm0fWi0xml4y4KYfro8VU2XjOrUu
         uE0SxPzudxLYV7l/LqfvYi0uVfY4DKnKxS1l2JYdvURiOB6SCQQNcOU3eAvD23jatJGt
         bty3rElFKVDltlGohuovNCrKN14zgQqyNv3dN/QtNb5U4Eu0qb6L+PeQIkBXFZXcY6dx
         1mTr67nP3mfjdCxG/76HQagUrgoGCGu6eSwA4ROFMFcGbOaj2PUB8+0Oi624g78g9fQs
         KBayjPhWbRS7bAbSnABk2/clFT+YVQ9Hw0jDedarjQl2PMQ8QhtuJl46xjhlu7RDnHyY
         BzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=kwu9Vx1NkvN4Lg9C6jTBfuWm8dAdvbr0fv2E5S/Ux1E=;
        b=cjFag9Qk1XGVpvYH+qrf11MY3gyUpjJgEkPhRLmmHFIFWKb58MCw2eIgUZF+O43A+2
         tY91cKbQN8zFrsLHnatNn7pNwZ/Vb/XDKbBWLfMSgdpr61bfPzZQt6/U/czsYsCKajpP
         sDwISkb9ecX6dZU/5nHcU/qYiqVGrJGBhI0yEhzurwlG2i0UQvWM6a4h8vEkYJaQOLnX
         0gj7dj8ya/OIwBiOYUfU4wd/0SNtOWrE8FeQwxCSjYgkdaHYE0KZZord7XGLiRytv83F
         PfxDiOdXifsGj31DIP7xsuhz8q678EHoY6tDassbKbZDvyd+/2363qtRYKVlmPmGQwpk
         UQAQ==
X-Gm-Message-State: AOAM532CkHXv+AB+fH+04F7CCFdmPDrU9qWiMxWykqr5KL/mvWRGcBZU
	oYS+pLbmwiQzvBoOzEKdWu15dqO1xx401w==
X-Google-Smtp-Source: ABdhPJx7FpmhkCeHsyS3Ylto6mGmzDIuMaxEZZ00PobgOSBIPdlE/O6/BWysCdfoDUW+xyDoGoAI7Q==
X-Received: by 2002:a63:7347:: with SMTP id d7mr3567181pgn.63.1603212851679;
        Tue, 20 Oct 2020 09:54:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:f406:23bf:ebb1:a1e8? ([2601:646:9200:4e0:f406:23bf:ebb1:a1e8])
        by smtp.gmail.com with ESMTPSA id w143sm2841245pfc.31.2020.10.20.09.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2020 09:54:11 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH] usb-modeswitch, usb-modeswitch-data: fix usrmerge
To: Ulrich ?lmann <u.oelmann@pengutronix.de>,
 openembedded-devel@lists.openembedded.org
References: <20201020091053.27879-1-u.oelmann@pengutronix.de>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <c08fc5cb-900f-3ec1-58d0-c6f2a61e2b47@gmail.com>
Date: Tue, 20 Oct 2020 09:54:10 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201020091053.27879-1-u.oelmann@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 10/20/20 2:10 AM, Ulrich ?lmann wrote:
> Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
> ---
>   .../usb-modeswitch/usb-modeswitch-data_20191128.bb            | 4 ++--
>   .../recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb    | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
> index 938c0f9c26bd..ca970e59bb3a 100644
> --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
> +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
> @@ -11,9 +11,9 @@ SRC_URI[md5sum] = "e8fce7eb949cbe16c61fb71bade4cc17"
>   SRC_URI[sha256sum] = "3f039b60791c21c7cb15c7986cac89650f076dc274798fa242231b910785eaf9"
>   
>   do_install() {
> -    oe_runmake install DESTDIR=${D}
> +    oe_runmake install DESTDIR=${D} RULESDIR=${D}/${nonarch_base_libdir}/udev/rules.d
>   }
>   
>   RDEPENDS_${PN} = "usb-modeswitch (>= 2.4.0)"
> -FILES_${PN} += "${base_libdir}/udev/rules.d/ \
> +FILES_${PN} += "${nonarch_base_libdir}/udev/rules.d/ \
>                   ${datadir}/usb_modeswitch"
> diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
> index baad340908ac..0143a258b01a 100644
> --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
> +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
> @@ -12,7 +12,7 @@ inherit pkgconfig systemd
>   
>   SYSTEMD_SERVICE_${PN} = "usb_modeswitch@.service"
>   
> -EXTRA_OEMAKE = "TCL=${bindir}/tclsh"
> +EXTRA_OEMAKE = "TCL=${bindir}/tclsh UDEVDIR=${D}/${nonarch_base_libdir}/udev"

Can we use STAGING_DIR_TARGET instead of D here

>   
>   FILES_${PN} = "${bindir} ${sysconfdir} ${nonarch_base_libdir}/udev/usb_modeswitch ${sbindir} ${localstatedir}/lib/usb_modeswitch"
>   RDEPENDS_${PN} = "tcl"
> 
> 
> 
> 
> 
