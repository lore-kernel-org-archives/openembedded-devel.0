Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F71CA5FAD
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:48:53 +0000 (UTC)
Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1307.1790722124747446840
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pygg48sz;
 spf=pass (domain: gmail.com, ip: 74.125.224.168, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8a87fe69060so38086327b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:48:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790722124; cv=none;
        d=google.com; s=arc-20260327;
        b=BcLc4V4fRvycHR2EKFHnIS9jW4cHgSdCHv8ijon3+16qDkL4fVy2Cnbl5+Kqa12Oyr
         Nw3pbSbFhm6xoAnHM5ZYdrnMXbY1yerNsE1tXSWsI2SpLzY9JckygGp5j454fU9OH8Yo
         B4BmcL4Az9u5rKS/+AzU0Q6qLsNuL4OLTEHijEnSiGx0KFgR3cT5qrK04o6gPYQUMG8A
         XeIe6aoUTCWJ/E9sKtz3hvS3jYUrYJRTbX/wLfcU1kkbLvz3Kgcr4j2wLgteS1NygKTC
         1WFFZg2kHC8zupgLxrPLSxBT3ziub5xmGhjq8kcO5hPpcDVrKZFEH4M446BENgsaGWGW
         uIzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J5avVP6I7wmt2+WusM65onX46Mfa0p8oKBC53/APur0=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=jzHZdFscvWwkxI5NGteXEKtYmud8LlCDxTVFUg+jTM2fYlQS8O2tUUbFBNM4VymRJl
         vlLePmq3fJqPOxFBP8w72qGF4f7mBTUE05rPYd4begHq7/+DXY2RBwdwqBp/8ZjPtoaS
         D+8pmPo2qCkQMyPJEWabckDvF7cHiDG1Dg7z8qdK2hOCy0HqBm8D+nTaBqktF/5XC/Ye
         Nvl1RuaCm2u4RdJg5EvZKRNNavTIvOcuo/R8V3PWXUSK9ooXVg1HtXWLRd9N0Vvi/NeF
         qQrPqhXVIWVyi4M9jippyd8SDpf2JSY7l8nbT/g49yiT8EVrtQHscuJQViFSVlUaAi8X
         7YNg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722124; x=1791326924; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J5avVP6I7wmt2+WusM65onX46Mfa0p8oKBC53/APur0=;
        b=pygg48szc+7Rykt8QakQbWbDJoZu5HLbOS1ro/4bqu1bxBDPNkwNKTPFnsBC4ZC7HK
         PlhRSkawuD/qh1/tpGB2kLMmABE8EgM/Xcp+N8YpDZrhvRhzZ/NjjykD+CcYfQhZa5uI
         h4QYXdp3fqW1kcG3ibcjJY3SfddHFcRXPUEElecJdh+Fh/MSdKIoyFFjnkRldeQ/YBt+
         dQFvDqsQhbcAIDs7yShYjC/K+wmS/5kGP+tezlsfmZOsp+SKvBVEgMO+d9l1GfoSFHq/
         xZ0KovHfXLdzM9s2JrkHFcqhhjxnzUII9S5BWx66aSC91aw6IlB6AdG94ZDmP0c51jdc
         hm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722124; x=1791326924;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J5avVP6I7wmt2+WusM65onX46Mfa0p8oKBC53/APur0=;
        b=FT5/gYB6mCN/e+mG3UmQO4fEU3G+GMFTW4dtsaWZZk0NbbhSxd9ZyzpeJrmQ6t5CeD
         0aZ472ikJnHvrMVt5FUE9RiMhrZ0Bw7upa72d9DTZa/rqB59u38C5jWIzmgY3fPg5Wq3
         LKSsDB5xwDlhG51FnFSX8SbcNVjWSOCw54MSFDqvxqrA4eNFaGY/ayKEJytJrjBplZko
         dhXdq/xCvG4bOp1OacN2NwMx6YcFl6CT8jK1lmJbVv0qb+IW6CuAigzDguZ24APtkGrA
         sMqodROBU37jkjmyGNYTb6Bb9INLhpFTmatMQzlrxaVq5FSN96wh98T+6PLFyiGWvOkT
         22bQ==
X-Gm-Message-State: AFq9FYJFHrJNB5rtWM4Y/TpOGJC9wxMk5yQ+vBXxU12wsbDXdXbNzz72
	G1L3uiv1/DKXryrXEFg3eypY3oQ5gmx/iN0E9efwTA0ZxJ0EidrSE6Xkuk9ye2NRINBc18831od
	lBZWKNvB5rcfzJfKwVBBDE8uh3y/95Js=
X-Gm-Gg: AYBFou3O5fPZYxgsSoovAkoXywyUcuhZVhw7UWHPK06a5ArGiN3HNOd3hbyBiuiw1LU
	hMlc6NMVhhuiTQnhV9iU9pZJN9aLj5e96AQQEeVALAnD09fN7r9uucUrYtjuUeRxyhh6B2xe2qC
	GdrprQMqDx+uyykX1UFhanto9Nx4vGx0kvFDrCT346TYEetlJ7WaArRoAoicFyXMrQ/Q7ihWfFU
	bMA8zcfcbBPtb9CMABbANheRljoh4ksal/9fHJGyTY6dGaDOGVdO17ibsFsO6acwWQdZ6L5SUid
	a2avH+TJXCaVm4BivZGhGe9Jo/mR5lqDVie7GXmd7RGSC+uD2dYte0iEar1teyZjWSiNQyl38jw
	bGve/E5RlyVmnlHyNTGaUd3DpziVg6kE/A474NnJUHGG7K3nqbLFa1ZDuVi+wtNh/2D1c6RGCh3
	PKrlxc8q8ptbvgGIsnkqH68hEO8VJIvjDgmoZG92X6Y2ohmIPgjZ9Zco5ABx6n+NIKvRnqjD/7i
	TsqygV5Q4qrtrxDJ0WqPh/DH/Q4JAUnN4P3/PwWqm8OJIowhmn2YQq+L/VDvcKkIqEJbn8YZlP3
	u2/kjszn
X-Received: by 2002:a05:690c:c6ce:10b0:8aa:5af3:e420 with SMTP id
 00721157ae682-8ac14dffda7mr2723117b3.11.1790722123518; Tue, 29 Sep 2026
 15:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260929173728.6952-1-f_l_k@t-online.de>
In-Reply-To: <20260929173728.6952-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Sep 2026 15:48:16 -0700
X-Gm-Features: AclHuK9qjJkeC8IprCZvJrgalXS02MI8uaJvNchOoCnuJ6CH-PBZ6On6QYvU6J8
Message-ID: <CAMKF1sqmb2zERud6GLB3R9b-A5N=BM_rdNhueg6q+1PjJ0dXcQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] bmap-writer: honour ImageSize for the last block
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000105879065ca6fc36"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130487

