Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235E3C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 16:30:06 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.20056.1661185797107628068
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 09:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=koaG3shT;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id y15so6854834pfr.9
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 09:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=QdjA/Gf21+D0juFGKfUA4fZil+Cnu2bAV1MOf/BKVcE=;
        b=koaG3shTX2RXV+ECnPTtBGzIHUDSGa+GJSFQobJ2BCvRoMNIgLYrU1U4L4sWqUpdC+
         ZCMkPDhLbE511O+xTMI1VoahoH91Sjt6fN0p6KTilsnmcZLWyV9NnWJhxbEF34XgaE3F
         eNBnVYnJfv1BaPy9SIyvP+FQIBCUg2Gq0VFz3/lmyAeyFcm8n1Fsre3IO3DdsvZmNGym
         ugLETiRkQXm3wyA8TJA8yBhSjU57IWaYXy4jquh1+lvB3e6909yDxPH4S9zzQ6tsZCqu
         KoBflFYv7cW4mdAyp20IiSpWZJR8kkrb3UXCrABTF1ZQ7SKscwVogwMFXWGr7gtJhsij
         fAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=QdjA/Gf21+D0juFGKfUA4fZil+Cnu2bAV1MOf/BKVcE=;
        b=Arpwd5I/Y6AePmbcQF4AURrlbzbJoVlkGqTLdBaw3BOkdT0blJS0SGIqptALAE/UXb
         Cjf7WNw4yzxoS67Qr13MAaJF1mc9ue5qgX5DoCDlF1G7oaIJTnXZRQw9jH1SibLeFH6d
         dNuPbcI4mZjBNIYvcQxsrY0OXe7xOuCNLWzVo/zkowyAGXH6k7DJ5oWELs6FbDKcbCxM
         ffzpUyd4qft0xbtIlolbpvTC83EvFCMBGjpcMwjrDERO4YENylygzI1/hY5lSA/RN1q1
         ZnNoaRN21a7VKiKwd8SxDGYK/C7FXuzArgt13zceM3fhTexevTJsG7teKsMM0+IRImw2
         cMaA==
X-Gm-Message-State: ACgBeo30O6vfsyzqHRHFFFYQQMIJILduneyWdOrZUMl8OJVyf61ucnqi
	RWU0iZFUWCKbe/5rtvJZFaFQLhn8sMqRWY3qM9U=
X-Google-Smtp-Source: 
 AA6agR5UZ/3jfyrvR97OogJaVBbITTtYJzTgcu5Lfcu2AlBKriVrxAWLrKDItvpzcpYP2OmCU460tBx83WnuEufiR7I=
X-Received: by 2002:a63:d70c:0:b0:420:f9b6:9c3d with SMTP id
 d12-20020a63d70c000000b00420f9b69c3dmr17628754pgg.377.1661185796339; Mon, 22
 Aug 2022 09:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <170DA50147D7B733.9591@lists.openembedded.org>
In-Reply-To: <170DA50147D7B733.9591@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 22 Aug 2022 17:29:45 +0100
Message-ID: 
 <CANPvuRn8DQhynAHH=ZEe=4t9A5Y_jPxqJ05UrBh+yWwqXfmu=w@mail.gmail.com>
Subject: Re: [oe] [meta-networking][master][kirkstone][PATCH 1/2]
 wireguard-module: 1.0.20210219 -> 1.0.20210219
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Ricardo Salveti <ricardo@foundries.io>, daiane.angolini@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000004bff6805e6d6f53c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Aug 2022 16:30:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98371

--0000000000004bff6805e6d6f53c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am sorry but the commit title is wrong

-wireguard-module: 1.0.20210219 -> 1.0.20210219
+wireguard-module: 1.0.20210219 -> 1.0.20220627

I will send a v2

Jose

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia segunda, 22/08/2022 =C3=
=A0(s)
11:47:

> Also change the git protocol to https.
>
> Relevant changes:
> - 18fbcd6 version: bump
> - 3ec3e82 compat: handle backported rng and blake2s
> - ba45dd6 qemu: give up on RHEL8 in CI
> - c7560fd qemu: set panic_on_warn=3D1 from cmdline
> - 33c87a1 qemu: use vports on arm
> - 894152a netns: limit parallelism to $(nproc) tests at once
> - f888673 netns: make routing loop test non-fatal
> - f9d9b4d device: check for metadata_dst with skb_valid_dst()
> - f909532 qemu: enable ACPI for SMP
> - ec89ca6 socket: ignore v6 endpoints when ipv6 is disabled
> - fa32671 socket: free skb in send6 when ipv6 is disabled
> - ffb8cd6 qemu: simplify RNG seeding
> - 4eff63d queueing: use CFI-safe ptr_ring cleanup function
> - 273018b crypto: curve25519-x86_64: use in/out register constraints more
> precisely
> - 4f4c019 compat: drop Ubuntu 14.04
> - 743eef2 version: bump
> - 3c9f3b6 crypto: curve25519-x86_64: solve register constraints with
> reserved registers
> - 8e40dd6 compat: udp_tunnel: don't take reference to non-init namespace
> - ea6b8e7 compat: siphash: use _unaligned version by default
> - 5325bc8 ratelimiter: use kvcalloc() instead of kvzalloc()
> - e44c78c receive: drop handshakes if queue lock is contended
> - 5707d38 receive: use ring buffer for incoming handshakes
> - 68abb1b device: reset peer src endpoint when netns exits
> - ea3f5fb main: rename 'mod_init' & 'mod_exit' functions to be
> module-specific
> - cb001d4 netns: actually test for routing loops
> - 2715e64 compat: update for RHEL 8.5
> - 2974725 compat: account for grsecurity backports and changes
> - 50dda8c compat: account for latest c8s backports
> - d378f93 version: bump
> - fb4a0da qemu: increase default dmesg log size
> - 8f4414d qemu: add disgusting hacks for RHEL 8
> - fd7a462 allowedips: add missing __rcu annotation to satisfy sparse
> - 383461d allowedips: free empty intermediate nodes when removing single
> node
> - 03add82 allowedips: allocate nodes in kmem_cache
> - b56d48c allowedips: remove nodes in O(1)
> - 3c14c4b allowedips: initialize list head in selftest
> - 4d8b7ed peer: allocate in kmem_cache
> - 6fbc0e6 global: use synchronize_net rather than synchronize_rcu
> - 405caf0 kbuild: do not use -O3
> - b50ef4d netns: make sure rp_filter is disabled on vethc
> - e67b722 version: bump
> - 1edffe2 Revert "compat: skb_mark_not_on_list will be backported to
> Ubuntu 18.04"
> - 2cf9543 compat: update and improve detection of CentOS Stream 8
> - 122f06b compat: icmp_ndo_send functions were backported extensively
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  ...odule_1.0.20210219.bb =3D> wireguard-module_1.0.20220627.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-kernel/wireguard/{
> wireguard-module_1.0.20210219.bb =3D> wireguard-module_1.0.20220627.bb}
> (85%)
>
> diff --git a/meta-networking/recipes-kernel/wireguard/
> wireguard-module_1.0.20210219.bb
> b/meta-networking/recipes-kernel/wireguard/
> wireguard-module_1.0.20220627.bb
> similarity index 85%
> rename from meta-networking/recipes-kernel/wireguard/
> wireguard-module_1.0.20210219.bb
> rename to meta-networking/recipes-kernel/wireguard/
> wireguard-module_1.0.20220627.bb
> index ce2ba6552..d80bdd87a 100644
> --- a/meta-networking/recipes-kernel/wireguard/
> wireguard-module_1.0.20210219.bb
> +++ b/meta-networking/recipes-kernel/wireguard/
> wireguard-module_1.0.20220627.bb
> @@ -1,8 +1,8 @@
>  require wireguard.inc
>
> -SRCREV =3D "122f06bfd8fc7b06a0899fa9adc4ce8e06900d98"
> +SRCREV =3D "18fbcd68a35a892527345dc5679d0b2d860ee004"
>
> -SRC_URI =3D "git://git.zx2c4.com/wireguard-linux-compat;branch=3Dmaster"
> +SRC_URI =3D "git://
> git.zx2c4.com/wireguard-linux-compat;protocol=3Dhttps;branch=3Dmaster"
>
>  inherit module kernel-module-split
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98363):
> https://lists.openembedded.org/g/openembedded-devel/message/98363
> Mute This Topic: https://lists.openembedded.org/mt/93178353/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000004bff6805e6d6f53c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I am sorry but the commit title is wrong</div><div><b=
r></div><div>-wireguard-module: 1.0.20210219 -&gt; 1.0.20210219<br>+wiregua=
rd-module: 1.0.20210219 -&gt; 1.0.20220627<br></div><div><br></div><div>I w=
ill send a v2</div><div><br></div><div>Jose</div><div><br></div><div>Jose Q=
uaresma via <a href=3D"http://lists.openembedded.org">lists.openembedded.or=
g</a> &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.or=
g">gmail.com@lists.openembedded.org</a>&gt; escreveu no dia segunda, 22/08/=
2022 =C3=A0(s) 11:47:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Also change the git protocol to https.<br>
<br>
Relevant changes:<br>
- 18fbcd6 version: bump<br>
- 3ec3e82 compat: handle backported rng and blake2s<br>
- ba45dd6 qemu: give up on RHEL8 in CI<br>
- c7560fd qemu: set panic_on_warn=3D1 from cmdline<br>
- 33c87a1 qemu: use vports on arm<br>
- 894152a netns: limit parallelism to $(nproc) tests at once<br>
- f888673 netns: make routing loop test non-fatal<br>
- f9d9b4d device: check for metadata_dst with skb_valid_dst()<br>
- f909532 qemu: enable ACPI for SMP<br>
- ec89ca6 socket: ignore v6 endpoints when ipv6 is disabled<br>
- fa32671 socket: free skb in send6 when ipv6 is disabled<br>
- ffb8cd6 qemu: simplify RNG seeding<br>
- 4eff63d queueing: use CFI-safe ptr_ring cleanup function<br>
- 273018b crypto: curve25519-x86_64: use in/out register constraints more p=
recisely<br>
- 4f4c019 compat: drop Ubuntu 14.04<br>
- 743eef2 version: bump<br>
- 3c9f3b6 crypto: curve25519-x86_64: solve register constraints with reserv=
ed registers<br>
- 8e40dd6 compat: udp_tunnel: don&#39;t take reference to non-init namespac=
e<br>
- ea6b8e7 compat: siphash: use _unaligned version by default<br>
- 5325bc8 ratelimiter: use kvcalloc() instead of kvzalloc()<br>
- e44c78c receive: drop handshakes if queue lock is contended<br>
- 5707d38 receive: use ring buffer for incoming handshakes<br>
- 68abb1b device: reset peer src endpoint when netns exits<br>
- ea3f5fb main: rename &#39;mod_init&#39; &amp; &#39;mod_exit&#39; function=
s to be module-specific<br>
- cb001d4 netns: actually test for routing loops<br>
- 2715e64 compat: update for RHEL 8.5<br>
- 2974725 compat: account for grsecurity backports and changes<br>
- 50dda8c compat: account for latest c8s backports<br>
- d378f93 version: bump<br>
- fb4a0da qemu: increase default dmesg log size<br>
- 8f4414d qemu: add disgusting hacks for RHEL 8<br>
- fd7a462 allowedips: add missing __rcu annotation to satisfy sparse<br>
- 383461d allowedips: free empty intermediate nodes when removing single no=
de<br>
- 03add82 allowedips: allocate nodes in kmem_cache<br>
- b56d48c allowedips: remove nodes in O(1)<br>
- 3c14c4b allowedips: initialize list head in selftest<br>
- 4d8b7ed peer: allocate in kmem_cache<br>
- 6fbc0e6 global: use synchronize_net rather than synchronize_rcu<br>
- 405caf0 kbuild: do not use -O3<br>
- b50ef4d netns: make sure rp_filter is disabled on vethc<br>
- e67b722 version: bump<br>
- 1edffe2 Revert &quot;compat: skb_mark_not_on_list will be backported to U=
buntu 18.04&quot;<br>
- 2cf9543 compat: update and improve detection of CentOS Stream 8<br>
- 122f06b compat: icmp_ndo_send functions were backported extensively<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.=
io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://odule_1.0.20210219.bb" rel=3D"noreferrer" target=
=3D"_blank">odule_1.0.20210219.bb</a> =3D&gt; <a href=3D"http://wireguard-m=
odule_1.0.20220627.bb" rel=3D"noreferrer" target=3D"_blank">wireguard-modul=
e_1.0.20220627.bb</a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-networking/recipes-kernel/wireguard/{<a href=3D"http://wi=
reguard-module_1.0.20210219.bb" rel=3D"noreferrer" target=3D"_blank">wiregu=
ard-module_1.0.20210219.bb</a> =3D&gt; <a href=3D"http://wireguard-module_1=
.0.20220627.bb" rel=3D"noreferrer" target=3D"_blank">wireguard-module_1.0.2=
0220627.bb</a>} (85%)<br>
<br>
diff --git a/meta-networking/recipes-kernel/wireguard/<a href=3D"http://wir=
eguard-module_1.0.20210219.bb" rel=3D"noreferrer" target=3D"_blank">wiregua=
rd-module_1.0.20210219.bb</a> b/meta-networking/recipes-kernel/wireguard/<a=
 href=3D"http://wireguard-module_1.0.20220627.bb" rel=3D"noreferrer" target=
