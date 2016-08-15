Return-Path: <erkka.kaaria@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 40411770DF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 09:32:02 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 15 Aug 2016 02:32:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,524,1464678000"; d="scan'208";a="155853687"
Received: from ekaaria-xps-8300.fi.intel.com ([10.237.68.37])
	by fmsmga004.fm.intel.com with ESMTP; 15 Aug 2016 02:32:02 -0700
From: =?UTF-8?q?Erkka=20K=C3=A4=C3=A4ri=C3=A4?= <erkka.kaaria@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2016 12:36:20 +0300
Message-Id: <1471253780-28526-2-git-send-email-erkka.kaaria@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1471253780-28526-1-git-send-email-erkka.kaaria@intel.com>
References: <1471253780-28526-1-git-send-email-erkka.kaaria@intel.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH v2 2/2] openjdk-8-release-102b14.inc: Ignore deprecation
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
X-List-Received-Date: Mon, 15 Aug 2016 09:32:03 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

cmVhZGRpcl9yIGhhcyBiZWVuIGRlcHJlY2F0ZWQgc2luY2UgZ2xpYmMgMi4yNC4gQXMgb3Blbmpk
ayB1c2VzIHRoaXMKZnVuY3Rpb24sIGEgd2FybmluZyBpcyBnZW5lcmF0ZWQgZHVyaW5nIGJ1aWxk
IHRoYXQgZ2V0cyB0dXJuZWQgaW50bwphbiBlcnJvciB3aGVuIC1XZXJyb3IgaXMgdXNlZC4KCldo
aWxlIHRoZSByZWFkZGlyIGZ1bmN0aW9uIGlzIHN1Z2dlc3RlZCBhcyBhbiByZXBsYWNlbWVudCwg
aXQgaGFzCnNsaWdodGx5IGRpZmZlcmVudCBBUEkuIFRoZSB3YXJuaW5nIGlzIGlnbm9yZWQgaW5z
dGVhZCB0byBwcmV2ZW50IGFueQp1bmV4cGVjdGVkIGJyZWFrYWdlIGZyb20gcGF0Y2hpbmcgdGhl
IG9mZmVuZGluZyBmdW5jdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBFcmtrYSBLw6TDpHJpw6QgPGVy
a2thLmthYXJpYUBpbnRlbC5jb20+Ci0tLQogcmVjaXBlcy1jb3JlL29wZW5qZGsvb3Blbmpkay04
LXJlbGVhc2UtMTAyYjE0LmluYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL3JlY2lwZXMtY29yZS9vcGVuamRrL29wZW5qZGstOC1yZWxlYXNl
LTEwMmIxNC5pbmMgYi9yZWNpcGVzLWNvcmUvb3Blbmpkay9vcGVuamRrLTgtcmVsZWFzZS0xMDJi
MTQuaW5jCmluZGV4IGM5ZjYyZmYuLmZkZWI3NzEgMTAwNjQ0Ci0tLSBhL3JlY2lwZXMtY29yZS9v
cGVuamRrL29wZW5qZGstOC1yZWxlYXNlLTEwMmIxNC5pbmMKKysrIGIvcmVjaXBlcy1jb3JlL29w
ZW5qZGsvb3Blbmpkay04LXJlbGVhc2UtMTAyYjE0LmluYwpAQCAtMTUsNiArMTUsMTAgQEAgQlVJ
TERfRElSX0VDSiA9ICJvcGVuamRrLmJ1aWxkLWVjaiIKICMgRm9yY2UgYXJtIG1vZGUgZm9yIG5v
dwogQVJNX0lOU1RSVUNUSU9OX1NFVF9hcm12NHQgPSAiQVJNIgogCisjIHJlYWRkaXJfciB3YXMg
ZGVwcmVjYXRlZCBpbiBnbGliYy0yLjI0LiBJZ25vcmUgdGhlIGVycm9yIGZvciBub3cKKyMgTk9U
RTogV2hlbiB1cGRhdGluZyB0aGUgcmVjaXBlLCBwbGVhc2UgY2hlY2sgaWYgdGhpcyBpcyBzdGls
bCBuZWVkZWQKK0NGTEFHU19hcHBlbmQgPSAiIC1Xbm8tZXJyb3I9ZGVwcmVjYXRlZC1kZWNsYXJh
dGlvbnMiCisKICMgRW5hYmxlIHplcm8gbW9kZSBmb3IgYXJtIGJhc2VkIGJ1aWxkcywgYXMgbm9y
bWFsIGhvdHNwb3QgZmFpbHMgdG8gYnVpbGQKIFBBQ0tBR0VDT05GSUdfYXBwZW5kX2FybSA9ICIg
emVybyIKIAotLSAKMi43LjQKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJbnRlbCBGaW5sYW5kIE95ClJlZ2lzdGVy
ZWQgQWRkcmVzczogUEwgMjgxLCAwMDE4MSBIZWxzaW5raSAKQnVzaW5lc3MgSWRlbnRpdHkgQ29k
ZTogMDM1NzYwNiAtIDQgCkRvbWljaWxlZCBpbiBIZWxzaW5raSAKClRoaXMgZS1tYWlsIGFuZCBh
bnkgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvcgp0aGUg
c29sZSB1c2Ugb2YgdGhlIGludGVuZGVkIHJlY2lwaWVudChzKS4gQW55IHJldmlldyBvciBkaXN0
cmlidXRpb24KYnkgb3RoZXJzIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBhcmUgbm90
IHRoZSBpbnRlbmRlZApyZWNpcGllbnQsIHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYW5kIGRl
bGV0ZSBhbGwgY29waWVzLgo=


