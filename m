Return-Path: <toertel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E13CD4F47
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 18:33:44 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2044.1779042822762881528
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 11:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jG8Oyk2g;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: toertel@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8b4298d271fso39852606d6.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 11:33:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779042822; cv=none;
        d=google.com; s=arc-20240605;
        b=IfxafD4fjdVRidmvHb/40YkUUHh1K4M7MSZ16pv5aNUgFpTqycwKv+m7HqU9L2Nou9
         ahW4A6aSQVPk+UzmfIjV89mOIhhG9KG+ax2wiz7zsTbxtKuePMAE1BWDO+vHniCqyrrL
         SHWlMHajxEKq3qoMln/Udym0O8BeSEQ5LdsimxR+N5ci7j2pTQBboaIpD4Y2mzFsSR5A
         qSMNbzXwLz+I4xjKqst7Y79IW+c/vvjWDQsfGf61fHaMPtebL65+ztI3ha+TbgfN1eLi
         O6OsMrx5fnfFB5i+lAI9qQO9RAzLkrMIK8EAc6/4dawrCdpDL3yizK/Rw7U9tQ3RhpEa
         WeDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3b2jGJgG8NCQQBW0t/L96NY1UR/Vaa6fM80bVY+Cj8w=;
        fh=ppDu5lENFy+wt7sBClt9ToB0e70L62hmebRnJUoy2lI=;
        b=Vo4kLhv4FbxMLGtvRAGnZlTE5G3kQUVGzL8rhwo9El7FQlLLc4/bR0EUcP9kzf7i8z
         /gUeVRx702HciHY173Vku131eQrcNfRMwdeqxzwlPvHjY2lG8TEAGV+jdssdwCXEwdp2
         +NSn4TsTJX3QovBUp0qYbnuwKogrIU5UZPu4nWVI4GSyF4am52pBeUb4hT62SqqyYbvQ
         JruSvY8KMQO9v2lxvph9exjfBI8SOD33sBLwJiBPUtmmIKlYM+ZP29Dk3RF+WP+ih+vc
         AeWvt/+PSV1+uvqpTtg9zP6QZNr2xSYRIomHobGY0UWgMWOKD2CMjh0KFfNPICTsdSMj
         QIOQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779042822; x=1779647622; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3b2jGJgG8NCQQBW0t/L96NY1UR/Vaa6fM80bVY+Cj8w=;
        b=jG8Oyk2gHxbiqjqGAIlqH4mKYfJj7gQsfnIcrgshijhQXakBAbZx0YIlwq4L4MyDAK
         Jqu6BUZEXjix7/5UJpeXBdorz7EaPPv6cxAARI34+SVuvfHlGIP2RltFl1Cfc3Cr4B+6
         x36IyidzX+AfUCcxhgJ8M2Ew45MHzrt3PzqZ+fgxzNt4mv6j7xtHOQhMIpnz7RZ7cd3Q
         l/uvdkuhDk/KdCKDXsSVgDlv4DldBQfM40qCSuY2CxLXfwwnPaaOeyg486qyDpERtPzL
         UmwbaJ9n6Xc+NIWqUU9wiuKzpTd/iVLYFogwb2msFKnnaO5WCXZKciErvBjvQd/klC1R
         apdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779042822; x=1779647622;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3b2jGJgG8NCQQBW0t/L96NY1UR/Vaa6fM80bVY+Cj8w=;
        b=bLJttC+qw9k1DZQIIFMk6po6dCSITAkN/ytCJZBK0FBf8OVIkkz7Vtj6A7VIutBIrl
         5h2sEqMEf+/nFMQBOtz0aGdgPVMy17yUvKfBAWRjtuaR6oLAmLPjR4tcF3VNjOhYrOEq
         kqQgiyN9bdZ/ghOoWvTJCd45Scp2kb7sdRonIKSOTHc17R0HE99ZJXYQPkxGIBdoYo2l
         JD8o9YJ72DQE23Vj+VB4Qyq5GznybFRjz4iPuJrwWYyz/0pAME5jtsZWZVlmbnE1qDm3
         uEOwps5ixk5W1sYbUUhAl9wjdJAmKksj6VJjAMeTStOPyi+7uaUhoOrbJPsBeoyWisX8
         oarw==
X-Gm-Message-State: AOJu0Yxlm+9uvg4Z0VKePDyaZ87oARL+CzCZMqDd2zwmZEvFN8ECfkbf
	h7ZiexqrKrpHxQgjz4HsUAahnoxnTCV2id+OUu6A6St5ONyOJ3b/IdE7i7ITQkphEW1f9TyYV53
	75TiEore94AtuIbN/RwNmWQUVGRninCBQHKkG
