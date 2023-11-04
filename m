Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8554C4332F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 03:13:03 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.3424.1699067573478079919
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 20:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VWwt2AGd;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gstbw5uV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b9851b462-90c6ddca-c118-4b89-abb7-117a665578d8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699067573;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2Nxg8DRKulQaN0IBC7WfQ9I7duhPkGKbrMZft6+WH5w=;
	b=VWwt2AGd1TKykbyHlAjXLgBml3UgT3EhfMztXmnw0dQJBt5N7oTxadZzQvnxavar
	Y+YWv1XO3CMoOgEqJHNGpwIPtgyPxoyA1XSV7KARRCPwbq7MHymGdbKYeElt4hB6K/2
	vePyHhmqR4Jxhlo6asZirqQCfAJd3z580KL8kMwI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699067573;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2Nxg8DRKulQaN0IBC7WfQ9I7duhPkGKbrMZft6+WH5w=;
	b=gstbw5uVui8uovNYlltrj8yz6fG8cZ5eV5qkDuOx+EM01unhbpSUcsTcKk0m3GgF
	ccKuUZgKiWdYpCjYljyotWKQ8rvi+fc/Cc584wAgtOSdI++T6hSASbWOhwX+2kJOK3a
	MUS1GFtuDJJqcBxirsE13Y0sC00hKcAlYaE/9Nrs=
Content-Type: multipart/mixed; boundary="===============6130574160894739484=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] civetweb: upgrading to 1.16 FAILED
Message-ID: <0101018b9851b462-90c6ddca-c118-4b89-abb7-117a665578d8-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 03:12:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 03:13:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106196

