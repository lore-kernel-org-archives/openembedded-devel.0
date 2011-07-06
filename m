Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1QeYp1-0005gN-CA
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 22:35:47 +0200
Received: by qyk38 with SMTP id 38so224365qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jul 2011 13:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=HEabmtQ1xaAoa7oz8AmyqSjmBLEvUgbC8TQ9qbA6MnU=;
	b=KxvPOf2TAqgTQxkbBuHotssEbm8ynTo+VNgoEjySJJ88TGop+oDzCv9Nm4hRoJuRkn
	je9HKZYe/maRZmUE4Dgj9jA4V/pdA0etDP1aiOroZh2P98hgdAz90GYSUxVkCmOJ/pG5
	a9WvYGdw0a7aq5gTrby0m/QN9rXqJHUrrjhBI=
Received: by 10.229.101.145 with SMTP id c17mr6831153qco.161.1309984316131;
	Wed, 06 Jul 2011 13:31:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.215.206 with HTTP; Wed, 6 Jul 2011 13:31:36 -0700 (PDT)
In-Reply-To: <201107061734.31202.GNUtoo@no-log.org>
References: <CACrTVgKyLQ1UDqzUAcJACrsraPYfcOZf7c8HdfQOJsgTAx-r7A@mail.gmail.com>
	<201107061734.31202.GNUtoo@no-log.org>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Wed, 6 Jul 2011 22:31:36 +0200
Message-ID: <CACrTVgJ6hYwz8bbJPowEN_jb5A+hd4vVr_T4qQONdtKd8gGv_g@mail.gmail.com>
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
X-List-Received-Date: Wed, 06 Jul 2011 20:35:47 -0000
X-Groupsio-MsgNum: 33020
Content-Type: multipart/mixed; boundary=0016364ee53ad30b5304a76c7d88

--0016364ee53ad30b5304a76c7d88
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Attached the new patch. is this ok for you this time ?
About the fix-makefile I don't know and did not take the time, just followed
this http://forum.videolan.org/viewtopic.php?f=13&t=46465
I just know that it works for me :)

So with this patch vlc will be build wilth live555 support. Before that if
live555 was present(built without fPIC flag by default) vlc did not build
successfully
But if you did clean live555 then vlc build process would detect it and then
build successfully deactivating live555 support (that is why I did succeed
to build the last time without understanding it)

With pleasure!

A 1.1.10 recipe could be cool too but It was above my skills/time for now.(
had some compile error and did not took the time to fix it)

Sylvain

2011/7/6 Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

> >Let me know if it is not good enough, and if the patch is accepted.
> hi,
> First thanks for the patch, unfortunately it's in the wrong format, you
> should
> rather use git (git add + git commit + git format-patch + git-send-email )
> as
> described in the patch sending guide:
> http://www.openembedded.org/index.php/How_to_submit_a_patch_for_dummies
>
> Then I wonder what is fix-makefile.
>
> I'd like vlc to get fixed. Thanks again for caring about vlc.
>
> Denis.
>

--0016364ee53ad30b5304a76c7d88
Content-Type: application/octet-stream; 
	name="0001-live555-recipe-added-fPIC-flag-need-by-VLC-to-build-.patch"
Content-Disposition: attachment; 
	filename="0001-live555-recipe-added-fPIC-flag-need-by-VLC-to-build-.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gpsqmtyf0

RnJvbSAyNTA2YWNhNTNlY2RiNDliZGMyMzNjNzdiMWU0Y2U4YjM5MjA0NjExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/U3lsdmFpbj0yMCdHYXJ0aFBTJz0yMFBhcj1D
Mz1BOT89IDxzeWx2YWluLnBhcmVAZ21haWwuY29tPgpEYXRlOiBXZWQsIDYgSnVsIDIwMTEgMjI6
MTU6NDMgKzAyMDAKU3ViamVjdDogW1BBVENIXSBsaXZlNTU1IHJlY2lwZTogYWRkZWQgLWZQSUMg
ZmxhZyBuZWVkIGJ5IFZMQyB0byBidWlsZCB3aXRoIGxpdmU1NTUgc3VwcG9ydApNSU1FLVZlcnNp
b246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1U
cmFuc2Zlci1FbmNvZGluZzogOGJpdAoKU2lnbmVkLW9mZi1ieTogU3lsdmFpbiAnR2FydGhQUycg
UGFyw6kgPHN5bHZhaW4ucGFyZUBnbWFpbC5jb20+Ci0tLQogcmVjaXBlcy9saXZlNTU1L2xpdmU1
NTUuaW5jIHwgICAgMiArKwogMSBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDAgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcmVjaXBlcy9saXZlNTU1L2xpdmU1NTUuaW5jIGIvcmVj
aXBlcy9saXZlNTU1L2xpdmU1NTUuaW5jCmluZGV4IDE0ZTk3YmIuLjc5NTFiNDYgMTAwNjQ0Ci0t
LSBhL3JlY2lwZXMvbGl2ZTU1NS9saXZlNTU1LmluYworKysgYi9yZWNpcGVzL2xpdmU1NTUvbGl2
ZTU1NS5pbmMKQEAgLTE4LDcgKzE4LDkgQEAgVEFSR0VUX0NDX0FSQ0ggKz0gIiR7TERGTEFHU30i
CiAKIGRvX2NvbmZpZ3VyZSgpIHsKIAljcCAke1dPUktESVJ9L2NvbmZpZy5saW51eC1jcm9zcyAu
CisgICAgICAgIGVjaG8gIkNPTVBJTEVfT1BUUys9IiAtZlBJQyAiIiA+PiBjb25maWcubGludXgt
Y3Jvc3MKIAkuL2dlbk1ha2VmaWxlcyBsaW51eC1jcm9zcworICAgICAgICBmaW5kIC4gLW5hbWUg
J01ha2VmaWxlJyAtZXhlYyBmaXgtbWFrZWZpbGUge30gXDsKIH0KIAogZG9fY29tcGlsZSgpIHsK
LS0gCjEuNy40LjEKCg==

--0016364ee53ad30b5304a76c7d88--
