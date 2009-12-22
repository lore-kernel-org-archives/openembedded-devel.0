Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jan.paesmans@gmail.com>) id 1NN0i8-0001qa-T9
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Dec 2009 10:07:23 +0100
Received: by fxm8 with SMTP id 8so5541851fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2009 01:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=NeclGIYfcLPk+KFp2BCz/D1XEIgjgK1v37rapCngZ0Y=;
	b=bVe3+CXT8WlYfYzx+9Bq77vlYtmpE3Mt8ca2r0TUdvdE/v7z5ivjAdN9jO04ve2P1u
	ZSNnz0hQsNYFXsd2NXQGsNHtuWyWPqJCYIyxWw1V/U7t9pHxUe/sQaOaHqnBzxUOdUpo
	Y7jAc5oqA6VaPaPHeaTbS1f8LIdDpP3imFiXg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=YkdKiLLY8MXb2EdJPeC0ZWD3IOjRW+lTscuz2Ll4zUjIdC8T/VxyhKsYeZhnqd4Xrq
	a1MYJzPh3KBkJDxqEeuTDGIj2YsYW5pQDAEjIUtx/CU0VtVwbHKpiDic9sDe81Vg4X09
	Q90eHFQ3H1cBJjgt/B/kCWLvxaTtL7y8jTlIk=
MIME-Version: 1.0
Received: by 10.87.73.4 with SMTP id a4mr2086615fgl.76.1261472729058; Tue, 22 
	Dec 2009 01:05:29 -0800 (PST)
Date: Tue, 22 Dec 2009 10:05:29 +0100
Message-ID: <5725a2600912220105i1a664f7le147617b9800692d@mail.gmail.com>
From: Jan Paesmans <jan.paesmans@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: jan.paesmans@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: gSOAP
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
X-List-Received-Date: Tue, 22 Dec 2009 09:07:24 -0000
X-Groupsio-MsgNum: 15171
Content-Type: multipart/mixed; boundary=001636458b7ae8cce9047b4d812b

--001636458b7ae8cce9047b4d812b
Content-Type: text/plain; charset=ISO-8859-1

Hello,

In the gSOAP package I noticed the following patch was applied to the
native build: use-just-built-binary.patch
This patches the makefiles of gSOAP so that the correct executable is used.
However the problem originates from the fact that the makefile
variable $(SOAP) is overridden in gsoap_${PV}.bb with the following
directive:

EXTRA_OEMAKE = "SOAP=${STAGING_BINDIR_NATIVE}/soapcpp2"

Instead of patching the makefiles of gsoap, I've come up with a
simpler solution.

In the gsoap-native_*.bb files, overwrite EXTRA_OEMAKE like so:

EXTRA_OEMAKE = ""

This removes the problem with building gsoap natively and not using
the correct executable.

Please find my patch in attachment.

Regards,

Jan

Signed-off-by: Jan Paesmans <jan.paesmans@gmail.com>

---
 .../use-just-built-binary-2.7.13.patch             |   12 ------------
 .../gsoap/gsoap-native/use-just-built-binary.patch |   19 -------------------
 recipes/gsoap/gsoap-native_2.7.13.bb               |    2 +-
 recipes/gsoap/gsoap-native_2.7.7.bb                |    2 +-
 4 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644
recipes/gsoap/gsoap-native/use-just-built-binary-2.7.13.patch
 delete mode 100644 recipes/gsoap/gsoap-native/use-just-built-binary.patch

