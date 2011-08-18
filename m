Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <blunderer@gmail.com>) id 1Qu4uH-0007MK-Ax
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 17:53:21 +0200
Received: by ywa12 with SMTP id 12so642305ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2011 08:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=FzwYNbkvZYKv59oA/faZ0kNCP1wA2chZ3jYLQs1HdDI=;
	b=Mm02VupYhqvaHUwdGJz9kkgLFuJEz8HDMYiJDzdtt8LJg3h2opwJvv98rMBgvAMTr6
	tYQx9sgGm1iMkytoTsSj0cQyv1E3xWk4YBxWXh3bNU1DdXlSIYAfLFRL5O1uUVtkAWjF
	HM+MRTNIDQX1lX9JslEm6Bc4YQM3wfJ+1Qc3U=
Received: by 10.236.200.164 with SMTP id z24mr5131890yhn.84.1313682521076;
	Thu, 18 Aug 2011 08:48:41 -0700 (PDT)
MIME-Version: 1.0
Sender: blunderer@gmail.com
Received: by 10.236.70.70 with HTTP; Thu, 18 Aug 2011 08:48:21 -0700 (PDT)
From: Tristan Lelong <tristan.lelong@blunderer.org>
Date: Thu, 18 Aug 2011 17:48:21 +0200
X-Google-Sender-Auth: z4htGHQTgqZfwTRMv9zIEXqIUEk
Message-ID: <CAJb9USWOKap6nFh8TxogvQtO8=5cZ9x8AaAEUQto=EjvShW8QA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] Add a new recipe: libroxml
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
X-List-Received-Date: Thu, 18 Aug 2011 15:53:21 -0000
X-Groupsio-MsgNum: 33700
Content-Type: multipart/mixed; boundary=20cf305e24530432e504aac98c97

--20cf305e24530432e504aac98c97
Content-Type: text/plain; charset=ISO-8859-1

Add a new recipe: libroxml

libroxml is a small fast and powerfull xml parsing library.
It handles parsing, creating, modifying xml documents

Signed-off-by: Tristan Lelong <tristan.lelong@libroxml.net>
---
 recipes/libroxml/libroxml.inc      |   23 +++++++++++++++++++++++
 recipes/libroxml/libroxml_2.1.0.bb |    8 ++++++++
 2 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libroxml/libroxml.inc
 create mode 100644 recipes/libroxml/libroxml_2.1.0.bb

diff --git a/recipes/libroxml/libroxml.inc b/recipes/libroxml/libroxml.inc
new file mode 100644
index 0000000..5ade6e7
--- /dev/null
+++ b/recipes/libroxml/libroxml.inc
@@ -0,0 +1,23 @@
+
+DESCRIPTION = "small, fast and powerfull xml library"
+LICENSE = "LGPL"
+SECTION = "libs"
+PRIORITY = "optional"
+MAINTAINER = "Tristan Lelong <tristan.lelong@libroxml.net>"
+HOMEPAGE = "http://www.libroxml.net"
+
+PROVIDES = "libroxml"
+RPROVIDES = "libroxml"
+
+SRC_URI = "http://libroxml.googlecode.com/files/libroxml-2.1.0.tar.gz"
+
+S = ${WORKDIR}/${PN}-${PV}
+
+do_install() {
+        oe_runmake install DESTDIR=${D}
+}
+
+PACKAGES = ${PN}
+
+FILES_${PN} = ${libdir}/libroxml.so.0 ${bindir}/roxml
+
diff --git a/recipes/libroxml/libroxml_2.1.0.bb
b/recipes/libroxml/libroxml_2.1.0.bb
new file mode 100644
index 0000000..22fff51
--- /dev/null
+++ b/recipes/libroxml/libroxml_2.1.0.bb
@@ -0,0 +1,8 @@
+
+PR = "r0"
+
+require libroxml.inc
+
+SRC_URI[md5sum] = "eb69737ba6dc345399531dfa5975a53d"
+SRC_URI[sha256sum] =
"823d9d495bc07618355e3137e289dfcc792b8a513f12452a2aba9c88b48f2e2d"
+
-- 
1.7.5.3


-- 
618FE3EF

--20cf305e24530432e504aac98c97
Content-Type: text/x-patch; charset=US-ASCII; name="Add-a-new-recipe-libroxml.patch"
Content-Disposition: attachment; filename="Add-a-new-recipe-libroxml.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_grhwms1q0

