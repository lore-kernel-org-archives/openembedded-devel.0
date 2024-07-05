Return-Path: <sven.schwermer@disruptive-technologies.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBDAC30658
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 11:53:17 +0000 (UTC)
Subject: Re: [meta-networking][PATCH] networkmanager: fix gir build
To: openembedded-devel@lists.openembedded.org
From: "Sven" <sven.schwermer@disruptive-technologies.com>
X-Originating-Location: Oslo, Oslo County, NO (95.130.220.46)
X-Originating-Platform: Linux Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 05 Jul 2024 04:53:11 -0700
References: <20240430064721.164017-1-f_l_k@t-online.de>
In-Reply-To: <20240430064721.164017-1-f_l_k@t-online.de>
Message-ID: <3010.1720180391903558586@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Jul 2024 11:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111258

This patch breaks my build (scarthgap):

| DEBUG: Executing shell function do_configure
| cp: cannot stat '$BBPATH/tmp/work/cortexa7t2hf-neon-vfpv4-poky-linux-gnue=
abi/networkmanager/1.46.0/recipe-sysroot/usr/lib/girepository-1.0/GObject*t=
ypelib': No such file or directory
| WARNING: $BBPATH/tmp/work/cortexa7t2hf-neon-vfpv4-poky-linux-gnueabi/netw=
orkmanager/1.46.0/temp/run.do_configure.1339834:152 exit 1 from 'cp -f $BBP=
ATH/tmp/work/cortexa7t2hf-neon-vfpv4-poky-linux-gnueabi/networkmanager/1.46=
.0/recipe-sysroot/usr/lib/girepository-1.0/GObject*typelib $BBPATH/tmp/work=
/cortexa7t2hf-neon-vfpv4-poky-linux-gnueabi/networkmanager/1.46.0/recipe-sy=
sroot-native/usr/lib/girepository-1.0/'

I believe this might be related to the fact that I have gobject introspecti=
on data generation disabled via DISTRO_FEATURES_BACKFILL_CONSIDERED=3D"gobj=
ect-introspection-data" ?

