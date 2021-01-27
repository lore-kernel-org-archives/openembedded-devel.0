Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.11939.1611771573134271821
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 10:19:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PGpDrYoX;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id l11so1537366qvt.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Jan 2021 10:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OVgTyleQcpIr2PctztxAqgDuJO3HLFri4fRIGMamMww=;
        b=PGpDrYoX/cq7qnwR3A0oIkJ2/DhKge25erQN0QtOzHZiYXCSJMcKM2oQ1RWySroCeu
         OtphLIgUu24gciQwM3FAu9LExQcK0w9Y6giXhW/RWP2TUR7Di+KQlmnZijuL+vPCJmKc
         pqOT7jsGXcuN2E68Cf8oJ75fs8tHGG9hm8XG4xw1JaFqR1M2EuC2VeKAuAGcjm9mbr7j
         gGf6zd57bvOX8wdUcdiX+/iVurPnZ617z+rF2O89GW8n9ocTxLmzHDpJSAcUF9uuKBYj
         ueYPLHDy21UKuoGGb++OCRxYbvT0Le+xSJi3F9e76HzrTkKYzY+Cb2Vuc8tS/aWz7K/k
         Ln5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OVgTyleQcpIr2PctztxAqgDuJO3HLFri4fRIGMamMww=;
        b=AsJ32injDRJRQo+9ZwQbtyNd/ca1xd6BbMJNGGE67BkHcdZ5KppVgQ27F3bSUQAgJV
         H2FFKcYLA4uBoU/0oyEzPISF3RjZ2Cc1fkyifBS+yAd6OisTpeeixwzV7jJ28npGiW/p
         eXGItSP+5xyFy1O6tjQhGDClyeVQfnMampvW6H4CqA74dzmt2mYVL/EHFG02Hx1yMRRB
         GuOiTmtI7Zu0/ezW9c9BhNGvM4u+0nPH12zcs11xR5InyXBRyc/Cp2QNdiur+S5m2fqJ
         xIq9ZsT0a/S9Vqi5VCYQKzTTEgxvUSRJ89SBW75763dnCATgp0qY9I0vIdo9upIOIMSh
         PMEA==
X-Gm-Message-State: AOAM532RLYsKcUlE04JVmif0qySTONb7sdxQCfLXv3qJp63MQNkkGuy4
	HsXXrWfeySFwFOFeWZ5Ng/xsNLYpmKSPg0gg1g0=
X-Google-Smtp-Source: ABdhPJxRjiQlZmgOh2iEa6gN47RxMc1csLRcjBQcGqp93Yc1u7ZSRIld6LHzjojeEuAXa9CG50Odj+3ofbYYvVqVr/I=
X-Received: by 2002:a0c:c688:: with SMTP id d8mr11937334qvj.8.1611771572205;
 Wed, 27 Jan 2021 10:19:32 -0800 (PST)
MIME-Version: 1.0
References: <20210126093122.716978-1-n.jeker@gmx.net>
In-Reply-To: <20210126093122.716978-1-n.jeker@gmx.net>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 27 Jan 2021 10:19:06 -0800
Message-ID: <CAMKF1soWp0Voqn3vTZQmnvhLGz=Bmeh+3_xcQDxcCFm9kvNjgQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] networkmanager: Add PACKAGECONFIG for ovs
To: Nicolas Jeker <n.jeker@gmx.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

it seems that network-manager-applet needs jannson, see this failure

https://errors.yoctoproject.org/Errors/Details/541973/

On Tue, Jan 26, 2021 at 1:31 AM Nicolas Jeker <n.jeker@gmx.net> wrote:
>
> Open vSwitch support is enabled by default in NetworkManager, but only
> useful in the context of several virtualisation environments, e.g. Xen,
> KVM, OpenStack and more. Therefore, the ovs PACKAGECONFIG is now disabled by
> default.
>
> The jansson dependency is only required for Open vSwitch and teamsdctl
> support in NetworkManager. As there is no libteamsdctl recipe around
> (and no teamsdctl PACKAGECONFIG), make it dependent on the ovs
> PACKAGECONFIG.
>
> Signed-off-by: Nicolas Jeker <n.jeker@gmx.net>
> ---
>  .../networkmanager/networkmanager_1.28.0.bb                     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb
> index 3e7a068ac..646ebea49 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb
> @@ -15,7 +15,6 @@ DEPENDS = " \
>      util-linux \
>      libndp \
>      libnewt \
> -    jansson \
>      curl \
>  "
>
> @@ -85,6 +84,7 @@ PACKAGECONFIG[wifi] = "--with-wext=yes --enable-wifi=yes,--with-wext=no --enable
>  PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
>  PACKAGECONFIG[qt4-x11-free] = "--enable-qt,--disable-qt,qt4-x11-free"
>  PACKAGECONFIG[cloud-setup] = "--with-nm-cloud-setup=yes,--with-nm-cloud-setup=no"
> +PACKAGECONFIG[ovs] = "--enable-ovs,--disable-ovs,jansson"
>
>  PACKAGES =+ " \
>    ${PN}-nmcli ${PN}-nmcli-doc \
> --
> 2.30.0
>
>
> 
>
