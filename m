Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7A8C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 16:43:00 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web12.110.1646671379816431567
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 08:43:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pLkj7qvA;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id w1so13740252qtj.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 08:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QbY2jSedJs4lFHtZBKRqp55kq3gNWipw3Qon5x+axNw=;
        b=pLkj7qvAuAwVl4RmlWQgNzS6FM5p2qStbaQRPESC5rLzYzCJ9s898gfxYxL5B5UJ27
         QMP3R+BQfT1U6CwfAruq6IOlVjJNGJnKbjeUVzapXpLp0SyUjB+K6UoA7Qb6Q7bVnxWd
         MtkwvhFrI7XkcKmN025PUIHzLAVtZoGozr7L7BliAj3+M71UbNxNB899A3sgMKsh1bbD
         AIknhn5jH/NNH8uPE4icmDp3VdSSiDn9jSM8hMXUNPy/y7kn1qXFsrUi78ep0V+WDDmQ
         sHoWOW3y0XbZk1kr8x7Tn5KsrNeerBcsXtdJZXJfaHkf3yAs3Xx4BiHQagAqmsIyLK/3
         uEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QbY2jSedJs4lFHtZBKRqp55kq3gNWipw3Qon5x+axNw=;
        b=Q0KY67vvSOfzLsexxHSXg3cjwo4wQsW3/CSEu7LwIzy2jH3MBSEMjJB+q+HsWY0WFf
         TkjQg7ULwaQnYqTk0ACnL7Nbt3qByxArOBiqb/QSqV6iN3/FEE3CsIyBaPdy6SX73Uw/
         GVcVHMFmcOQM+ZSJJOqnTMZP+ZNObKgm+3JLv6foHU9EXmxymM1SWjbE4D6eAY6hH8p5
         aw7pgMAUgJ6lkDhWsepO/urlTnqwMJl5GsLD/a034k5pLGCm4BNECP8iPyK0pmHp2ZaW
         FIycN7Nsks/Ez1yfNjRXeHZ0xstrZ6pDZaQfxy61Uf+G7bePX2wvTlAan/BEHD/AuwmF
         Suag==
X-Gm-Message-State: AOAM531q+go5ta8qWjq0FsgY7Uwxu1xGolV54sXuw6C8ohkP5CKcv6Wb
	IxbQj9hpxCLbegFBm8eyuOL1RbC7XewnoNrN0kDUCgTIhT8=
X-Google-Smtp-Source: 
 ABdhPJzxFsczLeSnx93gLtTCVbYKA2AzTdwJwcDR1J2xGk65CKzpEBRCEsCfC3r7y93jMkJvJ0C4toCTMyN0tHOWXHM=
X-Received: by 2002:ac8:5a86:0:b0:2de:29af:5658 with SMTP id
 c6-20020ac85a86000000b002de29af5658mr10052344qtc.54.1646671378825; Mon, 07
 Mar 2022 08:42:58 -0800 (PST)
MIME-Version: 1.0
References: <20220307121112.1844760-1-ross.burton@arm.com>
In-Reply-To: <20220307121112.1844760-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Mar 2022 08:42:32 -0800
Message-ID: 
 <CAMKF1sqsGCB+Mnq9qniig-NKSm+qM8d=S0xhHgKg1WGXx87GNw@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/2] python3-blivetgui: use setuptools_legacy
To: Ross Burton <ross@burtonini.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 16:43:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95861

Can you rebase this on master-next ?

On Mon, Mar 7, 2022 at 4:11 AM Ross Burton <ross@burtonini.com> wrote:
>
> The setup.py installs to arbitrary target paths, so can't use the new
> bdist_wheel installation method.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
> index 995fb49622..7c3af1a8be 100644
> --- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
> +++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
> @@ -16,7 +16,7 @@ SRC_URI = "git://github.com/storaged-project/blivet-gui.git;branch=master;protoc
>  inherit features_check
>  REQUIRED_DISTRO_FEATURES = "x11 systemd"
>
> -inherit setuptools3 python3native
> +inherit setuptools3_legacy python3native
>
>  RDEPENDS:${PN} = "python3-pygobject python3 \
>                    python3-blivet gtk+3  \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95847): https://lists.openembedded.org/g/openembedded-devel/message/95847
> Mute This Topic: https://lists.openembedded.org/mt/89610237/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

