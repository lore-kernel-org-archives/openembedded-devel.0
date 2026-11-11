Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2714.1794426861918947182
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 11:54:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=l8vpZg4X;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b3541bb1a2so22509917b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 11:54:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794426861; cv=none;
        d=google.com; s=arc-20260327;
        b=KT3nr4GQag/BsH2/u0J9jZ1N89VgfamQjeLLp2fqsIRYAREGqOGrTCrltH3IdypIiT
         xKKf385IKRT9fTeTUuOTGjpIIKPXUq/qgCDkGWrIb5jpFeBplOezPo7HrG5PTZMGo7Ds
         VkIbjUYtv0YE2TluQq7RgeNGCwT6VeXSryP9I28aH2sGiKrq//bDj9KMihzB1QptWNuk
         veqFKLGi1Wx+bqyLQkwGVlzMb38mIczvLmZxtgbyrhxLeHZXwwFfQu2OwnYAJiSbn4G8
         3PzDKHWWtJn9od5CaaM3KqmN1Cfp+YMKP+q86M5VDo1RQig3PyIKZCV+BHC0v9ihMaxp
         fs0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CzcXTqGycOlaRv/KMlFODs4ahPIB6Nycte5rl+YPlFg=;
        fh=GrsJcsure4nQHKC4m8YYTt+X8+N7dUl41eQSU5SYvoI=;
        b=lDN2NrbSFpnqqgCCgW6o24I1HH7ah2R5/Yah008M2JC3smkTizCMKqa3c4rprrsg9j
         DPIe1U1Wf9aQWdW0LWNhIjJg5kXWxiPLpNeLHp0sHgEyKvAlJpxsLwWTca1HTXdyouAg
         5mwXN0okpnY65yynIlcWqHvHH+jvs0Da40kxSg0V5FuonxsyV0+XTvc4FL1BYO+urKrJ
         zVEPlVmFtTSHI78RIoh/+RSXtOrdv4JvH/hOW8QCujwowNuiYnfkXHw2FhI2Ul3c4bmB
         ZNXFdt3JlNlGJCDfAMftjYlFxwk5/9BYAKNYBG0jwHq+fs80fa6kVUW7Jf4jDtxxySAg
         Hk+A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794426861; x=1795031661; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CzcXTqGycOlaRv/KMlFODs4ahPIB6Nycte5rl+YPlFg=;
        b=l8vpZg4XECvK58q2mSYM01ToiB9ZKiINLDRZNbZ43wnHtcugjxzfPo+LbodI9V57vT
         gTsggxQqZmPJgJoTZ2a/IzzcMxdwAolSeR5EOLH/bWKSNf7NyHqTzgz6eJQcdG7w7ecr
         qwdBve5aWmI1WNLsmZMtkz7lTjftP2U/+hFKsnCCjwpvootILEa0AbzOvSGyBIin3PjT
         4i1Ki/Q6Bq90/z3XB4iUCc71MFkhizJN6RcJlZrT5UsIeh4qMidTNkIZ9Nbn6Kmhoyog
         gQrCt0dDtAUVD5G/XIpVIIs3UIteMOr7HnWstGPQNIgqJMJIedbaP77d7vbGpDcx28T/
         1H9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426861; x=1795031661;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CzcXTqGycOlaRv/KMlFODs4ahPIB6Nycte5rl+YPlFg=;
        b=YROBIU/i0RixBFEpJASkRrj3fcnRExpCzFMOCUU480Qgl331IraYZeQVZBrwcF+V0L
         UfEtD/EOb7JclxhiGwmQSIapkQ/TKjS0IF78kEeq8kRCqHnMfvuBgh4zMA8GnXcBvDN8
         B7AXmoLNGD0hWYN6phPMekesc74swwZtZgoUyTQwGJldhGYdfT927mrYK6mbpCHsMds4
         rSaVzHGbGMtrI7DxQ28G6AlI4Yj9dlDb5WA86GOqvCUm/tMisw2bKx40BmXy/QF/GQvD
         5yktUTPQdjbTIxAcGsze60222aHXykkm/mY2JQ1dYvUyup/+jCuN0SzRf/SrGxIu3wsS
         kOZA==
