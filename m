Return-Path: <ashishkumar.mishra@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34ABFCCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 10:22:36 +0000 (UTC)
Subject: Whats the standard macro for "${WORKDIR}/sources" in master branch
To: openembedded-devel@lists.openembedded.org
From: "AshishKumar Mishra" <ashishkumar.mishra@bmwtechworks.in>
X-Originating-Location: Bengaluru, Karnataka, IN (106.222.202.125)
X-Originating-Platform: Windows Chrome 142
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 30 Oct 2025 03:22:32 -0700
Message-ID: <aylY.1761819752207315631.fowC@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="CRc3dP4F0YAxCSsy6XPQ"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 10:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121204

--CRc3dP4F0YAxCSsy6XPQ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Team ,

We used to have the file added via SRC_URI in well known macro relative to =
${WORKDIR} & have standard macro's
But in master the files are placed under *"${WORKDIR}/sources"*
Example for imagemagick:
P=3D"imagemagick-7.1.2-5"
S=3D"/mnt/addon-drive/00-upstream/master/build/tmp/work/x86-64-v3-poky-linu=
x/imagemagick/7.1.2-5/sources/imagemagick-7.1.2-5"
WORKDIR=3D"/mnt/addon-drive/00-upstream/master/build/tmp/work/x86-64-v3-pok=
y-linux/imagemagick/7.1.2-5"

00-upstream/master/build : ls -al 00-upstream/master/build/tmp/work/x86-64-=
v3-poky-linux */imagemagick/7.1.2-5/sources/*
total 20
drwxr-xr-x =C2=A03 bti-001003 domain users 4096 Oct 30 15:08 .
drwxr-xr-x 20 bti-001003 domain users 4096 Oct 30 15:29 ..
drwxr-xr-x 22 bti-001003 domain users 4096 Oct 30 15:08 *imagemagick-7.1.2-=
5*
-rwxr-xr-x =C2=A01 bti-001003 domain users 3679 Oct 30 15:07 *imagemagick-p=
test.sh*
-rw-r--r-- =C2=A01 bti-001003 domain users =C2=A0962 Oct 29 17:50 *run-ptes=
t*

so in recipe we have to make use either of :
- ${S}/ *..* /run-ptest
- ${WORKDIR}/ *sources* /run-ptest

i am naturally aligned for approach (b) from above
a) But wanted to check what's the preferred way from community ?
b) Or if we have any standard macro for ${WORKDIR}/sources to be=C2=A0 used=
 in recipe
c) Or if members are expecting a new macro to be created ?

Thanks ,
Ashish Kumar Mishra

--CRc3dP4F0YAxCSsy6XPQ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Team ,&nbsp;</div>
<div>&nbsp;</div>
<div>We used to have the file added via SRC_URI in well known macro relativ=
e to ${WORKDIR} &amp; have standard macro's&nbsp;</div>
<div>But in master the files are placed under <span style=3D"text-decoratio=
n: underline;"><strong>"${WORKDIR}/sources"</strong></span></div>
<div>Example for imagemagick:<br />
<div>P=3D"imagemagick-7.1.2-5"<br />S=3D"/mnt/addon-drive/00-upstream/maste=
r/build/tmp/work/x86-64-v3-poky-linux/imagemagick/7.1.2-5/sources/imagemagi=
ck-7.1.2-5"<br />WORKDIR=3D"/mnt/addon-drive/00-upstream/master/build/tmp/w=
ork/x86-64-v3-poky-linux/imagemagick/7.1.2-5"</div>
<div>&nbsp;</div>
<div>00-upstream/master/build : ls -al 00-upstream/master/build/tmp/work/x8=
6-64-v3-poky-linux<strong>/imagemagick/7.1.2-5/sources/</strong><br />total=
 20<br />drwxr-xr-x &nbsp;3 bti-001003 domain users 4096 Oct 30 15:08 .<br =
/>drwxr-xr-x 20 bti-001003 domain users 4096 Oct 30 15:29 ..<br />drwxr-xr-=
x 22 bti-001003 domain users 4096 Oct 30 15:08 <strong>imagemagick-7.1.2-5<=
/strong><br />-rwxr-xr-x &nbsp;1 bti-001003 domain users 3679 Oct 30 15:07<=
strong> imagemagick-ptest.sh</strong><br />-rw-r--r-- &nbsp;1 bti-001003 do=
main users &nbsp;962 Oct 29 17:50 <strong>run-ptest</strong></div>
<div>&nbsp;</div>
<div>so in recipe we have to make use either of :</div>
<div>- ${S}/<span style=3D"text-decoration: underline;"><strong>..</strong>=
</span>/run-ptest<br />- ${WORKDIR}/<span style=3D"text-decoration: underli=
ne;"><strong>sources</strong></span>/run-ptest</div>
<div>&nbsp;</div>
<div>i am naturally aligned for approach (b) from above</div>
<div>a) But wanted to check what's the preferred way from community ?</div>
<div>b) Or if we have any standard macro for ${WORKDIR}/sources to be&nbsp;=
 used in recipe&nbsp;</div>
<div>c) Or if members are expecting a new macro to be created ?</div>
<div>&nbsp;</div>
<div>Thanks ,</div>
<div>Ashish Kumar Mishra&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
</div>

--CRc3dP4F0YAxCSsy6XPQ--

