Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web08.1623.1615231368992354065
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 11:22:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MExhThmb;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id c16so5364488ply.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Mar 2021 11:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WhGl0urCSDXIW8hFOkS4u16hLDtuSJsA/i+yCUZ9vR0=;
        b=MExhThmbKsMFzgaLBNtGUjCQ2v1Dk+XQkd58yg7nfYr+emVl0NZitIoIQJZWI4ggVK
         MrJFB1WXouNSuvWh/rgSzdJYgg1nK9mj+IbfPj0GOLSXJQ20wmUqaaF9LrlvzcsY7viI
         ozLzAnLaTESfBDmAu+0TISx1yfvKHCWuWO85ak71Srm9uDIy9qsal4obgRwW3xkLp2x/
         0xu1qlawL5fXU85FH6+uKGeoFQBOXCJO3gzFLnTLCOPm+/PYbY6B54nIAyBgLVGFFxuo
         ec3aQ3b+4HFepoZGJ9iwm9DmKn3rknEq610cRkSbSnnJQb9YGcycn6ymEeLwOZ2tnouD
         +7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WhGl0urCSDXIW8hFOkS4u16hLDtuSJsA/i+yCUZ9vR0=;
        b=BFkCOGuwrz6ZzE4xgaWIKvtg0fODPzJHdQE1ygRweKGdg3ZMoA5nDWPAHJ2IOU+A41
         vUgNhTscKAN4AgLgr8mxIe3C36JoskVSpWC3GSlEujmPDzKSq0//lBI8XBTS7NK7WqWL
         sgfXele54xjKL3wvLSOsS9zqLWGyKpCaTh6VVoi3eVpeBoD/qzMYckvRj0yit9RFQBwO
         9+PyyrlttRAyL5G9Gm++XxmGfbZnz/XUmnxl6MfDctMerIj4pYGFR0thUfmwkhqXbQgv
         HFbMOz1OhijoX80vBFm6N50QqRnhIm4cs6+DXpAEY3gNYuoJQZVrnrxt4RA34x2ktBbQ
         GOtg==
X-Gm-Message-State: AOAM5303CdcOZ4V0rqBMMeqFA5oCYnxiFexGGocpAqwnR+FlWcicGN2y
	gmBMt7jw/6DBTn/+3GSa1aHnuW4qTVMuS2MF+e+LfZdw
X-Google-Smtp-Source: ABdhPJz+7+nWnOHD8QWDScC+bQYR8/o1FkmrUEVj7LQ0SfVq51o9KjXzxlno8hlW33gi18S8FNqRk4NQIPVCnEh7mgg=
X-Received: by 2002:a17:90a:a414:: with SMTP id y20mr402066pjp.77.1615231368301;
 Mon, 08 Mar 2021 11:22:48 -0800 (PST)
MIME-Version: 1.0
References: <20210308135318.1651724-1-dwagenknecht@emlix.com>
In-Reply-To: <20210308135318.1651724-1-dwagenknecht@emlix.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Mon, 8 Mar 2021 20:22:36 +0100
Message-ID: <CALbNGRS=1CtvfApuUURtrt1CEiGjW9GD+1P0qey+cwtEGh2p0w@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gnome-keyring: set file capabilities in pkg_postinst
To: Daniel Wagenknecht <dwagenknecht@emlix.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 8, 2021 at 2:55 PM Daniel Wagenknecht
<dwagenknecht@emlix.com> wrote:
>
> file capabilities need to be set on gnome-keyring-daemon. This is now
> possible using pkg_postinst function on the build host. Previous
> workarounds are not needed anymore.
>
> Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
> ---
>  .../recipes-gnome/gnome-keyring/gnome-keyring_3.34.0.bb   | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.34.0.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.34.0.bb
> index 52c254b28..be6d922bc 100644
> --- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.34.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.34.0.bb
> @@ -43,9 +43,7 @@ FILES_${PN} += " \
>      ${libdir}/pkcs11/gnome-keyring-pkcs11.so \
>  "
>
> -# fix | gnome-keyring-daemon: insufficient process capabilities, unsecure memory might get used
^ Please leave this part of the comment - it is still valid and
explaining why setcap is necessary
> -# This does not make it through pseudo so perform on-target - sigh
> -pkg_postinst_ontarget_${PN} () {
> -    setcap cap_ipc_lock+ep `which gnome-keyring-daemon`
> +pkg_postinst_${PN} () {
> +    setcap cap_ipc_lock+ep $D/${bindir}/gnome-keyring-daemon
>  }
> -RDEPENDS_${PN} += "libcap-bin"
> +PACKAGE_WRITE_DEPS += "libcap-native"
> --
Cheers

Andreas
