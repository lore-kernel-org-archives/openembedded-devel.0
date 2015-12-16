Return-Path: <erkka.kaaria@intel.com>
X-Greylist: delayed 593 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 16 Dec 2015 10:57:44 UTC
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B326773170
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2015 10:57:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 16 Dec 2015 02:47:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,436,1444719600"; d="scan'208";a="872614270"
Received: from ekaaria-xps-8300.fi.intel.com ([10.237.68.35])
	by orsmga002.jf.intel.com with ESMTP; 16 Dec 2015 02:47:50 -0800
From: =?UTF-8?q?Erkka=20K=C3=A4=C3=A4ri=C3=A4?= <erkka.kaaria@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Dec 2015 12:49:13 +0200
Message-Id: <1450262953-5345-1-git-send-email-erkka.kaaria@intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [meta-java][PATCH] openjdk-8: Use zero mode on arm
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
X-List-Received-Date: Wed, 16 Dec 2015 10:57:44 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q3VycmVudGx5IGFybSBidWlsZCBmYWlscyBkdWUgdG8gaG90c3BvdCBlcnJvcnMuIFVzZSB6ZXJv
IG1vZGUgaW5zdGVhZC4KClNpZ25lZC1vZmYtYnk6IEVya2thIEvDpMOkcmnDpCA8ZXJra2Eua2Fh
cmlhQGludGVsLmNvbT4KLS0tCiByZWNpcGVzLWNvcmUvb3Blbmpkay9vcGVuamRrLTgtcmVsZWFz
ZS03MmIwNS5pbmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL3JlY2lwZXMtY29yZS9vcGVuamRrL29wZW5qZGstOC1yZWxlYXNlLTcyYjA1Lmlu
YyBiL3JlY2lwZXMtY29yZS9vcGVuamRrL29wZW5qZGstOC1yZWxlYXNlLTcyYjA1LmluYwppbmRl
eCA0Zjk1ODBlLi5mOGJhMzY3IDEwMDY0NAotLS0gYS9yZWNpcGVzLWNvcmUvb3Blbmpkay9vcGVu
amRrLTgtcmVsZWFzZS03MmIwNS5pbmMKKysrIGIvcmVjaXBlcy1jb3JlL29wZW5qZGsvb3Blbmpk
ay04LXJlbGVhc2UtNzJiMDUuaW5jCkBAIC0xNSw2ICsxNSw5IEBAIEJVSUxEX0RJUl9FQ0ogPSAi
b3Blbmpkay5idWlsZC1lY2oiCiAjIEZvcmNlIGFybSBtb2RlIGZvciBub3cKIEFSTV9JTlNUUlVD
VElPTl9TRVRfYXJtdjR0ID0gIkFSTSIKIAorIyBFbmFibGUgemVybyBtb2RlIGZvciBhcm0gYmFz
ZWQgYnVpbGRzLCBhcyBub3JtYWwgaG90c3BvdCBmYWlscyB0byBidWlsZCAKK1BBQ0tBR0VDT05G
SUdfYXBwZW5kX2FybSA9ICIgemVybyIKKwogQ09SQkFfQ0hBTkdFU0VUID0gIjdkZWViNGY3MDQw
NCIKIFNSQ19VUklbY29yYmEubWQ1c3VtXSA9ICI1NDRiNDk2M2QxNGZiNzE1NWIxMmRiYzU2ZDA1
ODY0OSIKIFNSQ19VUklbY29yYmEuc2hhMjU2c3VtXSA9ICJhNzVjMzE3MDZmNjM0NTg1YmFmMGQw
YTBiMjBlMzIxYWM2MzRkNDFkNmFmYjYyYmQ2ZmZiMWY5YzBiNzY2ZDA5IgotLSAKMi4xLjQKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpJbnRlbCBGaW5sYW5kIE95ClJlZ2lzdGVyZWQgQWRkcmVzczogUEwgMjgxLCAw
MDE4MSBIZWxzaW5raSAKQnVzaW5lc3MgSWRlbnRpdHkgQ29kZTogMDM1NzYwNiAtIDQgCkRvbWlj
aWxlZCBpbiBIZWxzaW5raSAKClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNv
bnRhaW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvcgp0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVu
ZGVkIHJlY2lwaWVudChzKS4gQW55IHJldmlldyBvciBkaXN0cmlidXRpb24KYnkgb3RoZXJzIGlz
IHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZApyZWNpcGll
bnQsIHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLgo=


