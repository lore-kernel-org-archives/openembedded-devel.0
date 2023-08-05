Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13B4C001DE
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:19 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.2162.1691221152744479788
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=CaqxJvGN;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.197, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 048AB1C0007
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221151;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=dyVqGthMht9AtraVS2iaNGKAesstI015RZdfKRRpy4Q=;
	b=CaqxJvGNtfCUglh6RUZmC1gqZmVrNpheurzVrhlEuYuVe4KlPmqeNfDhGLDV3+y6ZSr7x1
	wyQDvJ7EEp770Z9XlzOTgT4sgJbMCqrtMYuQEBgG8Rra/joZcAPSHfTUMGn13crsPVKoFQ
	ltx9VTjJbY/RQTRE1xhuZdNeIgvfrlsjwtajcmpVZXpxFBCKvv8BU6oWAhygFn182K5Csp
	l1CWS6iJd54uheXdPRaCDH+EzOcuWKfiGacDd4CV3YIZbitfOa0BMCaqSXWR0M5cRFeBsU
	olx+wxwnEuMAqukOnhpZY2b3kje71ZW8UTbZhh4e0sQso/i85TW3yOUFhJMheA==
Content-Type: multipart/mixed; boundary="===============3382329150588041905=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-polyline: upgrading to 2.0.0 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104257
Message-Id: <20230805073919.B13B4C001DE@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:19 +0000 (UTC)