X-Gm-Message-State: APuU4Z+OJ+h+9Nhgs/t9LZslAQcTRO8D0S5qxAJDJU91bWahYuiFMTL1
	psfC8/SuZ4CsXB8x9fb99hfh/Rl/FSRiq5I1uQo1HGNkLmaDwRpGbN/MQfzQJZX0cw9iPxzhNMA
	hO4IB4OSnJEtcgbDX3jG+ootTZNbSULc=
X-Gm-Gg: AYBFou1JQGgzcPf3pby+yznZZgNhk+YMg+o9zTSBqoupJQqICj2+MeG4d9UPB4sYwDi
	9yQSiN/7bjrnRDfJK2klexE+XHO3wJXmTno4INo2SubSXGknsjeUvNd++zhF8zzvoQ+YL7GpAIg
	4/pmggArwgLB4NA5QjpvWRDxlGUhA7gTbpIOTBf3IrRtrdqpqBnQBbtAN8Z5cmOn2C3xHithy9B
	ieEXGaV+MOuYH0nmOgLAdjcIrrqThW8QBMfY+x2DA7rDESpdpQIsHPV9d3QvILK2ZneJBuOOtko
	do9xBfGVvFmS/As7xNHt0JT85sOpVZfNJB0x90a4gGPxSjxT6VyI74FRbNxic+vwS1FSQ54oK+G
	onUBthG+kFIA5+TuFycppjTDJ0dcf5S4SjHUgOXVpB+EKTn9c83QC/XZlcOfBi7k9F+n7GUTpzS
	A0q9iTHline8ebM5Vak0CSyUOnWpGqp6pGPHA7JYMZuD0AjOm9horyHUTXZlwlKjb9ncSpAHHzP
	QE1Mr1hZ7beQ8NVZd5iwczBty3oKJx0fpEM7oe4SNzZABOJdqz/R5HjokNrxJQM38yRbsbFTO5e
	uX4e5Anhb3rAb1/3Y/NeJdo/YdL35xEdl7WPPyLgJkV8Fpe0o9wF2ds4EFvCGQktPGPZa6FNXQL
	IkSV9wIgDst+X2hXWClq+24QPzAAKNxSh1b8Q5RQ8hGA=
X-Received: by 2002:a05:690c:d8c:b0:8b0:a7d5:8595 with SMTP id
 00721157ae682-8b3a80f91abmr20038737b3.51.1794426860895; Wed, 11 Nov 2026
 11:54:20 -0800 (PST)
MIME-Version: 1.0
References: <20261111172826.1584415-1-kshakir@las-colo41-d19-20.qualcomm.com>
In-Reply-To: <20261111172826.1584415-1-kshakir@las-colo41-d19-20.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Nov 2026 11:53:54 -0800
X-Gm-Features: AclHuK-PaY9LtmQUnpqEGREoZEXaXDo2hbYZoZdfnNHjRu_NSWQoiezyZylySvw
Message-ID: <CAMKF1sqH85NA4bsEr9T+spY7h=MNuL5qNwAR0dSwQS6cJ=hfgA@mail.gmail.com>
Subject: Re: [oe] [PATCH] docker-moby: preserve gids during docker exec
To: kshakir@las-colo41-d19-20.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org, bruce.ashfield@gmail.com, 
	Kemal Rasim Sh <kshakir@qti.qualcomm.com>
Content-Type: multipart/alternative; boundary="0000000000009e82c60660058f05"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 19:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132135

--0000000000009e82c60660058f05
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Wrong ML, please send it to meta-virtualization@lists.yoctoproject.org

On Wed, Nov 11, 2026 at 10:22=E2=80=AFAM Kemal Rasim Sh via openembedded-de=
vel
<kshakir=3Dlas-colo41-d19-20.qualcomm.com@lists.openembedded.org> wrote:

