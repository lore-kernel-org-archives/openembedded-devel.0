Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34081C00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 16:47:42 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.50659.1674146852479695570
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jan 2023 08:47:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l76QDP9W;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id j10-20020a4aa64a000000b004f9b746ee29so609993oom.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 08:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fPNSFe/slm1/t2zigepuE9j+IbfEhc5DKYKtmOvsbh8=;
        b=l76QDP9WVPrjL4XTznubDzwQIGrUnSU3yASiO/ci3JSk/EzpsbZJO136MuIsNdebZ0
         ZmwkjsAzwEMbtCFNV/9KmdL3XErfU0g4ct3EE+8rSZPTUCCx8HkVrqhHP634f2PX/dGf
         0/6P5kyMlZl2OuBNp8F13AS6wA4EIXzXTFkJhyDiF9f+1i4WDYyFiF+opUQ++WglLuWD
         bfn5RZizDvNsB/dk7fHt9DySuhO3jJM3eCsPWl7b7U2IHYg5Ko/6eC3ASB8lJJwQj4Zq
         0i+eGFEJprLieySVwySaq+SOQksmqCWkAiwy9+zr/kEU7iToya72K6nUyCWcktGXXnZr
         WQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPNSFe/slm1/t2zigepuE9j+IbfEhc5DKYKtmOvsbh8=;
        b=EVap3nnYKAZe1M7qwqQGfWoby7pukiz4GOsLnomMGBfo5QVNvRdo4LRFW1yOEOKBb0
         LEa4XYScoq9pSJxq6NF/ivuFLz6+aecbPpLMaWSCk2q3CkiE6+EPOzIZkii6Z7UUORCs
         0S9kEmNOD0T+EpApc8X6v72NBf2lnqOJZtyEuBNgsZlg1IfIO879r5CPiwfz/Po9K/tz
         Mk3iUODnxgq9Qqjc3FjPOYW95CVS/BJaGH6rCckir159SmrlplXY8sZOUTU2FbcWsMDa
         tkhCvvWo8H7fmJ638jhdBsmAqaN4G5r6hjUBLXe4onpVLaUUJLs92lE/BAyiUJLcQsg0
         KvSA==
X-Gm-Message-State: AFqh2kpbZRRR77NS5s7/OJLqX8n8mfH/8kdSvPl1jDAgmwCFW3Bi2IdJ
	dt78xJDZxtjnxlnnYHH8zXepKrinjF+XgQ5YU+tFHn/Q+iU=
X-Google-Smtp-Source: AMrXdXuSHG6YcvK5Ct4Gl5CPkPNXsIL4GC+yoSqS3FkZtNT6DulF+nWP7TYI/WxHO1vlZawi/sxzzLUMNKnO6V9+UqM=
X-Received: by 2002:a4a:3513:0:b0:4b1:52d7:5963 with SMTP id
 l19-20020a4a3513000000b004b152d75963mr508030ooa.73.1674146851618; Thu, 19 Jan
 2023 08:47:31 -0800 (PST)
MIME-Version: 1.0
References: <21844dea-df37-ed52-f0b1-08e76a02cccd@gmail.com>
In-Reply-To: <21844dea-df37-ed52-f0b1-08e76a02cccd@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Jan 2023 08:47:05 -0800
Message-ID: <CAMKF1spUUOJxZi_2A5pAH7WxqgJVn5Xtk2W0PpNveSvSAGRy+w@mail.gmail.com>
Subject: Re: Dunfell merge request: Jan 19th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 16:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100662

applied thanks Armin.

On Thu, Jan 19, 2023 at 4:52 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 7952135f650b4a754e2255f5aa03973a32344123:
>
>    postgresql: Fix CVE-2022-2625 (2022-12-11 16:01:15 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to e707e9b7cf5c62bff4fee029965a87b22dd4ccba:
>
>    postfix: upgrade 3.4.23 -> 3.4.27 (2023-01-19 07:49:31 -0500)
>
> ----------------------------------------------------------------
> Hitendra Prajapati (1):
>        proftpd: CVE-2021-46854 memory disclosure to radius server
>
> Siddharth Doshi (1):
>        xterm : Fix CVE-2022-45063 code execution via OSC 50 input
> sequences] CVE-2022-45063
>
> Valeria Petrov (1):
>        php: update 7.4.28 -> 7.4.33
>
> Virendra Thakur (1):
>        capnproto: Fix CVE-2022-46149
>
> Yi Zhao (1):
>        postfix: upgrade 3.4.23 -> 3.4.27
>
> wangmy (1):
>        apache2: upgrade 2.4.53 -> 2.4.54
>
>   .../postfix/{postfix_3.4.23.bb => postfix_3.4.27.bb} |   2 +-
>   .../recipes-daemons/proftpd/files/CVE-2021-46854.patch          | 51 ++
>   meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb        | 1 +
>   meta-oe/recipes-devtools/capnproto/capnproto_0.7.0.bb           | 4 +-
>   meta-oe/recipes-devtools/capnproto/files/CVE-2022-46149.patch   | 49 ++
>   meta-oe/recipes-devtools/php/{php_7.4.28.bb => php_7.4.33.bb} |   2 +-
>   meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-45063.patch    | 785
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-graphics/xorg-app/xterm_353.bb                  | 1 +
>   .../0004-apache2-log-the-SELinux-context-at-startup.patch       | 12 +-
>   .../apache2/{apache2_2.4.53.bb => apache2_2.4.54.bb} |   2 +-
>   10 files changed, 898 insertions(+), 11 deletions(-)
>   rename meta-networking/recipes-daemons/postfix/{postfix_3.4.23.bb =>
> postfix_3.4.27.bb} (89%)
>   create mode 100644
> meta-networking/recipes-daemons/proftpd/files/CVE-2021-46854.patch
>   create mode 100644
> meta-oe/recipes-devtools/capnproto/files/CVE-2022-46149.patch
>   rename meta-oe/recipes-devtools/php/{php_7.4.28.bb => php_7.4.33.bb} (99%)
>   create mode 100644
> meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-45063.patch
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.53.bb =>
> apache2_2.4.54.bb} (99%)