--===============3382329150588041905==
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
ZGUgSGVscGVyCgotLSA+OCAtLQpGcm9tIDViNDQ3YmM1MGMxZDkwYWMyYzNlOTBmMDlhMGJiMjVl
NWVlMDM5ZGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206IFVwZ3JhZGUgSGVscGVyIDxh
dWhAbW90by10aW1vLmRldj4KRGF0ZTogRnJpLCA0IEF1ZyAyMDIzIDIzOjQyOjM1IC0wNTAwClN1
YmplY3Q6IFtQQVRDSF0gcHl0aG9uMy1wb2x5bGluZTogdXBncmFkZSAxLjQuMCAtPiAyLjAuMAoK
LS0tCiAuLi5pbmVfMS40LjAuYmIgPT4gcHl0aG9uMy1wb2x5bGluZV8yLjAuMC5iYn0gfCA1OSAr
KysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97
cHl0aG9uMy1wb2x5bGluZV8xLjQuMC5iYiA9PiBweXRob24zLXBvbHlsaW5lXzIuMC4wLmJifSAo
MTMlKQoKZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcG9seWxpbmVfMS40LjAuYmIgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXBvbHlsaW5lXzIuMC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggMTMlCnJlbmFt
ZSBmcm9tIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9seWxp
bmVfMS40LjAuYmIKcmVuYW1lIHRvIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcG9seWxpbmVfMi4wLjAuYmIKaW5kZXggNDg2ZTcwYzhmLi5mNjhkNDExZTkgMTAw
NjQ0Ci0tLSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9s
eWxpbmVfMS40LjAuYmIKKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1wb2x5bGluZV8yLjAuMC5iYgpAQCAtMSwxMCArMSw2MyBAQAorIyBGSVhNRTogdGhl
IExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVw
Z3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9s
ZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0Ug
dmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21t
aXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vu
c2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoK
KyMKKyMgLS0tIExJQ0VOU0UKKyMgKysrIExJQ0VOU0UKKyMgQEAgLTEsMjAgKzEsMjAgQEAKKyMg
LUNvcHlyaWdodCAoYykgMjAxNCBCcnVubyBNLiBDdXN0w7NkaW8KKyMgLUNvcHlyaWdodCAoYykg
MjAxOSBGcmVkZXJpY2sgSmFuc2VuCisjIC0KKyMgLVBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50
ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmluZyBhIGNvcHkKKyMgLW9m
IHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJT
b2Z0d2FyZSIpLCB0byBkZWFsCisjIC1pbiB0aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlv
biwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbiB0aGUgcmlnaHRzCisjIC10byB1c2UsIGNv
cHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsIGFuZC9v
ciBzZWxsCisjIC1jb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMg
dG8gd2hvbSB0aGUgU29mdHdhcmUgaXMKKyMgLWZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0
byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6CisjIC0KKyMgLVRoZSBhYm92ZSBjb3B5cmlnaHQg
bm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxsIGJlIGluY2x1ZGVkIGluCisj
IC1hbGwgY29waWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4KKyMg
LQorIyAtVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkg
T0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKKyMgLUlNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJ
TUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLAorIyAtRklUTkVTUyBG
T1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4gSU4gTk8gRVZFTlQg
U0hBTEwgVEhFCisjIC1BVVRIT1JTIE9SIENPUFlSSUdIVCBIT0xERVJTIEJFIExJQUJMRSBGT1Ig
QU5ZIENMQUlNLCBEQU1BR0VTIE9SIE9USEVSCisjIC1MSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4g
QUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9SIE9USEVSV0lTRSwgQVJJU0lORyBGUk9NLAorIyAt
T1VUIE9GIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUiBP
VEhFUiBERUFMSU5HUyBJTgorIyAtVEhFIFNPRlRXQVJFLgorIyArQ29weXJpZ2h0IChjKSAyMDIz
IEZyZWRlcmljayBKYW5zZW4KKyMgK0NvcHlyaWdodCAoYykgMjAxNCBCcnVubyBNLiBDdXN0w7Nk
aW8KKyMgKworIyArUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2Us
IHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weQorIyArb2YgdGhpcyBzb2Z0d2FyZSBhbmQg
YXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwK
KyMgK2luIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91
dCBsaW1pdGF0aW9uIHRoZSByaWdodHMKKyMgK3RvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwg
cHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwgYW5kL29yIHNlbGwKKyMgK2NvcGllcyBv
ZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZSBTb2Z0d2Fy
ZSBpcworIyArZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29u
ZGl0aW9uczoKKyMgKworIyArVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVy
bWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUgaW5jbHVkZWQgaW4KKyMgK2FsbCBjb3BpZXMgb3Igc3Vi
c3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLgorIyArCisjICtUSEUgU09GVFdBUkUg
SVMgUFJPVklERUQgIkFTIElTIiwgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwgRVhQUkVT
UyBPUgorIyArSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFO
VElFUyBPRiBNRVJDSEFOVEFCSUxJVFksCisjICtGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVS
UE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiBJTiBOTyBFVkVOVCBTSEFMTCBUSEUKKyMgK0FVVEhP
UlMgT1IgQ09QWVJJR0hUIEhPTERFUlMgQkUgTElBQkxFIEZPUiBBTlkgQ0xBSU0sIERBTUFHRVMg
T1IgT1RIRVIKKyMgK0xJQUJJTElUWSwgV0hFVEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1Qs
IFRPUlQgT1IgT1RIRVJXSVNFLCBBUklTSU5HIEZST00sCisjICtPVVQgT0YgT1IgSU4gQ09OTkVD
VElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVSIERFQUxJTkdTIElOCisj
ICtUSEUgU09GVFdBUkUuCisjIAorIworCiBTVU1NQVJZID0gIkEgUHl0aG9uIGltcGxlbWVudGF0
aW9uIG9mIEdvb2dsZSdzIEVuY29kZWQgUG9seWxpbmUgQWxnb3JpdGhtIEZvcm1hdCIKIEhPTUVQ
QUdFID0gImh0dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9wb2x5bGluZS8iCiBMSUNFTlNFID0gIk1J
VCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTBmYmQxMzUwMGNhYmQw
NmRkNzUxYmE2YjJiZTMwNGM2IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTtt
ZDU9MWZiOGQxZGM2ODU2OTUxOTViYjNjMWU0OGFkZmVmNDgiCiAKLVNSQ19VUklbbWQ1c3VtXSA9
ICJiOTdjNTczNzg2MDVjNGE4NTZjNDM3NTY5Zjk1YTBjYiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICI3YzdmODlkMDlhMDljN2I2MTYxYmRiZmI0ZmQzMDRiMTg2ZmM3YTIwNjBmYTRmMzFjYjNmNjFj
NjQ2YTVjMDc0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE0OTJiOGZjYWRjMjE0M2Y4YWVkYzY3
M2QzYzZkOTVkZjQ1MTMxZjFjNjJlYjhkNTFjODE4M2IyNGU3NzE0ODYiCiAKIGluaGVyaXQgcHlw
aSBzZXR1cHRvb2xzMyBwdGVzdAogCi0tIAoyLjI1LjEKCg==

--===============3382329150588041905==
Content-Type: text/x-diff; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-polyline-upgrade-1.4.0-2.0.0.patch"

