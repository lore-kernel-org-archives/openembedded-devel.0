Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1Qea9t-0007oo-Fq
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 00:02:06 +0200
Received: by qwh5 with SMTP id 5so195975qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jul 2011 14:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=S1DYSvnMUiGkXa4XUlIs29c8KUwTKIJuotMDNDWpp8s=;
	b=GpNSC0ifi+XvG8psfa3k30UnjQhRMw0tIIFNCwQ3HMypKLp95pWtTGhF4zqi+amEw0
	WOX8EI6PLeAy6LDg6zLjc7HXjQJAXQEzdCSMlhFV5CH3EKlinvooa2YArrDeI7L1WlaL
	cH2KJAC/ndqvkDem2fS9z0D8fTfLIgjEGS0ng=
Received: by 10.229.57.129 with SMTP id c1mr75123qch.47.1309989340156; Wed, 06
	Jul 2011 14:55:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.215.206 with HTTP; Wed, 6 Jul 2011 14:55:20 -0700 (PDT)
In-Reply-To: <CACrTVgLG+DcK=p0G4D0sfVy44Dm0WnVrH+yf3u2241_DkNguhw@mail.gmail.com>
References: <CACrTVgKyLQ1UDqzUAcJACrsraPYfcOZf7c8HdfQOJsgTAx-r7A@mail.gmail.com>
	<201107061734.31202.GNUtoo@no-log.org>
	<CACrTVgJ6hYwz8bbJPowEN_jb5A+hd4vVr_T4qQONdtKd8gGv_g@mail.gmail.com>
	<CACrTVgLG+DcK=p0G4D0sfVy44Dm0WnVrH+yf3u2241_DkNguhw@mail.gmail.com>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Wed, 6 Jul 2011 23:55:20 +0200
Message-ID: <CACrTVgK1=Kmy-ZHXCreTWrizA=ihJTbJoXWO7ny-1=e6-ds6vg@mail.gmail.com>
To: "Denis 'GNUtoo' Carikli" <GNUtoo@no-log.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH-proposal] fix vlc building (-fPIC error) by patching live555 recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jul 2011 22:02:06 -0000
X-Groupsio-MsgNum: 33022
Content-Type: multipart/mixed; boundary=000e0cdf8e964794c104a76da98b

--000e0cdf8e964794c104a76da98b
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

ok sorry for the noise.. last time with INC_PR updated

From d8eaabb63088dc68b7bba3f5a6ac6a31e65a36e6 Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Sylvain=3D20'GarthPS'=3D20Par=3DC3=3DA9?=3D <sylvain.pare=
@gmail.com>
Date: Wed, 6 Jul 2011 23:53:42 +0200
Subject: [PATCH] live555 recipe: added -fPIC flag need by VLC to build with
live555 support
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Sylvain 'GarthPS' Par=E9 <sylvain.pare@gmail.com>
---
 recipes/live555/live555.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/live555/live555.inc b/recipes/live555/live555.inc
index 14e97bb..f1e21dc 100644
--- a/recipes/live555/live555.inc
+++ b/recipes/live555/live555.inc
@@ -7,7 +7,7 @@ HOMEPAGE =3D "http://live.com/"
 LICENSE =3D "LGPL"
 SECTION =3D "devel"

-INC_PR =3D "r1"
+INC_PR =3D "r2"

 URLV =3D
"${@bb.data.getVar('PV',d,1)[0:4]}.${@bb.data.getVar('PV',d,1)[4:6]}.${@bb.=
data.getVar('PV',d,1)[6:8]}"
 SRC_URI =3D "http://www.live555.com/liveMedia/public/live.${URLV}.tar.gz \
@@ -18,6 +18,7 @@ TARGET_CC_ARCH +=3D "${LDFLAGS}"

 do_configure() {
     cp ${WORKDIR}/config.linux-cross .
+    echo "COMPILE_OPTS+=3D" -fPIC "" >> config.linux-cross
     ./genMakefiles linux-cross
 }

