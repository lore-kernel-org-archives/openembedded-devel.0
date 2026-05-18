Return-Path: <ashishkumar.mishra@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F5BCD4F52
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 09:49:47 +0000 (UTC)
Subject: Re: [meta-oe][PATCH v3 0/3] android-tools: migration and cleanup
To: openembedded-devel@lists.openembedded.org
From: "AshishKumar Mishra" <ashishkumar.mishra@bmwtechworks.in>
X-Originating-Location: IN (203.197.190.100)
X-Originating-Platform: Windows Edge 148
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 18 May 2026 02:49:46 -0700
References: <20260505150634.192651-1-emailaddress.ashish@gmail.com> <2022222.1778130561122567168@lists.openembedded.org> <2115555.1778654861364723634@lists.openembedded.org> <6a719287-ab7f-486b-a9c4-ec5801e9e8af@gmail.com> <CAMKF1sp=Ae3MHJYK7fbAXokwEhayigWkOPjpzw+H4Mp3W3Bjow@mail.gmail.com> <PN0P287MB0358EC7112FFB28C9B6157C089062@PN0P287MB0358.INDP287.PROD.OUTLOOK.COM> <CAMKF1spvQfLjaAWu4_QJwU+_QPivKEw7SjTvxMzcc4+dieAmqA@mail.gmail.com> <1575450.1778745762950591364@lists.openembedded.org> <1575450.1778840626136865406@lists.openembedded.org> <1824db6e-eded-4f5f-8626-c74406ef2670@gmail.com> <CAMKF1srFmVDNF=f2aU1SEYFv5MGXgZGOYc9150HDuBeTJg1V8g@mail.gmail.com>
In-Reply-To: <CAMKF1srFmVDNF=f2aU1SEYFv5MGXgZGOYc9150HDuBeTJg1V8g@mail.gmail.com>
Message-ID: <1690109.1779097786262242307@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="fXD4WXJYpxnKZORSnypj"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 09:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127048

--fXD4WXJYpxnKZORSnypj
Content-Type: multipart/alternative; boundary="YGdjIzTIF5xx85fe8PI8"

--YGdjIzTIF5xx85fe8PI8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem / Gyorgy & Team,

This issue was specific to CLANG, and it reported the error as it was being=
 passed header files in compilation command

I have created a fix attached below, would requires teams comment/ feedback=
 on below before i sent RFC-V4.

1) Tested in two separate build one with gcc (default + qemuarm64) another =
with clang + qemuarm64
Compiled android-tools locally and the added in core-image-minimal & t este=
d the adb on qemu target
Local.conf (for clang check)
MACHINE =3D "qemuarm64"
PREFERRED_PROVIDER_virtual/cc =3D "clang"
PREFERRED_PROVIDER_virtual/cxx =3D "clang"
TOOLCHAIN =3D "clang"

#PREFERRED_PROVIDER_llvm =3D "clang"
#PREFERRED_PROVIDER_llvm-native =3D "clang-native"
#PREFERRED_PROVIDER_nativesdk-llvm =3D "nativesdk-clang"
#PROVIDES:pn-clang =3D "llvm"
#PROVIDES:pn-clang-native =3D "llvm-native"
#PROVIDES:pn-nativesdk-clang =3D "nativesdk-llvm"
IMAGE_INSTALL:append =3D " android-tools"
EXTRA_IMAGE_FEATURES +=3D "allow-empty-password empty-root-password allow-r=
oot-login"

root@qemuarm64:~# /bin/adb --version
Android Debug Bridge version 1.0.41
Version -debian
Installed as /usr/bin/adb
root@qemuarm64:~#

2) Can team please confirm if this is sufficient or there is any other test=
 which i could do before sharing the RFC-v4
Idea is to avoid last minute build error like this coming at CI-CD?

3) Going ahead should i check with clang also for every patch which needs t=
o be send upstream ?
This could save teams/ maintainers effort

Attached is the patch for team reference which if team is fine (with approa=
ch and above testing) , will share in RFC-V4

Thanks,
Ashish

--YGdjIzTIF5xx85fe8PI8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Khem / <span style=3D"color: #333333; font-family: system-ui, 'Sego=
e UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, san=
s-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Co=
lor Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: no=
rmal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; wido=
ws: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: nowr=
ap; background-color: #ffffff; text-decoration-thickness: initial; text-dec=
oration-style: initial; text-decoration-color: initial; display: inline !im=
portant; float: none;">Gyorgy<span> &amp; Team,&nbsp;<br /><br />This issue=
 was specific to CLANG, and it reported the error as it was being passed he=
