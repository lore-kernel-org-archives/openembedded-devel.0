Return-Path: <erkka.kaaria@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6945177217
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 13:02:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 29 Jan 2016 05:02:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,364,1449561600"; d="scan'208";a="903816530"
Received: from ekaaria-xps-8300.fi.intel.com ([10.237.68.35])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2016 05:02:53 -0800
From: =?UTF-8?q?Erkka=20K=C3=A4=C3=A4ri=C3=A4?= <erkka.kaaria@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jan 2016 15:04:53 +0200
Message-Id: <1454072693-4081-1-git-send-email-erkka.kaaria@intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] ecj.in: Expand retry logic to work around internal compiler errors
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
X-List-Received-Date: Fri, 29 Jan 2016 13:02:56 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RWNqIHJhcmVseSBjcmFzaGVzIGR1ZSB0byBpbnRlcm5hbCBjb21waWxlciBlcnJvci4gRXh0ZW5k
IHRoZSBleGlzdGluZyByZXRyeQpsb2dpYyB0byBzaWxlbnRseSByZXRyeSBpZiBjb21waWxlIGZh
aWxzLgoKU2lnbmVkLW9mZi1ieTogRXJra2EgS8Okw6RyacOkIDxlcmtrYS5rYWFyaWFAaW50ZWwu
Y29tPgotLS0KIHJlY2lwZXMtY29yZS9lY2ovZmlsZXMvZWNqLmluIHwgNCArKysrCiAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcmVjaXBlcy1jb3JlL2Vjai9m
aWxlcy9lY2ouaW4gYi9yZWNpcGVzLWNvcmUvZWNqL2ZpbGVzL2Vjai5pbgppbmRleCBjYWViZWQz
Li4zNmZiOWFlIDEwMDc1NQotLS0gYS9yZWNpcGVzLWNvcmUvZWNqL2ZpbGVzL2Vjai5pbgorKysg
Yi9yZWNpcGVzLWNvcmUvZWNqL2ZpbGVzL2Vjai5pbgpAQCAtOSw2ICs5LDEwIEBAIHdoaWxlIFsg
JHtlcnJvcl9jb3VudGVyfSAtbGUgJHtlcnJvcl9tYXh9IC1hICR7ZXJyb3Jfb2NjdXJlZH0gPSB0
cnVlIF07IGRvCiAgICAgICAgIGVjaG8gImVjaiBjcmFzaGVkICR7ZXJyb3JfY291bnRlcn0gLSBz
aWxlbnRseSB0cnlpbmcgYWdhaW4iCiAgICAgICAgIGVycm9yX29jY3VyZWQ9dHJ1ZQogICAgICAg
ICBlcnJvcl9jb3VudGVyPSQoKCAkZXJyb3JfY291bnRlciArIDEgKSkKKyAgICBlbGlmIFsgJHtl
cnJvcl9udW1iZXJ9IC1lcSAyNTUgXTsgdGhlbgorICAgICAgICBlY2hvICJlY2ogcmV0dXJuZWQg
LTEgLSBsaWtlbHkgaW50ZXJuYWwgY29tcGlsZXIgZXJyb3Igb3Igc2ltaWxhciAtIHNpbGVudGx5
IHRyeWluZyBhZ2FpbiIKKyAgICAgICAgZXJyb3Jfb2NjdXJlZD10cnVlCisgICAgICAgIGVycm9y
X2NvdW50ZXI9JCgoICRlcnJvcl9jb3VudGVyICsgMSApKQogICAgIGVsc2UKICAgICAgICAgZXJy
b3Jfb2NjdXJlZD1mYWxzZQogICAgIGZpCi0tIAoyLjEuNAoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkludGVsIEZp
bmxhbmQgT3kKUmVnaXN0ZXJlZCBBZGRyZXNzOiBQTCAyODEsIDAwMTgxIEhlbHNpbmtpIApCdXNp
bmVzcyBJZGVudGl0eSBDb2RlOiAwMzU3NjA2IC0gNCAKRG9taWNpbGVkIGluIEhlbHNpbmtpIAoK
VGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwg
bWF0ZXJpYWwgZm9yCnRoZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMpLiBB
bnkgcmV2aWV3IG9yIGRpc3RyaWJ1dGlvbgpieSBvdGhlcnMgaXMgc3RyaWN0bHkgcHJvaGliaXRl
ZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkCnJlY2lwaWVudCwgcGxlYXNlIGNvbnRhY3Qg
dGhlIHNlbmRlciBhbmQgZGVsZXRlIGFsbCBjb3BpZXMuCg==


