Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47907C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 16:23:30 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web08.28057.1647275006805276258
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 09:23:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xk7Rpc8g;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id p8so12892052qvg.12
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 09:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Cp++FiAWxNr27Mpr5N/Nn08rW5Ibf7tiOdQ1a+Xp6ww=;
        b=Xk7Rpc8gPW82fwD0gTT1dshIUdFVuc8L8wBxVnPDHHjIDn8QQ7inKsDVgQV3oN33v+
         sevawfRYeARx6z2yXxVVNjdsQDNQ86XPOuuoVMMaoqqZZEsc6fL4B5rbVZsqeD1MNR/z
         pwDxeVZWyDfus7lyfD1sU8fsvEb97COWVzyKYDu8jYb5pOCGeZV/2Hy/UaYU00Dy+pXk
         I7tR3tjntjsUKvp5yCM0iRcNDv5FO6FlrNVLIK7ihWfjkQWuaHSuMVhM1TzIp1RQ8/wO
         ZbUJDyK7K2QI1lAdLjdvcWBV/InKYEdVRw50yYAkOSv46dKe4yIgyuZza5fu6K660mo+
         ng2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Cp++FiAWxNr27Mpr5N/Nn08rW5Ibf7tiOdQ1a+Xp6ww=;
        b=zasPKgKzH4jyuhJ/1FpDz2P7V1f650AEklPPRFXnQVYNB9+W9nS9tiVZMBVdvJYbgs
         aPbOM+I5Yez42vhRV1VTn6556MXaqiN/LOnRtpmsfFuzdD22ag9fuxTfhUw7qwgfIjdh
         oLsEkf3zFrF0ck3pNUu/bKy98Yo1J+ibEWpt9dzYwfwsNhYFsfJcox3GIhp6+J1D9vC9
         e3u+FC8KMwfAJYNqEV7KtQBltsEO2HzSm2+KmTC2HnGgw0L75SLEsQzBUONhItaUMUCs
         3ZEbgdH94ra9f3yoGe7is/0YG2bjA1wfi/IhLz2QIqZggeZrui0vVDdJ6w9/S49udJzn
         r7hw==
X-Gm-Message-State: AOAM532BRSwtay3U1SBa3VHDSsgPQG/s/f7R67BpXkYesKvAt1GCwL2e
	By6zFupEeoGwGaFYcn6YtPq8mV/XrOSVLmOEbeA=
X-Google-Smtp-Source: 
 ABdhPJwy4JQiEnWoRajGqtCM6JPk4q7AcxpZC/cbhfSio8OyJQw/TgRUfSG3oOZThqGLGfZMfUfvi3V53DGT6cu9qDI=
X-Received: by 2002:ad4:5def:0:b0:435:ac38:a77e with SMTP id
 jn15-20020ad45def000000b00435ac38a77emr18430171qvb.24.1647275005794; Mon, 14
 Mar 2022 09:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220314085646.38283-1-daniel@qtec.com>
 <20220314085646.38283-3-daniel@qtec.com>
In-Reply-To: <20220314085646.38283-3-daniel@qtec.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Mar 2022 09:22:59 -0700
Message-ID: 
 <CAMKF1so3TUDnsUgV9DPdtuf5FxP-UXxPsy5ogqsuuS7n+vT++w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 3/6] xf86-video-ati: Update 19.1.0 ->
 19.1.0+5eba006e
To: Daniel Gomez <daniel@qtec.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 dagmcr@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Mar 2022 16:23:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95984

seeing failures on mips

https://errors.yoctoproject.org/Errors/Details/651743/

