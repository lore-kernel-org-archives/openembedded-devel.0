Return-Path: <erkka.kaaria@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3F08673D46
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 06:55:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 09 Nov 2015 22:55:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,269,1444719600"; d="scan'208";a="681946443"
Received: from ekaaria-xps-8300.fi.intel.com ([10.237.68.35])
	by orsmga003.jf.intel.com with ESMTP; 09 Nov 2015 22:55:57 -0800
From: =?UTF-8?q?Erkka=20K=C3=A4=C3=A4ri=C3=A4?= <erkka.kaaria@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2015 08:55:44 +0200
Message-Id: <1447138544-29758-1-git-send-email-erkka.kaaria@intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [meta-java][PATCH] ecj-initial.in: Disable multithreading to mitigate segfaulting
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
X-List-Received-Date: Tue, 10 Nov 2015 06:56:01 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q2FjYW8taW5pdGlhbC1uYXRpdmUgc3VmZmVycyBmcm9tIHNwb3JhZGljIHNlZ21lbnRhdGlvbiBm
YXVsdHMsIHdoZW4gdGhlIEphdmEKcHJvZ3JhbSB1c2VzIG11bHRpcGxlIEphdmEgdGhyZWFkcywg
ZHVlIHRvIGEgcmFjZSBjb25kaXRpb24uIEluIHBhcnRpY3VsYXIsCmphbXZtLW5hdGl2ZSBhbmQg
Y2xhc3NwYXRoLW5hdGl2ZSBidWlsZHMgd291bGQgb2NjYXNpb25hbGx5IGZhaWwgYXMgdGhlCmVj
bGlwc2UgY29tcGlsZXIgdXNlZCBkdXJpbmcgYnVpbGQgdGFzayBieSBkZWZhdWx0IHVzZXMgbXVs
dGlwbGUgdGhyZWFkcy4KCkFzIGZpeGluZyB0aGUgcmFjZSBjb25kaXRpb24gd291bGQgcmVxdWly
ZSBsYXJnZSBjaGFuZ2VzIHRvIHRoZQpjYWNhby1pbml0aWFsLW5hdGl2ZSBjb2RlYmFzZSwgYW5k
IGFzIGl0IGlzIG9ubHkgdXNlZCBicmllZmx5IGR1cmluZyB0aGUKYm9vdHN0cmFwcGluZyBwcm9j
ZXNzLCBpdCBpcyBlYXNpZXIgYW5kIHNhZmVyIHRvIGp1c3QgZm9yY2UgZWNqLWluaXRpYWwgdG8g
cnVuCmluIGEgc2luZ2xldGhyZWFkZWQgbW9kZS4KClNpZ25lZC1vZmYtYnk6IEVya2thIEvDpMOk
cmnDpCA8ZXJra2Eua2FhcmlhQGludGVsLmNvbT4KLS0tCiByZWNpcGVzLWNvcmUvZWNqL2ZpbGVz
L2Vjai1pbml0aWFsLmluIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcmVjaXBlcy1jb3JlL2Vjai9maWxlcy9lY2ot
aW5pdGlhbC5pbiBiL3JlY2lwZXMtY29yZS9lY2ovZmlsZXMvZWNqLWluaXRpYWwuaW4KaW5kZXgg
MjA5OTk5MS4uMzBjMWM4YSAxMDA3NTUKLS0tIGEvcmVjaXBlcy1jb3JlL2Vjai9maWxlcy9lY2ot
aW5pdGlhbC5pbgorKysgYi9yZWNpcGVzLWNvcmUvZWNqL2ZpbGVzL2Vjai1pbml0aWFsLmluCkBA
IC0xICsxLDMgQEAKLSR7UlVOVElNRX0gLVhteDUxMm0gLWNwICR7RUNKX0pBUn0gb3JnLmVjbGlw
c2UuamR0LmludGVybmFsLmNvbXBpbGVyLmJhdGNoLk1haW4gJHsxKyIkQCJ9CisjIC1EamR0LmNv
bXBpbGVyLnVzZVNpbmdsZVRocmVhZD10cnVlIGZvcmNlcyB0aGUgY29tcGlsZXIgdG8gb25seSB1
c2UgYSBzaW5nbGUgdGhyZWFkLiBUaGlzIGlzIGEgd29ya2Fyb3VuZCB0byBhIHJhY2UgY29uZGl0
aW9uCisjIGJ1ZyBpbiBjYWNhby1pbml0aWFsLW5hdGl2ZSwgd2hlcmUgdXNpbmcgbXVsdGlwbGUg
amF2YSB0aHJlYWQgY291bGQgY2F1c2Ugc3BvcmFkaWMgc2VnbWVudGF0aW9uIGZhdWx0cworJHtS
VU5USU1FfSAtWG14NTEybSAtRGpkdC5jb21waWxlci51c2VTaW5nbGVUaHJlYWQ9dHJ1ZSAtY3Ag
JHtFQ0pfSkFSfSBvcmcuZWNsaXBzZS5qZHQuaW50ZXJuYWwuY29tcGlsZXIuYmF0Y2guTWFpbiAk
ezErIiRAIn0KLS0gCjIuMS40CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSW50ZWwgRmlubGFuZCBPeQpSZWdpc3Rl
cmVkIEFkZHJlc3M6IFBMIDI4MSwgMDAxODEgSGVsc2lua2kgCkJ1c2luZXNzIElkZW50aXR5IENv
ZGU6IDAzNTc2MDYgLSA0IApEb21pY2lsZWQgaW4gSGVsc2lua2kgCgpUaGlzIGUtbWFpbCBhbmQg
YW55IGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBtYXRlcmlhbCBmb3IKdGhl
IHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykuIEFueSByZXZpZXcgb3IgZGlz
dHJpYnV0aW9uCmJ5IG90aGVycyBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5v
dCB0aGUgaW50ZW5kZWQKcmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIGFuZCBk
ZWxldGUgYWxsIGNvcGllcy4K


