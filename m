Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4B4C001DC
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:31:20 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.1012.1689139873424775208
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=Am7B0Zsk;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.199, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7EACFF804
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139872;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=AidDqV1IvcxW+KoySec3VTtlzzjQ5ltiUX+FvozqDzU=;
	b=Am7B0ZskYUrXyE+EBqI/azQv08AfDHCtVDDFGTQwXDBBoSxaExN3HiRwtwCi7qBT4C2EOi
	3n0Im2uEr4cw90sZIvGjp50ITsEOdQ6c3XlOJtAvFAKRLpRVEn7yLPE5/hp8ROKlQpCJ+i
	srevGEJJcF1MD2fea6MHfSd7lDMGmt25c75KXQN5kqv9qqSm1cI93T7krxQTnobbPKppfw
	8JYI/xU1i7KMb5ZiZxMSbZBzHnTQ7Rx6YgYxmCEnI0ctRts7hRbjSHhYsPBSdU5Jt0EKFy
	elFwoovxLKZjq4PPP3AkRwqx5ZSZVai3uFVMxmcri2Gi0S5TSemE9jLWnMkLpQ==
Content-Type: multipart/mixed; boundary="===============7058795700448658704=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-polyline: upgrading to 2.0.0 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103788
Message-Id: <20230712053120.7B4B4C001DC@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:31:20 +0000 (UTC)

