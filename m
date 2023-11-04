Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14207C0729B
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:31:12 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.5527.1699083060908871589
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Wixxdt8B;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IFP8ltPZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b993e045d-52d2c7c7-6346-497a-907e-58a711ff9be0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Juy/+/IIpC0I4XuUdG3k6B990ZQrnXHRxiZYBUEffGw=;
	b=Wixxdt8BYUwW/qvbM1ggUdnpJvcB1sUvQIEPSUP43iayKXJuj/1t/bqOyokYSFmc
	mKszPNmP4Ub0KMGZxJ9v5lDGg6IrmbdGR5rQOHQteq3zgLFRytzhmZfcFT0XMO2BbXM
	w+Z68+ir2ErWatsmE+SG9iVHHLLCan/uWCWsK5ik=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699083060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Juy/+/IIpC0I4XuUdG3k6B990ZQrnXHRxiZYBUEffGw=;
	b=IFP8ltPZPKDcTOKGFoGqG9F1vgiXBtGp72VOVABBe71z8O3dczfTO7BC74M5s4gY
	jxjGwqeeM1sB6MJo3TsAmzRYvZRLAW/R9f7DIvRdCiUrO4XqoSC0HznpBIa9UpcPwGx
	kYTyEq0go2zxgNk0tzw0rqPOLbDwJf7uDqIHbzmU=
Content-Type: multipart/mixed; boundary="===============5216636588746280189=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xfce4-settings: upgrading to 4.19.0 FAILED
Message-ID: <0101018b993e045d-52d2c7c7-6346-497a-907e-58a711ff9be0-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:31:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106333

