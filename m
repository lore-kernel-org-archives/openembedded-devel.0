Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46534D3B7DE
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 10:16:31 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5190.1765188986535632517
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 02:16:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mINBVNfL;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so39424885e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 02:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765188985; x=1765793785; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nfpccmWrAqepFlRiHYvR5K3m1Mxl3TG5GDLGuzlBpkk=;
        b=mINBVNfL1qCJkeQOsWbxrqoBJyWxWH87fpzE1vJ9IxxSOFvTucazpw2gRRaUXhLW9e
         YakqxXP9VDkWKyGZlE9bEftoAb4+UVY4ebQN/O4vCbideAPaUNr4Oc5wVXm+YKhEmEl6
         kWDb6eFUhxDLsZ4ZdRFTr27Dw62UM5Nx6Ns+3hptu9rf+JxQ2Ch08ZfIWccQ1EmojcpN
         VqFSnHww+3wkHXW1gkNOkGi6RUP37/8HUfVvHWWHF49vLT2MRe+7iOcyCQ5ROPs2ijPm
         r1IjTn4joqsdYKjGEEbwxmoBEj3RrnNyF2fHV7ORd/NUIZfFSF0Yyve+R6//VeWL9Be5
         chUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765188985; x=1765793785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nfpccmWrAqepFlRiHYvR5K3m1Mxl3TG5GDLGuzlBpkk=;
        b=YIQLQe42Ah6xxXI0HUGCUR/UJsS3S/9eSChyyZ/C7TEB2pz1GjA4VpLxRvOVhPha2I
         ZxshlGsVLgH0ExgGlzeUaN7cAe7muquy4d7/GoSeQ8IybNQEkuSqFQG0J4t9K64pVFlo
         biIDq7ggRDI/xUZDffhXs07AeH9XetShgcxYJicmuOBbO8JfQbokzCVk1+K1NefYXIVq
         mQRsRSGJfSDR/o2vbegmsOm9GPen4emXeUpKkyhDl4hWTkn7c2f/NQ07KJ9v2e7/uUbt
         1VqGWDSjlG68Eb+ap0myY15LKBuj0iSLcf93/jY3uH+2bpfp2TOrM9Cu13Q8V8TJNEuk
         IvIg==
X-Forwarded-Encrypted: i=1; AJvYcCVeVmbWS1IoxdJE8+NuwUigr2j0Mc9ru0QrKbFb6lqy+FoYnn2vYPiqBrex/oqe7d0aYPO6rZAMIwzlDPnvOcRmXOI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyyIxyj+cKQqvsGBk3OS5quuPPH/pdsXywa6xUmFuza/SoquGfs
	yS5e/W4Q8EXYvWjFcL64AYl1wVX4hBk+fTUJuiS9iWHeN82YnjEAPzCY
X-Gm-Gg: ASbGncsIwX2Mehk/aDX72byrZ7vzlpt3LkstFyOECslAuDb1Zr6JbTUKL19RbrOcgpT
	wbGtkhNzDvu8fwqsFpSoqKhOO/5dWaDsyqPqVicWHCq3hoxkjariUXG9sUrOUpbH/a9xCBSORfh
	dmYByAA6x88sLs0MDEq1IpuiLLqlFidR2RyvYuuPoJUuzsmlvAeQkyFtRm5m8b7bQYTAaJCaYAx
	YA0H0o6RQpPU0KuEmFwgSELjhpS14HAPVSO03ONr9gyq1QXzSbGc7hQqIm5bg5g48vZtqVsv5pz
	4yxkdPObgRPQzkSxtY4AGpfB1J3ybaXc+hlwlUqktqkJBZdvuAwsT+QMqVwx7bjXHnkI+iL133/
	WQ5Pw/Ex/Qzefxj4OhC4nm/Wv/Sob4jt8S52j9CNkL3IByr1wVxXV25ZjZjOC5bnMd+xcj+IEm+
	Zisz6FQOMH+RbomoWYmlY=
X-Google-Smtp-Source: AGHT+IF2o2eIXAs5dSeWAKR6s4vd/WZ5l+6GTCte386FyQSY2iCotHe08aqTeNSdEBnBYQoQq3eEEQ==
X-Received: by 2002:a05:600c:46c9:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-47939e4d07cmr62499965e9.29.1765188984624;
        Mon, 08 Dec 2025 02:16:24 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b140cf4sm141008975e9.5.2025.12.08.02.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 02:16:24 -0800 (PST)
Message-ID: <7772cb79-4c3b-4fa3-b209-0b4919e24d9d@gmail.com>
Date: Mon, 8 Dec 2025 11:16:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW29lXVttZXRhLWdub21lXVtQQVRDSCAyLzJdIGdu?=
 =?UTF-8?Q?ome-control-center=3A_upgrade_48=2E3_-=3E_49=2E2=2E2?=
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20251208091300.21039-1-liuyd.fnst@fujitsu.com>
 <83e4a981-fdaf-47ec-9f4d-a8e05b3513e9@gmail.com>
 <TY3PR01MB114830BFED9BC1A66BD20D9D19BA2A@TY3PR01MB11483.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <TY3PR01MB114830BFED9BC1A66BD20D9D19BA2A@TY3PR01MB11483.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 10:16:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122375

