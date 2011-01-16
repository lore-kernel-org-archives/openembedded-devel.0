Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vadmium@gmail.com>) id 1PeRjL-0004OX-Gr
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Jan 2011 13:29:11 +0100
Received: by wwi17 with SMTP id 17so4158048wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Jan 2011 04:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type;
	bh=3WcudLdMYdTMHoFCV7LvMMrSjlBtilLs6D6x1Ru8yVI=;
	b=ADNPB383OZBj2cp41Q9ZAulYZdVV4Eog7hnClxlarqLS/jYW57s0HRLuVkdRPPw8u3
	1//3qYneJqGSUnzZLrp4QUvedHEzzBauroTE79sUmpeRe8GyCQHJKDdd0b5MFvux6hje
	mEpawl34CIEm0f5WJufC5RciH2F4vVFMrM+Xs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=ZoXtYUNtYPCRLCAJtep6b7l6dZk4QWQGtpvkkoMVQF8VReo2CFeJGbYSsLFK1Zyumh
	QdHeY3ww+XXeaL2GMgZCSFu0VqAzJaftbu573r9u76OM1a1sBKYdNlk5y8kGkATxGPmB
	/D/3RP3FltU+rt1HZ82ZLNHYLuXtPjYPVWBF0=
MIME-Version: 1.0
Received: by 10.216.48.6 with SMTP id u6mr2206914web.77.1295180914995; Sun, 16
	Jan 2011 04:28:34 -0800 (PST)
Sender: vadmium@gmail.com
Received: by 10.216.17.203 with HTTP; Sun, 16 Jan 2011 04:28:34 -0800 (PST)
Date: Sun, 16 Jan 2011 12:28:34 +0000
X-Google-Sender-Auth: y0G26F7frOX-fmv2gnQGMqX6w4w
Message-ID: <AANLkTinMQCv0OHCHcEz9Lzi+V75RRFLBcnYvsFQXs0dL@mail.gmail.com>
From: Martin Panter <vadmium+floss@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Change to MOC 2.4.4; fixes issue with ltdl library
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
X-List-Received-Date: Sun, 16 Jan 2011 12:29:11 -0000
X-Groupsio-MsgNum: 28070
Content-Type: multipart/mixed; boundary=0016364c79dd5bb2f00499f5ce7a

--0016364c79dd5bb2f00499f5ce7a
Content-Type: text/plain; charset=UTF-8

See attached patch file
-Martin

--0016364c79dd5bb2f00499f5ce7a
Content-Type: text/plain; charset=UTF-8; name="moc-2.4.4.patch.txt"
Content-Disposition: attachment; filename="moc-2.4.4.patch.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gizxwjb20

