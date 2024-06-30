Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1E8C27C4F
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 23:35:20 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.7980.1719790513970353621
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 16:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U1I3uJr9;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2598a57b2c1so1259432fac.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Jun 2024 16:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719790513; x=1720395313; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ql0GcNJbG4oRL79sstBNo6C88UQQ5hk6w2dPdAEAnfg=;
        b=U1I3uJr9avFQi44p0ZhXA2ysEoskhl26rfhzrDNFIm2GFqUoX6lj/QALGcnNV60R8z
         CkZeDpICDv0BI919MaoD6MqwFl+7195YgtVOwzlHgP4oO86IHmIDCfdx5S6cGIJq+DY1
         j2VbEtldskOmpvnf5zZvqXvyKhBXO4dYuDii9/RxPH03BdwFHwxDgpDLkDxXaSn04rXj
         uiBxZStVwtuwcCbESwdxTNoOqCtJUKkBWhYX4IzIOKvbQidWyn1mzBzj932t6YNGLZgS
         Nt8e0e9JwVi1TYAw5QpL29TXInoYQ8Gyl4YPHinDWdkTkGHY5+luKP2LOlEMj2BqxBkL
         FVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719790513; x=1720395313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ql0GcNJbG4oRL79sstBNo6C88UQQ5hk6w2dPdAEAnfg=;
        b=pwvshYdM80e7r1jgAgUiHRGmGhr4owupHM65HntY410vAYfYDaSHOFfSUH3T1TqxAp
         WKWtU60Qethv2wDiH1HHFiOClRuoAOnFLE95IlpzKOJRfNKV9RcjsCiHJkDrT8B7UClf
         Drh5mxQxWICRHqvo688EPf3GgnBmaz4FkipSU+laxmgB1myfd07pNKw8lDWla1rD8JIB
         skn8YR7WN3et3Lex/H8Lo+f5NJ34Z7XS4SWcg+gAqUMDOLIHfs9lzQOG9UgsgCHcwpNM
         NzMUQUa6Vjvsfd8UtA2JR8CsRk8EwcxYyKYnRp1m608RE01MYoyw3Q2+P6zfiSh+8AZ6
         /vrw==
X-Gm-Message-State: AOJu0YwTozO4VwgrUmj2d3SEniAoG0sfiRwKCCaIaEKzHx6Veu9+vepi
	b8r7GvuAhbOzjGY5KV3mygaQXg5STn9cjS9SbF2Xho6C2EgGQNW2xg8dW0bhEN9P+FmNlMfc8qG
	XfM7NwFJqcugNLBIunPl63QPL1Jo=
X-Google-Smtp-Source: AGHT+IEDl6WwuMzJScL76BVoa8o0Jw+ELE/bLjDuST3+uuLXvihyD5fOOCOvQpVnkWx/y/DxajmZz4Pil915lthlCiE=
X-Received: by 2002:a05:6870:d8ce:b0:259:80dc:13e2 with SMTP id
 586e51a60fabf-25db3442b6bmr4102011fac.11.1719790513011; Sun, 30 Jun 2024
 16:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240630124721.64234-1-f_l_k@t-online.de>
In-Reply-To: <20240630124721.64234-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 30 Jun 2024 16:34:47 -0700
Message-ID: <CAMKF1srwPHUtw3sAOtu80dx8FYGLODTwMwGzH4z-L0+-70hfyw@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 1/2] pipewire: update 1.0.7 -> 1.2.0
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Jun 2024 23:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111167

It fails on 32bit x86 clang/lld linker -
https://errors.yoctoproject.org/Errors/Details/788619/
perhaps we need to specify linking with -latomic on architectures
missing 64bit atomics.

On Sun, Jun 30, 2024 at 5:46=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> PipeWire 1.2.0 (2024-06-27)
>
> This is the 1.2 release that is API and ABI compatible with previous
> 1.1.x and 1.0.x releases.
>
> This release contains some of the bigger changes that happened since
> the 1.0 release last year, including:
>
>   * Support for asynchronous processing has been implemented. Nodes can c=
hoose
>     (or be forced) to be scheduled asynchronously. The graph will not wai=
t for
>     the output of the node to continue processing but it will use the out=
put
>     of the previous cycle (or silence) instead. This adds one cycle of la=
tency
>     but it can avoid having some nodes blocking the processing graph. Non=
 realtime
>     streams and filters now also use this asynchronous processing instead=
 of