diff --git a/recipes/gsoap/gsoap-native/use-just-built-binary-2.7.13.patch
b/recipes/gsoap/gsoap-native/use-just-built-binary-2.7.13.patch
deleted file mode 100644
index 25a8ef0..0000000
--- a/recipes/gsoap/gsoap-native/use-just-built-binary-2.7.13.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -urN gsoap-2.7.orig/gsoap/wsdl/Makefile.am
gsoap-2.7.orig/gsoap/wsdl/Makefile.am
---- gsoap-2.7.orig/gsoap/wsdl/Makefile.am	2009-03-21 22:24:42.000000000 +0100
-+++ gsoap-2.7.orig/gsoap/wsdl/Makefile.am	2009-04-07 11:30:50.000000000 +0200
-@@ -17,7 +17,7 @@ BUILT_SOURCES=$(SOAP_CPP_SRC)
- # WSDL2H_EXTRA_LIBS=-lssl -lcrypto -lz # defined in configure.in
-
- $(SOAP_CPP_SRC) : $(SOAPHEADER)
--	$(SOAP) $(SOAP_FLAGS) $(SOAPHEADER)
-+	../src/soapcpp2 $(SOAP_FLAGS) $(SOAPHEADER)
-
- #LIBS=
-
diff --git a/recipes/gsoap/gsoap-native/use-just-built-binary.patch
b/recipes/gsoap/gsoap-native/use-just-built-binary.patch
deleted file mode 100644
index f7e4811..0000000
--- a/recipes/gsoap/gsoap-native/use-just-built-binary.patch
+++ /dev/null
@@ -1,19 +0,0 @@
----
- soapcpp2/wsdl/Makefile.am |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- gsoap-2.7.orig/soapcpp2/wsdl/Makefile.am
-+++ gsoap-2.7/soapcpp2/wsdl/Makefile.am
-@@ -13,11 +13,11 @@ SOAP_CPP_SRC=wsdlC.cpp
- SOAPHEADER=wsdl.h
- SOAP_FLAGS=-SC -pwsdl
- BUILT_SOURCES=$(SOAP_CPP_SRC)
-
- $(SOAP_CPP_SRC) : $(SOAPHEADER)
--	$(SOAP) $(SOAP_FLAGS) $(SOAPHEADER)
-+	../src/soapcpp2 $(SOAP_FLAGS) $(SOAPHEADER)
-
- #LIBS=
-
- bin_PROGRAMS=wsdl2h
-
diff --git a/recipes/gsoap/gsoap-native_2.7.13.bb
b/recipes/gsoap/gsoap-native_2.7.13.bb
index 3ed78d0..f0370be 100644
--- a/recipes/gsoap/gsoap-native_2.7.13.bb
+++ b/recipes/gsoap/gsoap-native_2.7.13.bb
@@ -2,7 +2,7 @@ require gsoap_${PV}.inc

 DEPENDS = ""

-SRC_URI += "file://use-just-built-binary-2.7.13.patch;patch=1"
+EXTRA_OEMAKE = ""

 inherit native

diff --git a/recipes/gsoap/gsoap-native_2.7.7.bb
b/recipes/gsoap/gsoap-native_2.7.7.bb
index 206208d..0b8a4b8 100644
--- a/recipes/gsoap/gsoap-native_2.7.7.bb
+++ b/recipes/gsoap/gsoap-native_2.7.7.bb
@@ -3,7 +3,7 @@ require gsoap_${PV}.bb
 DEPENDS = ""
 PR = "r1"

-SRC_URI += "file://use-just-built-binary.patch;patch=1"
+EXTRA_OEMAKE = ""

 inherit native

 --
1.6.3.3

--001636458b7ae8cce9047b4d812b
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-redefine-EXTRA_OEMAKE-iso-patching-gSOAP-package-mak.patch"
Content-Disposition: attachment; 
	filename="0001-redefine-EXTRA_OEMAKE-iso-patching-gSOAP-package-mak.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g3ig2zy80