RnJvbSAzMDY4OWZlMGUyM2IxODliN2RhOGJiZjQ2MTY3Njk5MGEyYmRlYzAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJ0aW4gUGFudGVyIDx2YWRtaXVtIMOgIGdtYWlsLmNvbT4K
RGF0ZTogRnJpLCAyNCBEZWMgMjAxMCAwNTozOToxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0ggMS8z
XSBNT0M6IENoYW5nZSB0byAyLjQuNDsgZml4ZXMgaXNzdWUgd2l0aCBsdGRsIGxpYnJhcnkKClZl
cnNpb24gMi40LjMgd291bGQgZ2l2ZSBsb3RzIG9mIGNvbXBsYWludHMgY29tcGlsaW5nIGx0ZGwu
YywgZm9yIGluc3RhbmNlCgpsdGRsLmM6ODYzOjMxOiBlcnJvcjogJ0xURExfT0JKRElSJyB1bmRl
Y2xhcmVkIGhlcmUgKG5vdCBpbiBhIGZ1bmN0aW9uKQoKQWxzbyBjaGFuZ2VkIHRvIFNvdXJjZSBm
b3JnZSBtaXJyb3IKLS0tCiByZWNpcGVzL21vYy9tb2NfMi40LjMuYmIgfCAgIDE4IC0tLS0tLS0t
LS0tLS0tLS0tLQogcmVjaXBlcy9tb2MvbW9jXzIuNC40LmJiIHwgICAxOCArKysrKysrKysrKysr
KysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0p
CiBkZWxldGUgbW9kZSAxMDA2NDQgcmVjaXBlcy9tb2MvbW9jXzIuNC4zLmJiCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgcmVjaXBlcy9tb2MvbW9jXzIuNC40LmJiCgpkaWZmIC0tZ2l0IGEvcmVjaXBlcy9t
b2MvbW9jXzIuNC4zLmJiIGIvcmVjaXBlcy9tb2MvbW9jXzIuNC4zLmJiCmRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCBiYWRjN2FmLi4wMDAwMDAwCi0tLSBhL3JlY2lwZXMvbW9jL21vY18y
LjQuMy5iYgorKysgL2Rldi9udWxsCkBAIC0xLDE4ICswLDAgQEAKLURFU0NSSVBUSU9OID0gIk1P
QyBpcyBhIG5jdXJzZXMgYmFzZWQgbXVzaWMgcGxheWVyIgotQVVUSE9SID0gIkRhbWlhbiBQaWV0
cmFzIDxkYXBlckBkYXBlci5uZXQ+IgotSE9NRVBBR0UgPSAiaHR0cDovL21vYy5kYXBlci5uZXQv
IgotU0VDVElPTiA9ICJjb25zb2xlL211bHRpbWVkaWEiCi1MSUNFTlNFID0gIkdQTCIKLURFUEVO
RFMgPSAibmN1cnNlcyBmbGFjIgotUFIgPSAicjEiCi0KLVNSQ19VUkkgPSAiZnRwOi8vZnRwLmRh
cGVyLm5ldC9wdWIvc29mdC9tb2Mvc3RhYmxlLyR7UE59LSR7UFZ9LnRhci5iejIiCi0KLWluaGVy
aXQgYXV0b3Rvb2xzCi0KLUVYVFJBX09FQ09ORiA9ICItLXdpdGhvdXQtZmxhYyIKLQotRklMRVNf
JHtQTn0tZGJnICs9ICIke2xpYmRpcn0vbW9jL2RlY29kZXJfcGx1Z2lucy8uZGVidWciCi0KLVNS
Q19VUklbbWQ1c3VtXSA9ICI4ODA4MDgyODQ4ZTkwZWVlYzU0MTViYWFlYzdlOThhZCIKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI4NTk4YmI0ZjY1ZTBiN2QyYTY2OWUwNjIyMmU2YmE1ZWIxMTI3YjUy
YjlhMzAxMzZiMmE4MjNjY2VlMTA5MjlmIgpkaWZmIC0tZ2l0IGEvcmVjaXBlcy9tb2MvbW9jXzIu
NC40LmJiIGIvcmVjaXBlcy9tb2MvbW9jXzIuNC40LmJiCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAuLjc1OWIyNDMKLS0tIC9kZXYvbnVsbAorKysgYi9yZWNpcGVzL21vYy9tb2Nf
Mi40LjQuYmIKQEAgLTAsMCArMSwxOCBAQAorREVTQ1JJUFRJT04gPSAiTU9DIGlzIGEgbmN1cnNl
cyBiYXNlZCBtdXNpYyBwbGF5ZXIiCitBVVRIT1IgPSAiRGFtaWFuIFBpZXRyYXMgPGRhcGVyQGRh
cGVyLm5ldD4iCitIT01FUEFHRSA9ICJodHRwOi8vbW9jLmRhcGVyLm5ldC8iCitTRUNUSU9OID0g
ImNvbnNvbGUvbXVsdGltZWRpYSIKK0xJQ0VOU0UgPSAiR1BMIgorREVQRU5EUyA9ICJuY3Vyc2Vz
IGZsYWMiCitQUiA9ICJyMCIKKworU1JDX1VSSSA9ICIke1NPVVJDRUZPUkdFX01JUlJPUn0vJHtQ
Tn0vJHtQfS50YXIuYnoyIgorCitpbmhlcml0IGF1dG90b29scworCitFWFRSQV9PRUNPTkYgPSAi
LS13aXRob3V0LWZsYWMiCisKK0ZJTEVTXyR7UE59LWRiZyArPSAiJHtsaWJkaXJ9L21vYy9kZWNv
ZGVyX3BsdWdpbnMvLmRlYnVnIgorCitTUkNfVVJJW21kNXN1bV0gPSAiNjQ3Yzc3MGE1NTQyYTRh
ZTU0MzczODY4MDdhODk3OTYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjZiZjU3MDcxMjhkZWYy
MGQ4YjY5YzBmMGMzNjI0YTgyYjdmNzJjMzYyODBiY2Y4NmI5YjVlOGJmOGQwOGIwNSIKLS0gCjEu
Ny4xCgo=

--0016364c79dd5bb2f00499f5ce7a--
