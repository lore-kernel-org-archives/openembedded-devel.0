Return-Path: <erkka.kaaria@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EE49E76E5E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 13:19:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Aug 2016 06:19:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,544,1464678000"; d="scan'208";a="1028365388"
Received: from ekaaria-xps-8300.fi.intel.com ([10.237.68.37])
	by fmsmga001.fm.intel.com with ESMTP; 19 Aug 2016 06:19:50 -0700
From: =?UTF-8?q?Erkka=20K=C3=A4=C3=A4ri=C3=A4?= <erkka.kaaria@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Aug 2016 16:24:36 +0300
Message-Id: <1471613076-15965-1-git-send-email-erkka.kaaria@intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-java][PATCH] openjdk-8-cross.inc: Fix QA error caused by missing hash
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
X-List-Received-Date: Fri, 19 Aug 2016 13:19:52 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U29tZSBvcGVuamRrIG1ha2VmaWxlcyAoZS5nLiB2bS5tYWtlKSBvbmx5IHVzZSBDRkxBR1MgYXMg
dGhlaXIgbGlua2VyCmZsYWdzLiBUaGlzIG1lYW5zIHRoYXQgdGhlIG9lLXNwZWNpZmljIGxpbmtl
ciBmbGFncyBhcmUgbG9zdC4gVGhpcyBpbgpwYXJ0aWN1bGFyIGNhdXNlcyBpc3N1ZXMgd2l0aCB0
aGUgcmVjZW50IG9lLWNvcmUgY29tbWl0IGE5OGE4MTgwOCwgd2hpY2gKaW50ZW50aW9uYWxseSBw
b2lzb25zIHRoZSBsaW5rZXIgaGFzaCBzdHlsZSwgc28gdGhhdCBhbnkgcmVjaXBlcyB0aGF0IGRv
Cm5vdCB1c2UgdGhlIG9lIExERkxBR1MgZmFpbCB0byBidWlsZC4KClNpZ25lZC1vZmYtYnk6IEVy
a2thIEvDpMOkcmnDpCA8ZXJra2Eua2FhcmlhQGludGVsLmNvbT4KLS0tCiByZWNpcGVzLWNvcmUv
b3Blbmpkay9vcGVuamRrLTgtY3Jvc3MuaW5jIHwgMTAgKysrKysrLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9yZWNpcGVz
LWNvcmUvb3Blbmpkay9vcGVuamRrLTgtY3Jvc3MuaW5jIGIvcmVjaXBlcy1jb3JlL29wZW5qZGsv
b3Blbmpkay04LWNyb3NzLmluYwppbmRleCAxMWU5NGNlLi42MDk3YWZjIDEwMDY0NAotLS0gYS9y
ZWNpcGVzLWNvcmUvb3Blbmpkay9vcGVuamRrLTgtY3Jvc3MuaW5jCisrKyBiL3JlY2lwZXMtY29y
ZS9vcGVuamRrL29wZW5qZGstOC1jcm9zcy5pbmMKQEAgLTM5LDIxICszOSwyMyBAQCBTUkNfVVJJ
X2FwcGVuZCA9ICJcCiAgICAgZmlsZTovL2p2bS5jZmcgXAogIgogCisjIFNvbWUgbWFrZWZpbGVz
IHBpY2sgdGhlIGxpbmtlciBmbGFncyBmcm9tIHRoZSBDRkxBR1MgdmFyaWFibGUsIHNvIGFkZAor
IyB0aGUgTERGTEFHUyB0byBDRkxBR1MKK0NGTEFHU19hcHBlbmQgPSAiIFwKKyAgJHtMREZMQUdT
fSBcCisiCisKIEVYVFJBX09FQ09ORl9hcHBlbmQgPSAiXAogICAgIC0td2l0aC1qb2JzPSR7QGdl
dF9qZGs4X25hdGl2ZV9qb2JzKGQpfSBcCi0gICAgXAogICAgIC0td2l0aC1zeXMtcm9vdD0ke1NU
QUdJTkdfRElSfSBcCiAgICAgLS13aXRoLXRvb2xzLWRpcj0ke1NUQUdJTkdfRElSX05BVElWRX0g
XAogICAgIC0td2l0aC1ib290LWpkaz0ke1NUQUdJTkdfTElCRElSX05BVElWRX0vanZtL29wZW5q
ZGstOC1uYXRpdmUgXAogICAgIC0td2l0aC1jYWNlcnRzLWZpbGU9JHtTVEFHSU5HX0xJQkRJUl9O
QVRJVkV9L2p2bS9vcGVuamRrLTgtbmF0aXZlL2pyZS9saWIvc2VjdXJpdHkvY2FjZXJ0cyBcCi0g
ICAgXAogICAgIC0tZGlzYWJsZS1wcmVjb21waWxlZC1oZWFkZXJzIFwKICAgICAtLWRpc2FibGUt
emlwLWRlYnVnLWluZm8gXAotICAgIFwKICAgICAtLXdpdGgtZXh0cmEtY2ZsYWdzPScke0NGTEFH
U30nIFwKICAgICAtLXdpdGgtZXh0cmEtY3h4ZmxhZ3M9JyR7Q1hYRkxBR1N9JyBcCiAgICAgLS13
aXRoLWV4dHJhLWxkZmxhZ3M9JyR7TERGTEFHU30nIFwKLSAgICBcCiAgICAgJHtAamRrX2NvbmZp
Z3VyZV9vcHRpb25zKGQpfSBcCiAiCiAKLS0gCjIuNy40CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSW50ZWwgRmlu
bGFuZCBPeQpSZWdpc3RlcmVkIEFkZHJlc3M6IFBMIDI4MSwgMDAxODEgSGVsc2lua2kgCkJ1c2lu
ZXNzIElkZW50aXR5IENvZGU6IDAzNTc2MDYgLSA0IApEb21pY2lsZWQgaW4gSGVsc2lua2kgCgpU
aGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBt
YXRlcmlhbCBmb3IKdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykuIEFu
eSByZXZpZXcgb3IgZGlzdHJpYnV0aW9uCmJ5IG90aGVycyBpcyBzdHJpY3RseSBwcm9oaWJpdGVk
LiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQKcmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0
aGUgc2VuZGVyIGFuZCBkZWxldGUgYWxsIGNvcGllcy4K