--===============5216636588746280189==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
ICp4ZmNlNC1zZXR0aW5ncyogdG8gKjQuMTkuMCogaGFzIEZhaWxlZChkb19jb21waWxlKS4KCkRl
dGFpbGVkIGVycm9yIGluZm9ybWF0aW9uOgoKZG9fY29tcGlsZSBmYWlsZWQKCgoKTmV4dCBzdGVw
czoKICAgIC0gYXBwbHkgdGhlIHBhdGNoOiBnaXQgYW0gMDAwMS14ZmNlNC1zZXR0aW5ncy11cGdy
YWRlLTQuMTguMi00LjE5LjAucGF0Y2gKICAgIC0gY2hlY2sgdGhlIGNoYW5nZXMgdG8gdXBzdHJl
YW0gcGF0Y2hlcyBhbmQgc3VtbWFyaXplIHRoZW0gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLAogICAg
LSBjb21waWxlIGFuIGltYWdlIHRoYXQgY29udGFpbnMgdGhlIHBhY2thZ2UKICAgIC0gcGVyZm9y
bSBzb21lIGJhc2ljIHNhbml0eSB0ZXN0cwogICAgLSBhbWVuZCB0aGUgcGF0Y2ggYW5kIHNpZ24g
aXQgb2ZmOiBnaXQgY29tbWl0IC1zIC0tcmVzZXQtYXV0aG9yIC0tYW1lbmQKICAgIC0gc2VuZCBp
dCB0byB0aGUgYXBwcm9wcmlhdGUgbWFpbGluZyBsaXN0CgpBbHRlcm5hdGl2ZWx5LCBpZiB5b3Ug
YmVsaWV2ZSB0aGUgcmVjaXBlIHNob3VsZCBub3QgYmUgdXBncmFkZWQgYXQgdGhpcyB0aW1lLAp5
b3UgY2FuIGZpbGwgUkVDSVBFX05PX1VQREFURV9SRUFTT04gaW4gcmVzcGVjdGl2ZSByZWNpcGUg
ZmlsZSBzbyB0aGF0CmF1dG9tYXRpYyB1cGdyYWRlcyB3b3VsZCBubyBsb25nZXIgYmUgYXR0ZW1w
dGVkLgoKUGxlYXNlIHJldmlldyB0aGUgYXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRoZXIgaW5mb3Jt
YXRpb24gYW5kIGJ1aWxkL3VwZGF0ZSBmYWlsdXJlcy4KQW55IHByb2JsZW0gcGxlYXNlIGZpbGUg
YSBidWcgYXQgaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL2VudGVyX2J1Zy5jZ2k/
cHJvZHVjdD1BdXRvbWF0ZWQlMjBVcGRhdGUlMjBIYW5kbGVyCgpSZWdhcmRzLApUaGUgVXBncmFk
ZSBIZWxwZXIKCi0tID44IC0tCkZyb20gNTUwMzdjMDBiYzViY2E2YzE1YjE5YjkwYjk1MjgyMmY2
ZWQ4NWFiOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKRnJvbTogVXBncmFkZSBIZWxwZXIgPGF1
aEB5b2N0b3Byb2plY3Qub3JnPgpEYXRlOiBTYXQsIDQgTm92IDIwMjMgMDY6NTU6MDIgKzAwMDAK
U3ViamVjdDogW1BBVENIXSB4ZmNlNC1zZXR0aW5nczogdXBncmFkZSA0LjE4LjIgLT4gNC4xOS4w
CgotLS0KIC4uLjAwMS14c2V0dGluZ3MueG1sLVNldC1kZWZhdWx0LXRoZW1lcy5wYXRjaCB8IDQx
IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLm5nc180LjE4LjIuYmIgPT4geGZjZTQtc2V0dGluZ3Nf
NC4xOS4wLmJifSB8ICAzICstCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0MyBk
ZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhLXhmY2UvcmVjaXBlcy14ZmNlL3hm
Y2U0LXNldHRpbmdzL2ZpbGVzLzAwMDEteHNldHRpbmdzLnhtbC1TZXQtZGVmYXVsdC10aGVtZXMu
cGF0Y2gKIHJlbmFtZSBtZXRhLXhmY2UvcmVjaXBlcy14ZmNlL3hmY2U0LXNldHRpbmdzL3t4ZmNl
NC1zZXR0aW5nc180LjE4LjIuYmIgPT4geGZjZTQtc2V0dGluZ3NfNC4xOS4wLmJifSAoODglKQoK
ZGlmZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVzLXhmY2UveGZjZTQtc2V0dGluZ3MvZmlsZXMv
MDAwMS14c2V0dGluZ3MueG1sLVNldC1kZWZhdWx0LXRoZW1lcy5wYXRjaCBiL21ldGEteGZjZS9y
ZWNpcGVzLXhmY2UveGZjZTQtc2V0dGluZ3MvZmlsZXMvMDAwMS14c2V0dGluZ3MueG1sLVNldC1k
ZWZhdWx0LXRoZW1lcy5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggM2E0YzAw
OTEzLi4wMDAwMDAwMDAKLS0tIGEvbWV0YS14ZmNlL3JlY2lwZXMteGZjZS94ZmNlNC1zZXR0aW5n
cy9maWxlcy8wMDAxLXhzZXR0aW5ncy54bWwtU2V0LWRlZmF1bHQtdGhlbWVzLnBhdGNoCisrKyAv
ZGV2L251bGwKQEAgLTEsNDEgKzAsMCBAQAotRnJvbSAyMjE4YmE4YTIxZTlmNTcxNWI2NTJjNjQx
NmMyZGRiNTUyNjg2YjE0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogPT9VVEYtOD9x
P0FuZHJlYXM9MjBNPUMzPUJDbGxlcj89IDxzY2huaXR6ZWx0b255QGdvb2dsZW1haWwuY29tPgot
RGF0ZTogU3VuLCAyMCBNYXkgMjAxMiAxNToyMjowOSArMDIwMAotU3ViamVjdDogW1BBVENIXSB4
c2V0dGluZ3MueG1sOiBTZXQgZGVmYXVsdCB0aGVtZXMKLU1JTUUtVmVyc2lvbjogMS4wCi1Db250
ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKLUNvbnRlbnQtVHJhbnNmZXItRW5j
b2Rpbmc6IDhiaXQKLQotVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtjb25maWd1cmF0
aW9uXQotCi1TaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIE3DvGxsZXIgPHNjaG5pdHplbHRvbnlAZ29v
Z2xlbWFpbC5jb20+Ci0KLVRoZW1lIFhmY2UgZG9lc24ndCB3b3JrIGFzIGV4cGVjdGVkLiBGb3Ig
ZXhhbXBsZSwgbm8gbGF5b3V0IGluIHN0YXJ0Ci1tZW51IGFuZCBhcHBsaWNhdGlvbnMnIG1lbnUg
YmFyLiBBbmQgR3RrQ29sb3JCdXR0b24gaXMgYmxhbmsgaW4gY29uZmlnCi10YWIgcGFnZSBmcm9t
IHhmY2U0LXRlcm1pbmFsIC0+IEVkaXQgLT4gUHJlZmVyZW5jZSAtPiBDb2xvcnMuCi0KLVNvIHVz
ZSBBZHdhaXRhIGFzIGRlZmF1bHQgdGhlbWUgaW5zdGVhZC4KLQotU2lnbmVkLW9mZi1ieTogS2Fp
IEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+Ci0tLS0KLSB4ZnNldHRpbmdzZC94c2V0dGlu
Z3MueG1sIHwgNCArKy0tCi0gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL3hmc2V0dGluZ3NkL3hzZXR0aW5ncy54bWwgYi94ZnNl
dHRpbmdzZC94c2V0dGluZ3MueG1sCi1pbmRleCBkOGZlMmFjLi4wZjUyNDZiIDEwMDY0NAotLS0t
IGEveGZzZXR0aW5nc2QveHNldHRpbmdzLnhtbAotKysrIGIveGZzZXR0aW5nc2QveHNldHRpbmdz
LnhtbAotQEAgLTYsOCArNiw4IEBACi0gCi0gPGNoYW5uZWwgbmFtZT0ieHNldHRpbmdzIiB2ZXJz
aW9uPSIxLjAiPgotICAgPHByb3BlcnR5IG5hbWU9Ik5ldCIgdHlwZT0iZW1wdHkiPgotLSAgICA8
cHJvcGVydHkgbmFtZT0iVGhlbWVOYW1lIiB0eXBlPSJlbXB0eSIvPgotLSAgICA8cHJvcGVydHkg
bmFtZT0iSWNvblRoZW1lTmFtZSIgdHlwZT0iZW1wdHkiLz4KLSsgICAgPHByb3BlcnR5IG5hbWU9
IlRoZW1lTmFtZSIgdHlwZT0ic3RyaW5nIiB2YWx1ZT0iQWR3YWl0YSIvPgotKyAgICA8cHJvcGVy
dHkgbmFtZT0iSWNvblRoZW1lTmFtZSIgdHlwZT0ic3RyaW5nIiB2YWx1ZT0iQWR3YWl0YSIvPgot
ICAgICA8cHJvcGVydHkgbmFtZT0iRG91YmxlQ2xpY2tUaW1lIiB0eXBlPSJpbnQiIHZhbHVlPSI0
MDAiLz4KLSAgICAgPHByb3BlcnR5IG5hbWU9IkRvdWJsZUNsaWNrRGlzdGFuY2UiIHR5cGU9Imlu
dCIgdmFsdWU9IjUiLz4KLSAgICAgPHByb3BlcnR5IG5hbWU9IkRuZERyYWdUaHJlc2hvbGQiIHR5
cGU9ImludCIgdmFsdWU9IjgiLz4KLS0tIAotMi4xLjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS14ZmNl
L3JlY2lwZXMteGZjZS94ZmNlNC1zZXR0aW5ncy94ZmNlNC1zZXR0aW5nc180LjE4LjIuYmIgYi9t
ZXRhLXhmY2UvcmVjaXBlcy14ZmNlL3hmY2U0LXNldHRpbmdzL3hmY2U0LXNldHRpbmdzXzQuMTku
MC5iYgpzaW1pbGFyaXR5IGluZGV4IDg4JQpyZW5hbWUgZnJvbSBtZXRhLXhmY2UvcmVjaXBlcy14
ZmNlL3hmY2U0LXNldHRpbmdzL3hmY2U0LXNldHRpbmdzXzQuMTguMi5iYgpyZW5hbWUgdG8gbWV0
YS14ZmNlL3JlY2lwZXMteGZjZS94ZmNlNC1zZXR0aW5ncy94ZmNlNC1zZXR0aW5nc180LjE5LjAu
YmIKaW5kZXggMGExODIyNzNiLi5iYjE0MjM2ZDkgMTAwNjQ0Ci0tLSBhL21ldGEteGZjZS9yZWNp
cGVzLXhmY2UveGZjZTQtc2V0dGluZ3MveGZjZTQtc2V0dGluZ3NfNC4xOC4yLmJiCisrKyBiL21l
dGEteGZjZS9yZWNpcGVzLXhmY2UveGZjZTQtc2V0dGluZ3MveGZjZTQtc2V0dGluZ3NfNC4xOS4w
LmJiCkBAIC04LDggKzgsNyBAQCBpbmhlcml0IHhmY2UgZmVhdHVyZXNfY2hlY2sgbWltZS14ZGcK
IAogUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID0gIngxMSIKIAotU1JDX1VSSSArPSAiZmlsZTov
LzAwMDEteHNldHRpbmdzLnhtbC1TZXQtZGVmYXVsdC10aGVtZXMucGF0Y2giCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiNDY2MTM2MTA4N2ZhYWU1N2VmYjQ5NzQxZmZjZjkwYmY5MDc4NzYwZTE2M2Ji
ZGVmNjNiOTI0MDgzYmRjNGYyMiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxOTNlMDBhZWU5NzY2
MGQ5OTc0MmRmMTQ2Y2EyZTU0NWZiYjE1ZTIyMzNmZDgzYjE5YzczNzFkYjRhOTcwNDUzIgogCiBF
WFRSQV9PRUNPTkYgKz0gIi0tZW5hYmxlLW1haW50YWluZXItbW9kZSAtLWRpc2FibGUtZGVidWci
CiAKLS0gCjIuMzkuMgoK