On Mon, Mar 14, 2022 at 1:57 AM Daniel Gomez <daniel@qtec.com> wrote:
>
> - Move tarball recipe to git due to the lack of a release in over 2+
>   years.
> - Drop patches already upstream.
> - Add PACKAGECONFIG support: udev and glamor.
> - Add mesa driver runtime dependencies and libegl as glamor runtime depen=
dency.
> - Add ${PN}-config package.
>
> Signed-off-by: Daniel Gomez <daniel@qtec.com>
> ---
>  .../0001-Fix-link-failure-with-gcc-10.patch   |  34 --
>  ...terminology-to-use-primary-secondary.patch | 369 ------------------
>  .../xorg-driver/xf86-video-ati_19.1.0.bb      |  25 --
>  .../xorg-driver/xf86-video-ati_git.bb         |  43 ++
>  4 files changed, 43 insertions(+), 428 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-ati/0=
001-Fix-link-failure-with-gcc-10.patch
>  delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-ati/0=
001-ati-cleanup-terminology-to-use-primary-secondary.patch
>  delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_1=
9.1.0.bb
>  create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_g=
it.bb
>
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati/0001-Fix=
-link-failure-with-gcc-10.patch b/meta-oe/recipes-graphics/xorg-driver/xf86=
-video-ati/0001-Fix-link-failure-with-gcc-10.patch
> deleted file mode 100644
> index 7dfa23342..000000000
> --- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati/0001-Fix-link-f=
ailure-with-gcc-10.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From cebbeaa9d0bdc18377faef27ea9ffd38e509d180 Mon Sep 17 00:00:00 2001
> -From: Adam Jackson <ajax@redhat.com>
> -Date: Tue, 4 Feb 2020 16:38:06 -0500
> -Subject: [PATCH] Fix link failure with gcc 10
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Without the 'extern' this looks like a definition not just a
> -declaration, in every file that includes the header. gcc 10 is stricter
> -about this kind of multiple definition.
> -
> -Upstream-Status: Backport [https://cgit.freedesktop.org/xorg/driver/xf86=
-video-ati/commit/?id=3Df223035f4ffcff2a9296d1e907a5193f8e8845a3]
> -Reviewed-by: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> ----
> - src/drmmode_display.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/drmmode_display.h b/src/drmmode_display.h
> -index 96eaef0..8cd8a0a 100644
> ---- a/src/drmmode_display.h
> -+++ b/src/drmmode_display.h
> -@@ -262,7 +262,7 @@ Bool drmmode_wait_vblank(xf86CrtcPtr crtc, drmVBlank=
SeqType type,
> -                        uint64_t *ust, uint32_t *result_seq);
> -
> -
> --miPointerSpriteFuncRec drmmode_sprite_funcs;
> -+extern miPointerSpriteFuncRec drmmode_sprite_funcs;
> -
> -
> - #endif
> ---
> -2.28.0
> -
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati/0001-ati=
-cleanup-terminology-to-use-primary-secondary.patch b/meta-oe/recipes-graph=
ics/xorg-driver/xf86-video-ati/0001-ati-cleanup-terminology-to-use-primary-=
secondary.patch
> deleted file mode 100644
> index cda2c2f14..000000000
> --- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati/0001-ati-cleanu=
p-terminology-to-use-primary-secondary.patch
> +++ /dev/null
> @@ -1,369 +0,0 @@
> -From 6e035c007876ffe972a497681dd3debdc806e979 Mon Sep 17 00:00:00 2001
> -From: Dave Airlie <airlied@redhat.com>
> -Date: Mon, 13 Jul 2020 09:11:28 +1000
> -Subject: [PATCH] ati: cleanup terminology to use primary/secondary
> -
> -The X server changed some API/ABIs here.
> -
> -Based on amdgpu patch by Michel
> ----
> -Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/driver/xf=
86-video-ati/-/commit/8da3e4561ef82bb78c9a17b8cd8bf139b9cfd680.patch]
> -man/radeon.man        |  2 +-
> - src/compat-api.h      |  6 ++++
> - src/drmmode_display.c |  4 +--
> - src/evergreen_state.h |  2 +-
> - src/r600_state.h      |  2 +-
> - src/radeon.h          | 10 +++---
> - src/radeon_exa.c      |  2 +-
> - src/radeon_glamor.c   |  2 +-
> - src/radeon_kms.c      | 74 +++++++++++++++++++++----------------------
> - 9 files changed, 55 insertions(+), 49 deletions(-)
> -
> -diff --git a/man/radeon.man b/man/radeon.man
> -index dcebf53..247dcdb 100644
> ---- a/man/radeon.man
> -+++ b/man/radeon.man
> -@@ -290,7 +290,7 @@ on. If this option is set, the default value of the =
property is 'on' or 'off'
> - accordingly. If this option isn't set, the default value of the propert=
y is
> - .B auto,
> - which means that TearFree is on for rotated outputs, outputs with RandR
> --transforms applied and for RandR 1.4 slave outputs, otherwise off.
> -+transforms applied and for RandR 1.4 secondary outputs, otherwise off.
> - .TP
> - .BI "Option \*qAccelMethod\*q \*q" "string" \*q
> - Chooses between available acceleration architectures.  Valid values are
> -diff --git a/src/compat-api.h b/src/compat-api.h
> -index f4e7524..def6d3e 100644
> ---- a/src/compat-api.h
> -+++ b/src/compat-api.h
> -@@ -34,4 +34,10 @@
> - #define BLOCKHANDLER_ARGS pScreen, pTimeout, pReadmask
> - #endif
> -
> -+#if ABI_VIDEODRV_VERSION < SET_ABI_VERSION(25, 2)
> -+#define current_primary current_master
> -+#define primary_pixmap master_pixmap
> -+#define secondary_dst slave_dst
> -+#endif
> -+
> - #endif
> -diff --git a/src/drmmode_display.c b/src/drmmode_display.c
> -index 0e9e247..3dec91e 100644
> ---- a/src/drmmode_display.c
> -+++ b/src/drmmode_display.c
> -@@ -720,7 +720,7 @@ drmmode_crtc_prime_scanout_update(xf86CrtcPtr crtc, =
DisplayModePtr mode,
> -               xorg_list_for_each_entry(dirty, &screen->pixmap_dirty_lis=
t,
> -                                        ent) {
> -                       if (radeon_dirty_src_equals(dirty, drmmode_crtc->=
prime_scanout_pixmap)) {
> --                              dirty->slave_dst =3D
> -+                              dirty->secondary_dst =3D
> -                                       drmmode_crtc->scanout[scanout_id]=
.pixmap;
> -                               break;
> -                       }
> -@@ -1356,7 +1356,7 @@ drmmode_set_scanout_pixmap(xf86CrtcPtr crtc, Pixma=
pPtr ppix)
> -
> -       xorg_list_for_each_entry(dirty, &screen->pixmap_dirty_list, ent) =
{
> -               if (radeon_dirty_src_equals(dirty, drmmode_crtc->prime_sc=
anout_pixmap)) {
> --                      PixmapStopDirtyTracking(dirty->src, dirty->slave_=
dst);
> -+                      PixmapStopDirtyTracking(dirty->src, dirty->second=
ary_dst);
> -                       break;
> -               }
> -       }
> -diff --git a/src/evergreen_state.h b/src/evergreen_state.h
> -index 7e54e1c..34ba87b 100644
> ---- a/src/evergreen_state.h
> -+++ b/src/evergreen_state.h
> -@@ -350,7 +350,7 @@ extern void *RADEONEXACreatePixmap2(ScreenPtr pScree=
n, int width, int height,
> -                                   int *new_pitch);
> - extern void RADEONEXADestroyPixmap(ScreenPtr pScreen, void *driverPriv)=
;
> - extern Bool RADEONEXAPixmapIsOffscreen(PixmapPtr pPix);
> --extern Bool RADEONEXASharePixmapBacking(PixmapPtr ppix, ScreenPtr slave=
, void **handle_p);
> -+extern Bool RADEONEXASharePixmapBacking(PixmapPtr ppix, ScreenPtr secon=
dary, void **handle_p);
> - extern Bool RADEONEXASetSharedPixmapBacking(PixmapPtr ppix, void *handl=
e);
> -
> - #endif
> -diff --git a/src/r600_state.h b/src/r600_state.h
> -index 3434599..567c3ca 100644
> ---- a/src/r600_state.h
> -+++ b/src/r600_state.h
> -@@ -321,6 +321,6 @@ extern void *RADEONEXACreatePixmap2(ScreenPtr pScree=
n, int width, int height,
> -                                   int *new_pitch);
> - extern void RADEONEXADestroyPixmap(ScreenPtr pScreen, void *driverPriv)=
;
> - extern Bool RADEONEXAPixmapIsOffscreen(PixmapPtr pPix);
> --extern Bool RADEONEXASharePixmapBacking(PixmapPtr ppix, ScreenPtr slave=
, void **handle_p);
> -+extern Bool RADEONEXASharePixmapBacking(PixmapPtr ppix, ScreenPtr secon=
dary, void **handle_p);
> - extern Bool RADEONEXASetSharedPixmapBacking(PixmapPtr ppix, void *handl=
e);
> - #endif
> -diff --git a/src/radeon.h b/src/radeon.h
> -index 2c91346..85fd021 100644
> ---- a/src/radeon.h
> -+++ b/src/radeon.h
> -@@ -182,18 +182,18 @@ typedef enum {
> -
> -
> - static inline ScreenPtr
> --radeon_master_screen(ScreenPtr screen)
> -+radeon_primary_screen(ScreenPtr screen)
> - {
> --    if (screen->current_master)
> --      return screen->current_master;
> -+    if (screen->current_primary)
> -+      return screen->current_primary;
> -
> -     return screen;
> - }
> -
> - static inline ScreenPtr
> --radeon_dirty_master(PixmapDirtyUpdatePtr dirty)
> -+radeon_dirty_primary(PixmapDirtyUpdatePtr dirty)
> - {
> --    return radeon_master_screen(dirty->slave_dst->drawable.pScreen);
> -+    return radeon_primary_screen(dirty->secondary_dst->drawable.pScreen=
);
> - }
> -
> - static inline DrawablePtr
> -diff --git a/src/radeon_exa.c b/src/radeon_exa.c
> -index 268155e..320ff99 100644
> ---- a/src/radeon_exa.c
> -+++ b/src/radeon_exa.c
> -@@ -282,7 +282,7 @@ void RADEONEXADestroyPixmap(ScreenPtr pScreen, void =
*driverPriv)
> -     free(driverPriv);
> - }
> -
> --Bool RADEONEXASharePixmapBacking(PixmapPtr ppix, ScreenPtr slave, void =
**fd_handle)
> -+Bool RADEONEXASharePixmapBacking(PixmapPtr ppix, ScreenPtr seconndary, =
void **fd_handle)
> - {
> -     struct radeon_exa_pixmap_priv *driver_priv =3D exaGetPixmapDriverPr=
ivate(ppix);
> -
> -diff --git a/src/radeon_glamor.c b/src/radeon_glamor.c
> -index f109838..ccf9994 100644
> ---- a/src/radeon_glamor.c
> -+++ b/src/radeon_glamor.c
> -@@ -366,7 +366,7 @@ radeon_glamor_set_pixmap_bo(DrawablePtr drawable, Pi=
xmapPtr pixmap)
> -
> -
> - static Bool
> --radeon_glamor_share_pixmap_backing(PixmapPtr pixmap, ScreenPtr slave,
> -+radeon_glamor_share_pixmap_backing(PixmapPtr pixmap, ScreenPtr secondar=
y,
> -                                  void **handle_p)
> - {
> -       ScreenPtr screen =3D pixmap->drawable.pScreen;
> -diff --git a/src/radeon_kms.c b/src/radeon_kms.c
> -index b3db7c4..62962d6 100644
> ---- a/src/radeon_kms.c
> -+++ b/src/radeon_kms.c
> -@@ -559,8 +559,8 @@ dirty_region(PixmapDirtyUpdatePtr dirty)
> -       if (dirty->rotation !=3D RR_Rotate_0) {
> -               dstregion =3D transform_region(damageregion,
> -                                            &dirty->f_inverse,
> --                                           dirty->slave_dst->drawable.w=
idth,
> --                                           dirty->slave_dst->drawable.h=
eight);
> -+                                           dirty->secondary_dst->drawab=
le.width,
> -+                                           dirty->secondary_dst->drawab=
le.height);
> -       } else
> - #endif
> -       {
> -@@ -568,7 +568,7 @@ dirty_region(PixmapDirtyUpdatePtr dirty)
> -
> -           dstregion =3D RegionDuplicate(damageregion);
> -           RegionTranslate(dstregion, -dirty->x, -dirty->y);
> --          PixmapRegionInit(&pixregion, dirty->slave_dst);
> -+          PixmapRegionInit(&pixregion, dirty->secondary_dst);
> -           RegionIntersect(dstregion, dstregion, &pixregion);
> -           RegionUninit(&pixregion);
> -       }
> -@@ -585,8 +585,8 @@ redisplay_dirty(PixmapDirtyUpdatePtr dirty, RegionPt=
r region)
> -       if (RegionNil(region))
> -               goto out;
> -
> --      if (dirty->slave_dst->master_pixmap)
> --          DamageRegionAppend(&dirty->slave_dst->drawable, region);
> -+      if (dirty->secondary_dst->primary_pixmap)
> -+          DamageRegionAppend(&dirty->secondary_dst->drawable, region);
> -
> - #ifdef HAS_DIRTYTRACKING_ROTATION
> -       PixmapSyncDirtyHelper(dirty);
> -@@ -595,8 +595,8 @@ redisplay_dirty(PixmapDirtyUpdatePtr dirty, RegionPt=
r region)
> - #endif
> -
> -       radeon_cs_flush_indirect(src_scrn);
> --      if (dirty->slave_dst->master_pixmap)
> --          DamageRegionProcessPending(&dirty->slave_dst->drawable);
> -+      if (dirty->secondary_dst->primary_pixmap)
> -+          DamageRegionProcessPending(&dirty->secondary_dst->drawable);
> -
> - out:
> -       DamageEmpty(dirty->damage);
> -@@ -613,12 +613,12 @@ radeon_prime_scanout_update_abort(xf86CrtcPtr crtc=
, void *event_data)
> - void
> - radeon_sync_shared_pixmap(PixmapDirtyUpdatePtr dirty)
> - {
> --    ScreenPtr master_screen =3D radeon_dirty_master(dirty);
> -+    ScreenPtr primary_screen =3D radeon_dirty_primary(dirty);
> -     PixmapDirtyUpdatePtr ent;
> -     RegionPtr region;
> -
> --    xorg_list_for_each_entry(ent, &master_screen->pixmap_dirty_list, en=
t) {
> --      if (!radeon_dirty_src_equals(dirty, ent->slave_dst))
> -+    xorg_list_for_each_entry(ent, &primary_screen->pixmap_dirty_list, e=
nt) {
> -+      if (!radeon_dirty_src_equals(dirty, ent->secondary_dst))
> -           continue;
> -
> -       region =3D dirty_region(ent);
> -@@ -631,45 +631,45 @@ radeon_sync_shared_pixmap(PixmapDirtyUpdatePtr dir=
ty)
> - #if HAS_SYNC_SHARED_PIXMAP
> -
> - static Bool
> --master_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr di=
rty)
> -+primary_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr d=
irty)
> - {
> --    ScreenPtr master_screen =3D radeon_dirty_master(dirty);
> -+    ScreenPtr primary_screen =3D radeon_dirty_primary(dirty);
> -
> --    return !!master_screen->SyncSharedPixmap;
> -+    return !!primary_screen->SyncSharedPixmap;
> - }
> -
> - static Bool
> --slave_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr dir=
ty)
> -+secondary_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr=
 dirty)
> - {
> --    ScreenPtr slave_screen =3D dirty->slave_dst->drawable.pScreen;
> -+    ScreenPtr secondary_screen =3D dirty->secondary_dst->drawable.pScre=
en;
> -
> --    return !!slave_screen->SyncSharedPixmap;
> -+    return !!secondary_screen->SyncSharedPixmap;
> - }
> -
> - static void
> - call_sync_shared_pixmap(PixmapDirtyUpdatePtr dirty)
> - {
> --    ScreenPtr master_screen =3D radeon_dirty_master(dirty);
> -+    ScreenPtr primary_screen =3D radeon_dirty_primary(dirty);
> -
> --    master_screen->SyncSharedPixmap(dirty);
> -+    primary_screen->SyncSharedPixmap(dirty);
> - }
> -
> - #else /* !HAS_SYNC_SHARED_PIXMAP */
> -
> - static Bool
> --master_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr di=
rty)
> -+primary_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr d=
irty)
> - {
> --    ScrnInfoPtr master_scrn =3D xf86ScreenToScrn(radeon_dirty_master(di=
rty));
> -+    ScrnInfoPtr primary_scrn =3D xf86ScreenToScrn(radeon_dirty_primary(=
dirty));
> -
> --    return master_scrn->driverName =3D=3D scrn->driverName;
> -+    return primary_scrn->driverName =3D=3D scrn->driverName;
> - }
> -
> - static Bool
> --slave_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr dir=
ty)
> -+secondary_has_sync_shared_pixmap(ScrnInfoPtr scrn, PixmapDirtyUpdatePtr=
 dirty)