=3D"_blank">wireguard-module_1.0.20220627.bb</a><br>
similarity index 85%<br>
rename from meta-networking/recipes-kernel/wireguard/<a href=3D"http://wire=
guard-module_1.0.20210219.bb" rel=3D"noreferrer" target=3D"_blank">wireguar=
d-module_1.0.20210219.bb</a><br>
rename to meta-networking/recipes-kernel/wireguard/<a href=3D"http://wiregu=
ard-module_1.0.20220627.bb" rel=3D"noreferrer" target=3D"_blank">wireguard-=
module_1.0.20220627.bb</a><br>
index ce2ba6552..d80bdd87a 100644<br>
--- a/meta-networking/recipes-kernel/wireguard/<a href=3D"http://wireguard-=
module_1.0.20210219.bb" rel=3D"noreferrer" target=3D"_blank">wireguard-modu=
le_1.0.20210219.bb</a><br>
+++ b/meta-networking/recipes-kernel/wireguard/<a href=3D"http://wireguard-=
module_1.0.20220627.bb" rel=3D"noreferrer" target=3D"_blank">wireguard-modu=
le_1.0.20220627.bb</a><br>
@@ -1,8 +1,8 @@<br>
=C2=A0require wireguard.inc<br>
<br>
-SRCREV =3D &quot;122f06bfd8fc7b06a0899fa9adc4ce8e06900d98&quot;<br>
+SRCREV =3D &quot;18fbcd68a35a892527345dc5679d0b2d860ee004&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.zx2c4.com/wireguard-linux-co=
mpat;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git.zx2c4.com/wi=
reguard-linux-compat;branch=3Dmaster</a>&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.zx2c4.com/wireguard-linux-co=
mpat;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank"=
>git.zx2c4.com/wireguard-linux-compat;protocol=3Dhttps;branch=3Dmaster</a>&=
quot;<br>
<br>
=C2=A0inherit module kernel-module-split<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#98363): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/98363" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/98363</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93178353/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93178353/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000004bff6805e6d6f53c--