--===============6130574160894739484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
ICpjaXZldHdlYiogdG8gKjEuMTYqIGhhcyBGYWlsZWQoZG9fY29tcGlsZSkuCgpEZXRhaWxlZCBl
cnJvciBpbmZvcm1hdGlvbjoKCmRvX2NvbXBpbGUgZmFpbGVkCgoKCk5leHQgc3RlcHM6CiAgICAt
IGFwcGx5IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEtY2l2ZXR3ZWItdXBncmFkZS0xLjEyLTEuMTYu
cGF0Y2gKICAgIC0gY2hlY2sgdGhlIGNoYW5nZXMgdG8gdXBzdHJlYW0gcGF0Y2hlcyBhbmQgc3Vt
bWFyaXplIHRoZW0gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLAogICAgLSBjb21waWxlIGFuIGltYWdl
IHRoYXQgY29udGFpbnMgdGhlIHBhY2thZ2UKICAgIC0gcGVyZm9ybSBzb21lIGJhc2ljIHNhbml0
eSB0ZXN0cwogICAgLSBhbWVuZCB0aGUgcGF0Y2ggYW5kIHNpZ24gaXQgb2ZmOiBnaXQgY29tbWl0
IC1zIC0tcmVzZXQtYXV0aG9yIC0tYW1lbmQKICAgIC0gc2VuZCBpdCB0byB0aGUgYXBwcm9wcmlh
dGUgbWFpbGluZyBsaXN0CgpBbHRlcm5hdGl2ZWx5LCBpZiB5b3UgYmVsaWV2ZSB0aGUgcmVjaXBl
IHNob3VsZCBub3QgYmUgdXBncmFkZWQgYXQgdGhpcyB0aW1lLAp5b3UgY2FuIGZpbGwgUkVDSVBF
X05PX1VQREFURV9SRUFTT04gaW4gcmVzcGVjdGl2ZSByZWNpcGUgZmlsZSBzbyB0aGF0CmF1dG9t
YXRpYyB1cGdyYWRlcyB3b3VsZCBubyBsb25nZXIgYmUgYXR0ZW1wdGVkLgoKUGxlYXNlIHJldmll
dyB0aGUgYXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRoZXIgaW5mb3JtYXRpb24gYW5kIGJ1aWxkL3Vw
ZGF0ZSBmYWlsdXJlcy4KQW55IHByb2JsZW0gcGxlYXNlIGZpbGUgYSBidWcgYXQgaHR0cHM6Ly9i
dWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL2VudGVyX2J1Zy5jZ2k/cHJvZHVjdD1BdXRvbWF0ZWQl
MjBVcGRhdGUlMjBIYW5kbGVyCgpSZWdhcmRzLApUaGUgVXBncmFkZSBIZWxwZXIKCi0tID44IC0t
CkZyb20gYTA5MmFjYjc1N2I4OTI5YWY4ZGQyY2IzNmRmMzIxN2VkOGQzZDcwMyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKRnJvbTogVXBncmFkZSBIZWxwZXIgPGF1aEB5b2N0b3Byb2plY3Qub3Jn
PgpEYXRlOiBTYXQsIDQgTm92IDIwMjMgMDI6MDc6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
aXZldHdlYjogdXBncmFkZSAxLjEyIC0+IDEuMTYKCi0tLQogLi4uL2NpdmV0d2ViL2NpdmV0d2Vi
X2dpdC5iYiAgICAgICAgICAgICAgICAgIHwgMTQwICsrKysrKysrKysrKysrKysrLQogMSBmaWxl
IGNoYW5nZWQsIDEzNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jaXZldHdlYi9jaXZldHdlYl9n
aXQuYmIgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvY2l2ZXR3ZWIvY2l2
ZXR3ZWJfZ2l0LmJiCmluZGV4IGU5YzIwNTYxOC4uNDk1MWZiZDYzIDEwMDY0NAotLS0gYS9tZXRh
LW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvY2l2ZXR3ZWIvY2l2ZXR3ZWJfZ2l0LmJi
CisrKyBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jaXZldHdlYi9jaXZl
dHdlYl9naXQuYmIKQEAgLTEsMTEgKzEsMTQ1IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NI
S1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRo
ZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3
IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVk
ZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZp
YSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNv
cHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElD
RU5TRS5tZAorIyArKysgTElDRU5TRS5tZAorIyBAQCAtMTEsNyArMTEsNyBAQAorIyAgCisjICAj
IyMgSW5jbHVkZWQgd2l0aCBhbGwgZmVhdHVyZXMuCisjICAKKyMgLT4gQ29weXJpZ2h0IChjKSAy
MDEzLTIwMjAgVGhlIENpdmV0V2ViIGRldmVsb3BlcnMgKFtDUkVESVRTLm1kXShodHRwczovL2dp
dGh1Yi5jb20vY2l2ZXR3ZWIvY2l2ZXR3ZWIvYmxvYi9tYXN0ZXIvQ1JFRElUUy5tZCkpCisjICs+
IENvcHlyaWdodCAoYykgMjAxMy0yMDIxIFRoZSBDaXZldFdlYiBkZXZlbG9wZXJzIChbQ1JFRElU
Uy5tZF0oaHR0cHM6Ly9naXRodWIuY29tL2NpdmV0d2ViL2NpdmV0d2ViL2Jsb2IvbWFzdGVyL0NS
RURJVFMubWQpKQorIyAgPgorIyAgPiBDb3B5cmlnaHQgKGMpIDIwMDQtMjAxMyBTZXJnZXkgTHl1
YmthCisjICA+CisjIEBAIC00NSwyNSArNDUsMjkgQEAKKyMgIAorIyAgaHR0cDovL3d3dy5sdWEu
b3JnL2xpY2Vuc2UuaHRtbAorIyAgCisjIC0+IENvcHlyaWdodCAoQykgMTk5NC0yMDE1IEx1YS5v
cmcsIFBVQy1SaW8uCisjIC0+CisjIC0+IFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZy
ZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmluZyBhIGNvcHkKKyMgLT4gb2YgdGhp
cyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3
YXJlIiksIHRvIGRlYWwKKyMgLT4gaW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24s
IGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRpb24gdGhlIHJpZ2h0cworIyAtPiB0byB1c2UsIGNv
cHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsIGFuZC9v
ciBzZWxsCisjIC0+IGNvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29u
cyB0byB3aG9tIHRoZSBTb2Z0d2FyZSBpcworIyAtPiBmdXJuaXNoZWQgdG8gZG8gc28sIHN1Ympl
Y3QgdG8gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOgorIyAtPgorIyAtPiBUaGUgYWJvdmUgY29w
eXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRl
ZCBpbgorIyAtPiBhbGwgY29waWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0
d2FyZS4KKyMgLT4KKyMgLT4gVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhP
VVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKKyMgLT4gSU1QTElFRCwgSU5DTFVE
SU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFks
CisjIC0+IEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1F
TlQuIElOIE5PIEVWRU5UIFNIQUxMIFRIRQorIyAtPiBBVVRIT1JTIE9SIENPUFlSSUdIVCBIT0xE
RVJTIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SIE9USEVSCisjIC0+IExJQUJJ
TElUWSwgV0hFVEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNF
LCBBUklTSU5HIEZST00sCisjIC0+IE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNP
RlRXQVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIgREVBTElOR1MgSU4KKyMgLT4gVEhFIFNPRlRXQVJF
LgorIyArPiBDb3B5cmlnaHQgKEMpIDE5OTQtMjAyMCBMdWEub3JnLCBQVUMtUmlvLgorIyArPgor
IyArPiBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55
IHBlcnNvbiBvYnRhaW5pbmcgYSBjb3B5CisjICs+IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29j
aWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0byBkZWFsCisjICs+
IGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBs
aW1pdGF0aW9uIHRoZSByaWdodHMKKyMgKz4gdG8gdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBw
dWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLCBhbmQvb3Igc2VsbAorIyArPiBjb3BpZXMg
b2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUgU29mdHdh
cmUgaXMKKyMgKz4gZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcg
Y29uZGl0aW9uczoKKyMgKz4KKyMgKz4gVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRo
aXMgcGVybWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUgaW5jbHVkZWQgaW4KKyMgKz4gYWxsIGNvcGll
cyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuCisjICs+CisjICs+IFRI
RSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBL
SU5ELCBFWFBSRVNTIE9SCisjICs+IElNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQg
VE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLAorIyArPiBGSVRORVNTIEZPUiBB
IFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiBJTiBOTyBFVkVOVCBTSEFM
TCBUSEUKKyMgKz4gQVVUSE9SUyBPUiBDT1BZUklHSFQgSE9MREVSUyBCRSBMSUFCTEUgRk9SIEFO
WSBDTEFJTSwgREFNQUdFUyBPUiBPVEhFUgorIyArPiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4g
QUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9SIE9USEVSV0lTRSwgQVJJU0lORyBGUk9NLAorIyAr
PiBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9S
IE9USEVSIERFQUxJTkdTIElOCisjICs+IFRIRSBTT0ZUV0FSRS4KKyMgKworIyArCisjICtBZGRp
dGlvbmFsIGNvbXBvbmVudHMgQ29weXJpZ2h0IChDKSBMdWEub3JnLCBQVUMtUmlvLCB3aXRoIE1J
VCBsaWNlbnNlOiAKKyMgK2h0dHA6Ly93d3cuaW5mLnB1Yy1yaW8uYnIvfnJvYmVydG8vc3RydWN0
LworIyAgCisjICAKKyMgIFNRTGl0ZTMgTGljZW5zZQorIyBAQCAtMTE4LDI3ICsxMjIsMjkgQEAK
KyMgIAorIyAgIyMjIEluY2x1ZGVkIG9ubHkgaWYgYnVpbHQgd2l0aCBMdWEgc3VwcG9ydC4KKyMg
IAorIyAtaHR0cDovL2tlcGxlcnByb2plY3QuZ2l0aHViLmlvL2x1YWZpbGVzeXN0ZW0vbGljZW5z
ZS5odG1sCisjIC0KKyMgLT4gQ29weXJpZ2h0IEtlcGxlciBQcm9qZWN0IDIwMDMgKGh0dHA6Ly93
d3cua2VwbGVycHJvamVjdC5vcmcvbHVhZmlsZXN5c3RlbSkKKyMgLT4KKyMgLT4gUGVybWlzc2lv
biBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWlu
aW5nIGEgY29weQorIyAtPiBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50
YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwgdG8gZGVhbAorIyAtPiBpbiB0aGUgU29mdHdh
cmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbiB0aGUg
cmlnaHRzCisjIC0+IHRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJp
YnV0ZSwgc3VibGljZW5zZSwgYW5kL29yIHNlbGwKKyMgLT4gY29waWVzIG9mIHRoZSBTb2Z0d2Fy
ZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlIFNvZnR3YXJlIGlzCisjIC0+IGZ1
cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6Cisj
IC0+CisjIC0+IFRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24g
bm90aWNlIHNoYWxsIGJlIGluY2x1ZGVkIGluCisjIC0+IGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRp
YWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLgorIyAtPgorIyAtPiBUSEUgU09GVFdBUkUgSVMg
UFJPVklERUQgIkFTIElTIiwgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwgRVhQUkVTUyBP
UgorIyAtPiBJTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5U
SUVTIE9GIE1FUkNIQU5UQUJJTElUWSwKKyMgLT4gRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBV
UlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4gSU4gTk8gRVZFTlQgU0hBTEwgVEhFCisjIC0+IEFV
VEhPUlMgT1IgQ09QWVJJR0hUIEhPTERFUlMgQkUgTElBQkxFIEZPUiBBTlkgQ0xBSU0sIERBTUFH
RVMgT1IgT1RIRVIKKyMgLT4gTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05U
UkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwKKyMgLT4gT1VUIE9GIE9SIElO
IENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUiBPVEhFUiBERUFMSU5H
UyBJTgorIyAtPiBUSEUgU09GVFdBUkUuCisjICtodHRwczovL2dpdGh1Yi5jb20va2VwbGVycHJv
amVjdC9sdWFmaWxlc3lzdGVtL2Jsb2IvbWFzdGVyL0xJQ0VOU0UKKyMgKworIyArPiBDb3B5cmln
aHQgwqkgMjAwMy0yMDIwIEtlcGxlciBQcm9qZWN0LgorIyArPgorIyArPiBQZXJtaXNzaW9uIGlz
IGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbgorIyArPiBvYnRh
aW5pbmcgYSBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlv
bgorIyArPiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3
aXRob3V0CisjICs+IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uIHRo
ZSByaWdodHMgdG8gdXNlLCBjb3B5LAorIyArPiBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0
cmlidXRlLCBzdWJsaWNlbnNlLCBhbmQvb3Igc2VsbCBjb3BpZXMKKyMgKz4gb2YgdGhlIFNvZnR3
YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUgU29mdHdhcmUgaXMKKyMgKz4g
ZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoK
KyMgKz4KKyMgKz4gVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lv
biBub3RpY2Ugc2hhbGwgYmUKKyMgKz4gaW5jbHVkZWQgaW4gYWxsIGNvcGllcyBvciBzdWJzdGFu
dGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuCisjICs+CisjICs+IFRIRSBTT0ZUV0FSRSBJ
UyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELAorIyArPiBF
WFBSRVNTIE9SIElNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJB
TlRJRVMgT0YKKyMgKz4gTUVSQ0hBTlRBQklMSVRZLCBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIg
UFVSUE9TRSBBTkQKKyMgKz4gTk9OSU5GUklOR0VNRU5ULiBJTiBOTyBFVkVOVCBTSEFMTCBUSEUg
QVVUSE9SUyBPUiBDT1BZUklHSFQgSE9MREVSUworIyArPiBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJ
TSwgREFNQUdFUyBPUiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4KKyMgKz4gQUNUSU9O
IE9GIENPTlRSQUNULCBUT1JUIE9SIE9USEVSV0lTRSwgQVJJU0lORyBGUk9NLCBPVVQgT0YgT1Ig
SU4KKyMgKz4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVS
IERFQUxJTkdTIElOIFRIRQorIyArPiBTT0ZUV0FSRS4KKyMgIAorIyAgCisjICBMdWFYTUwgTGlj
ZW5zZQorIyBAQCAtMTg4LDkgKzE5NCw5IEBACisjICA+ID09PT09PT09PT09PT09PQorIyAgPiBE
dWt0YXBlIGxpY2Vuc2UKKyMgID4gPT09PT09PT09PT09PT09CisjIC0+IAorIyArPgorIyAgPiAo
aHR0cDovL29wZW5zb3VyY2Uub3JnL2xpY2Vuc2VzL01JVCkKKyMgLT4gCisjICs+CisjICA+IENv
cHlyaWdodCAoYykgMjAxMy0yMDE3IGJ5IER1a3RhcGUgYXV0aG9ycyAoc2VlIEFVVEhPUlMucnN0
KQorIyAgPgorIyAgPiBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJn
ZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYSBjb3B5CisjIAorIworCiBTVU1NQVJZID0gIkNp
dmV0d2ViIGVtYmVkZGVkIHdlYiBzZXJ2ZXIiCiBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5j
b20vY2l2ZXR3ZWIvY2l2ZXR3ZWIiCiAKIExJQ0VOU0UgPSAiTUlUIgotTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9NTBiZDFkN2YxMzViNTBkN2UyMTg5OTZiYTI4ZDBk
ODgiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT1jZTZjZTZlYjFi
MmZkNTllZTZiYWIyMTk0NzA0NDJhMyIKIAotU1JDUkVWID0gIjRiNDQwYTMzOTk3OTg1MmQ1YTUx
ZmIxMWE4MjI5NTI3MTIyMzFjMjMiCi1QViA9ICIxLjEyK2dpdCR7U1JDUFZ9IgorU1JDUkVWID0g
ImQ3YmEzNWJiYjY0OTIwOWM2NmU1ODJkNWEwMjQ0YmE5ODhhMTUxNTkiCitQViA9ICIxLjE2Igog
U1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2NpdmV0d2ViL2NpdmV0d2ViLmdpdDticmFuY2g9
bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtVW5pdHRlc3Qt
TGluay1saWJydC1hbmQtbGlibS11c2luZy1sLW9wdGlvbi5wYXRjaCBcCiAgICAgICAgICAgICIK
LS0gCjIuMzkuMgoK