--===============7058795700448658704==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
ICpweXRob24zLXBvbHlsaW5lKiB0byAqMi4wLjAqIGhhcyBGYWlsZWQoZG9fY29tcGlsZSkuCgpE
ZXRhaWxlZCBlcnJvciBpbmZvcm1hdGlvbjoKCmRvX2NvbXBpbGUgZmFpbGVkCgoKCk5leHQgc3Rl
cHM6CiAgICAtIGFwcGx5IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEtcHl0aG9uMy1wb2x5bGluZS11
cGdyYWRlLTEuNC4wLTIuMC4wLnBhdGNoCiAgICAtIGNoZWNrIHRoZSBjaGFuZ2VzIHRvIHVwc3Ry
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
ZGUgSGVscGVyCgotLSA+OCAtLQpGcm9tIGU3NTEzYjc2OTBhNWJmMDdlZWRhZjFhZTFiODEyMjA5
ZmRiMDM4OTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206IFVwZ3JhZGUgSGVscGVyIDxh
dWhAbW90by10aW1vLmRldj4KRGF0ZTogVHVlLCAxMSBKdWwgMjAyMyAyMToxMzo0MyAtMDUwMApT
dWJqZWN0OiBbUEFUQ0hdIHB5dGhvbjMtcG9seWxpbmU6IHVwZ3JhZGUgMS40LjAgLT4gMi4wLjAK
Ci0tLQogLi4uaW5lXzEuNC4wLmJiID0+IHB5dGhvbjMtcG9seWxpbmVfMi4wLjAuYmJ9IHwgNTkg
KysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24v
e3B5dGhvbjMtcG9seWxpbmVfMS40LjAuYmIgPT4gcHl0aG9uMy1wb2x5bGluZV8yLjAuMC5iYn0g
KDEzJSkKCmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXBvbHlsaW5lXzEuNC4wLmJiIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1wb2x5bGluZV8yLjAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDEzJQpyZW5h
bWUgZnJvbSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBvbHls
aW5lXzEuNC4wLmJiCnJlbmFtZSB0byBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXBvbHlsaW5lXzIuMC4wLmJiCmluZGV4IDQ4NmU3MGM4Zi4uZjY4ZDQxMWU5IDEw
MDY0NAotLS0gYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBv
bHlsaW5lXzEuNC4wLmJiCisrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcG9seWxpbmVfMi4wLjAuYmIKQEAgLTEsMTAgKzEsNjMgQEAKKyMgRklYTUU6IHRo
ZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1
cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBv
bGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNF
IHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29t
bWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNl
bnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6
CisjCisjIC0tLSBMSUNFTlNFCisjICsrKyBMSUNFTlNFCisjIEBAIC0xLDIwICsxLDIwIEBACisj
IC1Db3B5cmlnaHQgKGMpIDIwMTQgQnJ1bm8gTS4gQ3VzdMOzZGlvCisjIC1Db3B5cmlnaHQgKGMp
IDIwMTkgRnJlZGVyaWNrIEphbnNlbgorIyAtCisjIC1QZXJtaXNzaW9uIGlzIGhlcmVieSBncmFu
dGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYSBjb3B5CisjIC1v
ZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAi
U29mdHdhcmUiKSwgdG8gZGVhbAorIyAtaW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rp
b24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRpb24gdGhlIHJpZ2h0cworIyAtdG8gdXNlLCBj
b3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLCBhbmQv
b3Igc2VsbAorIyAtY29waWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25z
IHRvIHdob20gdGhlIFNvZnR3YXJlIGlzCisjIC1mdXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3Qg
dG8gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOgorIyAtCisjIC1UaGUgYWJvdmUgY29weXJpZ2h0
IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbgor
IyAtYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuCisj
IC0KKyMgLVRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZ
IE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9SCisjIC1JTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBM
SU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwKKyMgLUZJVE5FU1Mg
Rk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuIElOIE5PIEVWRU5U
IFNIQUxMIFRIRQorIyAtQVVUSE9SUyBPUiBDT1BZUklHSFQgSE9MREVSUyBCRSBMSUFCTEUgRk9S
IEFOWSBDTEFJTSwgREFNQUdFUyBPUiBPVEhFUgorIyAtTElBQklMSVRZLCBXSEVUSEVSIElOIEFO
IEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwKKyMg
LU9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1Ig
T1RIRVIgREVBTElOR1MgSU4KKyMgLVRIRSBTT0ZUV0FSRS4KKyMgK0NvcHlyaWdodCAoYykgMjAy
MyBGcmVkZXJpY2sgSmFuc2VuCisjICtDb3B5cmlnaHQgKGMpIDIwMTQgQnJ1bm8gTS4gQ3VzdMOz
ZGlvCisjICsKKyMgK1Blcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdl
LCB0byBhbnkgcGVyc29uIG9idGFpbmluZyBhIGNvcHkKKyMgK29mIHRoaXMgc29mdHdhcmUgYW5k
IGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0byBkZWFs
CisjICtpbiB0aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhv
dXQgbGltaXRhdGlvbiB0aGUgcmlnaHRzCisjICt0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2Us
IHB1Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsIGFuZC9vciBzZWxsCisjICtjb3BpZXMg
b2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUgU29mdHdh
cmUgaXMKKyMgK2Z1cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNv
bmRpdGlvbnM6CisjICsKKyMgK1RoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBl
cm1pc3Npb24gbm90aWNlIHNoYWxsIGJlIGluY2x1ZGVkIGluCisjICthbGwgY29waWVzIG9yIHN1
YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4KKyMgKworIyArVEhFIFNPRlRXQVJF
IElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJF
U1MgT1IKKyMgK0lNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJB
TlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLAorIyArRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBV
UlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4gSU4gTk8gRVZFTlQgU0hBTEwgVEhFCisjICtBVVRI
T1JTIE9SIENPUFlSSUdIVCBIT0xERVJTIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VT
IE9SIE9USEVSCisjICtMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNU
LCBUT1JUIE9SIE9USEVSV0lTRSwgQVJJU0lORyBGUk9NLAorIyArT1VUIE9GIE9SIElOIENPTk5F
Q1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUiBPVEhFUiBERUFMSU5HUyBJTgor
IyArVEhFIFNPRlRXQVJFLgorIyAKKyMKKwogU1VNTUFSWSA9ICJBIFB5dGhvbiBpbXBsZW1lbnRh
dGlvbiBvZiBHb29nbGUncyBFbmNvZGVkIFBvbHlsaW5lIEFsZ29yaXRobSBGb3JtYXQiCiBIT01F
UEFHRSA9ICJodHRwczovL3B5cGkub3JnL3Byb2plY3QvcG9seWxpbmUvIgogTElDRU5TRSA9ICJN
SVQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0wZmJkMTM1MDBjYWJk
MDZkZDc1MWJhNmIyYmUzMDRjNiIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PTFmYjhkMWRjNjg1Njk1MTk1YmIzYzFlNDhhZGZlZjQ4IgogCi1TUkNfVVJJW21kNXN1bV0g
PSAiYjk3YzU3Mzc4NjA1YzRhODU2YzQzNzU2OWY5NWEwY2IiCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiN2M3Zjg5ZDA5YTA5YzdiNjE2MWJkYmZiNGZkMzA0YjE4NmZjN2EyMDYwZmE0ZjMxY2IzZjYx
YzY0NmE1YzA3NCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxNDkyYjhmY2FkYzIxNDNmOGFlZGM2
NzNkM2M2ZDk1ZGY0NTEzMWYxYzYyZWI4ZDUxYzgxODNiMjRlNzcxNDg2IgogCiBpbmhlcml0IHB5
cGkgc2V0dXB0b29sczMgcHRlc3QKIAotLSAKMi4yNS4xCgo=