--===============5216636588746280189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4957 entries from dependency cache.
Parsing recipes...done.
Parsing of 3055 .bb files complete (3054 cached, 1 parsed). 4886 targets, 92 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e575f59b82eae78fb1ac8df7198eaa4a7a963259"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:69deda615a0ea7b205b9369e07f361ed7ac647f0"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 699 Local 690 Mirrors 0 Missed 9 Current 742 (98% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 751 of 1441 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 752 of 1441 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 754 of 1441 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 755 of 1441 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb:do_create_spdx_setscene)
NOTE: Running setscene task 756 of 1441 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/exo/exo_4.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 757 of 1441 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 764 of 1441 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.19.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 766 of 1441 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 828 of 1441 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb:do_create_spdx_setscene)
NOTE: recipe sound-theme-freedesktop-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxklavier-5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcanberra-0.30-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-datetime-setter-3.32.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-settings-4.19.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe xfce4-settings-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe exo-4.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe garcon-4.18.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnotify-0.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-settings-4.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxklavier-5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe garcon-4.18.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcanberra-0.30-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xfce4-settings-4.19.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe sound-theme-freedesktop-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1098 of 1441 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe libnotify-0.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1113 of 1441 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx_setscene)
NOTE: recipe exo-4.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xfce4-datetime-setter-3.32.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1150 of 1441 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1189 of 1441 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1269 of 1441 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-settings-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xfce4-settings-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3492 of 3891 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.19.0.bb:do_fetch)
NOTE: recipe xfce4-settings-4.19.0-r0: task do_fetch: Started
NOTE: recipe xfce4-settings-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 3873 of 3891 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.19.0.bb:do_unpack)
NOTE: Running task 3874 of 3891 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xfce4-settings-4.19.0-r0: task do_unpack: Started
NOTE: recipe xfce4-settings-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xfce4-settings-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 3875 of 3891 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.19.0.bb:do_patch)
NOTE: Running task 3876 of 3891 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.19.0.bb:do_collect_spdx_deps)
NOTE: recipe xfce4-settings-4.19.0-r0: task do_patch: Started
NOTE: recipe xfce4-settings-4.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xfce4-settings-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xfce4-settings-4.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xfce4-settings-4.19.0-r0: task do_patch: Succeeded
NOTE: Running task 3878 of 3891 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.19.0.bb:do_configure)
NOTE: recipe xfce4-settings-4.19.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/upower/upower_0.99.17.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/exo/exo_4.18.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/garcon/garcon_4.18.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/
 auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gn
 ome/libnotify/libnotify_0.8.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/gettext/gettext_0.22.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/autoconf/autoconf_2.72c.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes
 -devtools/intltool/intltool_0.51.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['libxklavier', 'libcanberra', 'upower', 'exo', 'garcon', 'glibc', 'desktop-file-utils', 'gcc-cross-x86_64', 'gcc-runtime', 'libtool-cross', 'libtool-native', 'quilt-native', 'gdk-pixbuf', 'gtk+3', 'hicolor-icon-theme', 'libnotify', 'xrandr', 'libx11', 'libxcursor', 'libxi', 'gettext-native', 'autoconf-native', 'automake-native', 'intltool-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'gtk+3-native', 'm4-native', 'gnu-config-native', 'texinfo-dummy-native', 'zlib-native', 'gmp-native', 'zstd-native', 'mpfr-native', 'binutils-cross-x86_64', 'xz-native', 'libmpc-native', 'linux-libc-headers', 'flex-native', 'libxfce4ui', 'cairo', 'libxml-parser-perl-native', 'gobject-introspection', 'glib-2.0', 'libvorbis', 'pulseaudio', 'alsa-lib', 'libtool', 'gtk+', 'libxrender', 'libxrandr', 'wayland-protocols', 'libxfixes', 'wayland', 'libxkbcommon', 'libxdamage', 'libxcomposite', 'libpng', 'opkg-utils', 'fontconfig', 'libxext', 'libepo
 xy', 'pango', 'mesa', 'libjpeg-turbo', 'at-spi2-core', 'util-macros', 'xorgproto', 'iso-codes', 'libxml2', 'xkbcomp', 'shared-mime-info', 'fontconfig-native', 'libxi-native', 'gettext-minimal-native', 'libpng-native', 'libxrandr-native', 'libxfixes-native', 'at-spi2-core-native', 'cairo-native', 'pango-native', 'libjpeg-turbo-native', 'python3-native', 'libxcomposite-native', 'libxdamage-native', 'libxcursor-native', 'libxext-native', 'libx11-native', 'libxrender-native', 'gobject-introspection-native', 'glib-2.0-native', 'gdk-pixbuf-native', 'libgudev', 'dbus-glib', 'systemd', 'libusb1', 'libxcb', 'xtrans', 'attr-native', 'libgcc', 'xfconf', 'xfce4-dev-tools', 'libsm', 'libxfce4util', 'startup-notification', 'libice', 'zlib', 'pixman', 'perl-native', 'expat-native', 'libffi', 'python3', 'bash-completion', 'libpcre2', 'util-linux', 'libogg', 'sbc', 'speexdsp', 'libsndfile1', 'base-passwd', 'bluez5', 'libcap', 'dbus', 'shadow-sysroot', 'ofono', 'base-files', 'avahi', 'libxtst', 'liba
 tomic-ops', 'shadow', 'shadow-native', 'expat', 'xkeyboard-config', 'freetype', 'harfbuzz', 'fribidi', 'libxft', 'vulkan-headers', 'libxshmfence', 'libxxf86vm', 'libdrm', 'vulkan-loader', 'libxkbfile', 'util-linux-native', 'freetype-native', 'xorgproto-native', 'util-macros-native', 'dbus-native', 'libxml2-native', 'libxtst-native', 'pixman-native', 'libxcb-native', 'libsm-native', 'harfbuzz-native', 'libxft-native', 'fribidi-native', 'cmake-native', 'gdbm-native', 'openssl-native', 'ncurses-native', 'libffi-native', 'libtirpc-native', 'sqlite3-native', 'util-linux-libuuid-native', 'bzip2-native', 'libedit-native', 'libnsl2-native', 'xtrans-native', 'libpcre2-native', 'shared-mime-info-native', 'libpam', 'zstd', 'acl', 'kmod', 'update-rc.d', 'initscripts', 'libseccomp', 'libxau', 'libxdmcp', 'libpthread-stubs', 'xcb-proto', 'vala', 'perl', 'xcb-util', 'make-native', 'libedit', 'util-linux-libuuid', 'libtirpc', 'xz', 'openssl', 'sqlite3', 'gdbm', 'ncurses', 'libxcrypt', 'libnsl2', 'b
 zip2', 'libcap-ng', 'flac', 'readline', 'libical', 'mobile-broadband-provider-info', 'ell', 'libdaemon', 'attr', 'icu', 'libpciaccess', 'libcap-ng-native', 'libxau-native', 'libpthread-stubs-native', 'libxdmcp-native', 'xcb-proto-native', 'libice-native', 'icu-native', 'itstool-native', 'cracklib', 'unzip-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.16.5
| Copyright (C) 2021 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/xfce4-settings-4.19.0/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/xfce4-settings-4.19.0/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot-native/usr/share/aclocal/ --force -I m4 ${ACLOCAL_FLAGS}
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in '.'.
| libtoolize: copying file './ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
| libtoolize: copying file 'm4/libtool.m4'
| libtoolize: copying file 'm4/ltoptions.m4'
| libtoolize: copying file 'm4/ltsugar.m4'
| libtoolize: copying file 'm4/ltversion.m4'
| libtoolize: copying file 'm4/lt~obsolete.m4'
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/xfce4-settings-4.19.0/m4/ -I /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot-native/usr/share/aclocal/ --force -I m4 ${ACLOCAL_FLAGS}
| autoreconf: running: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/xfce4-settings-4.19.0/m4/ --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/xfce4-settings-4.19.0/m4/ --include=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:66: installing './compile'
| configure.ac:58: installing './missing'
| common/Makefile.am: installing './depcomp'
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../xfce4-settings-4.19.0/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot  --enable-maintainer-mode --disable-debug --disable-static  --enable-libnotify --enable-sound-settings --enable-nls
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/x86_64-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/meta/site/common
| configure: loading site script /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot/usr/share/x86_64-poky-linux_config_site.d/ncurses_config
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking whether UID '6000' is supported by ustar format... yes
| checking whether GID '6000' is supported by ustar format... yes
| checking how to create a ustar tar archive... gnutar
| checking whether to enable maintainer-specific portions of Makefiles... yes
| checking whether make supports nested variables... (cached) yes
| checking whether make supports the include directive... yes (GNU style)
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot... none
| checking for stdio.h... (cached) yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for inttypes.h... (cached) yes
| checking for stdint.h... (cached) yes
| checking for strings.h... (cached) yes
| checking for sys/stat.h... (cached) yes
| checking for sys/types.h... (cached) yes
| checking for unistd.h... (cached) yes
| checking for wchar.h... yes
| checking for minix/config.h... no
| checking whether it is safe to define __EXTENSIONS__... yes
| checking whether _XOPEN_SOURCE should be defined... no
| checking for library containing strerror... none required
| checking for x86_64-poky-linux-gcc... (cached) x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot accepts -g... (cached) yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot... (cached) none
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools/grep -F
| checking how to print strings... printf
| checking for ld used by x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot... x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot
| checking if the linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot  ) is GNU ld... yes
| checking for a sed that does not truncate output... (cached) sed
| checking for xmllint... /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/recipe-sysroot-native/usr/bin/xmllint
| ../xfce4-settings-4.19.0/configure: line 6789: syntax error near unexpected token `GDBUS_CODEGEN,'
| ../xfce4-settings-4.19.0/configure: line 6789: `XDT_CHECK_PACKAGE_BINARY(GDBUS_CODEGEN, gio-2.0, gdbus_codegen, gdbus-codegen)'
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/temp/run.do_configure.2591384:286 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/temp/run.do_configure.2591384, line 286
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/temp/run.do_configure.2591384, line 262
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/temp/run.do_configure.2591384, line 232
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/temp/run.do_configure.2591384, line 152
| 	#5: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/temp/run.do_configure.2591384, line 290
NOTE: recipe xfce4-settings-4.19.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3879 tasks of which 3873 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104065430.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104065430.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.19.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: xfce4-settings-4.19.0-r0 do_configure: configure failed
ERROR: xfce4-settings-4.19.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/temp/run.do_configure.2591384', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/xfce4-settings/4.19.0/temp/log.do_configure.2591384
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.19.0.bb:do_configure) failed with exit code '1'