> - {
> --    ScrnInfoPtr slave_scrn =3D xf86ScreenToScrn(dirty->slave_dst->drawa=
ble.pScreen);
> -+    ScrnInfoPtr secondary_scrn =3D xf86ScreenToScrn(dirty->secondary_ds=
t->drawable.pScreen);
> -
> --    return slave_scrn->driverName =3D=3D scrn->driverName;
> -+    return secondary_scrn->driverName =3D=3D scrn->driverName;
> - }
> -
> - static void
> -@@ -684,12 +684,12 @@ call_sync_shared_pixmap(PixmapDirtyUpdatePtr dirty=
)
> - static xf86CrtcPtr
> - radeon_prime_dirty_to_crtc(PixmapDirtyUpdatePtr dirty)
> - {
> --    ScreenPtr screen =3D dirty->slave_dst->drawable.pScreen;
> -+    ScreenPtr screen =3D dirty->secondary_dst->drawable.pScreen;
> -     ScrnInfoPtr scrn =3D xf86ScreenToScrn(screen);
> -     xf86CrtcConfigPtr xf86_config =3D XF86_CRTC_CONFIG_PTR(scrn);
> -     int c;
> -
> --    /* Find the CRTC which is scanning out from this slave pixmap */
> -+    /* Find the CRTC which is scanning out from this secondary pixmap *=
/
> -     for (c =3D 0; c < xf86_config->num_crtc; c++) {
> -       xf86CrtcPtr xf86_crtc =3D xf86_config->crtc[c];
> -       drmmode_crtc_private_ptr drmmode_crtc =3D xf86_crtc->driver_priva=
te;
> -@@ -714,7 +714,7 @@ radeon_prime_scanout_do_update(xf86CrtcPtr crtc, uns=
igned scanout_id)
> -       if (radeon_dirty_src_equals(dirty, drmmode_crtc->prime_scanout_pi=
xmap)) {
> -           RegionPtr region;
> -
> --          if (master_has_sync_shared_pixmap(scrn, dirty))
> -+          if (primary_has_sync_shared_pixmap(scrn, dirty))
> -               call_sync_shared_pixmap(dirty);
> -
> -           region =3D dirty_region(dirty);
> -@@ -727,7 +727,7 @@ radeon_prime_scanout_do_update(xf86CrtcPtr crtc, uns=
igned scanout_id)
> -               radeon_cs_flush_indirect(scrn);
> -               RegionCopy(&drmmode_crtc->scanout_last_region, region);
> -               RegionTranslate(region, -crtc->x, -crtc->y);
> --              dirty->slave_dst =3D drmmode_crtc->scanout[scanout_id].pi=
xmap;
> -+              dirty->secondary_dst =3D drmmode_crtc->scanout[scanout_id=
].pixmap;
> -           }
> -
> -           redisplay_dirty(dirty, region);
> -@@ -754,7 +754,7 @@ radeon_prime_scanout_update_handler(xf86CrtcPtr crtc=
, uint32_t frame, uint64_t u
> - static void
> - radeon_prime_scanout_update(PixmapDirtyUpdatePtr dirty)
> - {
> --    ScreenPtr screen =3D dirty->slave_dst->drawable.pScreen;
> -+    ScreenPtr screen =3D dirty->secondary_dst->drawable.pScreen;
> -     ScrnInfoPtr scrn =3D xf86ScreenToScrn(screen);
> -     RADEONEntPtr pRADEONEnt =3D RADEONEntPriv(scrn);
> -     xf86CrtcPtr xf86_crtc =3D radeon_prime_dirty_to_crtc(dirty);
> -@@ -818,7 +818,7 @@ radeon_prime_scanout_update(PixmapDirtyUpdatePtr dir=
ty)
> - static void
> - radeon_prime_scanout_flip(PixmapDirtyUpdatePtr ent)
> - {
> --    ScreenPtr screen =3D ent->slave_dst->drawable.pScreen;
> -+    ScreenPtr screen =3D ent->secondary_dst->drawable.pScreen;
> -     ScrnInfoPtr scrn =3D xf86ScreenToScrn(screen);
> -     RADEONEntPtr pRADEONEnt =3D RADEONEntPriv(scrn);
> -     xf86CrtcPtr crtc =3D radeon_prime_dirty_to_crtc(ent);
> -@@ -893,11 +893,11 @@ radeon_dirty_update(ScrnInfoPtr scrn)
> -               if (screen->isGPU) {
> -                       PixmapDirtyUpdatePtr region_ent =3D ent;
> -
> --                      if (master_has_sync_shared_pixmap(scrn, ent)) {
> --                              ScreenPtr master_screen =3D radeon_dirty_=
master(ent);
> -+                      if (primary_has_sync_shared_pixmap(scrn, ent)) {
> -+                              ScreenPtr primary_screen =3D radeon_dirty=
_primary(ent);
> -
> --                              xorg_list_for_each_entry(region_ent, &mas=
ter_screen->pixmap_dirty_list, ent) {
> --                                      if (radeon_dirty_src_equals(ent, =
region_ent->slave_dst))
> -+                              xorg_list_for_each_entry(region_ent, &pri=
mary_screen->pixmap_dirty_list, ent) {
> -+                                      if (radeon_dirty_src_equals(ent, =
region_ent->secondary_dst))
> -                                               break;
> -                               }
> -                       }
> -@@ -921,7 +921,7 @@ radeon_dirty_update(ScrnInfoPtr scrn)
> -
> -                       RegionDestroy(region);
> -               } else {
> --                      if (slave_has_sync_shared_pixmap(scrn, ent))
> -+                      if (secondary_has_sync_shared_pixmap(scrn, ent))
> -                               continue;
> -
> -                       region =3D dirty_region(ent);
> -@@ -1216,7 +1216,7 @@ static void RADEONBlockHandler_KMS(BLOCKHANDLER_AR=
GS_DECL)
> -     (*pScreen->BlockHandler) (BLOCKHANDLER_ARGS);
> -     pScreen->BlockHandler =3D RADEONBlockHandler_KMS;
> -
> --    if (!xf86ScreenToScrn(radeon_master_screen(pScreen))->vtSema)
> -+    if (!xf86ScreenToScrn(radeon_primary_screen(pScreen))->vtSema)
> -       return;
> -
> -     if (!pScreen->isGPU)
> -@@ -2584,7 +2584,7 @@ CARD32 cleanup_black_fb(OsTimerPtr timer, CARD32 n=
ow, pointer data)
> -     xf86CrtcConfigPtr xf86_config =3D XF86_CRTC_CONFIG_PTR(scrn);
> -     int c;
> -
> --    if (xf86ScreenToScrn(radeon_master_screen(screen))->vtSema)
> -+    if (xf86ScreenToScrn(radeon_primary_screen(screen))->vtSema)
> -       return 0;
> -
> -     /* Unreference the all-black FB created by RADEONLeaveVT_KMS. After
> ---
> -2.33.1
> -
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_19.1.0.b=
b b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_19.1.0.bb
> deleted file mode 100644
> index c8ce77ab8..000000000
> --- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_19.1.0.bb
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -require recipes-graphics/xorg-driver/xorg-driver-video.inc
> -
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Daabff1606551f9461ccf567739af6=
3dc"
> -
> -SUMMARY =3D "X.Org X server -- ATI Radeon video driver"
> -
> -DESCRIPTION =3D "Open-source X.org graphics driver for ATI Radeon graphi=
cs"
> -
> -DEPENDS +=3D "virtual/libx11 libxvmc drm \
> -            virtual/libgl xorgproto libpciaccess"
> -
> -inherit features_check
> -REQUIRED_DISTRO_FEATURES +=3D "opengl"
> -
> -SRC_URI +=3D "file://0001-Fix-link-failure-with-gcc-10.patch \
> -            file://0001-ati-cleanup-terminology-to-use-primary-secondary=
.patch \
> -           "
> -SRC_URI[sha256sum] =3D "659f5a1629eea5f5334d9b39b18e6807a63aa1efa33c1236=
d9cc53acbb223c49"
> -
> -#EXTRA_OECONF +=3D "--disable-glamor"
> -
> -RDEPENDS:${PN} +=3D "xserver-xorg-module-exa"
> -RRECOMMENDS:${PN} +=3D "linux-firmware-radeon"
> -
> -FILES:${PN} +=3D "${datadir}/X11"
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_git.bb b=
/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_git.bb
> new file mode 100644
> index 000000000..5131f4614
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_git.bb
> @@ -0,0 +1,43 @@
> +require recipes-graphics/xorg-driver/xorg-driver-video.inc
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Daabff1606551f9461ccf567739af6=
3dc"
> +
> +SUMMARY =3D "X.Org X server -- ATI Radeon video driver"
> +
> +DESCRIPTION =3D "Open-source X.org graphics driver for ATI Radeon graphi=
cs"
> +
> +DEPENDS +=3D "virtual/libx11 libxvmc drm \
> +            virtual/libgl xorgproto libpciaccess"
> +
> +inherit features_check
> +
> +REQUIRED_DISTRO_FEATURES +=3D "opengl"
> +
> +SRC_URI =3D "git://git@gitlab.freedesktop.org/xorg/driver/xf86-video-ati=
.git;branch=3Dmaster"
> +SRCREV =3D "5eba006e4129e8015b822f9e1d2f1e613e252cda"
> +
> +SRC_URI[sha256sum] =3D "659f5a1629eea5f5334d9b39b18e6807a63aa1efa33c1236=
d9cc53acbb223c49"
> +
> +PV =3D "19.1.0+git${SRCPV}"
> +
> +S =3D "${WORKDIR}/git"
> +
> +PACKAGECONFIG ??=3D "udev"
> +PACKAGECONFIG[udev] =3D "--enable-udev,--disable-udev,udev"
> +PACKAGECONFIG[glamor] =3D "--enable-glamor,--disable-glamor"
> +
> +RDEPENDS:${PN}:append =3D "\
> +    ${@bb.utils.contains('PACKAGECONFIG', 'glamor', 'libegl', '', d)} \
> +    mesa-driver-radeon \
> +    mesa-driver-radeonsi \
> +    mesa-driver-swrast \
> +    xserver-xorg-extension-glx \
> +    xserver-xorg-module-exa \
> +"
> +
> +RRECOMMENDS:${PN} +=3D "linux-firmware-radeon"
> +
> +PACKAGES =3D+ "${PN}-config"
> +
> +FILES:${PN}-config =3D "${datadir}/X11/xorg.conf.d"
> +FILES:${PN} +=3D "${datadir}/X11"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95974): https://lists.openembedded.org/g/openembedded=
-devel/message/95974
> Mute This Topic: https://lists.openembedded.org/mt/89769364/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