I mean that I think the current latest stable version is 48.5. (And next
major stable will be 50)

On 12/8/25 11:13, Yiding Liu (Fujitsu) wrote:
> Hi Sarvari
>     So maybe I should upgrade gnome-control-center to 49.2?
> ------------------------------------------------------------------------
> *发件人:* Gyorgy Sarvari <skandigraun@gmail.com>
> *发送时间:* 2025年12月8日 17:54
> *收件人:* Liu, Yiding/刘 乙丁 <liuyd.fnst@fujitsu.com>;
> openembedded-devel@lists.openembedded.org
> <openembedded-devel@lists.openembedded.org>
> *主题:* Re: [oe][meta-gnome][PATCH 2/2] gnome-control-center: upgrade
> 48.3 -> 49.2.2
>  
> Doesn't gnome-control-center follow an "odd-versions-are-unstable"
> versioning pattern, making this version to be kinda-beta?
>
> On 12/8/25 10:13, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
> > Changelog:
> > - Revert libgxdp updates
> >
> >   The libgxdp updates depend on changes in gsettings-desktop-schemas
> >   that are part of the GNOME 50 cycle. Revert the pinned ref
> >   to the one we had before, until we branch libgxdp for GNOME 49.
> >
> > Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> > ---
> >  ...l-center_48.3.bb => gnome-control-center_49.2.2.bb} | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >  rename
> meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center_48.3.bb
> => gnome-control-center_49.2.2.bb} (79%)
> >
> > diff --git
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_48.3.bb
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_49.2.2.bb
> > similarity index 79%
> > rename from
> meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_48.3.bb
> > rename to
> meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_49.2.2.bb
> > index d8d5849534..9bb0228d50 100644
> > ---
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_48.3.bb
> > +++
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_49.2.2.bb
> > @@ -32,19 +32,22 @@ DEPENDS = " \
> >      udisks2 \
> >      upower \
> >      ${@' libxslt-native docbook-xsl-stylesheets-native' if
> d.getVar('GIDOCGEN_ENABLED') == 'True' else ''} \
> > +    blueprint-compiler-native \
> >  "
> > 
> >  inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext
> gi-docgen upstream-version-is-even bash-completion features_check
> > 
> >  REQUIRED_DISTRO_FEATURES += "opengl polkit pulseaudio systemd x11"
> > 
> > +SRC_URI =
> "https://download.gnome.org/sources/gnome-control-center/${@oe.utils.trim_version('${PV}
> <https://download.gnome.org/sources/gnome-control-center/${@oe.utils.trim_version('${PV}>',
> 1)}/gnome-control-center-${PV}.tar.xz"
> > +SRC_URI[sha256sum] =
> "c23ae220d6c1237d285925de7801e0e36338b9cc1a8bb51c2e37e715e6b503ad"
> > +
> >  SRC_URI += "file://0001-Add-meson-option-to-pass-sysroot.patch
> <file://0001-Add-meson-option-to-pass-sysroot.patch>"
> > -SRC_URI[archive.sha256sum] =
> "c0698245a6420badd077c16ffb218860e457cd7300612718eabf9aba47222bae"
> > 
> > -PACKAGECONFIG ??= "ibus ${@bb.utils.filter('DISTRO_FEATURES',
> 'wayland', d)}"
> > +PACKAGECONFIG ??= "ibus ${@bb.utils.filter('DISTRO_FEATURES',
> 'x11', d)}"
> >  PACKAGECONFIG[cups] = ",,cups,cups system-config-printer
> cups-pk-helper"
> >  PACKAGECONFIG[ibus] = "-Dibus=true, -Dibus=false, ibus"
> > -PACKAGECONFIG[wayland] = "-Dwayland=true, -Dwayland=false, wayland"
> > +PACKAGECONFIG[x11] = "-Dx11=true, -Dx11=false, virtual/libx11"
> >  PACKAGECONFIG[file-share] = ",,,gnome-user-share"
> >  PACKAGECONFIG[media-share] = ",,,rygel-meta tumbler"
> >  PACKAGECONFIG[malcontent] =
> "-Dmalcontent=true,-Dmalcontent=false,malcontent,malcontent-ui"
> > @@ -54,6 +57,7 @@ EXTRA_OEMESON += "-Doe_sysroot=${STAGING_DIR_HOST}"
> >  GIDOCGEN_MESON_OPTION = 'documentation'
> > 
> >  export XDG_DATA_DIRS = "${STAGING_DATADIR}"
> > +export GI_TYPELIB_PATH = "${RECIPE_SYSROOT}${libdir}/girepository-1.0"
> > 
> >  FILES:${PN} += " \
> >      ${datadir}/dbus-1 \
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#122371):
> https://lists.openembedded.org/g/openembedded-devel/message/122371
> > Mute This Topic: https://lists.openembedded.org/mt/116673072/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub
> [skandigraun@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>


