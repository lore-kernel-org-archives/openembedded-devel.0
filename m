Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1QeZxZ-0006rG-6n
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 23:48:41 +0200
Received: by qyk38 with SMTP id 38so264010qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jul 2011 14:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Mi3E56/gPlodZFF9XQJuhG9nSKYHE+myO8RMURi1YlU=;
	b=hoI+WiH7tfh5U0leREFut6xzAY6oPyrxNgrxt4Ujjx+I7kESBNGLjYbpyg+brlZFlr
	B7MxDMRqnGLMeuwLEHspBGht4j6VR1oeftelQy3fgHMDcICKykXwc+Oc9D7LR87JeOIH
	txQCCUXBHAVlke0kxB7fyXnP2V4ps6J39PlDY=
Received: by 10.229.66.148 with SMTP id n20mr45487qci.199.1309988690126; Wed,
	06 Jul 2011 14:44:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.215.206 with HTTP; Wed, 6 Jul 2011 14:44:30 -0700 (PDT)
In-Reply-To: <CACrTVgJ6hYwz8bbJPowEN_jb5A+hd4vVr_T4qQONdtKd8gGv_g@mail.gmail.com>
References: <CACrTVgKyLQ1UDqzUAcJACrsraPYfcOZf7c8HdfQOJsgTAx-r7A@mail.gmail.com>
	<201107061734.31202.GNUtoo@no-log.org>
	<CACrTVgJ6hYwz8bbJPowEN_jb5A+hd4vVr_T4qQONdtKd8gGv_g@mail.gmail.com>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Wed, 6 Jul 2011 23:44:30 +0200
Message-ID: <CACrTVgLG+DcK=p0G4D0sfVy44Dm0WnVrH+yf3u2241_DkNguhw@mail.gmail.com>
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
X-List-Received-Date: Wed, 06 Jul 2011 21:48:41 -0000
X-Groupsio-MsgNum: 33021
Content-Type: multipart/mixed; boundary=0016e648be2888e5fc04a76d8234

--0016e648be2888e5fc04a76d8234
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Patch attached. removed unneeded line


From 9e01ea60bf7790f1250ef24a317507e255f3f947 Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Sylvain=3D20'GarthPS'=3D20Par=3DC3=3DA9?=3D <sylvain.pare=
@gmail.com>
Date: Wed, 6 Jul 2011 23:36:14 +0200
Subject: [PATCH] live555 recipe: added -fPIC flag need by VLC to build with
live555 support
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Sylvain 'GarthPS' Par=E9 <sylvain.pare@gmail.com>
---
 recipes/live555/live555.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/live555/live555.inc b/recipes/live555/live555.inc
index 14e97bb..6de57cb 100644
--- a/recipes/live555/live555.inc
+++ b/recipes/live555/live555.inc
@@ -18,6 +18,7 @@ TARGET_CC_ARCH +=3D "${LDFLAGS}"

 do_configure() {
     cp ${WORKDIR}/config.linux-cross .
+    echo "COMPILE_OPTS+=3D" -fPIC "" >> config.linux-cross
     ./genMakefiles linux-cross
 }

--=20
1.7.4.1

--0016e648be2888e5fc04a76d8234
Content-Type: application/octet-stream; 
	name="0001-live555-recipe-added-fPIC-flag-need-by-VLC-to-build-.patch"
Content-Disposition: attachment; 
	filename="0001-live555-recipe-added-fPIC-flag-need-by-VLC-to-build-.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gpstetgz1

RnJvbSA5ZTAxZWE2MGJmNzc5MGYxMjUwZWYyNGEzMTc1MDdlMjU1ZjNmOTQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/U3lsdmFpbj0yMCdHYXJ0aFBTJz0yMFBhcj1D
Mz1BOT89IDxzeWx2YWluLnBhcmVAZ21haWwuY29tPgpEYXRlOiBXZWQsIDYgSnVsIDIwMTEgMjM6
MzY6MTQgKzAyMDAKU3ViamVjdDogW1BBVENIXSBsaXZlNTU1IHJlY2lwZTogYWRkZWQgLWZQSUMg
ZmxhZyBuZWVkIGJ5IFZMQyB0byBidWlsZCB3aXRoIGxpdmU1NTUgc3VwcG9ydApNSU1FLVZlcnNp
b246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1U
cmFuc2Zlci1FbmNvZGluZzogOGJpdAoKU2lnbmVkLW9mZi1ieTogU3lsdmFpbiAnR2FydGhQUycg
UGFyw6kgPHN5bHZhaW4ucGFyZUBnbWFpbC5jb20+Ci0tLQogcmVjaXBlcy9saXZlNTU1L2xpdmU1
NTUuaW5jIHwgICAgMSArCiAxIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9ucygrKSwgMCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9yZWNpcGVzL2xpdmU1NTUvbGl2ZTU1NS5pbmMgYi9yZWNp
cGVzL2xpdmU1NTUvbGl2ZTU1NS5pbmMKaW5kZXggMTRlOTdiYi4uNmRlNTdjYiAxMDA2NDQKLS0t
IGEvcmVjaXBlcy9saXZlNTU1L2xpdmU1NTUuaW5jCisrKyBiL3JlY2lwZXMvbGl2ZTU1NS9saXZl
NTU1LmluYwpAQCAtMTgsNiArMTgsNyBAQCBUQVJHRVRfQ0NfQVJDSCArPSAiJHtMREZMQUdTfSIK
IAogZG9fY29uZmlndXJlKCkgewogCWNwICR7V09SS0RJUn0vY29uZmlnLmxpbnV4LWNyb3NzIC4K
KwllY2hvICJDT01QSUxFX09QVFMrPSIgLWZQSUMgIiIgPj4gY29uZmlnLmxpbnV4LWNyb3NzCiAJ
Li9nZW5NYWtlZmlsZXMgbGludXgtY3Jvc3MKIH0KIAotLSAKMS43LjQuMQoK

--0016e648be2888e5fc04a76d8234--
