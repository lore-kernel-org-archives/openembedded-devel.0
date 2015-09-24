Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id D927F7669F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2015 23:22:37 +0000 (UTC)
Received: by iofb144 with SMTP id b144so94245029iof.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2015 16:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ssFngw7q2NXBuyA/miETzqDvIMqBsXwEW+zr0OoDvmc=;
	b=Zsmv1yHC92ntFnt6gcv6ZjPbYViABT4Z+RPmYrDuqFIfyuXp5sLUOiinTKrHhFY22U
	4/CB27LsSmf4wm9mZIJxk/oT8A8wz0KqbFKzGFxpHbR8p/ZiuarKx2e3EE6FqDV8K0VJ
	GDPfIbVjHBTrbgE+ZSRu/99N9PBTCy1aIOp9nNDtk9OXDR2XwL4X+44HyEcvHkIb7fZq
	e8wEK87jEkfE9G96JMNUkC0I2W4sB2K16137FLbs17j2CGnVeXIWA4CLB+jYGz8Hr040
	0Ss1lhUotdWjxojIHGnuCywh254GZ9WYI9zJVorgmZZ8rLM9nprKBOxtm/BFjUdhmHx5
	3DZA==
MIME-Version: 1.0
X-Received: by 10.107.14.140 with SMTP id 134mr3207404ioo.148.1443136957467;
	Thu, 24 Sep 2015 16:22:37 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Thu, 24 Sep 2015 16:22:37 -0700 (PDT)
In-Reply-To: <CALbNGRTopGO_K0BqpLaq27EeKhaC63QiE7Yo079PqOP5tQrSXA@mail.gmail.com>
References: <5603FD45.5030308@topic.nl>
	<CALbNGRTopGO_K0BqpLaq27EeKhaC63QiE7Yo079PqOP5tQrSXA@mail.gmail.com>
Date: Fri, 25 Sep 2015 01:22:37 +0200
Message-ID: <CALbNGRR9eL001Y7UByvKuoeQuOr=93OHX_WxjD2NHO5WKNmg-w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: "libgudev" fails to build with current master
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Sep 2015 23:22:38 -0000
X-Groupsio-MsgNum: 57542
Content-Type: multipart/mixed; boundary=001a113fef80b74a5f0520868187

--001a113fef80b74a5f0520868187
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2015 at 6:45 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Thu, Sep 24, 2015 at 3:40 PM, Mike Looijmans <mike.looijmans@topic.nl>=
 wrote:
>> | checking for LIBUDEV... no
>> | configure: error: Package requirements (libudev >=3D 199) were not met=
:
>> |
>> | Requested 'libudev >=3D 199' but version of libudev is 182
>> |
>> ...
>>
>> ERROR: Task 5548
>> (/.../meta-oe/meta-oe/recipes-gnome/libgudev/libgudev_230.bb, do_configu=
re)
>> failed with exit code '1'
>>
> Which init system are you using - I guess not systemd
>
Let's assume it is not systemd. Could you try attached  0001.. for
oe-core and 0002.. foe meta-oe and give feedback. I tested these for
systemd distro without new issues.

Andreas

--001a113fef80b74a5f0520868187
Content-Type: text/x-patch; charset=UTF-8; name="0001-udev-add-PROVIDES-libgudev.patch"
Content-Disposition: attachment; 
	filename="0001-udev-add-PROVIDES-libgudev.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ieyud8ne0