--===============7058795700448658704==
Content-Type: text/x-diff; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-polyline-upgrade-1.4.0-2.0.0.patch"

RnJvbSBlNzUxM2I3NjkwYTViZjA3ZWVkYWYxYWUxYjgxMjIwOWZkYjAzODkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQG1vdG8tdGltby5kZXY+CkRh
dGU6IFR1ZSwgMTEgSnVsIDIwMjMgMjE6MTM6NDMgLTA1MDAKU3ViamVjdDogW1BBVENIXSBweXRo
b24zLXBvbHlsaW5lOiB1cGdyYWRlIDEuNC4wIC0+IDIuMC4wCgotLS0KIC4uLmluZV8xLjQuMC5i
YiA9PiBweXRob24zLXBvbHlsaW5lXzIuMC4wLmJifSB8IDU5ICsrKysrKysrKysrKysrKysrKy0K
IDEgZmlsZSBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBvbHlsaW5lXzEu
NC4wLmJiID0+IHB5dGhvbjMtcG9seWxpbmVfMi4wLjAuYmJ9ICgxMyUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2x5bGluZV8xLjQu
MC5iYiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9seWxp
bmVfMi4wLjAuYmIKc2ltaWxhcml0eSBpbmRleCAxMyUKcmVuYW1lIGZyb20gbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2x5bGluZV8xLjQuMC5iYgpyZW5hbWUg
dG8gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2x5bGluZV8y
LjAuMC5iYgppbmRleCA0ODZlNzBjOGYuLmY2OGQ0MTFlOSAxMDA2NDQKLS0tIGEvbWV0YS1weXRo
b24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2x5bGluZV8xLjQuMC5iYgorKysg
Yi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBvbHlsaW5lXzIu
MC4wLmJiCkBAIC0xLDEwICsxLDYzIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2
YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xs
b3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vu
c2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFu
ZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGlj
ZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdo
dCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRQor
IyArKysgTElDRU5TRQorIyBAQCAtMSwyMCArMSwyMCBAQAorIyAtQ29weXJpZ2h0IChjKSAyMDE0
IEJydW5vIE0uIEN1c3TDs2RpbworIyAtQ29weXJpZ2h0IChjKSAyMDE5IEZyZWRlcmljayBKYW5z
ZW4KKyMgLQorIyAtUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2Us
IHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weQorIyAtb2YgdGhpcyBzb2Z0d2FyZSBhbmQg
YXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwK
KyMgLWluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91
dCBsaW1pdGF0aW9uIHRoZSByaWdodHMKKyMgLXRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwg
cHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwgYW5kL29yIHNlbGwKKyMgLWNvcGllcyBv
ZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZSBTb2Z0d2Fy
ZSBpcworIyAtZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29u
ZGl0aW9uczoKKyMgLQorIyAtVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVy
bWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUgaW5jbHVkZWQgaW4KKyMgLWFsbCBjb3BpZXMgb3Igc3Vi
c3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLgorIyAtCisjIC1USEUgU09GVFdBUkUg
SVMgUFJPVklERUQgIkFTIElTIiwgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwgRVhQUkVT
UyBPUgorIyAtSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFO
VElFUyBPRiBNRVJDSEFOVEFCSUxJVFksCisjIC1GSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVS
UE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiBJTiBOTyBFVkVOVCBTSEFMTCBUSEUKKyMgLUFVVEhP
UlMgT1IgQ09QWVJJR0hUIEhPTERFUlMgQkUgTElBQkxFIEZPUiBBTlkgQ0xBSU0sIERBTUFHRVMg
T1IgT1RIRVIKKyMgLUxJQUJJTElUWSwgV0hFVEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1Qs
IFRPUlQgT1IgT1RIRVJXSVNFLCBBUklTSU5HIEZST00sCisjIC1PVVQgT0YgT1IgSU4gQ09OTkVD
VElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVSIERFQUxJTkdTIElOCisj
IC1USEUgU09GVFdBUkUuCisjICtDb3B5cmlnaHQgKGMpIDIwMjMgRnJlZGVyaWNrIEphbnNlbgor
IyArQ29weXJpZ2h0IChjKSAyMDE0IEJydW5vIE0uIEN1c3TDs2RpbworIyArCisjICtQZXJtaXNz
aW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRh
aW5pbmcgYSBjb3B5CisjICtvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50
YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwgdG8gZGVhbAorIyAraW4gdGhlIFNvZnR3YXJl
IHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRpb24gdGhlIHJp
Z2h0cworIyArdG8gdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRl
LCBzdWJsaWNlbnNlLCBhbmQvb3Igc2VsbAorIyArY29waWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5k
IHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlIFNvZnR3YXJlIGlzCisjICtmdXJuaXNoZWQg
dG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOgorIyArCisjICtU
aGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFs
bCBiZSBpbmNsdWRlZCBpbgorIyArYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBv
ZiB0aGUgU29mdHdhcmUuCisjICsKKyMgK1RIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMi
LCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9SCisjICtJTVBMSUVELCBJ
TkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJ
TElUWSwKKyMgK0ZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5H
RU1FTlQuIElOIE5PIEVWRU5UIFNIQUxMIFRIRQorIyArQVVUSE9SUyBPUiBDT1BZUklHSFQgSE9M
REVSUyBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdFUyBPUiBPVEhFUgorIyArTElBQklM
SVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0Us
IEFSSVNJTkcgRlJPTSwKKyMgK09VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRX
QVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIgREVBTElOR1MgSU4KKyMgK1RIRSBTT0ZUV0FSRS4KKyMg
CisjCisKIFNVTU1BUlkgPSAiQSBQeXRob24gaW1wbGVtZW50YXRpb24gb2YgR29vZ2xlJ3MgRW5j
b2RlZCBQb2x5bGluZSBBbGdvcml0aG0gRm9ybWF0IgogSE9NRVBBR0UgPSAiaHR0cHM6Ly9weXBp
Lm9yZy9wcm9qZWN0L3BvbHlsaW5lLyIKIExJQ0VOU0UgPSAiTUlUIgotTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MGZiZDEzNTAwY2FiZDA2ZGQ3NTFiYTZiMmJlMzA0YzYi
CitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0xZmI4ZDFkYzY4NTY5NTE5
NWJiM2MxZTQ4YWRmZWY0OCIKIAotU1JDX1VSSVttZDVzdW1dID0gImI5N2M1NzM3ODYwNWM0YTg1
NmM0Mzc1NjlmOTVhMGNiIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdjN2Y4OWQwOWEwOWM3YjYx
NjFiZGJmYjRmZDMwNGIxODZmYzdhMjA2MGZhNGYzMWNiM2Y2MWM2NDZhNWMwNzQiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMTQ5MmI4ZmNhZGMyMTQzZjhhZWRjNjczZDNjNmQ5NWRmNDUxMzFmMWM2
MmViOGQ1MWM4MTgzYjI0ZTc3MTQ4NiIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzIHB0ZXN0
CiAKLS0gCjIuMjUuMQoK

