Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1193DC10F04
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:22 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.2289.1699061895895492882
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BsBt2PMe;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iDqzCxLt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b97fb14a9-1eeaaf98-2e5d-472e-ac8b-728e074a3e1b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=f6JVcTvo0M0zOkLTfuqN43YBr3aXHXV6dyznVF9+gRo=;
	b=BsBt2PMeigIcU4HkL35Gvfg91gnE6LUIZROeqv4fDLTh4ZXZc6jpXqNd/mttQpmp
	UUU3TosEZoYK4Go94p25OMVibBjvVX7wxPX+e4k615P376cj4mzYC7Du5/es9P4mbQe
	t7ONhc5KTy+5CnQYlfuviJrLomrB2dP6zeQfPQtY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=f6JVcTvo0M0zOkLTfuqN43YBr3aXHXV6dyznVF9+gRo=;
	b=iDqzCxLt9tFzPFTbJS0r9kp98RFLilkmdHoKrobUqVL8iKNZ3WFHcsYtsJpY4+s5
	QfezmlA4o76gRy02A0RbGdG9Xq/PrcMsaGGk2hVM5vZfEHDG1Vzyhl6Lq6FQFAk4qx2
	jfOCpMpNMjeA+T4+UytSi5gpruvOBJk2FdD/F7ds=
Content-Type: multipart/mixed; boundary="===============0568499590997774477=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-polyline: upgrading to 2.0.1 FAILED
Message-ID: <0101018b97fb14a9-1eeaaf98-2e5d-472e-ac8b-728e074a3e1b-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106140

