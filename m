Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63EEFD26D9F
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 21:38:02 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21016.1767994682104098581
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 13:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CSnBeedL;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7c75fc222c3so2432784a34.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 13:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767994681; x=1768599481; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xeSiLart9ek8Z/Fx/GLeXX4HBVQMneHdCvdeKExhXdA=;
        b=CSnBeedLiB0qx28fCvjbN2fPYGU3sX7+ceqk808TubH1E5LNiS5U/PVftGpPFem80I
         wyqC9fWhEg89je/DKNosoh8jd5i9PoyhOJ1ck3b1jIZqxCRajZS55WVFfA+CT+Pq0uO5
         lulNnQlD6vzmq4M9Xg1pkwWq4xvLL8uWF4dnoYpuB/vrJ7kZ3hSX9YfNWjlQtvwHycDx
         fjF4mmIFmXCGlKohJm1oB52LSnyJPRY/t6zaxyT33JOy59C7UiAfQP7XQeb1PqwEWnec
         x4veBHK0tKQ74zUg64euhAA7qfDe6aj0x5F9i8LCWJx52XtpG3JaD/PMyxD9eFG8zN+i
         VxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767994681; x=1768599481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xeSiLart9ek8Z/Fx/GLeXX4HBVQMneHdCvdeKExhXdA=;
        b=hoKGKiXR0vYSIujEfWKi37KhXP1mITNkA1N/YUcnO6VY/gGWlUMKAquv/DVHgqkLNc
         n5Ojfeh0RzDd+ZDE6cY/x4BxeW0M9Hu7cAnqQe5KNr4jHngJ9y4ydo68evi8riUWV4IO
         r2jS2qm4kRpCiYKO8pzjSbIlRYOOwCVGdFNB3GTWYPq1sXEspoTWSGPtJilcABMkj04b
         p+XeZ/t4uM0xGzEXm8iwqP56a6okizsj1teBlwOOXtIv7jSwEJraJDiVUWASvHw+0/kj
         hK0ie7mH/GcofU9MlGpwjSczfxkogntDKcJxNPmxsN22zZ5AG8stMez7K0EBa5tLb8yB
         n0Xw==
X-Gm-Message-State: AOJu0Yz+PxMmD0GoVSlo+gDg6hm+NSq5yGZnR4sarGPy0jgaS/0plBat
	v7X2eW3bChHHpyL/lK99YoBn8wZNpNB2KXoyyIOJTvTHRPx6vNRfbtkOorrw9KAPH8+xhuRQO5A
	n3aizvBqRzupqq3lD3rxvGbaF7NpVcYw=
X-Gm-Gg: AY/fxX4cz1vnugSDc1nZGnjKcZf1TskSLyd8L3lfyYLe3fB8gMV/Verjg/8gFhe/4aw
	PD0vnPVaZIaaYxPCHqSzgxR7Uk1JZIoi8lsZuvCRkGLf0uHHJZa9fW+I1py/+8HMxVVn6z1867u
	uNkfSZwrpljo52bcv3fYHBKM5Iy2VmIVXMThbZgCg3Dxzrq9C77zLUc0q1kb+97xlsNxI24shN+
	XC3PgBzVzOMSUXqLCN0QAkFWsseXJRg8pCXA9gRMkEz8FLd5urzM20XEp/NzFSfeiBNyBwZ
X-Google-Smtp-Source: AGHT+IFW7WTJo/vqaQthKwZzq8y/ZB27id5RbyultuVtaFg/qXUwK66Ho4Lp8QEl/g28jLzVGncQNnb5A4wOgHyz3XE=
X-Received: by 2002:a05:6808:17a1:b0:443:4144:ca09 with SMTP id
 5614622812f47-45a6bd0eca1mr4832932b6e.16.1767994681220; Fri, 09 Jan 2026
 13:38:01 -0800 (PST)
MIME-Version: 1.0
References: <20260109092843.1924568-1-ankur.tyagi85@gmail.com> <b6bebb8b-4db8-49cc-a9a4-50a853e4a478@gmail.com>
In-Reply-To: <b6bebb8b-4db8-49cc-a9a4-50a853e4a478@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 10 Jan 2026 10:37:49 +1300
X-Gm-Features: AQt7F2rO2rqFevyNgjsHDMbA-G9GhwSCentO6hE6vJOVPrfIg67-wJ2vICMDsXk
Message-ID: <CADySD0FYdXCcgicvzebshofOKM=BFrn3W+Jg2EEKUtovV=vYeg@mail.gmail.com>
Subject: Re: [oe][meta-networking][scarthgap][PATCH 01/12] cifs-utils: patch CVE-2025-2312
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 21:38:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123312

On Fri, Jan 9, 2026 at 11:47=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.c=
om> wrote:
>
> This patch needs a bit of caution, because it requires kernel 6.13 at
> least, without it it has not effect. The required kernel change[1] was
> not backported to older stable versions (both Scarthgap and Kirkstone
> are out of luck with the default kernel).
>
> Not saying the patch should be dropped, rather that CVE tag in the patch
> will mark is patched, but it's only half of the fix. Not sure what (if
> anything at all) should be done about this.
>
> [1]:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/fs/smb?id=3Ddb363b0a1d9e6b9dc556296f1b1007aeb496a8cf

