Return-Path: <lluis.campos@northern.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93DEE69E85
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 18:33:17 +0000 (UTC)
Subject: scarthgap libp11 do_patch error
To: openembedded-devel@lists.openembedded.org
From: "Lluis Campos" <lluis.campos@northern.tech>
X-Originating-Location: Oslo, Oslo County, NO (51.175.133.95)
X-Originating-Platform: Linux Firefox 133
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 02 Dec 2024 10:33:10 -0800
Message-ID: <yGmq.1733164390454452906.yuka@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="daxXEbkCr8Gj0hvnNRKr"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Dec 2024 18:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114142

--daxXEbkCr8Gj0hvnNRKr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

We recently stumble into an error in do_patch for libp11. It seems like the=
 following commit is the culprit:
* https://git.openembedded.org/meta-openembedded/commit/?h=3Dscarthgap&id=
=3Daed7003e72db4536c264d60daa41f949306aee8a

Error message follows:
ERROR: libp11-0.4.12-r0 do_patch: Applying patch '0001-detect-correct-opens=
sl-3.x.patch' on target directory '/.../tmp/work/core2-64-poky-linux/libp11=
/0.4.12/git'
CmdError('quilt --quiltrc /.../tmp/work/core2-64-poky-linux/libp11/0.4.12/r=
ecipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-det=
ect-correct-openssl-3.x.patch
patching file configure.ac
Hunk #1 FAILED at 33.
1 out of 1 hunk FAILED -- rejects in file configure.ac
Patch 0001-detect-correct-openssl-3.x.patch does not apply (enforce with -f=
)
stderr: ')

Anyone that can help?

Thanks,

Lluis

--daxXEbkCr8Gj0hvnNRKr
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello,</div>
<div>&nbsp;</div>
<div>We recently stumble into an error in do_patch for libp11. It seems lik=
e the following commit is the culprit:</div>
<div>* <a href=3D"https://git.openembedded.org/meta-openembedded/commit/?h=
=3Dscarthgap&amp;id=3Daed7003e72db4536c264d60daa41f949306aee8a" target=3D"_=
blank" rel=3D"noopener">https://git.openembedded.org/meta-openembedded/comm=
it/?h=3Dscarthgap&amp;id=3Daed7003e72db4536c264d60daa41f949306aee8a</a></di=
v>
<div>&nbsp;</div>
<div>Error message follows:</div>
<div>
<div>ERROR: libp11-0.4.12-r0 do_patch: Applying patch '0001-detect-correct-=
openssl-3.x.patch' on target directory '/.../tmp/work/core2-64-poky-linux/l=
ibp11/0.4.12/git'<br />CmdError('quilt --quiltrc /.../tmp/work/core2-64-pok=
y-linux/libp11/0.4.12/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: =
Applying patch 0001-detect-correct-openssl-3.x.patch<br />patching file con=
figure.ac<br />Hunk #1 FAILED at 33.<br />1 out of 1 hunk FAILED -- rejects=
 in file configure.ac<br />Patch 0001-detect-correct-openssl-3.x.patch does=
 not apply (enforce with -f)</div>
<div>stderr: ')</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Anyone that can help?</div>
<div>&nbsp;</div>
<div>Thanks,</div>
<div>&nbsp;</div>
<div>Lluis</div>
</div>

--daxXEbkCr8Gj0hvnNRKr--