RnJvbSA1YjQ0N2JjNTBjMWQ5MGFjMmMzZTkwZjA5YTBiYjI1ZTVlZTAzOWRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQG1vdG8tdGltby5kZXY+CkRh
dGU6IEZyaSwgNCBBdWcgMjAyMyAyMzo0MjozNSAtMDUwMApTdWJqZWN0OiBbUEFUQ0hdIHB5dGhv
bjMtcG9seWxpbmU6IHVwZ3JhZGUgMS40LjAgLT4gMi4wLjAKCi0tLQogLi4uaW5lXzEuNC4wLmJi
ID0+IHB5dGhvbjMtcG9seWxpbmVfMi4wLjAuYmJ9IHwgNTkgKysrKysrKysrKysrKysrKysrLQog
MSBmaWxlIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcG9seWxpbmVfMS40
LjAuYmIgPT4gcHl0aG9uMy1wb2x5bGluZV8yLjAuMC5iYn0gKDEzJSkKCmRpZmYgLS1naXQgYS9t
ZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBvbHlsaW5lXzEuNC4w
LmJiIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2x5bGlu
ZV8yLjAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDEzJQpyZW5hbWUgZnJvbSBtZXRhLXB5dGhvbi9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBvbHlsaW5lXzEuNC4wLmJiCnJlbmFtZSB0
byBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBvbHlsaW5lXzIu
MC4wLmJiCmluZGV4IDQ4NmU3MGM4Zi4uZjY4ZDQxMWU5IDEwMDY0NAotLS0gYS9tZXRhLXB5dGhv
bi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBvbHlsaW5lXzEuNC4wLmJiCisrKyBi
L21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9seWxpbmVfMi4w
LjAuYmIKQEAgLTEsMTAgKzEsNjMgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZh
bHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxv
d2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5z
ZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5k
IHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNl
bnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0
IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFCisj
ICsrKyBMSUNFTlNFCisjIEBAIC0xLDIwICsxLDIwIEBACisjIC1Db3B5cmlnaHQgKGMpIDIwMTQg
QnJ1bm8gTS4gQ3VzdMOzZGlvCisjIC1Db3B5cmlnaHQgKGMpIDIwMTkgRnJlZGVyaWNrIEphbnNl
bgorIyAtCisjIC1QZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwg
dG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYSBjb3B5CisjIC1vZiB0aGlzIHNvZnR3YXJlIGFuZCBh
c3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwgdG8gZGVhbAor
IyAtaW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0
IGxpbWl0YXRpb24gdGhlIHJpZ2h0cworIyAtdG8gdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBw
dWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLCBhbmQvb3Igc2VsbAorIyAtY29waWVzIG9m
IHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlIFNvZnR3YXJl
IGlzCisjIC1mdXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBjb25k
aXRpb25zOgorIyAtCisjIC1UaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJt
aXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbgorIyAtYWxsIGNvcGllcyBvciBzdWJz
dGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuCisjIC0KKyMgLVRIRSBTT0ZUV0FSRSBJ
UyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNT
IE9SCisjIC1JTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5U
SUVTIE9GIE1FUkNIQU5UQUJJTElUWSwKKyMgLUZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQ
T1NFIEFORCBOT05JTkZSSU5HRU1FTlQuIElOIE5PIEVWRU5UIFNIQUxMIFRIRQorIyAtQVVUSE9S
UyBPUiBDT1BZUklHSFQgSE9MREVSUyBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdFUyBP
UiBPVEhFUgorIyAtTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwg
VE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwKKyMgLU9VVCBPRiBPUiBJTiBDT05ORUNU
SU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIgREVBTElOR1MgSU4KKyMg
LVRIRSBTT0ZUV0FSRS4KKyMgK0NvcHlyaWdodCAoYykgMjAyMyBGcmVkZXJpY2sgSmFuc2VuCisj
ICtDb3B5cmlnaHQgKGMpIDIwMTQgQnJ1bm8gTS4gQ3VzdMOzZGlvCisjICsKKyMgK1Blcm1pc3Np
b24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFp
bmluZyBhIGNvcHkKKyMgK29mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRh
dGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0byBkZWFsCisjICtpbiB0aGUgU29mdHdhcmUg
d2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbiB0aGUgcmln
aHRzCisjICt0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1dGUs
IHN1YmxpY2Vuc2UsIGFuZC9vciBzZWxsCisjICtjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQg
dG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUgU29mdHdhcmUgaXMKKyMgK2Z1cm5pc2hlZCB0
byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6CisjICsKKyMgK1Ro
ZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxs
IGJlIGluY2x1ZGVkIGluCisjICthbGwgY29waWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9m
IHRoZSBTb2Z0d2FyZS4KKyMgKworIyArVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIs
IFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKKyMgK0lNUExJRUQsIElO
Q0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklM
SVRZLAorIyArRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdF
TUVOVC4gSU4gTk8gRVZFTlQgU0hBTEwgVEhFCisjICtBVVRIT1JTIE9SIENPUFlSSUdIVCBIT0xE
RVJTIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SIE9USEVSCisjICtMSUFCSUxJ
VFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9SIE9USEVSV0lTRSwg
QVJJU0lORyBGUk9NLAorIyArT1VUIE9GIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdB
UkUgT1IgVEhFIFVTRSBPUiBPVEhFUiBERUFMSU5HUyBJTgorIyArVEhFIFNPRlRXQVJFLgorIyAK
KyMKKwogU1VNTUFSWSA9ICJBIFB5dGhvbiBpbXBsZW1lbnRhdGlvbiBvZiBHb29nbGUncyBFbmNv
ZGVkIFBvbHlsaW5lIEFsZ29yaXRobSBGb3JtYXQiCiBIT01FUEFHRSA9ICJodHRwczovL3B5cGku
b3JnL3Byb2plY3QvcG9seWxpbmUvIgogTElDRU5TRSA9ICJNSVQiCi1MSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT0wZmJkMTM1MDBjYWJkMDZkZDc1MWJhNmIyYmUzMDRjNiIK
K0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTFmYjhkMWRjNjg1Njk1MTk1
YmIzYzFlNDhhZGZlZjQ4IgogCi1TUkNfVVJJW21kNXN1bV0gPSAiYjk3YzU3Mzc4NjA1YzRhODU2
YzQzNzU2OWY5NWEwY2IiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2M3Zjg5ZDA5YTA5YzdiNjE2
MWJkYmZiNGZkMzA0YjE4NmZjN2EyMDYwZmE0ZjMxY2IzZjYxYzY0NmE1YzA3NCIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICIxNDkyYjhmY2FkYzIxNDNmOGFlZGM2NzNkM2M2ZDk1ZGY0NTEzMWYxYzYy
ZWI4ZDUxYzgxODNiMjRlNzcxNDg2IgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMgcHRlc3QK
IAotLSAKMi4yNS4xCgo=