>     their own slightly broken version.
>   * The concept of node.sync-group was added. This groups nodes with over=
lapping
>     sync-group together when one of them sets the node.sync =3D true. Thi=
s is now
>     used to make sure all nodes are scheduled together when JACK transpor=
t is
>     started so that they all see the same transport time.
>   * Config parsing errors are reported earlier and much better with line =
and
>     column numbers where the parsing started to fail.
>   * Add support for mandatory metadata when negotiating buffer parameters=
. This
>     can be used to only negotiate extra buffer planes when certain metada=
ta is
>     negotiated. One use case is the explicit sync support that requires 2
>     extra fds for the timelines.
>   * Explicit sync metadata and support was added.
>   * Support was added for making and using multiple data-loops in the ser=
ver
>     and clients. Support for CPU affinity and priorities was added to the
>     data-loops as well.
>   * The log topic debug levels can now be changed at runtime with metadat=
a.
>     The log levels in the pulse server can be dynamically changed with a
>     /core message.
>   * The UCM conflicting devices patches were merged.
>   * Add snapcast-discover module to stream to snapcast servers.
>   * Rework how peers are linked and the counters are updated. Resume the
>     peers when a node is unlinked and not yet processed. This should caus=
e
>     less occasional dropouts in the graph when reconnecting things.
>   * Many GStreamer element updates.
>   * Many more fixes and improvements.
>
> Enjoy the summer vacation!
>
> Highlights (since the previous 1.1.83 release)
>   - Small fixes here and there.
>
> PipeWire
>   - Compilation fixes after enabling -Werror=3Dfloat-conversion
>
> Modules
>   - The module-rtp-sap now propagates the cleanup.sec property to the
>     rtp-source and the rtp-source now sets a property with the receiving
>     status.
>   - Fix for ROC 0.3, explicitly specify sender encoding. (#4070)
>   - Some fixes to the RAOP sink module, including a format fix for 32 bit
>     machines.
>
> Tools
>   - Fix pw-cli monitoring code.
>
> SPA
>   - Revert peer_enum_params again because it was not used and flawed.
>   - Fix multichannel processing in webrtc AEC.
>
> GStreamer
>   - Logging improvements.
>   - Fix a race in the bufferpool activation.
>
> Bluetooth
>   - Improvements to BAP broadcast code parsing.
>
> Older versions:
>
> PipeWire 1.1.83 (2024-06-17)
>
> This is the third and hopefully the last 1.2 release candidate that is
> API and ABI compatible with previous 1.0.x releases.
>
> Some last minute changes went in to clean up the node activation and
> scheduling that justify another pre-release.
>
> Highlights
>   - Rework how peers are linked and the counters are updated. Resume the
>     peers when a node is unlinked and not yet processed. This should caus=
e
>     less occasional dropouts in the graph when reconnecting things.
>   - Improve xruns in module-ffado.
>   - Many GStreamer element updates.
>   - More fixes and improvements.
>
> PipeWire
>   - Rework how peers are linked and the counters are updated. Resume the
>     peers when a node is unlinked and not yet processed. This should caus=
e
>     less dropouts in the graph when reconnecting. (#4026)
>   - Improve debug of xruns.
>   - Evaluate node.rules and device.rules before loading the plugin so tha=
t
>     extra properties can be passed to the plugin init function.
>
> Modules
>   - Improve timing reporting in module-ffado some more.
>   - Prealloc less memory in the profiler by default.
>   - Improve xrun handling in module-ffado.
>
> Tools
>   - Fix a crash in pw-link when a link fails.
>   - Fix pw-dump update for metadata. (#4053)
>
> SPA
>   - Improve handling of controls. (#4028)
>   - Fix the string size in v4l2 to hold the device and vendor id.
>   - Support meta_videotransform on buffers in v4l2. This can be used to
>     signal that the buffer was rotated for example.
>   - Add HDMI/AC3 profile to ALSA when supported.
>   - Make it possible to disable the webrtc dependency
>
> GStreamer
>   - Improve caps handling in the elements.
>   - Set buffer duration when we can.
>   - Post an element error when all the elements buffers are removed.
>     (#1980)
>   - Improve DMA_DRM caps selection.
>   - Some refactoring work.
>   - Improve state handling in the elements.
>
> JACK
>   - Improve how links are activated.
>   - Fix some races when freeing memory.
>
> Bluetooth
>   - Support multiple BIS in the broadcast source.
>
> PipeWire 1.1.82 (2024-05-24)
>
> This is the second 1.2 release candidate that is API and ABI
> compatible with previous 1.0.x releases.
>
> Not so many things needed to be fixed so this might already be the
> last prerelease if everything goes well...
>
> Highlights
>   - Fix problem when moving nodes that could cause nodes to be scheduled
>     wrongly and cause errors. (#4017)
>   - Add snapcast-discover module to stream to snapcast servers.
>   - Work around wrong kernel provided MTU for USB controllers.
>   - Fix some spelling mistakes all over the codebase.
>   - More small fixes and improvements.
>
> PipeWire
>   - Remove the private cleanup.h header and use the public SPA version.
>   - Fix problem when moving nodes that could cause nodes to be scheduled
>     wrongly and cause errors. (#4017)
>
> Modules
>   - Handle IPv6 in module-protocol-simple and support port allocation.
>   - Add snapcast-discover module to stream to snapcast servers.
>
> Bluetooth
>   - Work around wrong kernel provided MTU for USB controllers.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../pipewire/{pipewire_1.0.7.bb =3D> pipewire_1.2.0.bb}        | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.0.7.bb =
=3D> pipewire_1.2.0.bb} (99%)
>
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.7.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.0.bb
> similarity index 99%
> rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.7.bb
> rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.0.bb
> index 0c68cc4d2..c6c8da4cb 100644
> --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.7.bb
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.0.bb
> @@ -12,8 +12,8 @@ LIC_FILES_CHKSUM =3D " \
>
>  DEPENDS =3D "dbus ncurses"
>
> -SRCREV =3D "59fe89d41a67f6daad086f8f3fe522935be77a3f"
> -SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=
=3D1.0;protocol=3Dhttps"
> +SRCREV =3D "7b4c0dd5ecb40e4d2c153699a85c51e1460361e1"
> +SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=
=3D1.2;protocol=3Dhttps"
>
>  S =3D "${WORKDIR}/git"
>
> @@ -292,6 +292,7 @@ FILES:${PN}-tools =3D " \
>      ${bindir}/pw-cat \
>      ${bindir}/pw-cli \
>      ${bindir}/pw-config \
> +    ${bindir}/pw-container \
>      ${bindir}/pw-dot \
>      ${bindir}/pw-dsdplay \
>      ${bindir}/pw-dump \
> --
> 2.45.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111164): https://lists.openembedded.org/g/openembedde=
d-devel/message/111164
> Mute This Topic: https://lists.openembedded.org/mt/106959126/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