--000000000000105879065ca6fc36
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

/quiltrc push', 1, 'stdout: Applying patch
0001-Honour-ImageSize-for-the-last-block.patch
patch: **** Only garbage was found in the patch input.
Patch 0001-Honour-ImageSize-for-the-last-block.patch does not apply
(enforce with -f)

stderr: ')

Also rebase it on master-next when you send fixed v2

On Tue, Sep 29, 2026 at 10:37=E2=80=AFAM Markus Volk via lists.openembedded=
.org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> Writing an image whose size is not a multiple of the bmap block size
> failed at its last block with "Image ended before the block map did",
> because every range was taken to end at (endBlock + 1) * BlockSize.
> Add a patch that reads ImageSize from the bmap and clamps the ranges to
> it.
>
> Tested by writing a wic image whose size ends 2048 bytes into its
> last 4 KiB block to an NVMe disk.
>
> AI-Generated: Uses Claude Code (Claude Fable 5.1)
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...-Honour-ImageSize-for-the-last-block.patch | 85 +++++++++++++++++++
>  .../bmap-writer/bmap-writer_1.0.5.bb          |  4 +-
>  2 files changed, 88 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-oe/recipes-support/bmap-writer/bmap-writer/0001-Honour-ImageSize-for=
-the-last-block.patch
>
> diff --git
> a/meta-oe/recipes-support/bmap-writer/bmap-writer/0001-Honour-ImageSize-f=
or-the-last-block.patch
> b/meta-oe/recipes-support/bmap-writer/bmap-writer/0001-Honour-ImageSize-f=
or-the-last-block.patch
> new file mode 100644
> index 0000000000..1943256d71
> --- /dev/null
> +++
> b/meta-oe/recipes-support/bmap-writer/bmap-writer/0001-Honour-ImageSize-f=
or-the-last-block.patch
> @@ -0,0 +1,85 @@
> +From e63a11dedcdece8b9b285485a86405fd258b37d8 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Tue, 29 Sep 2026 17:29:52 +0200
> +Subject: [PATCH] Honour ImageSize for the last block
> +
> +bmaptool records the exact image size in ImageSize, and the last block
> +of an image whose size is not a multiple of BlockSize is only partly
> +filled. Writing and verifying used (endBlock + 1) * BlockSize as the end
> +of every range, so the range containing that block asked for more bytes
> +than the image has and the write failed with "Image ended before the
> +block map did". Read ImageSize and clamp the end of each range to it.
> +
> +AI-Generated: Uses Claude Code (Claude Fable 5.1)
> +Upstream-Status: Pending
> +---
> + src/bmap.cpp         | 5 +++++
> + src/bmap.h           | 1 +
> + src/image_writer.cpp | 2 +-
> + src/main.cpp         | 2 +-
> + 4 files changed, 8 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/bmap.cpp b/src/bmap.cpp
> +index fabf2c2..0162ac0 100644
> +--- a/src/bmap.cpp
> ++++ b/src/bmap.cpp
> +@@ -135,6 +135,7 @@ int parseBMap(const std::string &filename, bmap_t&
> bmapData) {
> +         bmapData.bmapVersion =3D (version !=3D nullptr) ?
> trimWhitespace(version) : "unknown";
> +
> +         // Parse image information
> ++        bmapData.imageSize =3D requireChildUnsigned(p_root, "ImageSize"=
);
> +         bmapData.blocksTotal =3D requireChildUnsigned(p_root,
> "BlocksCount");
> +         bmapData.blocksMapped =3D requireChildUnsigned(p_root,
> "MappedBlocksCount");
> +         bmapData.blockSize =3D requireChildUnsigned(p_root, "BlockSize"=
);
> +@@ -200,6 +201,10 @@ int validateBmap(const bmap_t& bmap, uint64_t
> deviceSize) {
> +         if (bmap.blocksTotal =3D=3D 0) {
> +             throw BmapError("BMAP: BlocksCount must not be zero");
> +         }
> ++        if (bmap.imageSize > bmap.blocksTotal * bmap.blockSize ||
> ++            bmap.imageSize <=3D (bmap.blocksTotal - 1) * bmap.blockSize=
) {
> ++            throw BmapError("BMAP: ImageSize does not match BlocksCount
> and BlockSize");
> ++        }
> +         if (bmap.blocksMapped > bmap.blocksTotal) {
> +             throw BmapError("BMAP: MappedBlocksCount exceeds
> BlocksCount");
> +         }
> +diff --git a/src/bmap.h b/src/bmap.h
> +index cf6ff9d..98cb969 100644
> +--- a/src/bmap.h
> ++++ b/src/bmap.h
> +@@ -38,6 +38,7 @@ struct bmap_t {
> +     std::string checksumType;
> +     size_t blockSize =3D 0;
> +     size_t blocksTotal =3D 0;
> ++    size_t imageSize =3D 0;
> +     size_t blocksMapped =3D 0;
> +     std::string bmapVersion;
> +     std::string bmapChecksum;
> +diff --git a/src/image_writer.cpp b/src/image_writer.cpp
> +index bb802ea..f864151 100644
> +--- a/src/image_writer.cpp
> ++++ b/src/image_writer.cpp
> +@@ -177,7 +177,7 @@ int BmapWriteImage(int fd, const bmap_t &bmap, int
> dev_fd, const std::string &de
> +         for (const auto &range : bmap.ranges) {
> +             // validateBmap() has already proven that none of this can
> overflow.
> +             const size_t outStart =3D range.startBlock * bmap.blockSize=
;
> +-            const size_t outEnd =3D (range.endBlock + 1) * bmap.blockSi=
ze;
> ++            const size_t outEnd =3D std::min((range.endBlock + 1) *
> bmap.blockSize, bmap.imageSize);
> +             const size_t rangeSize =3D outEnd - outStart;
> +             const off_t writeOffset =3D static_cast<off_t>(outStart);
> +             size_t writtenSize =3D 0;
> +diff --git a/src/main.cpp b/src/main.cpp
> +index ca42c12..b8cbbc5 100644
> +--- a/src/main.cpp
> ++++ b/src/main.cpp
> +@@ -166,7 +166,7 @@ int main(int argc, char *argv[]) {
> +     FdGuard imageGuard(image_fd);
> +
> +     std::cout << "BMAP format version: " << bmap.bmapVersion <<
> std::endl;
> +-    std::cout << "Image size: " << (bmap.blocksTotal * bmap.blockSize)
> << " bytes" << std::endl;
> ++    std::cout << "Image size: " << bmap.imageSize << " bytes" <<
> std::endl;
> +     std::cout << "Block size: " << bmap.blockSize << " bytes" <<
> std::endl;
> +     std::cout << "Mapped blocks: " << bmap.blocksMapped << " out of " <=
<
> bmap.blocksTotal
> +               << " (" << std::fixed << std::setprecision(1)
> +--
> +2.55.0
> +
> diff --git a/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.5.bb
> b/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.5.bb
> index 160d1b7112..5d493f3122 100644
> --- a/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.5.bb
> +++ b/meta-oe/recipes-support/bmap-writer/bmap-writer_1.0.5.bb
> @@ -8,7 +8,9 @@ SECTION =3D "console/utils"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De49f4652534af377a713df3d9dec6=
0cb"
>
> -SRC_URI =3D "git://
> github.com/embetrix/${BPN};branch=3Dmaster;protocol=3Dhttps;tag=3D${PV}
> <http://github.com/embetrix/$%7BBPN%7D;branch=3Dmaster;protocol=3Dhttps;t=
ag=3D$%7BPV%7D>
> "
> +SRC_URI =3D "git://
> github.com/embetrix/${BPN};branch=3Dmaster;protocol=3Dhttps;tag=3D${PV}
> <http://github.com/embetrix/$%7BBPN%7D;branch=3Dmaster;protocol=3Dhttps;t=
ag=3D$%7BPV%7D>
> \
> +           file://0001-Honour-ImageSize-for-the-last-block.patch \
> +           "
>  SRCREV =3D "c7b1bec0f40217d17e315226552e461a4a816abc"
>
>  DEPENDS =3D "libtinyxml2 libarchive"
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130486):
> https://lists.openembedded.org/g/openembedded-devel/message/130486
> Mute This Topic: https://lists.openembedded.org/mt/121494426/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000105879065ca6fc36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">/quiltrc push&#39;, 1, &#39;stdout: Applying patch 0001-Ho=
nour-ImageSize-for-the-last-block.patch<br>patch: **** Only garbage was fou=
nd in the patch input.<br>Patch 0001-Honour-ImageSize-for-the-last-block.pa=
tch does not apply (enforce with -f)<br><br>stderr: &#39;)<div><br></div><d=
iv>Also rebase it on master-next when you send fixed v2</div></div><br><div=
 class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Tue, Sep 29, 2026 at 10:37=E2=80=AFAM Markus Volk via <a href=3D=
"http://lists.openembedded.org">lists.openembedded.org</a> &lt;f_l_k=3D<a h=
ref=3D"mailto:t-online.de@lists.openembedded.org">t-online.de@lists.openemb=
edded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Writing an image whose size is not a multiple of the bmap block =
size<br>
failed at its last block with &quot;Image ended before the block map did&qu=
ot;,<br>
because every range was taken to end at (endBlock + 1) * BlockSize.<br>
Add a patch that reads ImageSize from the bmap and clamps the ranges to<br>
it.<br>
<br>
Tested by writing a wic image whose size ends 2048 bytes into its<br>
last 4 KiB block to an NVMe disk.<br>
<br>
AI-Generated: Uses Claude Code (Claude Fable 5.1)<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0...-Honour-ImageSize-for-the-last-block.patch | 85 ++++++++++++++++++=
+<br>
=C2=A0.../bmap-writer/<a href=3D"http://bmap-writer_1.0.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">bmap-writer_1.0.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 4 +-<br>
=C2=A02 files changed, 88 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/bmap-writer/bmap-writer/00=
01-Honour-ImageSize-for-the-last-block.patch<br>
<br>
diff --git a/meta-oe/recipes-support/bmap-writer/bmap-writer/0001-Honour-Im=
ageSize-for-the-last-block.patch b/meta-oe/recipes-support/bmap-writer/bmap=
-writer/0001-Honour-ImageSize-for-the-last-block.patch<br>
new file mode 100644<br>
index 0000000000..1943256d71<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/bmap-writer/bmap-writer/0001-Honour-ImageSize=
-for-the-last-block.patch<br>
@@ -0,0 +1,85 @@<br>
+From e63a11dedcdece8b9b285485a86405fd258b37d8 Mon Sep 17 00:00:00 2001<br>
+From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blan=
k">f_l_k@t-online.de</a>&gt;<br>
+Date: Tue, 29 Sep 2026 17:29:52 +0200<br>
+Subject: [PATCH] Honour ImageSize for the last block<br>
+<br>
+bmaptool records the exact image size in ImageSize, and the last block<br>
+of an image whose size is not a multiple of BlockSize is only partly<br>
+filled. Writing and verifying used (endBlock + 1) * BlockSize as the end<b=
r>
+of every range, so the range containing that block asked for more bytes<br=
>
+than the image has and the write failed with &quot;Image ended before the<=
br>
+block map did&quot;. Read ImageSize and clamp the end of each range to it.=
<br>
+<br>
+AI-Generated: Uses Claude Code (Claude Fable 5.1)<br>
+Upstream-Status: Pending<br>
+---<br>
+ src/bmap.cpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 +++++<br>
+ src/bmap.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
+ src/image_writer.cpp | 2 +-<br>
+ src/main.cpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ 4 files changed, 8 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/src/bmap.cpp b/src/bmap.cpp<br>
+index fabf2c2..0162ac0 100644<br>
+--- a/src/bmap.cpp<br>
++++ b/src/bmap.cpp<br>
+@@ -135,6 +135,7 @@ int parseBMap(const std::string &amp;filename, bmap_t&=
amp; bmapData) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bmapData.bmapVersion =3D (version !=3D n=
ullptr) ? trimWhitespace(version) : &quot;unknown&quot;;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Parse image information<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 bmapData.imageSize =3D requireChildUnsigned(p=
_root, &quot;ImageSize&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bmapData.blocksTotal =3D requireChildUns=
igned(p_root, &quot;BlocksCount&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bmapData.blocksMapped =3D requireChildUn=
signed(p_root, &quot;MappedBlocksCount&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bmapData.blockSize =3D requireChildUnsig=
ned(p_root, &quot;BlockSize&quot;);<br>
+@@ -200,6 +201,10 @@ int validateBmap(const bmap_t&amp; bmap, uint64_t dev=
iceSize) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bmap.blocksTotal =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0throw BmapError(&quot;BMAP=
: BlocksCount must not be zero&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bmap.imageSize &gt; bmap.blocksTotal * bm=
ap.blockSize ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bmap.imageSize &lt;=3D (bmap.bl=
ocksTotal - 1) * bmap.blockSize) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 throw BmapError(&quot;BMAP: Ima=
geSize does not match BlocksCount and BlockSize&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bmap.blocksMapped &gt; bmap.blocksTo=
tal) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0throw BmapError(&quot;BMAP=
: MappedBlocksCount exceeds BlocksCount&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+diff --git a/src/bmap.h b/src/bmap.h<br>
+index cf6ff9d..98cb969 100644<br>
+--- a/src/bmap.h<br>
++++ b/src/bmap.h<br>
+@@ -38,6 +38,7 @@ struct bmap_t {<br>
+=C2=A0 =C2=A0 =C2=A0std::string checksumType;<br>
+=C2=A0 =C2=A0 =C2=A0size_t blockSize =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0size_t blocksTotal =3D 0;<br>
++=C2=A0 =C2=A0 size_t imageSize =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0size_t blocksMapped =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0std::string bmapVersion;<br>
+=C2=A0 =C2=A0 =C2=A0std::string bmapChecksum;<br>
+diff --git a/src/image_writer.cpp b/src/image_writer.cpp<br>
+index bb802ea..f864151 100644<br>
+--- a/src/image_writer.cpp<br>
++++ b/src/image_writer.cpp<br>
+@@ -177,7 +177,7 @@ int BmapWriteImage(int fd, const bmap_t &amp;bmap, int=
 dev_fd, const std::string &amp;de<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (const auto &amp;range : bmap.ranges=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// validateBmap() has alre=
ady proven that none of this can overflow.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const size_t outStart =3D =
range.startBlock * bmap.blockSize;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const size_t outEnd =3D (range.=
endBlock + 1) * bmap.blockSize;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const size_t outEnd =3D std::mi=
n((range.endBlock + 1) * bmap.blockSize, bmap.imageSize);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const size_t rangeSize =3D=
 outEnd - outStart;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const off_t writeOffset =
=3D static_cast&lt;off_t&gt;(outStart);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t writtenSize =3D 0;<=
br>
+diff --git a/src/main.cpp b/src/main.cpp<br>
+index ca42c12..b8cbbc5 100644<br>
+--- a/src/main.cpp<br>
++++ b/src/main.cpp<br>
+@@ -166,7 +166,7 @@ int main(int argc, char *argv[]) {<br>
+=C2=A0 =C2=A0 =C2=A0FdGuard imageGuard(image_fd);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0std::cout &lt;&lt; &quot;BMAP format version: &quot; &=
lt;&lt; bmap.bmapVersion &lt;&lt; std::endl;<br>
+-=C2=A0 =C2=A0 std::cout &lt;&lt; &quot;Image size: &quot; &lt;&lt; (bmap.=
blocksTotal * bmap.blockSize) &lt;&lt; &quot; bytes&quot; &lt;&lt; std::end=
l;<br>
++=C2=A0 =C2=A0 std::cout &lt;&lt; &quot;Image size: &quot; &lt;&lt; bmap.i=
mageSize &lt;&lt; &quot; bytes&quot; &lt;&lt; std::endl;<br>
+=C2=A0 =C2=A0 =C2=A0std::cout &lt;&lt; &quot;Block size: &quot; &lt;&lt; b=
map.blockSize &lt;&lt; &quot; bytes&quot; &lt;&lt; std::endl;<br>
+=C2=A0 =C2=A0 =C2=A0std::cout &lt;&lt; &quot;Mapped blocks: &quot; &lt;&lt=
; bmap.blocksMapped &lt;&lt; &quot; out of &quot; &lt;&lt; bmap.blocksTotal=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;&lt; &quot; (&q=
uot; &lt;&lt; std::fixed &lt;&lt; std::setprecision(1)<br>
+-- <br>
+2.55.0<br>
+<br>
diff --git a/meta-oe/recipes-support/bmap-writer/<a href=3D"http://bmap-wri=
ter_1.0.5.bb" rel=3D"noreferrer" target=3D"_blank">bmap-writer_1.0.5.bb</a>=
 b/meta-oe/recipes-support/bmap-writer/<a href=3D"http://bmap-writer_1.0.5.=
bb" rel=3D"noreferrer" target=3D"_blank">bmap-writer_1.0.5.bb</a><br>
index 160d1b7112..5d493f3122 100644<br>
--- a/meta-oe/recipes-support/bmap-writer/<a href=3D"http://bmap-writer_1.0=
.5.bb" rel=3D"noreferrer" target=3D"_blank">bmap-writer_1.0.5.bb</a><br>
+++ b/meta-oe/recipes-support/bmap-writer/<a href=3D"http://bmap-writer_1.0=
.5.bb" rel=3D"noreferrer" target=3D"_blank">bmap-writer_1.0.5.bb</a><br>
@@ -8,7 +8,9 @@ SECTION =3D &quot;console/utils&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-3.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De49f4652534af377a713d=
f3d9dec60cb&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/embetrix/$%7BBPN%7D;b=
ranch=3Dmaster;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferrer" target=
=3D"_blank">github.com/embetrix/${BPN};branch=3Dmaster;protocol=3Dhttps;tag=
=3D${PV}</a>&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/embetrix/$%7BBPN%7D;b=
ranch=3Dmaster;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferrer" target=
=3D"_blank">github.com/embetrix/${BPN};branch=3Dmaster;protocol=3Dhttps;tag=
=3D${PV}</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Honour-ImageSize-for-=
the-last-block.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRCREV =3D &quot;c7b1bec0f40217d17e315226552e461a4a816abc&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;libtinyxml2 libarchive&quot;<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130486): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130486" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130486</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121494426/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121494426/1997914</a><br>
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

--000000000000105879065ca6fc36--

