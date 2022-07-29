Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1CF1C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 17:25:40 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.697.1659115536542395669
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 10:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YhMIA+YR;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id b25so4092073qka.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 10:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CUeeiEidhy3iLcJ9lghJslsC2TyOI+fw/c5HfrRqtWU=;
        b=YhMIA+YRBzS1EVKRHwbspOuMc79KCd35CWmnpO0SrBF9dJ69sAuNa1wH9iUnNW2dCt
         84qOgjfqXnQJe0IGjFM6AQs20pf83GO3ecBr76UDa/FrFNd5VRD8CW0fbECuppbdSb7M
         nMCRDJLupbRYI7gxV/04EUv0x0SqkG6LfzRuRf9W/IVIHIvN922OpeuOUyZ47SBlVwkt
         Ht4Aw4s6Z09GT6PhFNvFebz/p4GUF6OIWEEg3RFkjaRT1+rmsP+HyPMMrDnAZ97VUHhW
         kwenf7BP9lMZDCRWl1dIEkTTsappn3GDh9mtc15dFauoWSl98f0I82lnlpCd2e0KXj6w
         nD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CUeeiEidhy3iLcJ9lghJslsC2TyOI+fw/c5HfrRqtWU=;
        b=qfI63y81M97CQhvJAyFgZpGGjBLaqGNzFLww69TxULC4wR92hPgay2bmhxvB5o3VNB
         ldCDQ6wb4kl33YZJPOJsUOW+BaiYY3C9Nrpf2zbpfCUe8hpIOvOhEhmAmYOABW63MwHe
         Hn8IdRTApC/NhStSPfaRC639ZM9kKngmJpnI62+84JFmD4putern1ddY2UsYKI4zSu7P
         JXTmtmcZkV7qZuwCZW7j0tJPSFrhlEp87BHrXOzMqdHalYATFFeA6x6nbpY6DyfGQPv3
         mQbusb93ZTe0QzMyRihqZ9UdqnRym3idXLwb7zNhb3sxPbVgj1s1VlRVnNFcsHa08DFg
         FNhQ==
X-Gm-Message-State: AJIora9K3XODIckPXk2a/Gy/czwR0vR8RIXtqmklg5oMIeQjNIoW9WoL
	PSUhj5K3zfvW6x/SYOFpVCNaEQUd5DuzKdgyTCE=
X-Google-Smtp-Source: 
 AGRyM1sRQCswvRK7p2QdU2VZBLeTecpa1J4mB77xYg9MUncsPCOqvCMoXAsI0k3wP8svg0Rwi7JcDK8y4sKddv5aUsU=
X-Received: by 2002:a05:620a:4007:b0:6b5:d88b:6d42 with SMTP id
 h7-20020a05620a400700b006b5d88b6d42mr3587752qko.180.1659115535561; Fri, 29
 Jul 2022 10:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220729170844.68097-1-mike.petersen@ni.com>
 <20220729170844.68097-2-mike.petersen@ni.com>
In-Reply-To: <20220729170844.68097-2-mike.petersen@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Jul 2022 13:25:08 -0400
Message-ID: 
 <CAMKF1spA3HaxBEjgDkj2mce0fKp+TQFjVS2HmVymTWZbUFgR8g@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] sshpass: add recipe
To: Mike Petersen <mike.petersen@ni.com>
Cc: openembedded-devel@lists.openembedded.org,
	Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Jul 2022 17:25:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98051

On Fri, Jul 29, 2022 at 1:09 PM Mike Petersen <mike.petersen@ni.com> wrote:
>
> Needed for automating ssh logins, used in auto-tests.
>
> Co-authored-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> Signed-off-by: Mike Petersen <mike.petersen@ni.com>
> ---
>  .../recipes-connectivity/sshpass/sshpass_1.09.bb     | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb
>
> diff --git a/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb b/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb
> new file mode 100644
> index 000000000..0f3c14b9c
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "Non-interactive ssh password auth"
> +HOMEPAGE = "http://sshpass.sourceforge.net/"
> +SECTION = "console/network"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/sshpass/sshpass-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "191a9128a74d81ae36744d5deb50d164"

md5sum is not needed anymore.

> +SRC_URI[sha256sum] = "71746e5e057ffe9b00b44ac40453bf47091930cba96bbea8dc48717dedc49fb7"
> +
> +inherit autotools
> --
> 2.37.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98050): https://lists.openembedded.org/g/openembedded-devel/message/98050
> Mute This Topic: https://lists.openembedded.org/mt/92695592/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