ader files in compilation command&nbsp;<br /><br />I have created a fix att=
ached below, would requires teams comment/ feedback on below before i sent =
RFC-V4.<br /><br />1) <span style=3D"color: #333333; font-family: system-ui=
, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Ari=
al, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', '=
Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-ligatu=
res: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: n=
ormal; orphans: 2; text-align: start; text-indent: 0px; text-transform: non=
e; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-spac=
e: nowrap; background-color: #ffffff; text-decoration-thickness: initial; t=
ext-decoration-style: initial; text-decoration-color: initial; display: inl=
ine !important; float: none;"><span>Tested in two separate build one with g=
cc (default + <span style=3D"color: #333333; font-family: system-ui, 'Segoe=
 UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans=
-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Col=
or Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: nor=
mal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; o=
rphans: 2; text-align: start; text-indent: 0px; text-transform: none; widow=
s: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: nowra=
p; background-color: #ffffff; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial; display: inline !imp=
ortant; float: none;"><span>qemuarm64) another with clang + <span style=3D"=
color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue=
', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', =
'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; f=
ont-style: normal; font-variant-ligatures: normal; font-variant-caps: norma=
l; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start;=
 text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; white-space: nowrap; background-color: #ffffff;=
 text-decoration-thickness: initial; text-decoration-style: initial; text-d=
ecoration-color: initial; display: inline !important; float: none;"><span>q=
emuarm64&nbsp;<br /></span></span></span></span></span></span>&nbsp; &nbsp;=
 <span style=3D"text-decoration: underline;">Compiled android-tools locally=
 and the added in core-image-minimal &amp; t<span style=3D"color: #333333; =
font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', =
'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji'=
, 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: norma=
l; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: =
400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0p=
x; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; white-space: nowrap; background-color: #ffffff; text-decoration=
: underline; float: none; display: inline !important;">ested the adb on qem=
u target&nbsp;<br /></span></span>&nbsp; &nbsp; Local.conf (for clang check=
)&nbsp;<br />&nbsp; &nbsp; MACHINE =3D "qemuarm64"<br />&nbsp; &nbsp; PREFE=
RRED_PROVIDER_virtual/cc =3D "clang"<br />&nbsp; &nbsp; PREFERRED_PROVIDER_=
virtual/cxx =3D "clang"<br />&nbsp; &nbsp; TOOLCHAIN =3D "clang"<br /><br /=
>&nbsp; &nbsp; #PREFERRED_PROVIDER_llvm =3D "clang"<br />&nbsp; &nbsp; #PRE=
FERRED_PROVIDER_llvm-native =3D "clang-native"<br />&nbsp; &nbsp; #PREFERRE=
D_PROVIDER_nativesdk-llvm =3D "nativesdk-clang"<br />&nbsp; &nbsp; #PROVIDE=
S:pn-clang =3D "llvm"<br />&nbsp; &nbsp; #PROVIDES:pn-clang-native =3D "llv=
m-native"<br />&nbsp; &nbsp; #PROVIDES:pn-nativesdk-clang =3D "nativesdk-ll=
vm"<br />&nbsp; &nbsp; IMAGE_INSTALL:append =3D " android-tools"<br />&nbsp=
; &nbsp; EXTRA_IMAGE_FEATURES +=3D "allow-empty-password empty-root-passwor=
d allow-root-login"<br /><br />&nbsp; &nbsp; root@qemuarm64:~# /bin/adb --v=
ersion<br />&nbsp; &nbsp; Android Debug Bridge version 1.0.41<br />&nbsp; &=
nbsp; Version -debian<br />&nbsp; &nbsp; Installed as /usr/bin/adb<br />&nb=
sp; &nbsp; root@qemuarm64:~#<br /><br /><span style=3D"color: #333333; font=
-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Lib=
eration Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'S=
egoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; f=
ont-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; t=
ext-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-widt=
h: 0px; white-space: nowrap; background-color: #ffffff; text-decoration-thi=
ckness: initial; text-decoration-style: initial; text-decoration-color: ini=
tial; display: inline !important; float: none;"><span><span style=3D"color:=
 #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'No=
to Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe=
 UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-st=
yle: normal; font-variant-ligatures: normal; font-variant-caps: normal; fon=
t-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-=
indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; white-space: nowrap; background-color: #ffffff; text-=
decoration-thickness: initial; text-decoration-style: initial; text-decorat=
ion-color: initial; display: inline !important; float: none;"><span><br />2=
) Can team please confirm if this is sufficient or there is any other test =
which i could do before sharing the RFC-v4&nbsp;<br />&nbsp; &nbsp; &nbsp;I=
dea is to avoid last minute build error like this coming at CI-CD?<br /><br=
 />3) Going ahead should i check with clang also for every patch which need=
s to be send upstream ?&nbsp;</span></span></span></span></span></span></di=
v>
<div><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: nowrap; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial; display: inline !important; f=
loat: none;"><span><span style=3D"color: #333333; font-family: system-ui, '=
Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial,=
 sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Not=