--===============3382329150588041905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 12711 entries from dependency cache.
Parsing recipes...done.
Parsing of 7341 .bb files complete (7338 cached, 3 parsed). 12618 targets, 325 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:434929d84beb1d0cec4b680d6371d4b518e7376e"
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
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:434929d84beb1d0cec4b680d6371d4b518e7376e"
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
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:434929d84beb1d0cec4b680d6371d4b518e7376e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Checking sstate mirror object availability...done.
Sstate summary: Wanted 396 Local 192 Mirrors 194 Missed 10 Current 327 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running task 1225 of 2074 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_recipe_qa)
NOTE: recipe python3-polyline-2.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-polyline-2.0.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2054 of 2074 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_fetch)
NOTE: recipe python3-polyline-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-polyline-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 2055 of 2074 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_unpack)
NOTE: Running task 2056 of 2074 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-polyline-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-polyline-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-polyline-2.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2057 of 2074 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_patch)
NOTE: Running task 2058 of 2074 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-polyline-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-polyline-2.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-polyline-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-polyline-2.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-polyline-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2059 of 2074 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2060 of 2074 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_populate_lic)
NOTE: recipe python3-polyline-2.0.0-r0: task do_populate_lic: Started
NOTE: recipe python3-polyline-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-polyline-2.0.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-polyline-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2061 of 2074 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_configure)
NOTE: recipe python3-polyline-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-polyline-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2062 of 2074 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-polyline-2.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-polyline-2.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2063 of 2074 (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_compile)
NOTE: recipe python3-polyline-2.0.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-polyline/2.0.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-polyline/2.0.0-r0/polyline-2.0.0/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-polyline-2.0.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2063 tasks of which 2052 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-polyline-2.0.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-polyline-2.0.0-r0 do_compile: ExecutionError('/scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-polyline/2.0.0-r0/temp/run.do_compile.3555998', 1, None, None)
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/core2-64-poky-linux/python3-polyline/2.0.0-r0/temp/log.do_compile.3555998
ERROR: Task (/home/auh/Projects/meta-openembedded/meta-python/recipes-devtools/python/python3-polyline_2.0.0.bb:do_compile) failed with exit code '1'

--===============3382329150588041905==--

