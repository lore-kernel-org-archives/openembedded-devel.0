Return-Path: <eric.smith@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD57C61DB2
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 00:52:31 +0000 (UTC)
Subject: Using dracut to create an initramfs image via bitbake
To: openembedded-devel@lists.openembedded.org
From: eric.smith@oss.qualcomm.com
X-Originating-Location: Los Angeles, California, US (163.116.248.102)
X-Originating-Platform: Windows Chrome 136
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 10 Jun 2025 17:52:24 -0700
Message-ID: <1pXS.1749603144841364915.mHTW@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="KkLacgHQfmXkKeHWTpx2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jun 2025 00:52:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117880

--KkLacgHQfmXkKeHWTpx2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello OpenEmbedded developers,

I am curious if there's been discussion on trying to use dracut to build an=
 initramfs image via bitbake. To be clear, I mean running dracut on the bui=
ld host machine from a bitbake recipe, and having this dracut use files fro=
m the target image rootfs to build the initramfs.

Right now in meta-openembedded/meta-initramfs/recipes-devtools it looks lik=
e there's a dracut recipe to build dracut for the target arch, but no nativ=
e dracut recipe. So with the current dracut recipe, this dracut can only be=
 used from an architecture matching the target arch. This is not cross-comp=
atible.

There has been a recent improvement in dracut to enable a native dracut to =
work with cross-compiled binaries. See the merged patch that should go into=
 the next major dracut version 107 which replaces dracut's ldd usage - Pars=
e ELF .note.dlopen entries for dependencies, replace ldd for better cross s=
upport by chewi =C2=B7 Pull Request #1260 =C2=B7 dracut-ng/dracut-ng =C2=B7=
 GitHub ( https://github.com/dracut-ng/dracut-ng/pull/1260 )

If there's no active development on using the latest dracut to build an ini=
tramfs, I'd like to work on it. Specifically I want to create a dracut nati=
ve recipe and a dracut initramfs test image that uses the native dracut and=
 a machine image's rootfs to create an initramfs. I understand this work wo=
uld be dependent on a newer dracut that's not released yet.

What would be the testing expectations that I should run for my patches? Ru=
n testimage, as documented in the following? 4 Contributing Changes to a Co=
mponent =E2=80=94 The Yocto Project =C2=AE 5.2.999 documentation ( https://=
docs.yoctoproject.org/contributor-guide/submit-changes.html#test-your-chang=
es )

Thank you,
Eric

--KkLacgHQfmXkKeHWTpx2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello OpenEmbedded developers,</div>
<div>&nbsp;</div>
<div>I am curious if there's been discussion on trying to use dracut to bui=
ld an initramfs image via bitbake. To be clear, I mean running dracut on th=
e build host machine from a bitbake recipe, and having this dracut use file=
s from the target image rootfs to build the initramfs.</div>
<div>&nbsp;</div>
<div>Right now in meta-openembedded/meta-initramfs/recipes-devtools it look=
s like there's a dracut recipe to build dracut for the target arch, but no =
native dracut recipe. So with the current dracut recipe, this dracut can on=
ly be used from an architecture matching the target arch. This is not cross=
-compatible.</div>
<div>&nbsp;</div>
<div>There has been a recent improvement in dracut to enable a native dracu=
t to work with cross-compiled binaries. See the merged patch that should go=
 into the next major dracut version 107 which replaces dracut's ldd usage -=
 <a href=3D"https://github.com/dracut-ng/dracut-ng/pull/1260">Parse ELF .no=
te.dlopen entries for dependencies, replace ldd for better cross support by=
 chewi &middot; Pull Request #1260 &middot; dracut-ng/dracut-ng &middot; Gi=
tHub</a></div>
<div>&nbsp;</div>
<div>If there's no active development on using the latest dracut to build a=
n initramfs, I'd like to work on it. Specifically I want to create a dracut=
 native recipe and a dracut initramfs test image that uses the native dracu=
t and a machine image's rootfs to create an initramfs. I understand this wo=
rk would be dependent on a newer dracut that's not released yet.</div>
<div>&nbsp;</div>
<div>What would be the testing expectations that I should run for my patche=
s? Run testimage, as documented in the following? <a href=3D"https://docs.y=
octoproject.org/contributor-guide/submit-changes.html#test-your-changes">4 =
Contributing Changes to a Component &mdash; The Yocto Project &reg; 5.2.999=
 documentation</a></div>
<div>&nbsp;</div>
<div>Thank you,</div>
<div>Eric</div>

--KkLacgHQfmXkKeHWTpx2--

