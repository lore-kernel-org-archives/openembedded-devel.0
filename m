Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D5AC433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 16:30:46 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web12.8384.1665419439289382330
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=P5eRcThR;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.45,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f45.google.com with SMTP id g27so16623802edf.11
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RSccP0m1gcl5chgQIRnikpLqgArFAvY2jEWgyASpvaE=;
        b=P5eRcThRn6+AjA0HSABN3Mk4nuxvyOOumIqMtS9zbZi8JRSMXH1y+DU0Wu3cTv6ejB
         T8YYicLXQotk8B2IjF37XHkRbwRdK83u9800u5BENbdf3Se/OddlIvef9eEPc+T/AQYI
         aY+w0NWX8hGA1/Q8DEUkAVRpWc4K3Lb2rhn0Bs6VaPs/Il9PAeeP/EZtZJmV5Tcanmze
         kuX4lb6ThNyBFZMHbU0jAJNna1XDxM57tC5xvvFNBVG/bT99Nxl+BKR9CYAuNkq/fjf8
         FRvRVwi16qaGf5hIT9i/g1rz7SM8Psv01wS+OhYfR0WRvpm1CLAUuenyiMfHbinz3Nad
         sZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RSccP0m1gcl5chgQIRnikpLqgArFAvY2jEWgyASpvaE=;
        b=r9Spxe43gu9SPWVff/0D5K3BSYtUw3KILdHBKwqlMYANAo7ApUbwXdAMMyBEfR7KI+
         Q+fbisfBHa7uXSnrfIp0pxIrH327tW3TmhOTv57NQJgZhcgjReKsqdGQwlk6ebmYBCeo
         Tpz91RXt8IgAGOmWAEFXnCB4DzOy+X+beW7bN+KIaFlDBh9pBT/XyBF5ENw6QguB40Hc
         Ph87ulEHKdF6GgvLaO8JuSQ0CmaiOEOkQfe6qacrLMLfp+FzMkPJa1U7rOZYrOo/G7CD
         XjgFGOJ7P6QCguPnkpSy6E5yzScaZUtk+ZbJWgOd+yrJMqwWMpjHkvEmI0RounvUirgD
         FRZw==
X-Gm-Message-State: ACrzQf2BI6sz1xFC9cXIOao9h+2osjLE2K2k8XwCAb1T0Rp3V1bY1B3q
	sYLhsSP5QnlS4AB1Ez4TmPtvUsxXoYKsb8M11cHr2v9/f76g2cDo
X-Google-Smtp-Source: 
 AMsMyM6XcKQj1R3mVfH94kXj10PTII0ZfCoNWQH+giDI/nvbwin6yNqwfRSL+oDYcXkl84xl7i7T6YFcvBXF/5oMn8M=
X-Received: by 2002:a05:6402:2554:b0:459:b3e9:a6b1 with SMTP id
 l20-20020a056402255400b00459b3e9a6b1mr18739867edb.124.1665419437640; Mon, 10
 Oct 2022 09:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221009155421.278430-1-vkumbhar@mvista.com>
In-Reply-To: <20221009155421.278430-1-vkumbhar@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 10 Oct 2022 06:30:26 -1000
Message-ID: 
 <CAOSpxdapKxaW=FHxBhS0-OVOtWc-+ng_vi7v+P2mpNT9F=F6Zg@mail.gmail.com>
Subject: Re: [oe] [OE-core][dunfell][PATCH] CVE-2022-39177 bluez: BlueZ allows
 physically proximate attackers to cause a denial of service because malformed
 and invalid capabilities can be processed in profiles/audio/avdtp.c
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Oct 2022 16:30:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99133

You sent this to the wrong list!  You should resend to
openembedded-core@lists.openembedded.org

A more standard subject/shortlog would be something like:
[OE-core][dunfell][PATCH] bluez: fix CVE-2022-39177

You can give a detailed description in the commit message, so you just
need the top level info in the subject line. And it should always
start with the package/recipe name.

Thanks!

Steve

On Sun, Oct 9, 2022 at 12:06 PM vkumbhar <vkumbhar@mvista.com> wrote:
>
> Source: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=e2b0f0d8d63e1223bb714a9efb37e2257818268b
> MR: 122138
> Type: Security Fix
> Disposition: Backport from https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=e2b0f0d8d63e1223bb714a9efb37e2257818268b
> ChangeID: 680cf2af29d34d7925523e413b40008a71b0a26c
> Description:
>     avrcp: Fix not checking if params_len match number of received bytes
>
>     This makes sure the number of bytes in the params_len matches the
>     remaining bytes received so the code don't end up accessing invalid
>     memory.
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>  .../bluez5/bluez5/0001-CVE-2022-39177.patch   | 34 +++++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-CVE-2022-39177.patch
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
> index f34ba0dce5..f7d5f57c75 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -52,6 +52,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
>             file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
>             file://0001-test-gatt-Fix-hung-issue.patch \
> +           file://0001-CVE-2022-39177.patch \
>             "
>  S = "${WORKDIR}/bluez-${PV}"
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-CVE-2022-39177.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-CVE-2022-39177.patch
> new file mode 100644
> index 0000000000..54709e0cb1
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-CVE-2022-39177.patch
> @@ -0,0 +1,34 @@
> +From e5c8613fe171f0dc3aa812270bb15063aaa73d45 Mon Sep 17 00:00:00 2001
> +From: Vivek Kumbhar <vkumbhar@mvista.com>
> +Date: Sun, 9 Oct 2022 21:06:51 +0530
> +Subject: [PATCH] CVE-2022-39177
> +
> +Upstream-Status: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=e2b0f0d8d63e1223bb714a9efb37e2257818268b
> +CVE: CVE-2022-39177
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + profiles/audio/avrcp.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
> +index d9471c0..0233d53 100644
> +--- a/profiles/audio/avrcp.c
> ++++ b/profiles/audio/avrcp.c
> +@@ -1916,6 +1916,14 @@ static size_t handle_vendordep_pdu(struct avctp *conn, uint8_t transaction,
> +               goto err_metadata;
> +       }
> +
> ++      operands += sizeof(*pdu);
> ++      operand_count -= sizeof(*pdu);
> ++
> ++      if (pdu->params_len != operand_count) {
> ++              DBG("AVRCP PDU parameters length don't match");
> ++              pdu->params_len = operand_count;
> ++      }
> ++
> +       for (handler = session->control_handlers; handler->pdu_id; handler++) {
> +               if (handler->pdu_id == pdu->pdu_id)
> +                       break;
> +--
> +2.25.1
> +
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99112): https://lists.openembedded.org/g/openembedded-devel/message/99112
> Mute This Topic: https://lists.openembedded.org/mt/94225396/3620601
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

