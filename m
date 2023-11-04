Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DFEC072AB
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.2202.1699061894460360985
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hG3c6MWB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=I4HMbSXp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b97fb153a-ecef4ae7-1285-4b12-9b84-b3ee7c838ecb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yu7JVbeBb3S/iDlV6ex+eWHt4el01TurMQtNXQj3XAM=;
	b=hG3c6MWBpTsp80CgFEL/X3IDZGoNiHCeKVVPkxIr351L8iehdW2nSifKzF/Ocjme
	doIxQXn8xSOJbDLQmKFrPey/rNxlFT98BhIXrVbfcbdGqilDmBq4fNbo3LR1BD4KXFD
	YNj7jkc4nAoOqpKaB2Vqmun48G9+kHKYZAgqVAiI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yu7JVbeBb3S/iDlV6ex+eWHt4el01TurMQtNXQj3XAM=;
	b=I4HMbSXph/B1uo+xF8190qpQl8FmyOuFG1r+lJsFTEvkKMoq4iXHdPSer22TSxU7
	EmXid4fquwR8haqv8UFnB7rU1qO5z7Mog8EhmvW4F0TMaVdtIABsdGLQSjJ6j24swJI
	Dq62UxepaSI+EFjUDLMrVuo17zBxDgoqzsFsChAs=
Content-Type: multipart/mixed; boundary="===============1235794858019641321=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-process-tests: upgrading to 3.0.0 SUCCEEDED
Message-ID: <0101018b97fb153a-ecef4ae7-1285-4b12-9b84-b3ee7c838ecb-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106142