--===============0568499590997774477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
ICpweXRob24zLXBvbHlsaW5lKiB0byAqMi4wLjEqIGhhcyBGYWlsZWQoZG9fY29tcGlsZSkuCgpE
ZXRhaWxlZCBlcnJvciBpbmZvcm1hdGlvbjoKCmRvX2NvbXBpbGUgZmFpbGVkCgoKCk5leHQgc3Rl
cHM6CiAgICAtIGFwcGx5IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEtcHl0aG9uMy1wb2x5bGluZS11
cGdyYWRlLTEuNC4wLTIuMC4xLnBhdGNoCiAgICAtIGNoZWNrIHRoZSBjaGFuZ2VzIHRvIHVwc3Ry
ZWFtIHBhdGNoZXMgYW5kIHN1bW1hcml6ZSB0aGVtIGluIHRoZSBjb21taXQgbWVzc2FnZSwKICAg
IC0gY29tcGlsZSBhbiBpbWFnZSB0aGF0IGNvbnRhaW5zIHRoZSBwYWNrYWdlCiAgICAtIHBlcmZv
cm0gc29tZSBiYXNpYyBzYW5pdHkgdGVzdHMKICAgIC0gYW1lbmQgdGhlIHBhdGNoIGFuZCBzaWdu
IGl0IG9mZjogZ2l0IGNvbW1pdCAtcyAtLXJlc2V0LWF1dGhvciAtLWFtZW5kCiAgICAtIHNlbmQg
aXQgdG8gdGhlIGFwcHJvcHJpYXRlIG1haWxpbmcgbGlzdAoKQWx0ZXJuYXRpdmVseSwgaWYgeW91
IGJlbGlldmUgdGhlIHJlY2lwZSBzaG91bGQgbm90IGJlIHVwZ3JhZGVkIGF0IHRoaXMgdGltZSwK
eW91IGNhbiBmaWxsIFJFQ0lQRV9OT19VUERBVEVfUkVBU09OIGluIHJlc3BlY3RpdmUgcmVjaXBl
IGZpbGUgc28gdGhhdAphdXRvbWF0aWMgdXBncmFkZXMgd291bGQgbm8gbG9uZ2VyIGJlIGF0dGVt
cHRlZC4KClBsZWFzZSByZXZpZXcgdGhlIGF0dGFjaGVkIGZpbGVzIGZvciBmdXJ0aGVyIGluZm9y
bWF0aW9uIGFuZCBidWlsZC91cGRhdGUgZmFpbHVyZXMuCkFueSBwcm9ibGVtIHBsZWFzZSBmaWxl
IGEgYnVnIGF0IGh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9lbnRlcl9idWcuY2dp
P3Byb2R1Y3Q9QXV0b21hdGVkJTIwVXBkYXRlJTIwSGFuZGxlcgoKUmVnYXJkcywKVGhlIFVwZ3Jh
ZGUgSGVscGVyCgotLSA+OCAtLQpGcm9tIDUzOTg4YmI1YWExYTMwYTFjMDllM2ZkZDc1ZGM5ZWQw
ZDk3MGI5OWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206IFVwZ3JhZGUgSGVscGVyIDxh
dWhAeW9jdG9wcm9qZWN0Lm9yZz4KRGF0ZTogRnJpLCAzIE5vdiAyMDIzIDIzOjIxOjU3ICswMDAw
ClN1YmplY3Q6IFtQQVRDSF0gcHl0aG9uMy1wb2x5bGluZTogdXBncmFkZSAxLjQuMCAtPiAyLjAu
MQoKLS0tCiAuLi5pbmVfMS40LjAuYmIgPT4gcHl0aG9uMy1wb2x5bGluZV8yLjAuMS5iYn0gfCA1
OSArKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi97cHl0aG9uMy1wb2x5bGluZV8xLjQuMC5iYiA9PiBweXRob24zLXBvbHlsaW5lXzIuMC4xLmJi
fSAoMTMlKQoKZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcG9seWxpbmVfMS40LjAuYmIgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBvbHlsaW5lXzIuMC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggMTMlCnJl
bmFtZSBmcm9tIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9s
eWxpbmVfMS40LjAuYmIKcmVuYW1lIHRvIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcG9seWxpbmVfMi4wLjEuYmIKaW5kZXggNDg2ZTcwYzhmLi4wZWRiZDExZTYg
MTAwNjQ0Ci0tLSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cG9seWxpbmVfMS40LjAuYmIKKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1wb2x5bGluZV8yLjAuMS5iYgpAQCAtMSwxMCArMSw2MyBAQAorIyBGSVhNRTog
dGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29s
IHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhl
IG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VO
U0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBj
b21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xp
Y2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdl
czoKKyMKKyMgLS0tIExJQ0VOU0UKKyMgKysrIExJQ0VOU0UKKyMgQEAgLTEsMjAgKzEsMjAgQEAK
KyMgLUNvcHlyaWdodCAoYykgMjAxNCBCcnVubyBNLiBDdXN0w7NkaW8KKyMgLUNvcHlyaWdodCAo
YykgMjAxOSBGcmVkZXJpY2sgSmFuc2VuCisjIC0KKyMgLVBlcm1pc3Npb24gaXMgaGVyZWJ5IGdy
YW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmluZyBhIGNvcHkKKyMg
LW9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhl
ICJTb2Z0d2FyZSIpLCB0byBkZWFsCisjIC1pbiB0aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmlj
dGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbiB0aGUgcmlnaHRzCisjIC10byB1c2Us
IGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsIGFu
ZC9vciBzZWxsCisjIC1jb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNv
bnMgdG8gd2hvbSB0aGUgU29mdHdhcmUgaXMKKyMgLWZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVj
dCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6CisjIC0KKyMgLVRoZSBhYm92ZSBjb3B5cmln
aHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxsIGJlIGluY2x1ZGVkIGlu
CisjIC1hbGwgY29waWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4K
KyMgLQorIyAtVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFO
VFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKKyMgLUlNUExJRUQsIElOQ0xVRElORyBCVVQgTk9U
IExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLAorIyAtRklUTkVT
UyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4gSU4gTk8gRVZF
TlQgU0hBTEwgVEhFCisjIC1BVVRIT1JTIE9SIENPUFlSSUdIVCBIT0xERVJTIEJFIExJQUJMRSBG
T1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SIE9USEVSCisjIC1MSUFCSUxJVFksIFdIRVRIRVIgSU4g
QU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9SIE9USEVSV0lTRSwgQVJJU0lORyBGUk9NLAor
IyAtT1VUIE9GIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBP
UiBPVEhFUiBERUFMSU5HUyBJTgorIyAtVEhFIFNPRlRXQVJFLgorIyArQ29weXJpZ2h0IChjKSAy
MDIzIEZyZWRlcmljayBKYW5zZW4KKyMgK0NvcHlyaWdodCAoYykgMjAxNCBCcnVubyBNLiBDdXN0
w7NkaW8KKyMgKworIyArUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFy
Z2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weQorIyArb2YgdGhpcyBzb2Z0d2FyZSBh
bmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRl
YWwKKyMgK2luIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0
aG91dCBsaW1pdGF0aW9uIHRoZSByaWdodHMKKyMgK3RvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJn
ZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwgYW5kL29yIHNlbGwKKyMgK2NvcGll
cyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZSBTb2Z0
d2FyZSBpcworIyArZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcg
Y29uZGl0aW9uczoKKyMgKworIyArVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMg
cGVybWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUgaW5jbHVkZWQgaW4KKyMgK2FsbCBjb3BpZXMgb3Ig
c3Vic3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLgorIyArCisjICtUSEUgU09GVFdB
UkUgSVMgUFJPVklERUQgIkFTIElTIiwgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwgRVhQ
UkVTUyBPUgorIyArSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FS
UkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFksCisjICtGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIg
UFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiBJTiBOTyBFVkVOVCBTSEFMTCBUSEUKKyMgK0FV
VEhPUlMgT1IgQ09QWVJJR0hUIEhPTERFUlMgQkUgTElBQkxFIEZPUiBBTlkgQ0xBSU0sIERBTUFH
RVMgT1IgT1RIRVIKKyMgK0xJQUJJTElUWSwgV0hFVEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJB
Q1QsIFRPUlQgT1IgT1RIRVJXSVNFLCBBUklTSU5HIEZST00sCisjICtPVVQgT0YgT1IgSU4gQ09O
TkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVSIERFQUxJTkdTIElO
CisjICtUSEUgU09GVFdBUkUuCisjIAorIworCiBTVU1NQVJZID0gIkEgUHl0aG9uIGltcGxlbWVu
dGF0aW9uIG9mIEdvb2dsZSdzIEVuY29kZWQgUG9seWxpbmUgQWxnb3JpdGhtIEZvcm1hdCIKIEhP
TUVQQUdFID0gImh0dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9wb2x5bGluZS8iCiBMSUNFTlNFID0g
Ik1JVCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTBmYmQxMzUwMGNh
YmQwNmRkNzUxYmE2YjJiZTMwNGM2IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RTttZDU9MWZiOGQxZGM2ODU2OTUxOTViYjNjMWU0OGFkZmVmNDgiCiAKLVNSQ19VUklbbWQ1c3Vt
XSA9ICJiOTdjNTczNzg2MDVjNGE4NTZjNDM3NTY5Zjk1YTBjYiIKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICI3YzdmODlkMDlhMDljN2I2MTYxYmRiZmI0ZmQzMDRiMTg2ZmM3YTIwNjBmYTRmMzFjYjNm
NjFjNjQ2YTVjMDc0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc0Y2I1Y2VhMDk4ZGRkZjA5ZDFh
NWExZjE3YWY5MTg0ZDM3MWNiZjNlOTcyM2RlMDE5NGU1MzBlYzM5Y2ExZjYiCiAKIGluaGVyaXQg
cHlwaSBzZXR1cHRvb2xzMyBwdGVzdAogCi0tIAoyLjM5LjIKCg==

