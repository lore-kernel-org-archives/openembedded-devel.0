Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.11193.1594606075248495132
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 19:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OBArX2XZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id el4so5131759qvb.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2020 19:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6axLj8UUnockDOJc7Vdgf+Gk6kD4IB7rG4O0UWa8AKY=;
        b=OBArX2XZ2GsqH+qT6dhtP4I4e7vhtmHRGK1R961jlUFV9/Fd9qpRGlEFS6q+nXKwu0
         z88uDqYuBmoKuhtqWkn58PrH4cw+EY8teD2/50PAAbU2H3wzDUzvpzRzrhTNQY6r6lpb
         zI4StZ/EAqj0XdnkfTMe5WUSTqlfXFeA9O6eogMQetKCGHCBB5Jv7yQI6v8hlk431fnF
         IckAdYCdNZWkXjvkoI8nFxia28QwdRAa2WHkUNS9DLMN+0nMsc2pf3cPx9wcbgrXpUaD
         /cAWzqu/ShqLjoIPtnTuWhLh4r47aOHMurxSD/DrITtEYKAkUM+ZTYB197euqVl4/lOz
         RPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6axLj8UUnockDOJc7Vdgf+Gk6kD4IB7rG4O0UWa8AKY=;
        b=D7lm52GDXoTKGpZ9ne+IXWzE7DeQOIEv+4JXx/+0QmljnY2lWv0N7LdwQQpZt76LNW
         YXnsIn51G+tg0BGHMFI8P15iCBZgxeWfoJ/UqYIrDaj1I0+Rp+O8dFv8PXoL8LGLeicW
         GhpbLc073fpivZtjdZJu5p4aGPteJapOiSnbUwD9piJ7PiWDfyQZPSCVjaCO2+ql66/D
         YEMOg2e/6tX+ebT6n2fIOpSGwh2ZowtZOigaOzBpKm+l0GX01is8WY43cgwJ+2xdE0m6
         MuqJjRaC1UzA/T9nnQo2kRKfjzNSe/NAmrlF6NIPzz8/ujHy0EXr+onpypIyhgrjnh7Q
         c+kA==
X-Gm-Message-State: AOAM530F2/T4HfXmtlft9lrJXbghqS2+Be4ZYXhieiBUqKzc4/mRG6eT
	0n7XLJiIttT1QnNfdOe/zq46zYeXm0QuMP+jxKL+m5ep
X-Google-Smtp-Source: ABdhPJw9b+OlDzvO460kWKB6k4t+gLctTjQWIzrv1cw264MLeDUDHDtaQhofNXKs6d0gJ9hCA+RndHg57wtAD2DX6QY=
X-Received: by 2002:a0c:e80c:: with SMTP id y12mr3339869qvn.146.1594606074306;
 Sun, 12 Jul 2020 19:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <16205920B40F3B3B.7755@lists.openembedded.org> <0f9d5288-1d7f-547c-8641-c205ff45a203@windriver.com>
In-Reply-To: <0f9d5288-1d7f-547c-8641-c205ff45a203@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 12 Jul 2020 19:07:28 -0700
Message-ID: <CAMKF1sqhAzjyqtg9_MdQ7EeWkucDNJO+L7Vq2=dN9o8wwyH5pQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] rsyslog: get alias of syslog back
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

thanks, yes I have seen it break world builds I have removed it

On Sun, Jul 12, 2020 at 6:11 PM Changqing Li <changqing.li@windriver.com> wrote:
>
> Hi, Khem
>
> I noticed this patch is on next branch,  but this patch have problem with sysV,
>
> I need to send a V2 later.  Please help to revert it.  Thanks and sorry for troubling you.
>
> On 7/10/20 5:07 PM, Changqing Li wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> since upstream rsyslog commit
> https://github.com/rsyslog/rsyslog/pull/4317/commits/7a671da74f78047b3fd0eb65203f045de28cec0f
> , Alias=syslog.service is removed from service file, which will make
> systemctl restart syslog fail since Unit syslog.service not found when
> we set rsyslog to default syslog.
>
> And upstream have change the solution about pull 4317, so during next
> upgrade, we need to add our own rsyslog.service, refer
> https://github.com/rgerhards/rsyslog/commit/83d5710f074b34263322cd53fa1112aafd25b985
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
> index ff6699509..263a86e5c 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
> @@ -152,6 +152,9 @@ do_install_append() {
>          install -d 0755 ${D}${sysconfdir}/rsyslog.d
>          echo '$ModLoad mmjsonparse' >> ${D}${sysconfdir}/rsyslog.d/mmjsonparse.conf
>      fi
> +
> +    sed -i -e "s#;Requires=syslog.socket#Requires=syslog.socket#g" ${D}${systemd_system_unitdir}/rsyslog.service
> +    sed -i -e "s#;Alias=syslog.service#Alias=syslog.service#g" ${D}${systemd_system_unitdir}/rsyslog.service
>  }
>
>  FILES_${PN} += "${bindir}"
>
>
> 