o Color Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures=
: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norm=
al; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: =
nowrap; background-color: #ffffff; text-decoration-thickness: initial; text=
-decoration-style: initial; text-decoration-color: initial; display: inline=
 !important; float: none;"><span><span style=3D"color: #333333; font-family=
: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation=
 Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI=
 Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-var=
iant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter=
-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-tra=
nsform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 white-space: nowrap; background-color: #ffffff; text-decoration-thickness:=
 initial; text-decoration-style: initial; text-decoration-color: initial; d=
isplay: inline !important; float: none;"><span>&nbsp; &nbsp; This could sav=
e teams/ maintainers effort&nbsp;</span></span></span></span></span></span>=
</div>
<div><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Rob=
oto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, '=
Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: nowrap; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial; display: inline !important; f=
loat: none;"><span><span style=3D"color: #333333; font-family: system-ui, '=
Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial,=
 sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Not=
o Color Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures=
: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norm=
al; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: =
nowrap; background-color: #ffffff; text-decoration-thickness: initial; text=
-decoration-style: initial; text-decoration-color: initial; display: inline=
 !important; float: none;"><span><span style=3D"color: #333333; font-family=
: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation=
 Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI=
 Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-var=
iant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter=
-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-tra=
nsform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 white-space: nowrap; background-color: #ffffff; text-decoration-thickness:=
 initial; text-decoration-style: initial; text-decoration-color: initial; d=
isplay: inline !important; float: none;"><span><br />Attached is the patch =
for team reference which if team is fine (with approach and above testing) =
, will share in RFC-V4<br /><br /><br />Thanks,<br />Ashish&nbsp;<br /></sp=
an></span></span></span><br /><br /></span></span></div>
<div>&nbsp;</div>

--YGdjIzTIF5xx85fe8PI8--

--fXD4WXJYpxnKZORSnypj
Content-Type: application/octet-stream; name="0001-android-tools-fix-deprecated-header-warning-from-cla.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-android-tools-fix-deprecated-header-warning-from-cla.patch"