Thanks Gyorgy, I overlooked that aspect.
It will be misleading to mark CVE tag as patched when vulnerability
still exists.

I am in favor of dropping this patch.

>
> On 1/9/26 10:28, Ankur Tyagi via lists.openembedded.org wrote:
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > Details: https://nvd.nist.gov/vuln/detail/CVE-2025-2312
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  .../cifs/cifs-utils/CVE-2025-2312.patch       | 136 ++++++++++++++++++
> >  .../recipes-support/cifs/cifs-utils_7.0.bb    |   4 +-
> >  2 files changed, 139 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-networking/recipes-support/cifs/cifs-utils/CVE=
-2025-2312.patch
> >
> > diff --git a/meta-networking/recipes-support/cifs/cifs-utils/CVE-2025-2=
312.patch b/meta-networking/recipes-support/cifs/cifs-utils/CVE-2025-2312.p=
atch
> > new file mode 100644
> > index 0000000000..3e62b0f1c3
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/cifs/cifs-utils/CVE-2025-2312.pat=
ch
> > @@ -0,0 +1,136 @@
> > +From faf6ce0abd6fbca95721eb88754add9c0c700a5c Mon Sep 17 00:00:00 2001
> > +From: Ritvik Budhiraja <rbudhiraja@microsoft.com>
> > +Date: Tue, 19 Nov 2024 06:07:58 +0000
> > +Subject: [PATCH] CIFS.upcall to accomodate new namespace mount opt
> > +
> > +NOTE: This patch is dependent on one of the previously sent patches:
> > +[PATCH] CIFS: New mount option for cifs.upcall namespace resolution
> > +which introduces a new mount option called upcall_target, to
> > +customise the upcall behaviour.
> > +
> > +Building upon the above patch, the following patch adds functionality
> > +to handle upcall_target as a mount option in cifs.upcall. It can have =
2 values -
> > +mount, app.
> > +Having this new mount option allows the mount command to specify where=
 the