--===============0568499590997774477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5022 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:d850e6cfea071258fd5d979ab08472037fafcf06"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 433 Local 424 Mirrors 0 Missed 9 Current 330 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 339 of 763 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 341 of 763 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 426 of 763 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 430 of 763 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 544 of 763 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-7.4.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-polyline-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-polyline-2.0.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-polyline-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-polyline-2.0.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 752 of 763 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-polyline-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-polyline-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1334 of 2171 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb:do_fetch)
NOTE: recipe python3-polyline-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-polyline-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1939 of 2171 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb:do_unpack)
NOTE: Running task 1940 of 2171 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-polyline-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-polyline-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-polyline-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2152 of 2171 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb:do_patch)
NOTE: Running task 2153 of 2171 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-polyline-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-polyline-2.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-polyline-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-polyline-2.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-polyline-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2155 of 2171 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb:do_configure)
NOTE: recipe python3-polyline-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-polyline-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2157 of 2171 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-polyline-2.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-polyline-2.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2158 of 2171 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb:do_compile)
NOTE: recipe python3-polyline-2.0.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-polyline/2.0.1/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-polyline/2.0.1/polyline-2.0.1/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-polyline/2.0.1/temp/run.do_compile.763079:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-polyline/2.0.1/temp/run.do_compile.763079, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-polyline/2.0.1/temp/run.do_compile.763079, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-polyline/2.0.1/temp/run.do_compile.763079, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-polyline/2.0.1/temp/run.do_compile.763079, line 184
NOTE: recipe python3-polyline-2.0.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2158 tasks of which 2150 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103232127.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103232127.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-polyline-2.0.1-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-polyline-2.0.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-polyline/2.0.1/temp/run.do_compile.763079', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/python3-polyline/2.0.1/temp/log.do_compile.763079
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.1.bb:do_compile) failed with exit code '1'

