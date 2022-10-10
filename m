Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B02FC433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 16:27:46 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.8158.1665419262609228671
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:27:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=IhCNKm7r;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.52,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f52.google.com with SMTP id s30so16669397eds.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KQWMvUoO7RP5DgpnxNOxMoxklUUY6r+28835ukudpvk=;
        b=IhCNKm7rk9DhN+Qy9krLGMimS2870GH2R1l39SiCbTxQpkidCctnEnOoHfSzIkdQ+W
         n14b/6Hkzkjxi0YjeCykIdrCKi1L6pQAqt31nyeEdq0+XJD55ZxB7w9EtYu0tEd8Sdje
         KeVyBk+hcKG2t3ND144B6q98YnAebBgO1uoOPkgSHY9MyICxoL1wvMHexXO1mm0e18DH
         b08XBiZEcQl5hY0LEBLtSxGSfkNHEwxZtFOb0ywMxHlMH78srnbdw5wBTQ8XUAspM0+3
         0kNSaYd5RQrQqeM/bzPkzLWBwg8jPkw2EqAcLUc4LFSKo6ENK97O4b2UbsOsDeDQdQJW
         ARsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQWMvUoO7RP5DgpnxNOxMoxklUUY6r+28835ukudpvk=;
        b=UCxOBFi/AVUYRRkANqOHvR3xFEM/dcfqV8znqx/GwQ3JKMQ0MJvI+dWDFOrJCrwUOB
         dgDwDjmbeQvNVVPaExWC+USjWSL08Eu56MvO+Org+AOovP3+gJKWdPCOFYn52u/qGcYx
         SwF9ahBnmDhHkazEugyV86Wmf4nXMA4JMx8DPp+cIy0DBmNHgDleyfgQc8Y5Ll9qTQqG
         lMlhsgpTLDSxNjSkrcTeV6UTbLb0eiZdgBJmf3yqdrjCRikW8IIBBuTErIQKyNJYMemK
         1A4Gjduejwdf4roitxMUpqOzkXPXh9T/NObsuboyiyQ4tgorx3GPAsRy50jhWbtyvKZ/
         cBBA==
X-Gm-Message-State: ACrzQf1jHu5KWR7Y/hdu59ZQpS28Mox+q9tVPOzNyX8sC4+69hg6XQ+V
	VrFuL7v+s+AmHrSxg/vyb0smPuOrbTreCAOxoOWMoQ==
X-Google-Smtp-Source: 
 AMsMyM5HqiotyUyk8OuOOebgnAP4Asi2Z0N5qetQKsRsGhSaaPThEueADNNSaGCpLkuMsJ4NxO2iOlFbnTT+4FHPyEU=
X-Received: by 2002:a05:6402:501a:b0:457:f093:cadb with SMTP id
 p26-20020a056402501a00b00457f093cadbmr18368585eda.143.1665419260801; Mon, 10
 Oct 2022 09:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221009144614.275815-1-vkumbhar@mvista.com>
In-Reply-To: <20221009144614.275815-1-vkumbhar@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 10 Oct 2022 06:27:29 -1000
Message-ID: 
 <CAOSpxdY0Ed5DO+MAotKpW1kbCXzi40DA0nM5guXt9NgnKRvGAQ@mail.gmail.com>
Subject: Re: [oe] [OE-core][dunfell][PATCH] CVE-2022-38178 bind: memory leaks
 in EdDSA DNSSEC verification code
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Oct 2022 16:27:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99132

You sent this to the wrong list!  You should resend to
openembedded-core@lists.openembedded.org

A more standard subject/shortlog would be something like:
[OE-core][dunfell][PATCH] bind: fix CVE-2022-38178

You can give a detailed description in the commit message, so you just
need the top level info in the subject line. And it should always
start with the package/recipe name.

Thanks!

Steve

On Sun, Oct 9, 2022 at 4:49 AM vkumbhar <vkumbhar@mvista.com> wrote:
>
> Source: https://gitlab.isc.org/isc-projects/bind9/-/commit/1af23378ebb11da2eb0f412e4563d6c4165fbd3d
> MR: 122537
> Type: Security Fix
> Disposition: Backport from https://gitlab.isc.org/isc-projects/bind9/-/commit/1af23378ebb11da2eb0f412e4563d6c4165fbd3d
> ChangeID: f93f9a7755124934083d77cf9334fffb32a0c220
> Description:
>     CVE-2022-38178 bind: Free ctx on invalid siglen
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  .../bind/bind/0001-CVE-2022-38178.patch       | 28 +++++++++++++++++++
>  .../recipes-connectivity/bind/bind_9.11.22.bb |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bind/bind/0001-CVE-2022-38178.patch
>
> diff --git a/meta/recipes-connectivity/bind/bind/0001-CVE-2022-38178.patch b/meta/recipes-connectivity/bind/bind/0001-CVE-2022-38178.patch
> new file mode 100644
> index 0000000000..bf48dd69a1
> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind/0001-CVE-2022-38178.patch
> @@ -0,0 +1,28 @@
> +From cedf585da4809d1bde70cfe800d0f15e3cdccb58 Mon Sep 17 00:00:00 2001
> +From: Vivek Kumbhar <vkumbhar@mvista.com>
> +Date: Sun, 9 Oct 2022 19:54:32 +0530
> +Subject: [PATCH] CVE-2022-38178
> +
> +Upstream-Status: https://gitlab.isc.org/isc-projects/bind9/-/commit/7c0028cfad2ae5fdf82c4d02d3b8b3a1e96dc6ec
> +CVE: CVE-2022-38178
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + lib/dns/openssleddsa_link.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/dns/openssleddsa_link.c b/lib/dns/openssleddsa_link.c
> +index 76c7737..295f08e 100644
> +--- a/lib/dns/openssleddsa_link.c
> ++++ b/lib/dns/openssleddsa_link.c
> +@@ -325,7 +325,7 @@ openssleddsa_verify(dst_context_t *dctx, const isc_region_t *sig) {
> +               siglen = DNS_SIG_ED448SIZE;
> +
> +       if (sig->length != siglen)
> +-              return (DST_R_VERIFYFAILURE);
> ++               DST_RET(DST_R_VERIFYFAILURE);
> +
> +       isc_buffer_usedregion(buf, &tbsreg);
> +
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-connectivity/bind/bind_9.11.22.bb b/meta/recipes-connectivity/bind/bind_9.11.22.bb
> index 3b4a299b36..b075d01e2b 100644
> --- a/meta/recipes-connectivity/bind/bind_9.11.22.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.11.22.bb
> @@ -18,6 +18,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
>             file://0001-configure.in-remove-useless-L-use_openssl-lib.patch \
>             file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
>             file://0001-avoid-start-failure-with-bind-user.patch \
> +           file://0001-CVE-2022-38178.patch \
>             "
>
>  SRC_URI[sha256sum] = "afc6d8015006f1cabf699ff19f517bb8fd9c1811e5231f26baf51c3550262ac9"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99110): https://lists.openembedded.org/g/openembedded-devel/message/99110
> Mute This Topic: https://lists.openembedded.org/mt/94217455/3620601
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