RnJvbSAzODRjNzYzZjY2ZDVmNDliOTY3MjUzZThlNWQyNzI4MjI1NTJhNTI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/QW5kcmVhcz0yME09QzM9QkNsbGVyPz0gPHNj
aG5pdHplbHRvbnlAZ29vZ2xlbWFpbC5jb20+CkRhdGU6IEZyaSwgMjUgU2VwIDIwMTUgMDE6MDQ6
MzEgKzAyMDAKU3ViamVjdDogW1BBVENIXSB1ZGV2OiBhZGQgUFJPVklERVMgPSAibGliZ3VkZXYi
Ck1JTUUtVmVyc2lvbjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYt
OApDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CgpXaXRoIHRoZSBsYXN0IHVwZGF0ZSBv
ZiBzeXN0ZW1kIGxpYmd1ZGV2IHdhcyBzcGxpdHRlZCBvdXQgb2Ygc3lzdGVtZC4gVG8gbWFrZQpw
YWNrYWdlcyBkZXBlbmRpbmcgb24gbGliZ3VkZXYgaGFwcHksIGEgcmVjaXBlIGJ1aWxkaW5nIGxp
Ymd1ZGV2IHdhcyBjcmVhdGVkIGluCm1ldGEtb2UgYW5kIHRoZSBkZXBlbmRlbmNpZXMgd2VyZSBt
b2RpZmllZCBmcm9tIHVkZXYgdG8gbGliZ3VkZXYuCgpUaGlzIHdvcmtzIGZpbmUgZm9yIGRpc3Ry
b3MgdXNpbmcgc3lzdGVtZCBhcyBpbml0IHN5c3RlbSwgYnV0IGRpc3Ryb3Mgbm90IHVzaW5nCmJ1
aWxkIHVkZXYgd2hpY2ggcHJvdmlkZXMgbGliZ3VkZXYuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZWFz
IE3DvGxsZXIgPHNjaG5pdHplbHRvbnlAZ29vZ2xlbWFpbC5jb20+Ci0tLQogbWV0YS9yZWNpcGVz
LWNvcmUvdWRldi91ZGV2LmluYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91ZGV2L3VkZXYuaW5jIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvdWRldi91ZGV2LmluYwppbmRleCBhMDBkYWQ1Li5jMzc4YWUzIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtY29yZS91ZGV2L3VkZXYuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1j
b3JlL3VkZXYvdWRldi5pbmMKQEAgLTE1LDYgKzE1LDggQEAgTERGTEFHUyArPSAiLWxydCIKIERF
UEVORFMgPSAiZ2xpYi0yLjAgbGlidXNiIHVzYnV0aWxzIHBjaXV0aWxzIGdsaWItMi4wLW5hdGl2
ZSBncGVyZi1uYXRpdmUgbGlieHNsdC1uYXRpdmUgdXRpbC1saW51eCIKIFJQUk9WSURFU18ke1BO
fSA9ICJob3RwbHVnIgogCitQUk9WSURFUyA9ICJsaWJndWRldiIKKwogU1JDX1VSSSA9ICIke0tF
Uk5FTE9SR19NSVJST1J9L2xpbnV4L3V0aWxzL2tlcm5lbC9ob3RwbHVnL3VkZXYtJHtQVn0udGFy
Lmd6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtRml4aW5nLWtleWJvYXJkX2ZvcmNlX3JlbGVh
c2Uuc2gtc2hlbGwtc2NyaXB0LXBhdGgucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vYXZvaWQt
bW91c2UtYXV0b3N1c3BlbmQucGF0Y2ggXAotLSAKMi4xLjAKCg==

--001a113fef80b74a5f0520868187
Content-Type: text/x-patch; charset=UTF-8; 
	name="0002-libgudev-skip-recipe-for-distros-not-using-systemd-a.patch"
Content-Disposition: attachment; 
	filename="0002-libgudev-skip-recipe-for-distros-not-using-systemd-a.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ieyudhqd1

RnJvbSBlODMyMzVhNzc3ODgwYzM0M2ZjZTlmMjg2ZjUwNjc4YjIzNzYyMGRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/QW5kcmVhcz0yME09QzM9QkNsbGVyPz0gPHNj
aG5pdHplbHRvbnlAZ29vZ2xlbWFpbC5jb20+CkRhdGU6IEZyaSwgMjUgU2VwIDIwMTUgMDE6MTc6
MDEgKzAyMDAKU3ViamVjdDogW1BBVENIXSBsaWJndWRldjogc2tpcCByZWNpcGUgZm9yIGRpc3Ry
b3Mgbm90IHVzaW5nIHN5c3RlbWQgYXMgaW5pdApNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5
cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzog
OGJpdAoKZm9yIHRob3NlIHN5c3RlbXMgdWRldiBwcm92aWRlcyBsaWJndWRldgoKU2lnbmVkLW9m
Zi1ieTogQW5kcmVhcyBNw7xsbGVyIDxzY2huaXR6ZWx0b255QGdvb2dsZW1haWwuY29tPgotLS0K
IG1ldGEtb2UvcmVjaXBlcy1nbm9tZS9saWJndWRldi9saWJndWRldl8yMzAuYmIgfCA2ICsrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL21ldGEtb2Uv
cmVjaXBlcy1nbm9tZS9saWJndWRldi9saWJndWRldl8yMzAuYmIgYi9tZXRhLW9lL3JlY2lwZXMt
Z25vbWUvbGliZ3VkZXYvbGliZ3VkZXZfMjMwLmJiCmluZGV4IDM5ZmMxYzQuLjllNDU3ZDIgMTAw
NjQ0Ci0tLSBhL21ldGEtb2UvcmVjaXBlcy1nbm9tZS9saWJndWRldi9saWJndWRldl8yMzAuYmIK
KysrIGIvbWV0YS1vZS9yZWNpcGVzLWdub21lL2xpYmd1ZGV2L2xpYmd1ZGV2XzIzMC5iYgpAQCAt
MTEsMyArMTEsOSBAQCBMSUNFTlNFID0gIkxHUEx2Mi4xIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMiCiAKIGlu
aGVyaXQgZ25vbWViYXNlCisKKyMgaW4gbm9uIHN5c3RlbWQgZGlzdHJvcyB1ZGV2IGJ1aWxkcyBs
aWJndWRldgorcHl0aG9uICgpIHsKKyAgICBpZiBub3QgYmIudXRpbHMuY29udGFpbnMgKCdESVNU
Uk9fRkVBVFVSRVMnLCAnc3lzdGVtZCcsIFRydWUsIEZhbHNlLCBkKToKKyAgICAgICAgcmFpc2Ug
YmIucGFyc2UuU2tpcFBhY2thZ2UoIidzeXN0ZW1kJyBub3QgaW4gRElTVFJPX0ZFQVRVUkVTIikK
K30KLS0gCjIuMS4wCgo=

--001a113fef80b74a5f0520868187--