--=20
1.7.4.1

--000e0cdf8e964794c104a76da98b
Content-Type: application/octet-stream; 
	name="0001-live555-recipe-added-fPIC-flag-need-by-VLC-to-build-.patch"
Content-Disposition: attachment; 
	filename="0001-live555-recipe-added-fPIC-flag-need-by-VLC-to-build-.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gpstt4x01

RnJvbSBkOGVhYWJiNjMwODhkYzY4YjdiYmEzZjVhNmFjNmEzMWU2NWEzNmU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/U3lsdmFpbj0yMCdHYXJ0aFBTJz0yMFBhcj1D
Mz1BOT89IDxzeWx2YWluLnBhcmVAZ21haWwuY29tPgpEYXRlOiBXZWQsIDYgSnVsIDIwMTEgMjM6
NTM6NDIgKzAyMDAKU3ViamVjdDogW1BBVENIXSBsaXZlNTU1IHJlY2lwZTogYWRkZWQgLWZQSUMg
ZmxhZyBuZWVkIGJ5IFZMQyB0byBidWlsZCB3aXRoIGxpdmU1NTUgc3VwcG9ydApNSU1FLVZlcnNp
b246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1U
cmFuc2Zlci1FbmNvZGluZzogOGJpdAoKU2lnbmVkLW9mZi1ieTogU3lsdmFpbiAnR2FydGhQUycg
UGFyw6kgPHN5bHZhaW4ucGFyZUBnbWFpbC5jb20+Ci0tLQogcmVjaXBlcy9saXZlNTU1L2xpdmU1
NTUuaW5jIHwgICAgMyArKy0KIDEgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3JlY2lwZXMvbGl2ZTU1NS9saXZlNTU1LmluYyBiL3Jl
Y2lwZXMvbGl2ZTU1NS9saXZlNTU1LmluYwppbmRleCAxNGU5N2JiLi5mMWUyMWRjIDEwMDY0NAot
LS0gYS9yZWNpcGVzL2xpdmU1NTUvbGl2ZTU1NS5pbmMKKysrIGIvcmVjaXBlcy9saXZlNTU1L2xp
dmU1NTUuaW5jCkBAIC03LDcgKzcsNyBAQCBIT01FUEFHRSA9ICJodHRwOi8vbGl2ZS5jb20vIgog
TElDRU5TRSA9ICJMR1BMIgogU0VDVElPTiA9ICJkZXZlbCIKIAotSU5DX1BSID0gInIxIgorSU5D
X1BSID0gInIyIgogCiBVUkxWID0gIiR7QGJiLmRhdGEuZ2V0VmFyKCdQVicsZCwxKVswOjRdfS4k
e0BiYi5kYXRhLmdldFZhcignUFYnLGQsMSlbNDo2XX0uJHtAYmIuZGF0YS5nZXRWYXIoJ1BWJyxk
LDEpWzY6OF19IgogU1JDX1VSSSA9ICJodHRwOi8vd3d3LmxpdmU1NTUuY29tL2xpdmVNZWRpYS9w
dWJsaWMvbGl2ZS4ke1VSTFZ9LnRhci5neiBcCkBAIC0xOCw2ICsxOCw3IEBAIFRBUkdFVF9DQ19B
UkNIICs9ICIke0xERkxBR1N9IgogCiBkb19jb25maWd1cmUoKSB7CiAJY3AgJHtXT1JLRElSfS9j
b25maWcubGludXgtY3Jvc3MgLgorCWVjaG8gIkNPTVBJTEVfT1BUUys9IiAtZlBJQyAiIiA+PiBj
b25maWcubGludXgtY3Jvc3MKIAkuL2dlbk1ha2VmaWxlcyBsaW51eC1jcm9zcwogfQogCi0tIAox
LjcuNC4xCgo=

--000e0cdf8e964794c104a76da98b--