> > +upcall should happen: 'mount' for resolving the upcall to the host
> > +namespace, and 'app' for resolving the upcall to the ns of the calling
> > +thread. This will enable both the scenarios where the Kerberos credent=
ials
> > +can be found on the application namespace or the host namespace to whi=
ch
> > +just the mount operation is "delegated".
> > +This aids use cases like Kubernetes where the mount
> > +happens on behalf of the application in another container altogether.
> > +
> > +Signed-off-by: Ritvik Budhiraja <rbudhiraja@microsoft.com>
> > +Signed-off-by: Steve French <stfrench@microsoft.com>
> > +
> > +CVE: CVE-2025-2312
> > +Upstream-Status: Backport [https://git.samba.org/?p=3Dcifs-utils.git;a=
=3Dcommit;h=3D89b679228cc1be9739d54203d28289b03352c174]
> > +(cherry picked from commit 89b679228cc1be9739d54203d28289b03352c174)
> > +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > +---
> > + cifs.upcall.c | 55 +++++++++++++++++++++++++++++++++++++++++++-------=
-
> > + 1 file changed, 47 insertions(+), 8 deletions(-)
> > +
> > +diff --git a/cifs.upcall.c b/cifs.upcall.c
> > +index 52c0328..0883afa 100644
> > +--- a/cifs.upcall.c
> > ++++ b/cifs.upcall.c
> > +@@ -953,6 +953,13 @@ struct decoded_args {
> > + #define MAX_USERNAME_SIZE 256
> > +     char username[MAX_USERNAME_SIZE + 1];
> > +
> > ++#define MAX_UPCALL_STRING_LEN 6 /* "mount\0" */
> > ++    enum upcall_target_enum {
> > ++            UPTARGET_UNSPECIFIED, /* not specified, defaults to app *=
/
> > ++            UPTARGET_MOUNT, /* upcall to the mount namespace */
> > ++            UPTARGET_APP, /* upcall to the application namespace whic=
h did the mount */
> > ++    } upcall_target;
> > ++
> > +     uid_t uid;
> > +     uid_t creduid;
> > +     pid_t pid;
> > +@@ -969,6 +976,7 @@ struct decoded_args {
> > + #define DKD_HAVE_PID                0x20
> > + #define DKD_HAVE_CREDUID    0x40
> > + #define DKD_HAVE_USERNAME   0x80
> > ++#define DKD_HAVE_UPCALL_TARGET      0x100
> > + #define DKD_MUSTHAVE_SET (DKD_HAVE_HOSTNAME|DKD_HAVE_VERSION|DKD_HAVE=
_SEC)
> > +     int have;
> > + };
> > +@@ -979,6 +987,7 @@ __decode_key_description(const char *desc, struct =
decoded_args *arg)
> > +     size_t len;
> > +     char *pos;
> > +     const char *tkn =3D desc;
> > ++    arg->upcall_target =3D UPTARGET_UNSPECIFIED;
> > +
> > +     do {
> > +             pos =3D index(tkn, ';');
> > +@@ -1077,6 +1086,31 @@ __decode_key_description(const char *desc, stru=
ct decoded_args *arg)
> > +                     }
> > +                     arg->have |=3D DKD_HAVE_VERSION;
> > +                     syslog(LOG_DEBUG, "ver=3D%d", arg->ver);
> > ++            } else if (strncmp(tkn, "upcall_target=3D", 14) =3D=3D 0)=
 {
> > ++                    if (pos =3D=3D NULL)
> > ++                            len =3D strlen(tkn);
> > ++                    else
> > ++                            len =3D pos - tkn;
> > ++
> > ++                    len -=3D 14;
> > ++                    if (len > MAX_UPCALL_STRING_LEN) {
> > ++                            syslog(LOG_ERR, "upcall_target=3D value t=
oo long for buffer");
> > ++                            return 1;
> > ++                    }
> > ++                    if (strncmp(tkn + 14, "mount", 5) =3D=3D 0) {
> > ++                            arg->upcall_target =3D UPTARGET_MOUNT;
> > ++                            syslog(LOG_DEBUG, "upcall_target=3Dmount"=
);
> > ++                    } else if (strncmp(tkn + 14, "app", 3) =3D=3D 0) =
{
> > ++                            arg->upcall_target =3D UPTARGET_APP;
> > ++                            syslog(LOG_DEBUG, "upcall_target=3Dapp");
> > ++                    } else {
> > ++                            // Should never happen
> > ++                            syslog(LOG_ERR, "Invalid upcall_target va=
lue: %s, defaulting to app",
> > ++                                   tkn + 14);
> > ++                            arg->upcall_target =3D UPTARGET_APP;
> > ++                            syslog(LOG_DEBUG, "upcall_target=3Dapp");
> > ++                    }
> > ++                    arg->have |=3D DKD_HAVE_UPCALL_TARGET;
> > +             }
> > +             if (pos =3D=3D NULL)
> > +                     break;
> > +@@ -1440,15 +1474,20 @@ int main(const int argc, char *const argv[])
> > +      * acceptably in containers, because we'll be looking at the corr=
ect
> > +      * filesystem and have the correct network configuration.
> > +      */
> > +-    rc =3D switch_to_process_ns(arg->pid);
> > +-    if (rc =3D=3D -1) {
> > +-            syslog(LOG_ERR, "unable to switch to process namespace: %=
s", strerror(errno));
> > +-            rc =3D 1;
> > +-            goto out;
> > ++    if (arg->upcall_target =3D=3D UPTARGET_APP || arg->upcall_target =
=3D=3D UPTARGET_UNSPECIFIED) {
> > ++            syslog(LOG_INFO, "upcall_target=3Dapp, switching namespac=
es to application thread");
> > ++            rc =3D switch_to_process_ns(arg->pid);
> > ++            if (rc =3D=3D -1) {
> > ++                    syslog(LOG_ERR, "unable to switch to process name=
space: %s", strerror(errno));
> > ++                    rc =3D 1;
> > ++                    goto out;
> > ++            }
> > ++            if (trim_capabilities(env_probe))
> > ++                    goto out;
> > ++    } else {
> > ++            syslog(LOG_INFO, "upcall_target=3Dmount, not switching na=
mespaces to application thread");
> > +     }
> > +
> > +-    if (trim_capabilities(env_probe))
> > +-            goto out;
> > +
> > +     /*
> > +      * The kernel doesn't pass down the gid, so we resort here to scr=
aping
> > +@@ -1495,7 +1534,7 @@ int main(const int argc, char *const argv[])
> > +      * look at the environ file.
> > +      */
> > +     env_cachename =3D
> > +-            get_cachename_from_process_env(env_probe ? arg->pid : 0);
> > ++            get_cachename_from_process_env((env_probe && (arg->upcall=
_target =3D=3D UPTARGET_APP)) ? arg->pid : 0);
> > +
> > +     rc =3D setuid(uid);
> > +     if (rc =3D=3D -1) {
> > diff --git a/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb b/m=
eta-networking/recipes-support/cifs/cifs-utils_7.0.bb
> > index c78bbae7b8..4e27491bba 100644
> > --- a/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb
> > +++ b/meta-networking/recipes-support/cifs/cifs-utils_7.0.bb
> > @@ -5,7 +5,9 @@ LICENSE =3D "GPL-3.0-only & LGPL-3.0-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47f=
ae504"
> >
> >  SRCREV =3D "316522036133d44ed02cd39ed2748e2b59c85b30"
> > -SRC_URI =3D "git://git.samba.org/cifs-utils.git;branch=3Dmaster"
> > +SRC_URI =3D "git://git.samba.org/cifs-utils.git;branch=3Dmaster \
> > +           file://CVE-2025-2312.patch \
> > +"
> >
> >  S =3D "${WORKDIR}/git"
> >  DEPENDS +=3D "libtalloc"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#123279): https://lists.openembedded.org/g/openembed=
ded-devel/message/123279
> > Mute This Topic: https://lists.openembedded.org/mt/117172363/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

