Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.7516.1595285322706531612
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2020 15:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C3sw6OIq;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id el4so8434556qvb.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2020 15:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wo1UY4YHFJgDzQSOYyTT5JKtOe2dxmTZ5ZKpyE+RerY=;
        b=C3sw6OIq6MZTZhECGTCxEP3yXpgUGPcvrL5f1DYTBNB550nnMxbiJ9uTasIG7V3i+J
         gaR8swajZ/7SN1DrWtJAkpTgyN1uaYbnfr3Y2D5G+zUnF1ZJ7W/S39b5ZyfxCisSAS7e
         TIqoU/6BXVnmXqAwdL2XhAEXKS2bbqUp0SoWedJmBysnYxpc/F0xCtTwIz7F2e4pNEzT
         178Y65PVx1/jbdvT7SvF9kgCGy3lP96hfhW2LsTOsCdr9+gEy/cYdlRlK/Te/1z8bHwF
         j9x3OaT46QLpInEHNxJDVjqbqwP/kNC5LB8xFiUMa2KqMqb4GtbrVdBSG26YK0/bXY/m
         MiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wo1UY4YHFJgDzQSOYyTT5JKtOe2dxmTZ5ZKpyE+RerY=;
        b=H7tCsQUVCei488LB89Q/bpgeaRDKrjAj+UZ3lnbBJSXEmL5eUq231jMXE+3BayLHfY
         aPpGsQkiUNiTb77qKNF/WwbQFwdH499sgFGAcs3Eb7z0v+70wpB2IZ5u9cGiN25IR8na
         b+o9c2Ir6SZnetHtCJ7xUGKl+QrNLytXaPjkW55uptcQwsb5QXDiKW+1B3nD22MOH5XW
         pxI+VPHyESQFafLbwwBhokX1hxFLSTfL2iIXV2c69C0HgFlGeLMCYD67Czmtn9mZIHfm
         X8+InfUy1rH41bOFDMt5DhSSQJgIxoa8ZWEQ4IUXywsSZcLIevI9TszPmeVxYI2PFo1U
         iKhg==
X-Gm-Message-State: AOAM531Z3D+DIOzorv9jpfxg2cFKUm2ztPHEcezUVFjwqNxyDxPV6SAr
	c4m3TqHb1fGXhUw/WcuDIzSspnO5VILSIAVPrPE=
X-Google-Smtp-Source: ABdhPJwl8TvAfD3LOzmdM9Rz+iDHUGsSDeQs5OLLEI3m6T8Sixznr0slY9ZUvf88hPqkB6IGa0jMGpvFnbl4fJSn6Y4=
X-Received: by 2002:a05:6214:18f:: with SMTP id q15mr24386769qvr.23.1595285321735;
 Mon, 20 Jul 2020 15:48:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200720221946.33011-1-jpitti@cisco.com>
In-Reply-To: <20200720221946.33011-1-jpitti@cisco.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 20 Jul 2020 15:48:15 -0700
Message-ID: <CAMKF1squtZehqYZADc91pDLZjT6a+QYBRive=6jed7SM5THPNQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] netkit-telnetd: Fix buffer overflow in netoprintf
To: Julius Hemanth Pitti <jpitti@cisco.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	XE-Linux <xe-linux-external@cisco.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 20, 2020 at 3:27 PM Julius Hemanth Pitti <jpitti@cisco.com> wrote:
>
> netoprintf() was not handling a case where
> return value of vsnprintf is greater than
> "size"(2nd argument), results in buffer overflow
> while adjusting "nfrontp" pointer to point
> beyond "netobuf" buffer.
>
> Here is one such case where "nfrontp"
> crossed boundaries of "netobuf", and
> pointing to another global variable.
>
> (gdb) p &netobuf[8255]
> $5 = 0x55c93afe8b1f <netobuf+8255> ""
> (gdb) p nfrontp
> $6 = 0x55c93afe8c20 <terminaltype> "\377"
> (gdb) p &terminaltype
> $7 = (char **) 0x55c93afe8c20 <terminaltype>
> (gdb)
>
> This resulted in crash of telnetd service
> with segmentation fault.
>