--===============1235794858019641321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
ICpweXRob24zLXByb2Nlc3MtdGVzdHMqIHRvICozLjAuMCogaGFzIFN1Y2NlZWRlZC4KCk5leHQg
c3RlcHM6CiAgICAtIGFwcGx5IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEtcHl0aG9uMy1wcm9jZXNz
LXRlc3RzLXVwZ3JhZGUtMi4xLjItMy4wLjAucGF0Y2gKICAgIC0gY2hlY2sgdGhlIGNoYW5nZXMg
dG8gdXBzdHJlYW0gcGF0Y2hlcyBhbmQgc3VtbWFyaXplIHRoZW0gaW4gdGhlIGNvbW1pdCBtZXNz
YWdlLAogICAgLSBjb21waWxlIGFuIGltYWdlIHRoYXQgY29udGFpbnMgdGhlIHBhY2thZ2UKICAg
IC0gcGVyZm9ybSBzb21lIGJhc2ljIHNhbml0eSB0ZXN0cwogICAgLSBhbWVuZCB0aGUgcGF0Y2gg
YW5kIHNpZ24gaXQgb2ZmOiBnaXQgY29tbWl0IC1zIC0tcmVzZXQtYXV0aG9yIC0tYW1lbmQKICAg
IC0gc2VuZCBpdCB0byB0aGUgYXBwcm9wcmlhdGUgbWFpbGluZyBsaXN0CgpBbHRlcm5hdGl2ZWx5
LCBpZiB5b3UgYmVsaWV2ZSB0aGUgcmVjaXBlIHNob3VsZCBub3QgYmUgdXBncmFkZWQgYXQgdGhp
cyB0aW1lLAp5b3UgY2FuIGZpbGwgUkVDSVBFX05PX1VQREFURV9SRUFTT04gaW4gcmVzcGVjdGl2
ZSByZWNpcGUgZmlsZSBzbyB0aGF0CmF1dG9tYXRpYyB1cGdyYWRlcyB3b3VsZCBubyBsb25nZXIg
YmUgYXR0ZW1wdGVkLgoKUGxlYXNlIHJldmlldyB0aGUgYXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRo
ZXIgaW5mb3JtYXRpb24gYW5kIGJ1aWxkL3VwZGF0ZSBmYWlsdXJlcy4KQW55IHByb2JsZW0gcGxl
YXNlIGZpbGUgYSBidWcgYXQgaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL2VudGVy
X2J1Zy5jZ2k/cHJvZHVjdD1BdXRvbWF0ZWQlMjBVcGRhdGUlMjBIYW5kbGVyCgpSZWdhcmRzLApU
aGUgVXBncmFkZSBIZWxwZXIKCi0tID44IC0tCkZyb20gOTAzODNmNjY2ZDBmMjI5NWRiYjNiYjNj
ZjYyZmNlMzhhOTRhYjIzYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKRnJvbTogVXBncmFkZSBI
ZWxwZXIgPGF1aEB5b2N0b3Byb2plY3Qub3JnPgpEYXRlOiBGcmksIDMgTm92IDIwMjMgMjM6Mjc6
NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBweXRob24zLXByb2Nlc3MtdGVzdHM6IHVwZ3JhZGUg
Mi4xLjIgLT4gMy4wLjAKCi0tLQogLi4uLjEuMi5iYiA9PiBweXRob24zLXByb2Nlc3MtdGVzdHNf
My4wLjAuYmJ9IHwgMjcgKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDI1IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS1weXRob24vcmVjaXBlcy1k
ZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHJvY2Vzcy10ZXN0c18yLjEuMi5iYiA9PiBweXRob24z
LXByb2Nlc3MtdGVzdHNfMy4wLjAuYmJ9ICgzMSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wcm9jZXNzLXRlc3RzXzIuMS4yLmJiIGIv
bWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wcm9jZXNzLXRlc3Rz
XzMuMC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggMzElCnJlbmFtZSBmcm9tIG1ldGEtcHl0aG9uL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHJvY2Vzcy10ZXN0c18yLjEuMi5iYgpyZW5h
bWUgdG8gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wcm9jZXNz
LXRlc3RzXzMuMC4wLmJiCmluZGV4IGViMDE1MDRmNi4uYTQwMzZmN2RlIDEwMDY0NAotLS0gYS9t
ZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXByb2Nlc3MtdGVzdHNf
Mi4xLjIuYmIKKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1wcm9jZXNzLXRlc3RzXzMuMC4wLmJiCkBAIC0xLDEyICsxLDM1IEBACisjIEZJWE1FOiB0aGUg
TElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBn
cmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xk
IGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2
YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1p
dCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5z
ZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgor
IworIyAtLS0gTElDRU5TRQorIyArKysgTElDRU5TRQorIyBAQCAtMSw2ICsxLDYgQEAKKyMgLUJT
RCAyLUNsYXVzZSBMaWNlbnNlCisjIC0KKyMgLUNvcHlyaWdodCAoYykgMjAxMy0yMDIwLCBJb25l
bCBDcmlzdGlhbiBNxINyaWXImS4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgK0JTRCAyLUNsYXVz
ZSBMaWNlbnNlCisjICsKKyMgK0NvcHlyaWdodCAoYykgMjAxMy0yMDIzLCBJb25lbCBDcmlzdGlh
biBNxINyaWXImS4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgIAorIyAgUmVkaXN0cmlidXRpb24g
YW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0IG1vZGlm
aWNhdGlvbiwgYXJlIHBlcm1pdHRlZCBwcm92aWRlZCB0aGF0IHRoZQorIyAgZm9sbG93aW5nIGNv
bmRpdGlvbnMgYXJlIG1ldDoKKyMgCisjCisKICMgQ29weXJpZ2h0IChDKSAyMDIxIEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+CiAjIFJlbGVhc2VkIHVuZGVyIHRoZSBNSVQgbGljZW5zZSAo
c2VlIENPUFlJTkcuTUlUIGZvciB0aGUgdGVybXMpCiAKIFNVTU1BUlkgPSAiVG9vbHMgZm9yIHRl
c3RpbmcgcHJvY2Vzc2VzLiIKIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9pb25lbG1j
L3B5dGhvbi1wcm9jZXNzLXRlc3RzIgogTElDRU5TRSA9ICJCU0QtMi1DbGF1c2UiCi1MSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zNzAzMTA1NmFmZjM3ZTRiMzMxMDg3MmE5
YTNkMGIxZSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWFlYTM2ZDQ5
NDI5ZjUzZTA2ODY4ZDg3Y2Q5ZDYyMzQ5IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTM3NDdh
ZDk0N2JkZmM5M2U1Yzk4NmJkYjE3YTZkNzE4ZjNmMjZlODU3N2EwODA3YTAwOTYyZjI5ZTI2ZGVi
YSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlNWQ1N2RlYTcxNjEyNTFlOTFjYWRiODRiZjNlY2M4
NTI3NWZiMTIxZmQ0NzhlNTc5ZjgwMDc3N2IxZDQyNGJkIgogCiBpbmhlcml0IHB5cGkgc2V0dXB0
b29sczMKIAotLSAKMi4zOS4yCgo=