--===============0568499590997774477==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-polyline-upgrade-1.4.0-2.0.1.patch"

RnJvbSA1Mzk4OGJiNWFhMWEzMGExYzA5ZTNmZGQ3NWRjOWVkMGQ5NzBiOTljIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMzoyMTo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcG9seWxpbmU6IHVwZ3JhZGUgMS40LjAgLT4gMi4wLjEKCi0tLQogLi4uaW5lXzEuNC4w
LmJiID0+IHB5dGhvbjMtcG9seWxpbmVfMi4wLjEuYmJ9IHwgNTkgKysrKysrKysrKysrKysrKysr
LQogMSBmaWxlIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcG9seWxpbmVf
MS40LjAuYmIgPT4gcHl0aG9uMy1wb2x5bGluZV8yLjAuMS5iYn0gKDEzJSkKCmRpZmYgLS1naXQg
YS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBvbHlsaW5lXzEu
NC4wLmJiIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2x5
bGluZV8yLjAuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDEzJQpyZW5hbWUgZnJvbSBtZXRhLXB5dGhv
bi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBvbHlsaW5lXzEuNC4wLmJiCnJlbmFt
ZSB0byBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBvbHlsaW5l
XzIuMC4xLmJiCmluZGV4IDQ4NmU3MGM4Zi4uMGVkYmQxMWU2IDEwMDY0NAotLS0gYS9tZXRhLXB5
dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBvbHlsaW5lXzEuNC4wLmJiCisr
KyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9seWxpbmVf
Mi4wLjEuYmIKQEAgLTEsMTAgKzEsNjMgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VN
IHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZv
bGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGlj
ZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwg
YW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdM
aWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJp
Z2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNF
CisjICsrKyBMSUNFTlNFCisjIEBAIC0xLDIwICsxLDIwIEBACisjIC1Db3B5cmlnaHQgKGMpIDIw
MTQgQnJ1bm8gTS4gQ3VzdMOzZGlvCisjIC1Db3B5cmlnaHQgKGMpIDIwMTkgRnJlZGVyaWNrIEph
bnNlbgorIyAtCisjIC1QZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJn
ZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYSBjb3B5CisjIC1vZiB0aGlzIHNvZnR3YXJlIGFu
ZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwgdG8gZGVh
bAorIyAtaW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRo
b3V0IGxpbWl0YXRpb24gdGhlIHJpZ2h0cworIyAtdG8gdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdl
LCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLCBhbmQvb3Igc2VsbAorIyAtY29waWVz
IG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlIFNvZnR3
YXJlIGlzCisjIC1mdXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBj
b25kaXRpb25zOgorIyAtCisjIC1UaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBw
ZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbgorIyAtYWxsIGNvcGllcyBvciBz
dWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuCisjIC0KKyMgLVRIRSBTT0ZUV0FS
RSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFWFBS
RVNTIE9SCisjIC1JTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJS
QU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwKKyMgLUZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQ
VVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuIElOIE5PIEVWRU5UIFNIQUxMIFRIRQorIyAtQVVU
SE9SUyBPUiBDT1BZUklHSFQgSE9MREVSUyBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdF
UyBPUiBPVEhFUgorIyAtTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFD
VCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwKKyMgLU9VVCBPRiBPUiBJTiBDT05O
RUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIgREVBTElOR1MgSU4K
KyMgLVRIRSBTT0ZUV0FSRS4KKyMgK0NvcHlyaWdodCAoYykgMjAyMyBGcmVkZXJpY2sgSmFuc2Vu
CisjICtDb3B5cmlnaHQgKGMpIDIwMTQgQnJ1bm8gTS4gQ3VzdMOzZGlvCisjICsKKyMgK1Blcm1p
c3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9i
dGFpbmluZyBhIGNvcHkKKyMgK29mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1l
bnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0byBkZWFsCisjICtpbiB0aGUgU29mdHdh
cmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbiB0aGUg
cmlnaHRzCisjICt0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1
dGUsIHN1YmxpY2Vuc2UsIGFuZC9vciBzZWxsCisjICtjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBh
bmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUgU29mdHdhcmUgaXMKKyMgK2Z1cm5pc2hl
ZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6CisjICsKKyMg
K1RoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIHNo
YWxsIGJlIGluY2x1ZGVkIGluCisjICthbGwgY29waWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25z
IG9mIHRoZSBTb2Z0d2FyZS4KKyMgKworIyArVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJ
UyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKKyMgK0lNUExJRUQs
IElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRB
QklMSVRZLAorIyArRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJ
TkdFTUVOVC4gSU4gTk8gRVZFTlQgU0hBTEwgVEhFCisjICtBVVRIT1JTIE9SIENPUFlSSUdIVCBI
T0xERVJTIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SIE9USEVSCisjICtMSUFC
SUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9SIE9USEVSV0lT
RSwgQVJJU0lORyBGUk9NLAorIyArT1VUIE9GIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09G
VFdBUkUgT1IgVEhFIFVTRSBPUiBPVEhFUiBERUFMSU5HUyBJTgorIyArVEhFIFNPRlRXQVJFLgor
IyAKKyMKKwogU1VNTUFSWSA9ICJBIFB5dGhvbiBpbXBsZW1lbnRhdGlvbiBvZiBHb29nbGUncyBF
bmNvZGVkIFBvbHlsaW5lIEFsZ29yaXRobSBGb3JtYXQiCiBIT01FUEFHRSA9ICJodHRwczovL3B5
cGkub3JnL3Byb2plY3QvcG9seWxpbmUvIgogTElDRU5TRSA9ICJNSVQiCi1MSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0wZmJkMTM1MDBjYWJkMDZkZDc1MWJhNmIyYmUzMDRj
NiIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTFmYjhkMWRjNjg1Njk1
MTk1YmIzYzFlNDhhZGZlZjQ4IgogCi1TUkNfVVJJW21kNXN1bV0gPSAiYjk3YzU3Mzc4NjA1YzRh
ODU2YzQzNzU2OWY5NWEwY2IiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2M3Zjg5ZDA5YTA5Yzdi
NjE2MWJkYmZiNGZkMzA0YjE4NmZjN2EyMDYwZmE0ZjMxY2IzZjYxYzY0NmE1YzA3NCIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI3NGNiNWNlYTA5OGRkZGYwOWQxYTVhMWYxN2FmOTE4NGQzNzFjYmYz
ZTk3MjNkZTAxOTRlNTMwZWMzOWNhMWY2IgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMgcHRl
c3QKIAotLSAKMi4zOS4yCgo=

--===============0568499590997774477==--