RnJvbSBkNGQwZmE4OTI4ZmE2ZTYzM2Y5NTMxZDg2ODFlNzU0MDM3NjI0MGYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUcmlzdGFuIExlbG9uZyA8dHJpc3Rhbi5sZWxvbmdAbGlicm94
bWwubmV0PgpEYXRlOiBUaHUsIDE4IEF1ZyAyMDExIDE2OjM4OjU5ICswMjAwClN1YmplY3Q6IFtQ
QVRDSF0gQWRkIGEgbmV3IHJlY2lwZTogbGlicm94bWwgCiBsaWJyb3htbCBpcyBhIHNtYWxsIGZh
c3QgYW5kCiBwb3dlcmZ1bGwgeG1sIHBhcnNpbmcgbGlicmFyeS4gaXQgaGFuZGxlcyBwYXJzaW5n
LAogY3JlYXRpbmcsIG1vZGlmeWluZyB4bWwgZG9jdW1lbnRzCgpTaWduZWQtb2ZmLWJ5OiBUcmlz
dGFuIExlbG9uZyA8dHJpc3Rhbi5sZWxvbmdAbGlicm94bWwubmV0PgotLS0KIHJlY2lwZXMvbGli
cm94bWwvbGlicm94bWwuaW5jICAgICAgfCAgIDIzICsrKysrKysrKysrKysrKysrKysrKysrCiBy
ZWNpcGVzL2xpYnJveG1sL2xpYnJveG1sXzIuMS4wLmJiIHwgICAgOCArKysrKysrKwogMiBmaWxl
cyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IHJlY2lwZXMvbGlicm94bWwvbGlicm94bWwuaW5jCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cmVjaXBlcy9saWJyb3htbC9saWJyb3htbF8yLjEuMC5iYgoKZGlmZiAtLWdpdCBhL3JlY2lwZXMv
bGlicm94bWwvbGlicm94bWwuaW5jIGIvcmVjaXBlcy9saWJyb3htbC9saWJyb3htbC5pbmMKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uNWFkZTZlNwotLS0gL2Rldi9udWxsCisr
KyBiL3JlY2lwZXMvbGlicm94bWwvbGlicm94bWwuaW5jCkBAIC0wLDAgKzEsMjMgQEAKKworREVT
Q1JJUFRJT04gPSAic21hbGwsIGZhc3QgYW5kIHBvd2VyZnVsbCB4bWwgbGlicmFyeSIKK0xJQ0VO
U0UgPSAiTEdQTCIKK1NFQ1RJT04gPSAibGlicyIKK1BSSU9SSVRZID0gIm9wdGlvbmFsIgorTUFJ
TlRBSU5FUiA9ICJUcmlzdGFuIExlbG9uZyA8dHJpc3Rhbi5sZWxvbmdAbGlicm94bWwubmV0PiIK
K0hPTUVQQUdFID0gImh0dHA6Ly93d3cubGlicm94bWwubmV0IgorCitQUk9WSURFUyA9ICJsaWJy
b3htbCIKK1JQUk9WSURFUyA9ICJsaWJyb3htbCIKKworU1JDX1VSSSA9ICJodHRwOi8vbGlicm94
bWwuZ29vZ2xlY29kZS5jb20vZmlsZXMvbGlicm94bWwtMi4xLjAudGFyLmd6IgorCitTID0gJHtX
T1JLRElSfS8ke1BOfS0ke1BWfQorCitkb19pbnN0YWxsKCkgeworICAgICAgICBvZV9ydW5tYWtl
IGluc3RhbGwgREVTVERJUj0ke0R9Cit9CisKK1BBQ0tBR0VTID0gJHtQTn0KKworRklMRVNfJHtQ
Tn0gPSAke2xpYmRpcn0vbGlicm94bWwuc28uMCAke2JpbmRpcn0vcm94bWwKKwpkaWZmIC0tZ2l0
IGEvcmVjaXBlcy9saWJyb3htbC9saWJyb3htbF8yLjEuMC5iYiBiL3JlY2lwZXMvbGlicm94bWwv
bGlicm94bWxfMi4xLjAuYmIKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uMjJm
ZmY1MQotLS0gL2Rldi9udWxsCisrKyBiL3JlY2lwZXMvbGlicm94bWwvbGlicm94bWxfMi4xLjAu
YmIKQEAgLTAsMCArMSw4IEBACisKK1BSID0gInIwIgorCityZXF1aXJlIGxpYnJveG1sLmluYwor
CitTUkNfVVJJW21kNXN1bV0gPSAiZWI2OTczN2JhNmRjMzQ1Mzk5NTMxZGZhNTk3NWE1M2QiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiODIzZDlkNDk1YmMwNzYxODM1NWUzMTM3ZTI4OWRmY2M3OTJi
OGE1MTNmMTI0NTJhMmFiYTljODhiNDhmMmUyZCIKKwotLSAKMS43LjUuMwoK

--20cf305e24530432e504aac98c97--