--===============1235794858019641321==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-process-tests-upgrade-2.1.2-3.0.0.patch"

RnJvbSA5MDM4M2Y2NjZkMGYyMjk1ZGJiM2JiM2NmNjJmY2UzOGE5NGFiMjNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAyMzoyNzo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHJvY2Vzcy10ZXN0czogdXBncmFkZSAyLjEuMiAtPiAzLjAuMAoKLS0tCiAuLi4uMS4y
LmJiID0+IHB5dGhvbjMtcHJvY2Vzcy10ZXN0c18zLjAuMC5iYn0gfCAyNyArKysrKysrKysrKysr
KysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wcm9j
ZXNzLXRlc3RzXzIuMS4yLmJiID0+IHB5dGhvbjMtcHJvY2Vzcy10ZXN0c18zLjAuMC5iYn0gKDMx
JSkKCmRpZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXByb2Nlc3MtdGVzdHNfMi4xLjIuYmIgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXByb2Nlc3MtdGVzdHNfMy4wLjAuYmIKc2ltaWxhcml0eSBpbmRleCAz
MSUKcmVuYW1lIGZyb20gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1wcm9jZXNzLXRlc3RzXzIuMS4yLmJiCnJlbmFtZSB0byBtZXRhLXB5dGhvbi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXByb2Nlc3MtdGVzdHNfMy4wLjAuYmIKaW5kZXggZWIwMTUw
NGY2Li5hNDAzNmY3ZGUgMTAwNjQ0Ci0tLSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHJvY2Vzcy10ZXN0c18yLjEuMi5iYgorKysgYi9tZXRhLXB5dGhvbi9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXByb2Nlc3MtdGVzdHNfMy4wLjAuYmIKQEAg
LTEsMTIgKzEsMzUgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZl
IGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0
aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0Lgor
IyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6
ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0
ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVw
ZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFCisjICsrKyBMSUNF
TlNFCisjIEBAIC0xLDYgKzEsNiBAQAorIyAtQlNEIDItQ2xhdXNlIExpY2Vuc2UKKyMgLQorIyAt
Q29weXJpZ2h0IChjKSAyMDEzLTIwMjAsIElvbmVsIENyaXN0aWFuIE3Eg3JpZciZLiBBbGwgcmln
aHRzIHJlc2VydmVkLgorIyArQlNEIDItQ2xhdXNlIExpY2Vuc2UKKyMgKworIyArQ29weXJpZ2h0
IChjKSAyMDEzLTIwMjMsIElvbmVsIENyaXN0aWFuIE3Eg3JpZciZLiBBbGwgcmlnaHRzIHJlc2Vy
dmVkLgorIyAgCisjICBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5
IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQgbW9kaWZpY2F0aW9uLCBhcmUgcGVybWl0dGVkIHByb3Zp
ZGVkIHRoYXQgdGhlCisjICBmb2xsb3dpbmcgY29uZGl0aW9ucyBhcmUgbWV0OgorIyAKKyMKKwog
IyBDb3B5cmlnaHQgKEMpIDIwMjEgS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICMgUmVs
ZWFzZWQgdW5kZXIgdGhlIE1JVCBsaWNlbnNlIChzZWUgQ09QWUlORy5NSVQgZm9yIHRoZSB0ZXJt
cykKIAogU1VNTUFSWSA9ICJUb29scyBmb3IgdGVzdGluZyBwcm9jZXNzZXMuIgogSE9NRVBBR0Ug
PSAiaHR0cHM6Ly9naXRodWIuY29tL2lvbmVsbWMvcHl0aG9uLXByb2Nlc3MtdGVzdHMiCiBMSUNF
TlNFID0gIkJTRC0yLUNsYXVzZSIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PTM3MDMxMDU2YWZmMzdlNGIzMzEwODcyYTlhM2QwYjFlIgorTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRTttZDU9YWVhMzZkNDk0MjlmNTNlMDY4NjhkODdjZDlkNjIzNDkiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhMzc0N2FkOTQ3YmRmYzkzZTVjOTg2YmRiMTdhNmQ3MThm
M2YyNmU4NTc3YTA4MDdhMDA5NjJmMjllMjZkZWJhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImU1
ZDU3ZGVhNzE2MTI1MWU5MWNhZGI4NGJmM2VjYzg1Mjc1ZmIxMjFmZDQ3OGU1NzlmODAwNzc3YjFk
NDI0YmQiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0tIAoyLjM5LjIKCg==