X-Gm-Gg: Acq92OEtk0EncGk1s0hI7/IEAHiW9y1Zh8DxYdMnfqHz2od23Dfzz2pfz8ZXq1HrQUM
	2l0D4jmwY1gQsmbsSMU8n1OKrQAm7aq0opHLtBY8AEmFdJwAsLF1bTGNqWulUYCaqqcWUne8sDl
	zPSVYgxyUbJ8QGnM4Cq7hiEate4ZuLlW/+qbenGv7uZYu/7KPBe+gDWMSFLznP56N1ZIXL+2eyy
	rik+wOvo4wa3A9EVf2py8ZgZA4gqgCdHfbNFTMdOh3rMUynk6KM2Fk8az2uv2dzN7aAHMrOHoPV
	c0+tfQGuOt/W0lpWEiDwe9b7uHLK1K495Hr6
X-Received: by 2002:a05:6214:230c:b0:8ca:164c:a84f with SMTP id
 6a1803df08f44-8ca164caa84mr191849356d6.32.1779042821736; Sun, 17 May 2026
 11:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <18B062264B4E9032.2823970@lists.openembedded.org>
In-Reply-To: <18B062264B4E9032.2823970@lists.openembedded.org>
From: Mark Jonas <toertel@gmail.com>
Date: Sun, 17 May 2026 20:33:31 +0200
X-Gm-Features: AVHnY4LJNjX7HmIkfBxWFD6RDRQQBmgF9YbnS67euHeIwXqeUjTswq9Wbp76Lho
Message-ID: <CAEE5dN1KW=OnLQmNiQcfx2dO1FDHh_QCpBB0Zn2Yp+uA9W8bnw@mail.gmail.com>
Subject: Re: [oe] libsdl2 and libsdl2-net regressions on Wrynose
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: f_l_k@t-online.de, Khem Raj <raj.khem@gmail.com>, 
	Ricardo Ungerer <ungerer.ricardo@gmail.com>, jester@theyoctojester.info
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 18:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127044

Hi,

> While updating my meta-doom layer for Wrynose I stumbled over two
> libsdl2 and one libsdl2-net regression. I'm not sending patches yet
> because I am struggling with my QEMU setup. Still, I would like to
> give early feedback and potentially collect some feedback.
>
> For reasons I still have to investigate I cannot boot my images on
> QEMU. The booting starts but I never get to a login prompt. It freezes
> somewhere in the boot process after printing "Booting the kernel
> (entry offset: 0x000...ba0).".

I was able to resolve the boot problem with QEMU. After removing
IMAGE_INSTALL:qemux86-64:append = " kernel-module-snd-intel8x0"
the image now boots. Why that froze the boot is still a mystery to me.

Thanks to this finding I was able to verify that my AI assisted fix to the
DirectFB renderer of libsdl2 works. I can see Doom running.

It will now take me some days to prepare proper patches for OE and
libsdl2 upstream. In the meantime I would still be happy for feedback
regarding the way I am fixing the issues.

> ### 1 ###
>
> Between Kirkstone / Scarthgap and Wrynose the libsdl2 directfb
> renderer was broken by forgetting to adapt it to internal API changes.
> I hotfixed the problem using a coding assistant. It compiles now but I
> still need to verify that it also runs properly.
>
> libsdl2: Patch directfb compilation error
> https://gitlab.com/toertel/meta-doom/-/commit/3b75e8692e41e4a6bd47ad8616a725a469caf41c
>
> ### 2 ###
>
> Another libsdl2 regression (worked in Kirkstone and Scarthgap) is that
> /usr/lib/pkgconfig/sdl2.pc now contains a buildpath of DirectFB. I
> fixed that by mending sdl2.pc after do_install.
>
> ERROR: libsdl2-2.32.10-r0 do_package_qa: QA Issue: File
> /usr/lib/pkgconfig/sdl2.pc in package libsdl2-dev contains reference
> to TMPDIR [buildpaths]
> ERROR: libsdl2-2.32.10-r0 do_package_qa: Fatal QA errors were found,
> failing task.
>
> Before:
> Cflags: -I${includedir} -I${includedir}/SDL2
> -I/home/toertel/projects/yocto/build_wrynose/tmp/work/x86-64-v3-poky-linux/libsdl2/2.32.10/recipe-sysroot/usr/include/directfb
> -D_REENTRANT -D_REENTRANT
>
> After:
> Cflags: -I${includedir} -I${includedir}/SDL2  -I${includedir}/directfb
> -D_REENTRANT -D_REENTRANT
>
> libsdl2: Fix packaging QA issue in sdl2.pc
> https://gitlab.com/toertel/meta-doom/-/commit/2dc01101a9e5d050ee7330631012de21719f813b
>
> ### 3 ###
>
> Finally, when doing the build configuration (chocolate-doom) I ran
> into the problem that SDL2_net.pc is not installed by libsdl-net.
> Again, this regression came in between Kirkstone / Scarthgap and
> Wrynose. I fixed that by backporting a patch from libsdl2-net 2.4.0.
>
> | checking for SDL2_net >= 2.0.0... no
> | configure: error: Package requirements (SDL2_net >= 2.0.0) were not met:
> |
> | Package 'SDL2_net' not found
>
> libsdl2-net: Ensure that SDL2_net.pc is always installed
> https://gitlab.com/toertel/meta-doom/-/commit/5699206aec5b360c96266921f4427b596e44cdea

Cheers,
Mark