--===============5216636588746280189==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xfce4-settings-upgrade-4.18.2-4.19.0.patch"

RnJvbSA1NTAzN2MwMGJjNWJjYTZjMTViMTliOTBiOTUyODIyZjZlZDg1YWI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwNjo1NTowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
Y2U0LXNldHRpbmdzOiB1cGdyYWRlIDQuMTguMiAtPiA0LjE5LjAKCi0tLQogLi4uMDAxLXhzZXR0
aW5ncy54bWwtU2V0LWRlZmF1bHQtdGhlbWVzLnBhdGNoIHwgNDEgLS0tLS0tLS0tLS0tLS0tLS0t
LQogLi4ubmdzXzQuMTguMi5iYiA9PiB4ZmNlNC1zZXR0aW5nc180LjE5LjAuYmJ9IHwgIDMgKy0K
IDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQzIGRlbGV0aW9ucygtKQogZGVsZXRl
IG1vZGUgMTAwNjQ0IG1ldGEteGZjZS9yZWNpcGVzLXhmY2UveGZjZTQtc2V0dGluZ3MvZmlsZXMv
MDAwMS14c2V0dGluZ3MueG1sLVNldC1kZWZhdWx0LXRoZW1lcy5wYXRjaAogcmVuYW1lIG1ldGEt
eGZjZS9yZWNpcGVzLXhmY2UveGZjZTQtc2V0dGluZ3Mve3hmY2U0LXNldHRpbmdzXzQuMTguMi5i
YiA9PiB4ZmNlNC1zZXR0aW5nc180LjE5LjAuYmJ9ICg4OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS14
ZmNlL3JlY2lwZXMteGZjZS94ZmNlNC1zZXR0aW5ncy9maWxlcy8wMDAxLXhzZXR0aW5ncy54bWwt
U2V0LWRlZmF1bHQtdGhlbWVzLnBhdGNoIGIvbWV0YS14ZmNlL3JlY2lwZXMteGZjZS94ZmNlNC1z
ZXR0aW5ncy9maWxlcy8wMDAxLXhzZXR0aW5ncy54bWwtU2V0LWRlZmF1bHQtdGhlbWVzLnBhdGNo
CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAzYTRjMDA5MTMuLjAwMDAwMDAwMAotLS0g
YS9tZXRhLXhmY2UvcmVjaXBlcy14ZmNlL3hmY2U0LXNldHRpbmdzL2ZpbGVzLzAwMDEteHNldHRp
bmdzLnhtbC1TZXQtZGVmYXVsdC10aGVtZXMucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0MSAr
MCwwIEBACi1Gcm9tIDIyMThiYThhMjFlOWY1NzE1YjY1MmM2NDE2YzJkZGI1NTI2ODZiMTQgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiA9P1VURi04P3E/QW5kcmVhcz0yME09QzM9QkNs
bGVyPz0gPHNjaG5pdHplbHRvbnlAZ29vZ2xlbWFpbC5jb20+Ci1EYXRlOiBTdW4sIDIwIE1heSAy
MDEyIDE1OjIyOjA5ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIHhzZXR0aW5ncy54bWw6IFNldCBk
ZWZhdWx0IHRoZW1lcwotTUlNRS1WZXJzaW9uOiAxLjAKLUNvbnRlbnQtVHlwZTogdGV4dC9wbGFp
bjsgY2hhcnNldD1VVEYtOAotQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAotCi1VcHN0
cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2NvbmZpZ3VyYXRpb25dCi0KLVNpZ25lZC1vZmYt
Ynk6IEFuZHJlYXMgTcO8bGxlciA8c2Nobml0emVsdG9ueUBnb29nbGVtYWlsLmNvbT4KLQotVGhl
bWUgWGZjZSBkb2Vzbid0IHdvcmsgYXMgZXhwZWN0ZWQuIEZvciBleGFtcGxlLCBubyBsYXlvdXQg
aW4gc3RhcnQKLW1lbnUgYW5kIGFwcGxpY2F0aW9ucycgbWVudSBiYXIuIEFuZCBHdGtDb2xvckJ1
dHRvbiBpcyBibGFuayBpbiBjb25maWcKLXRhYiBwYWdlIGZyb20geGZjZTQtdGVybWluYWwgLT4g
RWRpdCAtPiBQcmVmZXJlbmNlIC0+IENvbG9ycy4KLQotU28gdXNlIEFkd2FpdGEgYXMgZGVmYXVs
dCB0aGVtZSBpbnN0ZWFkLgotCi1TaWduZWQtb2ZmLWJ5OiBLYWkgS2FuZyA8a2FpLmthbmdAd2lu
ZHJpdmVyLmNvbT4KLS0tLQotIHhmc2V0dGluZ3NkL3hzZXR0aW5ncy54bWwgfCA0ICsrLS0KLSAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQotCi1kaWZmIC0t
Z2l0IGEveGZzZXR0aW5nc2QveHNldHRpbmdzLnhtbCBiL3hmc2V0dGluZ3NkL3hzZXR0aW5ncy54
bWwKLWluZGV4IGQ4ZmUyYWMuLjBmNTI0NmIgMTAwNjQ0Ci0tLS0gYS94ZnNldHRpbmdzZC94c2V0
dGluZ3MueG1sCi0rKysgYi94ZnNldHRpbmdzZC94c2V0dGluZ3MueG1sCi1AQCAtNiw4ICs2LDgg
QEAKLSAKLSA8Y2hhbm5lbCBuYW1lPSJ4c2V0dGluZ3MiIHZlcnNpb249IjEuMCI+Ci0gICA8cHJv
cGVydHkgbmFtZT0iTmV0IiB0eXBlPSJlbXB0eSI+Ci0tICAgIDxwcm9wZXJ0eSBuYW1lPSJUaGVt
ZU5hbWUiIHR5cGU9ImVtcHR5Ii8+Ci0tICAgIDxwcm9wZXJ0eSBuYW1lPSJJY29uVGhlbWVOYW1l
IiB0eXBlPSJlbXB0eSIvPgotKyAgICA8cHJvcGVydHkgbmFtZT0iVGhlbWVOYW1lIiB0eXBlPSJz
dHJpbmciIHZhbHVlPSJBZHdhaXRhIi8+Ci0rICAgIDxwcm9wZXJ0eSBuYW1lPSJJY29uVGhlbWVO
YW1lIiB0eXBlPSJzdHJpbmciIHZhbHVlPSJBZHdhaXRhIi8+Ci0gICAgIDxwcm9wZXJ0eSBuYW1l
PSJEb3VibGVDbGlja1RpbWUiIHR5cGU9ImludCIgdmFsdWU9IjQwMCIvPgotICAgICA8cHJvcGVy
dHkgbmFtZT0iRG91YmxlQ2xpY2tEaXN0YW5jZSIgdHlwZT0iaW50IiB2YWx1ZT0iNSIvPgotICAg
ICA8cHJvcGVydHkgbmFtZT0iRG5kRHJhZ1RocmVzaG9sZCIgdHlwZT0iaW50IiB2YWx1ZT0iOCIv
PgotLS0gCi0yLjEuMAotCmRpZmYgLS1naXQgYS9tZXRhLXhmY2UvcmVjaXBlcy14ZmNlL3hmY2U0
LXNldHRpbmdzL3hmY2U0LXNldHRpbmdzXzQuMTguMi5iYiBiL21ldGEteGZjZS9yZWNpcGVzLXhm
Y2UveGZjZTQtc2V0dGluZ3MveGZjZTQtc2V0dGluZ3NfNC4xOS4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggODglCnJlbmFtZSBmcm9tIG1ldGEteGZjZS9yZWNpcGVzLXhmY2UveGZjZTQtc2V0dGluZ3Mv
eGZjZTQtc2V0dGluZ3NfNC4xOC4yLmJiCnJlbmFtZSB0byBtZXRhLXhmY2UvcmVjaXBlcy14ZmNl
L3hmY2U0LXNldHRpbmdzL3hmY2U0LXNldHRpbmdzXzQuMTkuMC5iYgppbmRleCAwYTE4MjI3M2Iu
LmJiMTQyMzZkOSAxMDA2NDQKLS0tIGEvbWV0YS14ZmNlL3JlY2lwZXMteGZjZS94ZmNlNC1zZXR0
aW5ncy94ZmNlNC1zZXR0aW5nc180LjE4LjIuYmIKKysrIGIvbWV0YS14ZmNlL3JlY2lwZXMteGZj
ZS94ZmNlNC1zZXR0aW5ncy94ZmNlNC1zZXR0aW5nc180LjE5LjAuYmIKQEAgLTgsOCArOCw3IEBA
IGluaGVyaXQgeGZjZSBmZWF0dXJlc19jaGVjayBtaW1lLXhkZwogCiBSRVFVSVJFRF9ESVNUUk9f
RkVBVFVSRVMgPSAieDExIgogCi1TUkNfVVJJICs9ICJmaWxlOi8vMDAwMS14c2V0dGluZ3MueG1s
LVNldC1kZWZhdWx0LXRoZW1lcy5wYXRjaCIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0NjYxMzYx
MDg3ZmFhZTU3ZWZiNDk3NDFmZmNmOTBiZjkwNzg3NjBlMTYzYmJkZWY2M2I5MjQwODNiZGM0ZjIy
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE5M2UwMGFlZTk3NjYwZDk5NzQyZGYxNDZjYTJlNTQ1
ZmJiMTVlMjIzM2ZkODNiMTljNzM3MWRiNGE5NzA0NTMiCiAKIEVYVFJBX09FQ09ORiArPSAiLS1l
bmFibGUtbWFpbnRhaW5lci1tb2RlIC0tZGlzYWJsZS1kZWJ1ZyIKIAotLSAKMi4zOS4yCgo=

--===============5216636588746280189==--