--===============1235794858019641321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-process-tests: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/process-tests/process-tests-2.1.2.tar.gz;downloadfilename=process-tests-2.1.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/process-tests/process-tests-3.0.0.tar.gz;downloadfilename=process-tests-3.0.0.tar.gz"
packages/core2-64-poky-linux/python3-process-tests: PKGV changed from 2.1.2 [default] to 3.0.0 [default]
packages/core2-64-poky-linux/python3-process-tests: PV changed from "2.1.2" to "3.0.0"
packages/core2-64-poky-linux/python3-process-tests/python3-process-tests-dbg: PKGV changed from 2.1.2 [default] to 3.0.0 [default]
packages/core2-64-poky-linux/python3-process-tests/python3-process-tests-dbg: PV changed from "2.1.2" to "3.0.0"
packages/core2-64-poky-linux/python3-process-tests/python3-process-tests-dev: PKGV changed from 2.1.2 [default] to 3.0.0 [default]
packages/core2-64-poky-linux/python3-process-tests/python3-process-tests-dev: PV changed from "2.1.2" to "3.0.0"
packages/core2-64-poky-linux/python3-process-tests/python3-process-tests-doc: PKGV changed from 2.1.2 [default] to 3.0.0 [default]
packages/core2-64-poky-linux/python3-process-tests/python3-process-tests-doc: PV changed from "2.1.2" to "3.0.0"
packages/core2-64-poky-linux/python3-process-tests/python3-process-tests-locale: PKGV changed from 2.1.2 [default] to 3.0.0 [default]
packages/core2-64-poky-linux/python3-process-tests/python3-process-tests-locale: PV changed from "2.1.2" to "3.0.0"
packages/core2-64-poky-linux/python3-process-tests/python3-process-tests-src: PKGV changed from 2.1.2 [default] to 3.0.0 [default]
packages/core2-64-poky-linux/python3-process-tests/python3-process-tests-src: PV changed from "2.1.2" to "3.0.0"
packages/core2-64-poky-linux/python3-process-tests/python3-process-tests-staticdev: PKGV changed from 2.1.2 [default] to 3.0.0 [default]
packages/core2-64-poky-linux/python3-process-tests/python3-process-tests-staticdev: PV changed from "2.1.2" to "3.0.0"
packages/core2-64-poky-linux/python3-process-tests/python3-process-tests: PKGV changed from 2.1.2 [default] to 3.0.0 [default]
packages/core2-64-poky-linux/python3-process-tests/python3-process-tests: PV changed from "2.1.2" to "3.0.0"
packages/core2-64-poky-linux/python3-process-tests/python3-process-tests: PKGSIZE changed from 33671 to 34233 (+2%)
Changes to packages/core2-64-poky-linux/python3-process-tests (sysroot):
  /usr/lib/python3.11/site-packages/process_tests-2.1.2.dist-info moved to /usr/lib/python3.11/site-packages/process_tests-3.0.0.dist-info

--===============1235794858019641321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-process-tests (sysroot):
  /usr/lib/python3.11/site-packages/process_tests-2.1.2.dist-info moved to /usr/lib/python3.11/site-packages/process_tests-3.0.0.dist-info

--===============1235794858019641321==--

