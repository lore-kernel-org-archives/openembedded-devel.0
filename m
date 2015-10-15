Return-Path: <erkka.kaaria@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C5EE5770CF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 10:46:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Oct 2015 03:45:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,684,1437462000"; d="scan'208";a="827266359"
Received: from ekaaria-xps-8300.fi.intel.com ([10.237.68.35])
	by orsmga002.jf.intel.com with ESMTP; 15 Oct 2015 03:45:40 -0700
From: =?UTF-8?q?Erkka=20K=C3=A4=C3=A4ri=C3=A4?= <erkka.kaaria@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Oct 2015 13:46:07 +0300
Message-Id: <1444905967-8862-1-git-send-email-erkka.kaaria@intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [meta-java][PATCH] cacao-initial-native: Fix sed matching
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Oct 2015 10:46:03 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIHJlY2lwZSB1c2VzIHNlZCB0byBwYXRjaCBzcmMvc2NyaXB0cy9qYXZhLmluIHNvIHRoYXQg
aXQgZXhlY3MgY2FjYW8taW5pdGlhbAppbnN0ZWFkIG9mIGNhY2FvLiBIb3dldmVyLCBpZiBjb25m
aWd1cmUgc3RlcCBpcyBydW4gYWdhaW4sIC1pbml0aWFsIGlzIGFwcGVuZGVkCmFnYWluIHRvIHRo
ZSBzdHJpbmcsIGxlYWRpbmcgdG8gJ2V4ZWMgY2FjYW8taW5pdGlhbC1pbml0aWFsJy4gVGhpcyBj
YXVzZXMgdGhlCmJ1aWxkIHRvIGZhaWwuCgpUaGlzIGlzIGZpeGVkIGJ5IGNoYW5naW5nIHRoZSBz
ZWQgY29tbWFuZCB0byBjb25zaWRlciBsYXJnZXIgcG9ydGlvbiBvZiB0aGUKc291cmNlIHN0cmlu
Zy4gVGhpcyBlbnN1cmVzIHRoYXQgdGhlIC1pbml0aWFsIGlzIG9ubHkgYXBwZW5kZWQgb25jZS4K
ClNpZ25lZC1vZmYtYnk6IEVya2thIEvDpMOkcmnDpCA8ZXJra2Eua2FhcmlhQGludGVsLmNvbT4K
LS0tCiByZWNpcGVzLWNvcmUvY2FjYW8vY2FjYW8taW5pdGlhbC1uYXRpdmVfMC45OC5iYiB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL3JlY2lwZXMtY29yZS9jYWNhby9jYWNhby1pbml0aWFsLW5hdGl2ZV8wLjk4LmJiIGIv
cmVjaXBlcy1jb3JlL2NhY2FvL2NhY2FvLWluaXRpYWwtbmF0aXZlXzAuOTguYmIKaW5kZXggNzJj
NjI0Ni4uZWM3ZmJkYiAxMDA2NDQKLS0tIGEvcmVjaXBlcy1jb3JlL2NhY2FvL2NhY2FvLWluaXRp
YWwtbmF0aXZlXzAuOTguYmIKKysrIGIvcmVjaXBlcy1jb3JlL2NhY2FvL2NhY2FvLWluaXRpYWwt
bmF0aXZlXzAuOTguYmIKQEAgLTM1LDcgKzM1LDcgQEAgZXhwb3J0IEpBUj0iZmFzdGphciIKIAog
ZG9fY29uZmlndXJlX2FwcGVuZCgpIHsKICAgIyBGaXggdGhlIGV4ZWN1dGFibGUgbmFtZSBpbiB0
aGUgd3JhcHBlciBzY3JpcHQuCi0gIHNlZCAtaSAtZSAic3xleGVjIGNhY2FvfGV4ZWMgY2FjYW8t
aW5pdGlhbHwiIHNyYy9zY3JpcHRzL2phdmEuaW4KKyAgc2VkIC1pIC1lICJzfGV4ZWMgY2FjYW8g
XFwkfGV4ZWMgY2FjYW8taW5pdGlhbCBcXCR8IiBzcmMvc2NyaXB0cy9qYXZhLmluCiB9CiAKIFNS
Q19VUklbbWQ1c3VtXSA9ICI4Yjg5MDdjOGI5MjU3NjFjOTQxMGJjYWRiOTcwNTM0NiIKLS0gCjIu
MS40CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KSW50ZWwgRmlubGFuZCBPeQpSZWdpc3RlcmVkIEFkZHJlc3M6IFBM
IDI4MSwgMDAxODEgSGVsc2lua2kgCkJ1c2luZXNzIElkZW50aXR5IENvZGU6IDAzNTc2MDYgLSA0
IApEb21pY2lsZWQgaW4gSGVsc2lua2kgCgpUaGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRz
IG1heSBjb250YWluIGNvbmZpZGVudGlhbCBtYXRlcmlhbCBmb3IKdGhlIHNvbGUgdXNlIG9mIHRo
ZSBpbnRlbmRlZCByZWNpcGllbnQocykuIEFueSByZXZpZXcgb3IgZGlzdHJpYnV0aW9uCmJ5IG90
aGVycyBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQK
cmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIGFuZCBkZWxldGUgYWxsIGNvcGll
cy4K