--===============7058795700448658704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12765 entries from dependency cache.
Parsing recipes...done.
Parsing of 7305 .bb files complete (7302 cached, 3 parsed). 12567 targets, 310 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies

Build Configuration (mc:default):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:9aba71ad1cf90f3d29d51a998a810fe340a4dee3"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemux86-musl):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:9aba71ad1cf90f3d29d51a998a810fe340a4dee3"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemuarm64):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:9aba71ad1cf90f3d29d51a998a810fe340a4dee3"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 289 Local 9 Mirrors 272 Missed 8 Current 193 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 200 of 482 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 202 of 482 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-polyline-2.0.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-polyline-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-polyline-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-polyline-2.0.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 1028 of 1688 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_fetch)
NOTE: recipe python3-polyline-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-polyline-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1550 of 1688 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_unpack)
NOTE: Running task 1551 of 1688 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-polyline-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-polyline-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-polyline-2.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1671 of 1688 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_patch)
NOTE: Running task 1672 of 1688 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-polyline-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-polyline-2.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-polyline-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-polyline-2.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-polyline-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1674 of 1688 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_configure)
NOTE: recipe python3-polyline-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-polyline-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1676 of 1688 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-polyline-2.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-polyline-2.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1677 of 1688 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_compile)
NOTE: recipe python3-polyline-2.0.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-polyline/2.0.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-polyline/2.0.0-r0/polyline-2.0.0/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-polyline-2.0.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1677 tasks of which 1669 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 8 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-polyline-2.0.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-polyline-2.0.0-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-polyline/2.0.0-r0/temp/run.do_compile.1382659', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-polyline/2.0.0-r0/temp/log.do_compile.1382659
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_compile) failed with exit code '1'

--===============7058795700448658704==--

