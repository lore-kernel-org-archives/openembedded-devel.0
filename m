Return-Path: <jaap.dejong@nedap.com>
X-Greylist: delayed 599 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 03 Apr 2017 11:04:48 UTC
Received: from smtp4.nedap.com (smtp4.nedap.com [213.160.213.85])
	by mail.openembedded.org (Postfix) with ESMTP id 2A30771BA1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Apr 2017 11:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nedap.com; i=@nedap.com; q=dns/txt; s=20161201;
	t=1491217491; x=1522753491;
	h=from:subject:to:message-id:date:mime-version;
	bh=UZMC3YPF4KIRMuZtMhBIcjJ5QKgplJahJ24auhUPALY=;
	b=BEEfumtD4qHeb31GrSeOQNlq2DMzspzJ8L23EHgnYXRaQnZBCo7Y04Iy
	Y6XtmcV4oEOxY8NSWraPIlihK+LTHR5uC0bbgEECTX8KoofA4ngm7S5/q
	ydiZKM6DjF8XAm1abRvzvJd7taptdOmv+U8Uuirgmf0u2y+I9NLWgQuhK w=;
Received: from nvc2354.nedap.local (HELO [10.2.16.70]) ([10.2.16.70])
	by smtp4.nedap.com with ESMTP; 03 Apr 2017 12:54:49 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <5822cba9-6a76-4555-a772-d862f216e0cf@nedap.com>
Date: Mon, 3 Apr 2017 12:54:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
Subject: [meta-networking][morty][PATCH] uftp: Add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Apr 2017 11:04:49 -0000
X-Groupsio-MsgNum: 66067
Content-Type: multipart/mixed; boundary="------------0B84BB2D79B25000E01DD379"

--------------0B84BB2D79B25000E01DD379
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



--------------0B84BB2D79B25000E01DD379
Content-Type: text/plain; charset=UTF-8;
 name="0001-uftp-Add-recipe.patch.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-uftp-Add-recipe.patch.txt"

RnJvbSBjYmEyMGMwZGY2NWRjZGQ3MTEwMDljNTU4NzE0MmQyNjA2ZGViMWE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKYWFwIGRlIEpvbmcgPGphYXAuZGVqb25nQG5lZGFwLmNvbT4K
RGF0ZTogTW9uLCAzIEFwciAyMDE3IDEyOjQ3OjE3ICswMjAwClN1YmplY3Q6IFttZXRhLW5ldHdv
cmtpbmddW21vcnR5XVtQQVRDSF0gdWZ0cDogQWRkIHJlY2lwZQpUbzogb3BlbmVtYmVkZGVkLWRl
dmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcKCi0tLQogbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMt
c3VwcG9ydC91ZnRwL3VmdHBfNC45LjMuYmIgfCAxNSArKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1uZXR3b3Jr
aW5nL3JlY2lwZXMtc3VwcG9ydC91ZnRwL3VmdHBfNC45LjMuYmIKCmRpZmYgLS1naXQgYS9tZXRh
LW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L3VmdHAvdWZ0cF80LjkuMy5iYiBiL21ldGEtbmV0
d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvdWZ0cC91ZnRwXzQuOS4zLmJiCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAuLmE2ZWVjZWIKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhLW5l
dHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L3VmdHAvdWZ0cF80LjkuMy5iYgpAQCAtMCwwICsxLDE1
IEBACitERVNDUklQVElPTiA9ICJFbmNyeXB0ZWQgVURQIGJhc2VkIEZUUCB3aXRoIG11bHRpY2Fz
dCIKK0hPTUVQQUdFID0gImh0dHBzOi8vc291cmNlZm9yZ2UubmV0L3Byb2plY3RzL3VmdHAtbXVs
dGljYXN0IgorU0VDVElPTiA9ICJsaWJzL25ldHdvcmsiCisKK0xJQ0VOU0UgPSAiR1BMdjMiCitM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9ZDMyMjM5YmNiNjczNDYz
YWI4NzRlODBkNDdmYWU1MDQiCisKK1NSQ19VUkkgPSAiJHtTT1VSQ0VGT1JHRV9NSVJST1J9L3Vm
dHAtbXVsdGljYXN0L3NvdXJjZS10YXIvdWZ0cC0ke1BWfS50YXIuZ3oiCisKK1NSQ19VUklbbWQ1
c3VtXSA9ICIyMzFkNmJhNzgyMGQ4OWE3MTJmZTdkNzI3YWIwZjhlNiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICI5ZTkyMTVhZjAzMTUyNTdjNmNjNGY0MGZiYzYxNjEwNTdlODYxYmUxZmZmMTBhMzhh
NTU2NGY2OTllOTljNzhmIgorCitkb19pbnN0YWxsICgpIHsKKwlvZV9ydW5tYWtlIGluc3RhbGwg
REVTVERJUj0ke0R9Cit9Ci0tIAoyLjcuNAoK

--------------0B84BB2D79B25000E01DD379--