--===============6130574160894739484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4886 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:5d31c82493584b315bf51585af1d548ac4b205a4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 154 Local 145 Mirrors 0 Missed 9 Current 155 (94% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 164 of 309 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb:do_populate_lic_setscene)
NOTE: Running setscene task 166 of 309 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 167 of 309 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_create_spdx_setscene)
NOTE: recipe civetweb-1.16-r0: task do_populate_lic_setscene: Started
NOTE: recipe civetweb-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe civetweb-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe civetweb-1.16-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 248 of 309 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 252 of 309 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe civetweb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe civetweb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 289 of 924 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 258 of 309 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe civetweb-1.16-r0: task do_fetch: Started
NOTE: recipe civetweb-1.16-r0: task do_fetch: Succeeded
NOTE: Running task 292 of 924 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb:do_unpack)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe civetweb-1.16-r0: task do_unpack: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 265 of 309 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 267 of 309 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe civetweb-1.16-r0: task do_unpack: Succeeded
NOTE: Running task 764 of 924 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb:do_patch)
NOTE: recipe civetweb-1.16-r0: task do_patch: Started
NOTE: recipe civetweb-1.16-r0: task do_patch: Succeeded
NOTE: Running task 766 of 924 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb:do_generate_toolchain_file)
NOTE: recipe civetweb-1.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe civetweb-1.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 301 of 309 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 303 of 309 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 306 of 309 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 902 of 924 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 911 of 924 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb:do_collect_spdx_deps)
NOTE: recipe civetweb-1.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe civetweb-1.16-r0: task do_collect_spdx_deps: Started
NOTE: recipe civetweb-1.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe civetweb-1.16-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 912 of 924 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb:do_configure)
NOTE: recipe civetweb-1.16-r0: task do_configure: Started
NOTE: recipe civetweb-1.16-r0: task do_configure: Succeeded
NOTE: Running task 913 of 924 (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb:do_compile)
NOTE: recipe civetweb-1.16-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/build --target all --
| Change Dir: '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/build'
| 
| Run Build Command(s): /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/recipe-sysroot-native/usr/bin/cmake -E env VERBOSE=1 make -f Makefile -j16 all
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/recipe-sysroot-native/usr/bin/cmake -S/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/git -B/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/build --check-build-system CMakeFiles/Makefile.cmake 0
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/recipe-sysroot-native/usr/bin/cmake -E cmake_progress_start /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/build/CMakeFiles /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/build//CMakeFiles/progress.marks
| make  -f CMakeFiles/Makefile2 all
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/build'
| make  -f src/CMakeFiles/civetweb-c-library.dir/build.make src/CMakeFiles/civetweb-c-library.dir/depend
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/build'
| cd /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/build && /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/recipe-sysroot-native/usr/bin/cmake -E cmake_depends "Unix Makefiles" /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/git /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/git/src /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/build /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/build/src /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/build/src/CMakeFiles/civetweb-c-library.dir/DependInfo.cmake "--color="
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/build'
| make  -f src/CMakeFiles/civetweb-c-library.dir/build.make src/CMakeFiles/civetweb-c-library.dir/build
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/build'
| [ 25%] Building C object src/CMakeFiles/civetweb-c-library.dir/civetweb.c.o
| cd /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/build/src && /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/recipe-sysroot -DCIVETWEB_DLL_EXPORTS -DNO_CGI -DNO_SSL_DL -DUSE_IPV6 -DUSE_STACK_SIZE=102400 -DUSE_WEBSOCKET -Dcivetweb_c_library_EXPORTS -I/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home
 /pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/git=/usr/src/debug/civetweb/1.16-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/git=/usr/src/debug/civetweb/1.16-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/build=/usr/src/debug/civetweb/1.16-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/build=/usr/src/debug/civetweb/1.16-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/recipe-sysroot-native=  -std=c
 11 -Wall -Wextra -Wshadow -Wconversion -Wmissing-prototypes -Wparentheses -Wno-padded -Wno-unused-macros -Wno-format-nonliteral -Wno-cast-qual -pedantic-errors -fvisibility=hidden -fPIC -MD -MT src/CMakeFiles/civetweb-c-library.dir/civetweb.c.o -MF CMakeFiles/civetweb-c-library.dir/civetweb.c.o.d -o CMakeFiles/civetweb-c-library.dir/civetweb.c.o -c /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/git/src/civetweb.c
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/git/src/civetweb.c:1561:2: error: #error "Please define OPENSSL_API_#_# or USE_MBEDTLS"
|  1561 | #error "Please define OPENSSL_API_#_# or USE_MBEDTLS"
|       |  ^~~~~
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/git/src/civetweb.c: In function 'init_ssl_ctx_impl':
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/git/src/civetweb.c:17286:47: warning: conversion to 'uint64_t' {aka 'long unsigned int'} from 'long int' may change the sign of the result [-Wsign-conversion]
| 17286 |         SSL_CTX_set_options(dom_ctx->ssl_ctx, ssl_get_protocol(protocol_ver));
|       |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/git/src/civetweb.c: In function 'mg_init_library':
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/git/src/civetweb.c:22448:22: error: 'mg_openssl_initialized' undeclared (first use in this function)
| 22448 |                 if (!mg_openssl_initialized) {
|       |                      ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/git/src/civetweb.c:22448:22: note: each undeclared identifier is reported only once for each function it appears in
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/build'
| make[2]: *** [src/CMakeFiles/civetweb-c-library.dir/build.make:76: src/CMakeFiles/civetweb-c-library.dir/civetweb.c.o] Error 1
| make[1]: *** [CMakeFiles/Makefile2:856: src/CMakeFiles/civetweb-c-library.dir/all] Error 2
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/build'
| make: *** [Makefile:166: all] Error 2
| 
| WARNING: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/temp/run.do_compile.418669:153 exit 2 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/temp/run.do_compile.418669, line 153
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/temp/run.do_compile.418669, line 147
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/temp/run.do_compile.418669, line 142
| 	#4: main, /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/temp/run.do_compile.418669, line 166
NOTE: recipe civetweb-1.16-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 913 tasks of which 905 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104020657.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104020657.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: civetweb-1.16-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/temp/run.do_compile.418669', 2, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/civetweb/1.16/temp/log.do_compile.418669
ERROR: Task (/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb:do_compile) failed with exit code '1'

--===============6130574160894739484==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-civetweb-upgrade-1.12-1.16.patch"

RnJvbSBhMDkyYWNiNzU3Yjg5MjlhZjhkZDJjYjM2ZGYzMjE3ZWQ4ZDNkNzAzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBOb3YgMjAyMyAwMjowNzoxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNp
dmV0d2ViOiB1cGdyYWRlIDEuMTIgLT4gMS4xNgoKLS0tCiAuLi4vY2l2ZXR3ZWIvY2l2ZXR3ZWJf
Z2l0LmJiICAgICAgICAgICAgICAgICAgfCAxNDAgKysrKysrKysrKysrKysrKystCiAxIGZpbGUg
Y2hhbmdlZCwgMTM3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
bWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L2NpdmV0d2ViL2NpdmV0d2ViX2dp
dC5iYiBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jaXZldHdlYi9jaXZl
dHdlYl9naXQuYmIKaW5kZXggZTljMjA1NjE4Li40OTUxZmJkNjMgMTAwNjQ0Ci0tLSBhL21ldGEt
bmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jaXZldHdlYi9jaXZldHdlYl9naXQuYmIK
KysrIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L2NpdmV0d2ViL2NpdmV0
d2ViX2dpdC5iYgpAQCAtMSwxMSArMSwxNDUgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hL
U1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhl
IGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcg
bGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRl
ZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2Ugdmlh
ICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29w
eXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNF
TlNFLm1kCisjICsrKyBMSUNFTlNFLm1kCisjIEBAIC0xMSw3ICsxMSw3IEBACisjICAKKyMgICMj
IyBJbmNsdWRlZCB3aXRoIGFsbCBmZWF0dXJlcy4KKyMgIAorIyAtPiBDb3B5cmlnaHQgKGMpIDIw
MTMtMjAyMCBUaGUgQ2l2ZXRXZWIgZGV2ZWxvcGVycyAoW0NSRURJVFMubWRdKGh0dHBzOi8vZ2l0
aHViLmNvbS9jaXZldHdlYi9jaXZldHdlYi9ibG9iL21hc3Rlci9DUkVESVRTLm1kKSkKKyMgKz4g
Q29weXJpZ2h0IChjKSAyMDEzLTIwMjEgVGhlIENpdmV0V2ViIGRldmVsb3BlcnMgKFtDUkVESVRT
Lm1kXShodHRwczovL2dpdGh1Yi5jb20vY2l2ZXR3ZWIvY2l2ZXR3ZWIvYmxvYi9tYXN0ZXIvQ1JF
RElUUy5tZCkpCisjICA+CisjICA+IENvcHlyaWdodCAoYykgMjAwNC0yMDEzIFNlcmdleSBMeXVi
a2EKKyMgID4KKyMgQEAgLTQ1LDI1ICs0NSwyOSBAQAorIyAgCisjICBodHRwOi8vd3d3Lmx1YS5v
cmcvbGljZW5zZS5odG1sCisjICAKKyMgLT4gQ29weXJpZ2h0IChDKSAxOTk0LTIwMTUgTHVhLm9y
ZywgUFVDLVJpby4KKyMgLT4KKyMgLT4gUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJl
ZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weQorIyAtPiBvZiB0aGlz
IHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdh
cmUiKSwgdG8gZGVhbAorIyAtPiBpbiB0aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlvbiwg
aW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbiB0aGUgcmlnaHRzCisjIC0+IHRvIHVzZSwgY29w
eSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwgYW5kL29y
IHNlbGwKKyMgLT4gY29waWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25z
IHRvIHdob20gdGhlIFNvZnR3YXJlIGlzCisjIC0+IGZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVj
dCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6CisjIC0+CisjIC0+IFRoZSBhYm92ZSBjb3B5
cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxsIGJlIGluY2x1ZGVk
IGluCisjIC0+IGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3
YXJlLgorIyAtPgorIyAtPiBUSEUgU09GVFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiwgV0lUSE9V
VCBXQVJSQU5UWSBPRiBBTlkgS0lORCwgRVhQUkVTUyBPUgorIyAtPiBJTVBMSUVELCBJTkNMVURJ
TkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwK
KyMgLT4gRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVO
VC4gSU4gTk8gRVZFTlQgU0hBTEwgVEhFCisjIC0+IEFVVEhPUlMgT1IgQ09QWVJJR0hUIEhPTERF
UlMgQkUgTElBQkxFIEZPUiBBTlkgQ0xBSU0sIERBTUFHRVMgT1IgT1RIRVIKKyMgLT4gTElBQklM
SVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0Us
IEFSSVNJTkcgRlJPTSwKKyMgLT4gT1VUIE9GIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09G
VFdBUkUgT1IgVEhFIFVTRSBPUiBPVEhFUiBERUFMSU5HUyBJTgorIyAtPiBUSEUgU09GVFdBUkUu
CisjICs+IENvcHlyaWdodCAoQykgMTk5NC0yMDIwIEx1YS5vcmcsIFBVQy1SaW8uCisjICs+Cisj
ICs+IFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkg
cGVyc29uIG9idGFpbmluZyBhIGNvcHkKKyMgKz4gb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2Np
YXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwKKyMgKz4g
aW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0IGxp
bWl0YXRpb24gdGhlIHJpZ2h0cworIyArPiB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1
Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsIGFuZC9vciBzZWxsCisjICs+IGNvcGllcyBv
ZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZSBTb2Z0d2Fy
ZSBpcworIyArPiBmdXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBj
b25kaXRpb25zOgorIyArPgorIyArPiBUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhp
cyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbgorIyArPiBhbGwgY29waWVz
IG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4KKyMgKz4KKyMgKz4gVEhF
IFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJ
TkQsIEVYUFJFU1MgT1IKKyMgKz4gSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBU
TyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFksCisjICs+IEZJVE5FU1MgRk9SIEEg
UEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuIElOIE5PIEVWRU5UIFNIQUxM
IFRIRQorIyArPiBBVVRIT1JTIE9SIENPUFlSSUdIVCBIT0xERVJTIEJFIExJQUJMRSBGT1IgQU5Z
IENMQUlNLCBEQU1BR0VTIE9SIE9USEVSCisjICs+IExJQUJJTElUWSwgV0hFVEhFUiBJTiBBTiBB
Q1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLCBBUklTSU5HIEZST00sCisjICs+
IE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1Ig
T1RIRVIgREVBTElOR1MgSU4KKyMgKz4gVEhFIFNPRlRXQVJFLgorIyArCisjICsKKyMgK0FkZGl0
aW9uYWwgY29tcG9uZW50cyBDb3B5cmlnaHQgKEMpIEx1YS5vcmcsIFBVQy1SaW8sIHdpdGggTUlU
IGxpY2Vuc2U6IAorIyAraHR0cDovL3d3dy5pbmYucHVjLXJpby5ici9+cm9iZXJ0by9zdHJ1Y3Qv
CisjICAKKyMgIAorIyAgU1FMaXRlMyBMaWNlbnNlCisjIEBAIC0xMTgsMjcgKzEyMiwyOSBAQAor
IyAgCisjICAjIyMgSW5jbHVkZWQgb25seSBpZiBidWlsdCB3aXRoIEx1YSBzdXBwb3J0LgorIyAg
CisjIC1odHRwOi8va2VwbGVycHJvamVjdC5naXRodWIuaW8vbHVhZmlsZXN5c3RlbS9saWNlbnNl
Lmh0bWwKKyMgLQorIyAtPiBDb3B5cmlnaHQgS2VwbGVyIFByb2plY3QgMjAwMyAoaHR0cDovL3d3
dy5rZXBsZXJwcm9qZWN0Lm9yZy9sdWFmaWxlc3lzdGVtKQorIyAtPgorIyAtPiBQZXJtaXNzaW9u
IGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5p
bmcgYSBjb3B5CisjIC0+IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRh
dGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0byBkZWFsCisjIC0+IGluIHRoZSBTb2Z0d2Fy
ZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uIHRoZSBy
aWdodHMKKyMgLT4gdG8gdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmli
dXRlLCBzdWJsaWNlbnNlLCBhbmQvb3Igc2VsbAorIyAtPiBjb3BpZXMgb2YgdGhlIFNvZnR3YXJl
LCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUgU29mdHdhcmUgaXMKKyMgLT4gZnVy
bmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKKyMg
LT4KKyMgLT4gVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBu
b3RpY2Ugc2hhbGwgYmUgaW5jbHVkZWQgaW4KKyMgLT4gYWxsIGNvcGllcyBvciBzdWJzdGFudGlh
bCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuCisjIC0+CisjIC0+IFRIRSBTT0ZUV0FSRSBJUyBQ
Uk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9S
CisjIC0+IElNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJ
RVMgT0YgTUVSQ0hBTlRBQklMSVRZLAorIyAtPiBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVS
UE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiBJTiBOTyBFVkVOVCBTSEFMTCBUSEUKKyMgLT4gQVVU
SE9SUyBPUiBDT1BZUklHSFQgSE9MREVSUyBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdF
UyBPUiBPVEhFUgorIyAtPiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRS
QUNULCBUT1JUIE9SIE9USEVSV0lTRSwgQVJJU0lORyBGUk9NLAorIyAtPiBPVVQgT0YgT1IgSU4g
Q09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVSIERFQUxJTkdT
IElOCisjIC0+IFRIRSBTT0ZUV0FSRS4KKyMgK2h0dHBzOi8vZ2l0aHViLmNvbS9rZXBsZXJwcm9q
ZWN0L2x1YWZpbGVzeXN0ZW0vYmxvYi9tYXN0ZXIvTElDRU5TRQorIyArCisjICs+IENvcHlyaWdo
dCDCqSAyMDAzLTIwMjAgS2VwbGVyIFByb2plY3QuCisjICs+CisjICs+IFBlcm1pc3Npb24gaXMg
aGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uCisjICs+IG9idGFp
bmluZyBhIGNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9u
CisjICs+IGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwgaW4gdGhlIFNvZnR3YXJlIHdp
dGhvdXQKKyMgKz4gcmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRpb24gdGhl
IHJpZ2h0cyB0byB1c2UsIGNvcHksCisjICs+IG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3Ry
aWJ1dGUsIHN1YmxpY2Vuc2UsIGFuZC9vciBzZWxsIGNvcGllcworIyArPiBvZiB0aGUgU29mdHdh
cmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZSBTb2Z0d2FyZSBpcworIyArPiBm
dXJuaXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOgor
IyArPgorIyArPiBUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9u
IG5vdGljZSBzaGFsbCBiZQorIyArPiBpbmNsdWRlZCBpbiBhbGwgY29waWVzIG9yIHN1YnN0YW50
aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4KKyMgKz4KKyMgKz4gVEhFIFNPRlRXQVJFIElT
IFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsCisjICs+IEVY
UFJFU1MgT1IgSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFO
VElFUyBPRgorIyArPiBNRVJDSEFOVEFCSUxJVFksIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQ
VVJQT1NFIEFORAorIyArPiBOT05JTkZSSU5HRU1FTlQuIElOIE5PIEVWRU5UIFNIQUxMIFRIRSBB
VVRIT1JTIE9SIENPUFlSSUdIVCBIT0xERVJTCisjICs+IEJFIExJQUJMRSBGT1IgQU5ZIENMQUlN
LCBEQU1BR0VTIE9SIE9USEVSIExJQUJJTElUWSwgV0hFVEhFUiBJTiBBTgorIyArPiBBQ1RJT04g
T0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLCBBUklTSU5HIEZST00sIE9VVCBPRiBPUiBJ
TgorIyArPiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIg
REVBTElOR1MgSU4gVEhFCisjICs+IFNPRlRXQVJFLgorIyAgCisjICAKKyMgIEx1YVhNTCBMaWNl
bnNlCisjIEBAIC0xODgsOSArMTk0LDkgQEAKKyMgID4gPT09PT09PT09PT09PT09CisjICA+IER1
a3RhcGUgbGljZW5zZQorIyAgPiA9PT09PT09PT09PT09PT0KKyMgLT4gCisjICs+CisjICA+ICho
dHRwOi8vb3BlbnNvdXJjZS5vcmcvbGljZW5zZXMvTUlUKQorIyAtPiAKKyMgKz4KKyMgID4gQ29w
eXJpZ2h0IChjKSAyMDEzLTIwMTcgYnkgRHVrdGFwZSBhdXRob3JzIChzZWUgQVVUSE9SUy5yc3Qp
CisjICA+CisjICA+IFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdl
LCB0byBhbnkgcGVyc29uIG9idGFpbmluZyBhIGNvcHkKKyMgCisjCisKIFNVTU1BUlkgPSAiQ2l2
ZXR3ZWIgZW1iZWRkZWQgd2ViIHNlcnZlciIKIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNv
bS9jaXZldHdlYi9jaXZldHdlYiIKIAogTElDRU5TRSA9ICJNSVQiCi1MSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT01MGJkMWQ3ZjEzNWI1MGQ3ZTIxODk5NmJhMjhkMGQ4
OCIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7bWQ1PWNlNmNlNmViMWIy
ZmQ1OWVlNmJhYjIxOTQ3MDQ0MmEzIgogCi1TUkNSRVYgPSAiNGI0NDBhMzM5OTc5ODUyZDVhNTFm
YjExYTgyMjk1MjcxMjIzMWMyMyIKLVBWID0gIjEuMTIrZ2l0JHtTUkNQVn0iCitTUkNSRVYgPSAi
ZDdiYTM1YmJiNjQ5MjA5YzY2ZTU4MmQ1YTAyNDRiYTk4OGExNTE1OSIKK1BWID0gIjEuMTYiCiBT
UkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vY2l2ZXR3ZWIvY2l2ZXR3ZWIuZ2l0O2JyYW5jaD1t
YXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1Vbml0dGVzdC1M
aW5rLWxpYnJ0LWFuZC1saWJtLXVzaW5nLWwtb3B0aW9uLnBhdGNoIFwKICAgICAgICAgICAgIgot
LSAKMi4zOS4yCgo=

--===============6130574160894739484==--