> From: Kemal Rasim Sh <kshakir@qti.qualcomm.com>
>
> Processes started with docker exec do not inherit all
> supplemental groups assigned to the container when it was
> created.
>
> When OCI additionalGids are injected through CDI or other
> OCI runtime modifications, the container init process
> receives the groups correctly. However, docker exec rebuilds
> user credentials and drops the original additionalGids from
> the OCI process specification.
>
> As a result, exec'd processes may lose access to devices and
> resources granted through supplemental group membership,
> leading to inconsistent behavior within the same container.
>
> Preserve and merge the original OCI additionalGids into the
> exec process specification so that groups assigned during
> container creation remain available to docker exec
> processes.
>
> Before:
>
>   docker exec <container> cat /proc/self/status | grep Groups
>   Groups: 15 44 1000
>
> After:
>
>   docker exec <container> cat /proc/self/status | grep Groups
>   Groups: 15 44 981 987 992 993 999 1000
>
> Signed-off-by: Kemal Rasim Sh <kshakir@qti.qualcomm.com>
> ---
>  recipes-containers/docker/docker-moby_git.bb  |  1 +
>  ...preserve-OCI-additionalGids-for-exec.patch | 61 +++++++++++++++++++
>  2 files changed, 62 insertions(+)
>  create mode 100644
> recipes-containers/docker/files/0002-daemon-preserve-OCI-additionalGids-f=
or-exec.patch
>
> diff --git a/recipes-containers/docker/docker-moby_git.bb
> b/recipes-containers/docker/docker-moby_git.bb
> index 271f006e..eafe7a35 100644
> --- a/recipes-containers/docker/docker-moby_git.bb
> +++ b/recipes-containers/docker/docker-moby_git.bb
> @@ -54,6 +54,7 @@ SRC_URI =3D "\
>          file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patc=
h
> \
>
>  file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=3Dsrc/import =
\
>
>  file://0001-check-config-make-CONFIG_MEMCG_SWAP-conditional.patch;patchd=
ir=3Dsrc/import
> \
> +
> file://0002-daemon-preserve-OCI-additionalGids-for-exec.patch;patchdir=3D=
src/import
> \
>         "
>
>  DOCKER_COMMIT =3D "${SRCREV_moby}"
> diff --git
> a/recipes-containers/docker/files/0002-daemon-preserve-OCI-additionalGids=
-for-exec.patch
> b/recipes-containers/docker/files/0002-daemon-preserve-OCI-additionalGids=
-for-exec.patch
> new file mode 100644
> index 00000000..8c5c5102
> --- /dev/null
> +++
> b/recipes-containers/docker/files/0002-daemon-preserve-OCI-additionalGids=
-for-exec.patch
> @@ -0,0 +1,61 @@
> +From 6a21aad6ca4fd964672fbf54dd409650a1e05110 Mon Sep 17 00:00:00 2001
> +From: Kemal Rasim Sh <kshakir@qti.qualcomm.com>
> +Date: Fri, 30 Oct 2026 09:02:24 +0200
> +Subject: [PATCH] daemon: preserve OCI additionalGids for exec processes
> +
> +docker exec rebuilds user credentials using WithUser() and
> +WithAdditionalGIDs(), which causes OCI Process.User.AdditionalGids
> +defined during container creation to be lost.
> +
> +Preserve and merge the container's original AdditionalGids into the
> +exec process specification so that supplemental groups injected by CDI
> +or other OCI spec modifications remain available to exec sessions.
> +
> +Fixes a discrepancy where the container init process receives CDI
> +additionalGids but processes started through docker exec do not.
> +
> +Upstream-Status: Submitted [https://github.com/moby/moby/pull/54104]
> +
> +Signed-off-by: Kemal Rasim Sh <kshakir@qti.qualcomm.com>
> +---
> + daemon/exec_linux.go | 20 ++++++++++++++++++++
> + 1 file changed, 20 insertions(+)
> +
> +diff --git a/daemon/exec_linux.go b/daemon/exec_linux.go
> +index 2d2f3d82f0999..014ab2f41c1b9 100644
> +--- a/daemon/exec_linux.go
> ++++ b/daemon/exec_linux.go
> +@@ -27,6 +27,11 @@ func getUserFromContainerd(ctx context.Context,
> containerdCli *containerd.Client
> +               return specs.User{}, err
> +       }
> +
> ++      // Preserve OCI additional groups from container creation.
> ++      inheritedGids :=3D append(
> ++              []uint32(nil),
> ++              spec.Process.User.AdditionalGids...,)
> ++
> +       opts :=3D []coci.SpecOpts{
> +               coci.WithUser(ec.User),
> +               coci.WithAdditionalGIDs(ec.User),
> +@@ -38,6 +43,21 @@ func getUserFromContainerd(ctx context.Context,
> containerdCli *containerd.Client
> +               }
> +       }
> +
> ++      // Merge inherited OCI groups.
> ++      existing :=3D map[uint32]struct{}{}
> ++
> ++      for _, gid :=3D range spec.Process.User.AdditionalGids {
> ++              existing[gid] =3D struct{}{}
> ++      }
> ++
> ++      for _, gid :=3D range inheritedGids {
> ++              if _, ok :=3D existing[gid]; !ok {
> ++                      spec.Process.User.AdditionalGids =3D append(
> ++                              spec.Process.User.AdditionalGids,
> ++                              gid,)
> ++              }
> ++      }
> ++
> +       return spec.Process.User, nil
> + }
> +
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#132134):
> https://lists.openembedded.org/g/openembedded-devel/message/132134
> Mute This Topic: https://lists.openembedded.org/mt/122216875/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009e82c60660058f05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Wrong ML, please send it to <a href=3D"mailto:meta-virtual=
ization@lists.yoctoproject.org">meta-virtualization@lists.yoctoproject.org<=
/a><br></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Nov 11, 2026 at 10:22=E2=80=AFAM Kema=
l Rasim Sh via openembedded-devel &lt;kshakir=3D<a href=3D"mailto:las-colo4=
1-d19-20.qualcomm.com@lists.openembedded.org">las-colo41-d19-20.qualcomm.co=
m@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">From: Kemal Rasim Sh &lt;<a href=3D"mailto:kshakir@=
qti.qualcomm.com" target=3D"_blank">kshakir@qti.qualcomm.com</a>&gt;<br>
<br>
Processes started with docker exec do not inherit all<br>
supplemental groups assigned to the container when it was<br>
created.<br>
<br>
When OCI additionalGids are injected through CDI or other<br>
OCI runtime modifications, the container init process<br>
receives the groups correctly. However, docker exec rebuilds<br>
user credentials and drops the original additionalGids from<br>
the OCI process specification.<br>
<br>
As a result, exec&#39;d processes may lose access to devices and<br>
resources granted through supplemental group membership,<br>
leading to inconsistent behavior within the same container.<br>
<br>
Preserve and merge the original OCI additionalGids into the<br>
exec process specification so that groups assigned during<br>
container creation remain available to docker exec<br>
processes.<br>
<br>
Before:<br>
<br>
=C2=A0 docker exec &lt;container&gt; cat /proc/self/status | grep Groups<br=
>
=C2=A0 Groups: 15 44 1000<br>
<br>
After:<br>
<br>
=C2=A0 docker exec &lt;container&gt; cat /proc/self/status | grep Groups<br=
>
=C2=A0 Groups: 15 44 981 987 992 993 999 1000<br>
<br>
Signed-off-by: Kemal Rasim Sh &lt;<a href=3D"mailto:kshakir@qti.qualcomm.co=
m" target=3D"_blank">kshakir@qti.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a>=C2=A0 |=C2=A0 1 +<=
br>
=C2=A0...preserve-OCI-additionalGids-for-exec.patch | 61 ++++++++++++++++++=
+<br>
=C2=A02 files changed, 62 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/docker/files/0002-daemon-preser=
ve-OCI-additionalGids-for-exec.patch<br>
<br>
diff --git a/recipes-containers/docker/<a href=3D"http://docker-moby_git.bb=
" rel=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a> b/recipes-con=
tainers/docker/<a href=3D"http://docker-moby_git.bb" rel=3D"noreferrer" tar=
get=3D"_blank">docker-moby_git.bb</a><br>
index 271f006e..eafe7a35 100644<br>
--- a/recipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a><br>
+++ b/recipes-containers/docker/<a href=3D"http://docker-moby_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker-moby_git.bb</a><br>
@@ -54,6 +54,7 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-cli-use-external-GO111MODULE-=
and-cross-compiler.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-dynbinary-use-go-cross-compil=
er.patch;patchdir=3Dsrc/import \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-check-config-make-CONFIG_MEMC=
G_SWAP-conditional.patch;patchdir=3Dsrc/import \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-daemon-preserve-OCI-additionalGids=
-for-exec.patch;patchdir=3Dsrc/import \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0DOCKER_COMMIT =3D &quot;${SRCREV_moby}&quot;<br>
diff --git a/recipes-containers/docker/files/0002-daemon-preserve-OCI-addit=
ionalGids-for-exec.patch b/recipes-containers/docker/files/0002-daemon-pres=
erve-OCI-additionalGids-for-exec.patch<br>
new file mode 100644<br>
index 00000000..8c5c5102<br>
--- /dev/null<br>
+++ b/recipes-containers/docker/files/0002-daemon-preserve-OCI-additionalGi=
ds-for-exec.patch<br>
@@ -0,0 +1,61 @@<br>
+From 6a21aad6ca4fd964672fbf54dd409650a1e05110 Mon Sep 17 00:00:00 2001<br>
+From: Kemal Rasim Sh &lt;<a href=3D"mailto:kshakir@qti.qualcomm.com" targe=
t=3D"_blank">kshakir@qti.qualcomm.com</a>&gt;<br>
+Date: Fri, 30 Oct 2026 09:02:24 +0200<br>
+Subject: [PATCH] daemon: preserve OCI additionalGids for exec processes<br=
>
+<br>
+docker exec rebuilds user credentials using WithUser() and<br>
+WithAdditionalGIDs(), which causes OCI Process.User.AdditionalGids<br>
+defined during container creation to be lost.<br>
+<br>
+Preserve and merge the container&#39;s original AdditionalGids into the<br=
>
+exec process specification so that supplemental groups injected by CDI<br>
+or other OCI spec modifications remain available to exec sessions.<br>
+<br>
+Fixes a discrepancy where the container init process receives CDI<br>
+additionalGids but processes started through docker exec do not.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/moby/moby/pull/5=
4104" rel=3D"noreferrer" target=3D"_blank">https://github.com/moby/moby/pul=
l/54104</a>]<br>
+<br>
+Signed-off-by: Kemal Rasim Sh &lt;<a href=3D"mailto:kshakir@qti.qualcomm.c=
om" target=3D"_blank">kshakir@qti.qualcomm.com</a>&gt;<br>
+---<br>
+ daemon/exec_linux.go | 20 ++++++++++++++++++++<br>
+ 1 file changed, 20 insertions(+)<br>
+<br>
+diff --git a/daemon/exec_linux.go b/daemon/exec_linux.go<br>
+index 2d2f3d82f0999..014ab2f41c1b9 100644<br>
+--- a/daemon/exec_linux.go<br>
++++ b/daemon/exec_linux.go<br>
+@@ -27,6 +27,11 @@ func getUserFromContainerd(ctx context.Context, contain=
erdCli *containerd.Client<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return specs.User{}=
, err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 // Preserve OCI additional groups from container cre=
ation.<br>
++=C2=A0 =C2=A0 =C2=A0 inheritedGids :=3D append(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 []uint32(nil),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spec.Process.User.Additi=
onalGids...,)<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0opts :=3D []coci.SpecOpts{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0coci.WithUser(ec.Us=
er),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0coci.WithAdditional=
GIDs(ec.User),<br>
+@@ -38,6 +43,21 @@ func getUserFromContainerd(ctx context.Context, contain=
erdCli *containerd.Client<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 // Merge inherited OCI groups.<br>
++=C2=A0 =C2=A0 =C2=A0 existing :=3D map[uint32]struct{}{}<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 for _, gid :=3D range spec.Process.User.AdditionalGi=
ds {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 existing[gid] =3D struct=
{}{}<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 for _, gid :=3D range inheritedGids {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if _, ok :=3D existing[g=
id]; !ok {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 spec.Process.User.AdditionalGids =3D append(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spec.Process.User.AdditionalGids,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gid,)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return spec.Process.User, nil<br>
+ }<br>
+ <br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#132134): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/132134" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/132134</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122216875/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122216875/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000009e82c60660058f05--