it seems like one. Can you also reproduce it with something like fedora ?

> Signed-off-by: Julius Hemanth Pitti <jpitti@cisco.com>
> ---
>  ....c-Fix-buffer-overflow-in-netoprintf.patch | 56 +++++++++++++++++++
>  .../netkit-telnet/netkit-telnet_0.17.bb       |  1 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/0001-telnetd-utility.c-Fix-buffer-overflow-in-netoprintf.patch
>
> diff --git a/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnetd-utility.c-Fix-buffer-overflow-in-netoprintf.patch b/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnetd-utility.c-Fix-buffer-overflow-in-netoprintf.patch
> new file mode 100644
> index 000000000..8f983e40a
> --- /dev/null
> +++ b/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnetd-utility.c-Fix-buffer-overflow-in-netoprintf.patch
> @@ -0,0 +1,56 @@
> +From 9c81c8e5bc7782e8ae12c078615abc3c896059f2 Mon Sep 17 00:00:00 2001
> +From: Julius Hemanth Pitti <jpitti@cisco.com>
> +Date: Tue, 14 Jul 2020 22:34:19 -0700
> +Subject: [PATCH] telnetd/utility.c: Fix buffer overflow in netoprintf
> +
> +As per man page of vsnprintf, when formated
> +string size is greater than "size"(2nd argument),
> +then vsnprintf returns size of formated string,
> +not "size"(2nd argument).
> +
> +netoprintf() was not handling a case where
> +return value of vsnprintf is greater than
> +"size"(2nd argument), results in buffer overflow
> +while adjusting "nfrontp" pointer to point
> +beyond "netobuf" buffer.
> +
> +Here is one such case where "nfrontp"
> +crossed boundaries of "netobuf", and
> +pointing to another global variable.
> +
> +(gdb) p &netobuf[8255]
> +$5 = 0x55c93afe8b1f <netobuf+8255> ""
> +(gdb) p nfrontp
> +$6 = 0x55c93afe8c20 <terminaltype> "\377"
> +(gdb) p &terminaltype
> +$7 = (char **) 0x55c93afe8c20 <terminaltype>
> +(gdb)
> +
> +This resulted in crash of telnetd service
> +with segmentation fault.
> +
> +Though this is DoS security bug, I couldn't
> +find any CVE ID for this.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Julius Hemanth Pitti <jpitti@cisco.com>
> +---
> + telnetd/utility.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/telnetd/utility.c b/telnetd/utility.c
> +index b9a46a6..4811f14 100644
> +--- a/telnetd/utility.c
> ++++ b/telnetd/utility.c
> +@@ -66,7 +66,7 @@ netoprintf(const char *fmt, ...)
> +       len = vsnprintf(nfrontp, maxsize, fmt, ap);
> +       va_end(ap);
> +
> +-      if (len<0 || len==maxsize) {
> ++      if (len<0 || len>=maxsize) {
> +        /* didn't fit */
> +        netflush();
> +       }
> +--
> +2.19.1
> diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
> index 0e92add63..08dd532b6 100644
> --- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
> +++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
> @@ -13,6 +13,7 @@ SRC_URI = "http://ftp.linux.org.uk/pub/linux/Networking/netkit/${BP}.tar.gz \
>             file://0001-telnet-telnetd-Fix-print-format-strings.patch \
>             file://0001-telnet-telnetd-Fix-deadlock-on-cleanup.patch \
>             file://CVE-2020-10188.patch \
> +           file://0001-telnetd-utility.c-Fix-buffer-overflow-in-netoprintf.patch \
>             "
>
>  UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netkit-telnet/"
> --
> 2.19.1
>