RnJvbSAwOWY4NDY3NWNkNDdkOTRmZjkzN2FkYzA4YzIxMzM5MmM1OGJhNjI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKYW4gUGFlc21hbnMgPGphbi5wYWVzbWFuc0BnbWFpbC5jb20+
CkRhdGU6IFR1ZSwgMjIgRGVjIDIwMDkgMDk6NTY6MjIgKzAxMDAKU3ViamVjdDogW1BBVENIXSBy
ZWRlZmluZSBFWFRSQV9PRU1BS0UgaXNvIHBhdGNoaW5nIGdTT0FQIHBhY2thZ2UgbWFrZWZpbGVz
CgotLS0KIC4uLi91c2UtanVzdC1idWlsdC1iaW5hcnktMi43LjEzLnBhdGNoICAgICAgICAgICAg
IHwgICAxMiAtLS0tLS0tLS0tLS0KIC4uLi9nc29hcC9nc29hcC1uYXRpdmUvdXNlLWp1c3QtYnVp
bHQtYmluYXJ5LnBhdGNoIHwgICAxOSAtLS0tLS0tLS0tLS0tLS0tLS0tCiByZWNpcGVzL2dzb2Fw
L2dzb2FwLW5hdGl2ZV8yLjcuMTMuYmIgICAgICAgICAgICAgICB8ICAgIDIgKy0KIHJlY2lwZXMv
Z3NvYXAvZ3NvYXAtbmF0aXZlXzIuNy43LmJiICAgICAgICAgICAgICAgIHwgICAgMiArLQogNCBm
aWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IHJlY2lwZXMvZ3NvYXAvZ3NvYXAtbmF0aXZlL3VzZS1qdXN0LWJ1aWx0LWJpbmFy
eS0yLjcuMTMucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCByZWNpcGVzL2dzb2FwL2dzb2FwLW5h
dGl2ZS91c2UtanVzdC1idWlsdC1iaW5hcnkucGF0Y2gKCmRpZmYgLS1naXQgYS9yZWNpcGVzL2dz
b2FwL2dzb2FwLW5hdGl2ZS91c2UtanVzdC1idWlsdC1iaW5hcnktMi43LjEzLnBhdGNoIGIvcmVj
aXBlcy9nc29hcC9nc29hcC1uYXRpdmUvdXNlLWp1c3QtYnVpbHQtYmluYXJ5LTIuNy4xMy5wYXRj
aApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMjVhOGVmMC4uMDAwMDAwMAotLS0gYS9y
ZWNpcGVzL2dzb2FwL2dzb2FwLW5hdGl2ZS91c2UtanVzdC1idWlsdC1iaW5hcnktMi43LjEzLnBh
dGNoCisrKyAvZGV2L251bGwKQEAgLTEsMTIgKzAsMCBAQAotZGlmZiAtdXJOIGdzb2FwLTIuNy5v
cmlnL2dzb2FwL3dzZGwvTWFrZWZpbGUuYW0gZ3NvYXAtMi43Lm9yaWcvZ3NvYXAvd3NkbC9NYWtl
ZmlsZS5hbQotLS0tIGdzb2FwLTIuNy5vcmlnL2dzb2FwL3dzZGwvTWFrZWZpbGUuYW0JMjAwOS0w
My0yMSAyMjoyNDo0Mi4wMDAwMDAwMDAgKzAxMDAKLSsrKyBnc29hcC0yLjcub3JpZy9nc29hcC93
c2RsL01ha2VmaWxlLmFtCTIwMDktMDQtMDcgMTE6MzA6NTAuMDAwMDAwMDAwICswMjAwCi1AQCAt
MTcsNyArMTcsNyBAQCBCVUlMVF9TT1VSQ0VTPSQoU09BUF9DUFBfU1JDKQotICMgV1NETDJIX0VY
VFJBX0xJQlM9LWxzc2wgLWxjcnlwdG8gLWx6ICMgZGVmaW5lZCBpbiBjb25maWd1cmUuaW4KLSAK
LSAkKFNPQVBfQ1BQX1NSQykgOiAkKFNPQVBIRUFERVIpCi0tCSQoU09BUCkgJChTT0FQX0ZMQUdT
KSAkKFNPQVBIRUFERVIpCi0rCS4uL3NyYy9zb2FwY3BwMiAkKFNPQVBfRkxBR1MpICQoU09BUEhF
QURFUikKLSAKLSAjTElCUz0KLSAKZGlmZiAtLWdpdCBhL3JlY2lwZXMvZ3NvYXAvZ3NvYXAtbmF0
aXZlL3VzZS1qdXN0LWJ1aWx0LWJpbmFyeS5wYXRjaCBiL3JlY2lwZXMvZ3NvYXAvZ3NvYXAtbmF0
aXZlL3VzZS1qdXN0LWJ1aWx0LWJpbmFyeS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggZjdlNDgxMS4uMDAwMDAwMAotLS0gYS9yZWNpcGVzL2dzb2FwL2dzb2FwLW5hdGl2ZS91
c2UtanVzdC1idWlsdC1iaW5hcnkucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwxOSArMCwwIEBA
Ci0tLS0KLSBzb2FwY3BwMi93c2RsL01ha2VmaWxlLmFtIHwgICAgMiArLQotIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQotCi0tLS0gZ3NvYXAtMi43Lm9yaWcv
c29hcGNwcDIvd3NkbC9NYWtlZmlsZS5hbQotKysrIGdzb2FwLTIuNy9zb2FwY3BwMi93c2RsL01h
a2VmaWxlLmFtCi1AQCAtMTMsMTEgKzEzLDExIEBAIFNPQVBfQ1BQX1NSQz13c2RsQy5jcHAKLSBT
T0FQSEVBREVSPXdzZGwuaAotIFNPQVBfRkxBR1M9LVNDIC1wd3NkbAotIEJVSUxUX1NPVVJDRVM9
JChTT0FQX0NQUF9TUkMpCi0gCi0gJChTT0FQX0NQUF9TUkMpIDogJChTT0FQSEVBREVSKQotLQkk
KFNPQVApICQoU09BUF9GTEFHUykgJChTT0FQSEVBREVSKQotKwkuLi9zcmMvc29hcGNwcDIgJChT
T0FQX0ZMQUdTKSAkKFNPQVBIRUFERVIpCi0gCi0gI0xJQlM9Ci0gCi0gYmluX1BST0dSQU1TPXdz
ZGwyaAotIApkaWZmIC0tZ2l0IGEvcmVjaXBlcy9nc29hcC9nc29hcC1uYXRpdmVfMi43LjEzLmJi
IGIvcmVjaXBlcy9nc29hcC9nc29hcC1uYXRpdmVfMi43LjEzLmJiCmluZGV4IDNlZDc4ZDAuLmYw
MzcwYmUgMTAwNjQ0Ci0tLSBhL3JlY2lwZXMvZ3NvYXAvZ3NvYXAtbmF0aXZlXzIuNy4xMy5iYgor
KysgYi9yZWNpcGVzL2dzb2FwL2dzb2FwLW5hdGl2ZV8yLjcuMTMuYmIKQEAgLTIsNyArMiw3IEBA
IHJlcXVpcmUgZ3NvYXBfJHtQVn0uaW5jCiAKIERFUEVORFMgPSAiIgogCi1TUkNfVVJJICs9ICJm
aWxlOi8vdXNlLWp1c3QtYnVpbHQtYmluYXJ5LTIuNy4xMy5wYXRjaDtwYXRjaD0xIgorRVhUUkFf
T0VNQUtFID0gIiIKIAogaW5oZXJpdCBuYXRpdmUKIApkaWZmIC0tZ2l0IGEvcmVjaXBlcy9nc29h
cC9nc29hcC1uYXRpdmVfMi43LjcuYmIgYi9yZWNpcGVzL2dzb2FwL2dzb2FwLW5hdGl2ZV8yLjcu
Ny5iYgppbmRleCAyMDYyMDhkLi4wYjhhNGI4IDEwMDY0NAotLS0gYS9yZWNpcGVzL2dzb2FwL2dz
b2FwLW5hdGl2ZV8yLjcuNy5iYgorKysgYi9yZWNpcGVzL2dzb2FwL2dzb2FwLW5hdGl2ZV8yLjcu
Ny5iYgpAQCAtMyw3ICszLDcgQEAgcmVxdWlyZSBnc29hcF8ke1BWfS5iYgogREVQRU5EUyA9ICIi
CiBQUiA9ICJyMSIKIAotU1JDX1VSSSArPSAiZmlsZTovL3VzZS1qdXN0LWJ1aWx0LWJpbmFyeS5w
YXRjaDtwYXRjaD0xIgorRVhUUkFfT0VNQUtFID0gIiIKIAogaW5oZXJpdCBuYXRpdmUKIAotLSAK
MS42LjMuMwoK

--001636458b7ae8cce9047b4d812b--
