Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350BDC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 17:57:06 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.52359.1643738225344364692
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 09:57:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=MKpDMI7g;
 spf=pass (domain: burtonini.com, ip: 209.85.221.52,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f52.google.com with SMTP id h21so33575977wrb.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 09:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hbhkYTDd/6iaqjRvRpn++VFe8zUZ5QmFm1IqM7FVowY=;
        b=MKpDMI7g2G3uY6QLyRGSMk8kWx6fcyea8qYeo+22JP0eg9TvshmNZJZWct/3QTJJT/
         uSU3eUR75JrMRCvfwsNCdxgA8Y+AnFH9Dnwd0REqH18q2wtKRgUImdbgKV6qE8v64hFK
         ekK4XKv3qoK9GS0lYsPwfumyCC+bAzSHrJ6LhT9E2lqq6X+bw/YJojVR+efVXtejgfG7
         jPbfhVbv2bfYUW821rC28YDkSs8VNAsBBbjLJZTiU3plTHmm9rwh1AU4WgcqXdEXjvCc
         ihfTnSw2i8OBaMrq8z+psYR2UzrbegGqNT5bAOL+e9N7g4Uob+J9P+aRfyxqqDRKG1on
         mZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hbhkYTDd/6iaqjRvRpn++VFe8zUZ5QmFm1IqM7FVowY=;
        b=KbURWUf8cKAsAQKPpeWrNsFE1+2j9bEZg2Fyj8tUeyozGrVnIWcZIVhfETi91d4aOv
         rz+N+wInOpv3cxm4WGUSOEvFA5Y7SOsPzqNlxkICc57djT02re+6PuuJHsweXEEQJsr8
         h4YtL1j60XFIQSRU53cbO4M8WgFdOY0+gC5DuaAtO8CvoCmnFLC0rJ8ebU3ENDV4Q3K+
         K8BFPNxfN3J/nvJb6gNxvtmo044fcXizZp1PGX55umjRk6FC1n305TmMNIZME3a3B3f3
         rE0IXtD+BgUV755eNYdH8vCsaK1Wbfxm1ihJsUh8HC8w68/mPNNc+lpcaDW+uf1fHKgw
         b6xQ==
X-Gm-Message-State: AOAM533sjlXh1oHzwfZub8LSgL+6JK7UCCZ/jVaKl3AR2G6gx2g9ejac
	dHjZjZmoQweUhmpHQsVPVqALW6R8CwI5WUmHbIC8jA==
X-Google-Smtp-Source: 
 ABdhPJxU+j74AOTytC9itKQxWttwj2G3faDsOdi+YA3UEkCKoYRu5c24HsKbrELekeTAvOYzbwrvUVMZga/dU6zLhLU=
X-Received: by 2002:a5d:4e02:: with SMTP id p2mr748099wrt.497.1643738223779;
 Tue, 01 Feb 2022 09:57:03 -0800 (PST)
MIME-Version: 1.0
References: <20220128175842.5234-1-f_l_k@t-online.de>
In-Reply-To: <20220128175842.5234-1-f_l_k@t-online.de>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 1 Feb 2022 17:56:52 +0000
Message-ID: 
 <CAAnfSTtwyydA03aJcwWQffLZwvNZxG2=S+vbjo6Aar1fPU410g@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] folks: dont build tests as they are not
 installed anyway
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Feb 2022 17:57:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95202

Thanks Markus, +1 from me.

Ross

On Fri, 28 Jan 2022 at 17:58, Markus Volk <f_l_k@t-online.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
> index d331dfdb5..c3c30ca46 100644
> --- a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
> +++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
> @@ -8,6 +8,7 @@ DEPENDS = " \
>  "
>
>  GNOMEBASEBUILDCLASS = "meson"
> +EXTRA_OEMESON += "-Dtests=false"
>
>  # gobject-introspection is mandatory and cannot be configured
>  REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> @@ -19,9 +20,8 @@ PACKAGECONFIG[ofono] = "-Deds_backend=true -Dofono_backend=true,-Dofono_backend=
>  PACKAGECONFIG[telepathy] = "-Dtelepathy_backend=true,-Dtelepathy_backend=false,telepathy-glib dbus-glib"
>  PACKAGECONFIG[import_tool] = "-Dimport_tool=true,-Dimport_tool=false,libxml2"
>  PACKAGECONFIG[inspect_tool] = "-Dinspect_tool=true,-Dinspect_tool=false"
> -PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,python3-dbusmock-native"
>
> -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'tests','', d)}"
> +PACKAGECONFIG ??= ""
>
>  inherit pkgconfig gnomebase gettext gobject-introspection vala features_check
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95157): https://lists.openembedded.org/g/openembedded-devel/message/95157
> Mute This Topic: https://lists.openembedded.org/mt/88750398/1676615
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