RnJvbSA3OWMxZjA4NzhkYzExZDU1MGJlM2E0MzVlZWFhNjAxYjQwOTE5ZWE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBc2hpc2ggS3VtYXIgTWlzaHJhIDxhc2hpc2hrdW1hci5taXNo
cmFAYm13dGVjaHdvcmtzLmluPgpEYXRlOiBTdW4sIDE3IE1heSAyMDI2IDA3OjU0OjI1ICswMDAw
ClN1YmplY3Q6IFtQQVRDSF0gYW5kcm9pZC10b29sczogZml4IGRlcHJlY2F0ZWQgaGVhZGVyIHdh
cm5pbmcgZnJvbSBjbGFuZwoKUmVtb3ZlIC5oIGhlYWRlciBmaWxlcyBmcm9tIHRoZSBTT1VSQ0VT
IGNvbXBpbGF0aW9uIGxpc3QgaW5zaWRlIGFkYmQubWsKdG8gcmVzb2x2ZSBhIENsYW5nIHdhcm5p
bmcgcmVnYXJkaW5nIHRyZWF0aW5nICdjLWhlYWRlcicgaW5wdXQgYXMgJ2MrKy1oZWFkZXInCgpN
b3ZlZCB0aGUgaGVhZGVyIGZpbGVzIGludG8gYSBzZXBhcmF0ZSBIRUFERVJTIHZhcmlhYmxlIHRv
IGFjdCBwdXJlbHkgYXMgYQpHTlUgTWFrZSBkZXBlbmRlbmN5IHRyaWdnZXIsIGtlZXBpbmcgdGhl
bSBvZmYgdGhlIGRpcmVjdCBjb21waWxlcgpleGVjdXRpb24gc3RyaW5nLgoKU2lnbmVkLW9mZi1i
eTogQXNoaXNoIEt1bWFyIE1pc2hyYSA8YXNoaXNoa3VtYXIubWlzaHJhQGJtd3RlY2h3b3Jrcy5p
bj4KLS0tCiAuLi4vYW5kcm9pZC10b29scy9hbmRyb2lkLXRvb2xzL2FkYmQubWsgICAgICAgICAg
IHwgMTUgKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9hbmRy
b2lkLXRvb2xzL2FuZHJvaWQtdG9vbHMvYWRiZC5tayBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29s
cy9hbmRyb2lkLXRvb2xzL2FuZHJvaWQtdG9vbHMvYWRiZC5tawppbmRleCAzMjgyMjE2YjhlLi43
MDlhMTY2ODg3IDEwMDY0NAotLS0gYS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvYW5kcm9pZC10
b29scy9hbmRyb2lkLXRvb2xzL2FkYmQubWsKKysrIGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xz
L2FuZHJvaWQtdG9vbHMvYW5kcm9pZC10b29scy9hZGJkLm1rCkBAIC01LDE2ICs1LDEyIEBAIFNP
VVJDRVMgPSBcCiAJYWRiL2FkYmNvbm5lY3Rpb24vYWRiY29ubmVjdGlvbl9zZXJ2ZXIuY3BwIFwK
IAlhZGIvZGFlbW9uL2F1dGguY3BwIFwKIAlhZGIvZGFlbW9uL2ZpbGVfc3luY19zZXJ2aWNlLmNw
cCBcCi0JYWRiL2RhZW1vbi9maWxlX3N5bmNfc2VydmljZS5oIFwKIAlhZGIvZGFlbW9uL2ZyYW1l
YnVmZmVyX3NlcnZpY2UuY3BwIFwKLQlhZGIvZGFlbW9uL2ZyYW1lYnVmZmVyX3NlcnZpY2UuaCBc
CiAJYWRiL2RhZW1vbi9qZHdwX3NlcnZpY2UuY3BwIFwKIAlhZGIvZGFlbW9uL21haW4uY3BwIFwK
IAlhZGIvZGFlbW9uL3Jlc3RhcnRfc2VydmljZS5jcHAgXAotCWFkYi9kYWVtb24vcmVzdGFydF9z
ZXJ2aWNlLmggXAogCWFkYi9kYWVtb24vc2VydmljZXMuY3BwIFwKIAlhZGIvZGFlbW9uL3NoZWxs
X3NlcnZpY2UuY3BwIFwKLQlhZGIvZGFlbW9uL3NoZWxsX3NlcnZpY2UuaCBcCiAJYWRiL2RhZW1v
bi91c2JfZmZzLmNwcCBcCiAJYWRiL2RhZW1vbi91c2JfbGVnYWN5LmNwcCBcCiAJYWRiL2RhZW1v
bi91c2IuY3BwIFwKQEAgLTQxLDcgKzM3LDE0IEBAIFNPVVJDRVMgPSBcCiAJZGlhZ25vc2VfdXNi
L2RpYWdub3NlX3VzYi5jcHAgXAogCWxpYmFzeW5jaW8vQXN5bmNJTy5jcHAgXAogCitIRUFERVJT
ID0gXAorICAgICAgICBhZGIvZGFlbW9uL2ZpbGVfc3luY19zZXJ2aWNlLmggXAorICAgICAgICBh
ZGIvZGFlbW9uL2ZyYW1lYnVmZmVyX3NlcnZpY2UuaCBcCisgICAgICAgIGFkYi9kYWVtb24vcmVz
dGFydF9zZXJ2aWNlLmggXAorICAgICAgICBhZGIvZGFlbW9uL3NoZWxsX3NlcnZpY2UuaAorCiBT
T1VSQ0VTIDo9ICQoZm9yZWFjaCBzb3VyY2UsICQoU09VUkNFUyksIHN5c3RlbS9jb3JlLyQoc291
cmNlKSkKK0hFQURFUlMgOj0gJChmb3JlYWNoIGhlYWRlciwgJChIRUFERVJTKSwgc3lzdGVtL2Nv
cmUvJChoZWFkZXIpKQogCiBTT1VSQ0VTICs9IFwKICAgICBmcmFtZXdvcmtzL25hdGl2ZS9saWJz
L2FkYmRfYXV0aC9hZGJkX2F1dGguY3BwCkBAIC03OSw5ICs4Miw5IEBAIGlmbmVxICgkKGZpbHRl
ciBhcm1lbCBtaXBzZWwsJChERUJfSE9TVF9BUkNIKSksKQogICBMREZMQUdTICs9IC1sYXRvbWlj
CiBlbmRpZgogCi1idWlsZDogJChTT1VSQ0VTKQorYnVpbGQ6ICQoU09VUkNFUykgJChIRUFERVJT
KQogCW1rZGlyIC0tcGFyZW50cyBkZWJpYW4vb3V0L3N5c3RlbS9jb3JlCi0JJChDWFgpICReIC1v
IGRlYmlhbi9vdXQvc3lzdGVtL2NvcmUvYWRiZCAkKENYWEZMQUdTKSAkKENQUEZMQUdTKSAkKExE
RkxBR1MpCisJJChDWFgpICQoU09VUkNFUykgLW8gZGViaWFuL291dC9zeXN0ZW0vY29yZS9hZGJk
ICQoQ1hYRkxBR1MpICQoQ1BQRkxBR1MpICQoTERGTEFHUykKIAogY2xlYW46CiAJJChSTSkgZGVi
aWFuL291dC9zeXN0ZW0vY29yZS9hZGJkCi0tIAoyLjQzLjAKCg==

--fXD4WXJYpxnKZORSnypj--

