Return-Path: <nick.lewis@usa.g4s.com>
Received: from mail1.bemta3.messagelabs.com (mail1.bemta3.messagelabs.com
	[195.245.230.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1D21C6FEE4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jun 2014 13:56:30 +0000 (UTC)
Received: from [85.158.137.19:42469] by server-11.bemta-3.messagelabs.com id
	BC/DE-19438-E87FE935; Mon, 16 Jun 2014 13:56:30 +0000
X-Env-Sender: nick.lewis@usa.g4s.com
X-Msg-Ref: server-5.tower-39.messagelabs.com!1402926956!14159644!12
X-Originating-IP: [89.206.228.155]
X-StarScan-Received: 
X-StarScan-Version: 6.11.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17512 invoked from network); 16 Jun 2014 13:56:30 -0000
Received: from unallocated.star.net.uk (HELO gbtwk10s038.Technology.local)
	(89.206.228.155)
	by server-5.tower-39.messagelabs.com with RC4-SHA encrypted SMTP;
	16 Jun 2014 13:56:30 -0000
Received: from GBTWK10E001.Technology.local ([10.234.1.29]) by
	gbtwk10s038.Technology.local ([10.234.1.40]) with mapi; Mon, 16 Jun 2014
	14:56:26 +0100
From: "Lewis, Nick" <nick.lewis@usa.g4s.com>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Jun 2014 14:56:25 +0100
Thread-Topic: [patch] Libxml++ ptest target paths fix
Thread-Index: Ac+JauaHyQLY0R/ySy2eAAoRjT/7Eg==
Message-ID: <AAE0766F5AF36B46BAB7E0EFB927320633FFF45DAF@GBTWK10E001.Technology.local>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: [patch] Libxml++ ptest target paths fix
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
X-List-Received-Date: Mon, 16 Jun 2014 13:56:33 -0000
X-Groupsio-MsgNum: 50353
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_AAE0766F5AF36B46BAB7E0EFB927320633FFF45DAFGBTWK10E001Te_"

--_002_AAE0766F5AF36B46BAB7E0EFB927320633FFF45DAFGBTWK10E001Te_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From 135ef5152b5b50e230940c2822b2eb4371072bb0 Mon Sep 17 00:00:00 2001
From: Nick Lewis <nick.lewis@usa.g4s.com>
Date: Mon, 16 Jun 2014 14:39:20 +0100
Subject: [PATCH] Libxmlxx ptest target paths fix

Signed-off-by: Nick Lewis <nick.lewis@usa.g4s.com>
---
 .../libxml/libxml++-2.37.1/libxml++_ptest.patch    | 23 +++++++++++++++---=
----
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-core/libxml/libxml++-2.37.1/libxml++_ptest.pat=
ch b/meta-oe/recipes-core/libxml/libxml++-2.37.1/libxml++_ptest.patch
index 1e847be..82960f1 100644
--- a/meta-oe/recipes-core/libxml/libxml++-2.37.1/libxml++_ptest.patch
+++ b/meta-oe/recipes-core/libxml/libxml++-2.37.1/libxml++_ptest.patch
@@ -12,10 +12,19 @@ index d4aadb1..0e36756 100644
  # Optional: auto-generate the ChangeLog file from the git log on make dis=
t
  include $(top_srcdir)/macros/dist-changelog.am
 diff --git a/examples/Makefile.am b/examples/Makefile.am
-index d9541ca..c28b49c 100644
+index d9541ca..c27e088 100644
 --- a/examples/Makefile.am
 +++ b/examples/Makefile.am
-@@ -36,6 +36,23 @@ check_PROGRAMS =3D \
+@@ -19,6 +19,8 @@ AM_CPPFLAGS =3D -I$(top_builddir) -I$(top_srcdir) -I. $(=
LIBXMLXX_CFLAGS)
+ AM_CXXFLAGS =3D $(LIBXMLXX_WXXFLAGS)
+ LDADD =3D $(top_builddir)/libxml++/libxml++-$(LIBXMLXX_API_VERSION).la $(=
LIBXMLXX_LIBS)
+
++LOG_DRIVER =3D $(SHELL) ../macros/test-driver
++
+ check_PROGRAMS =3D \
+   dom_build/dom_build \
+   dom_parse_entities/dom_parse_entities \
+@@ -36,6 +38,23 @@ check_PROGRAMS =3D \
    schemavalidation/schemavalidation \
    textreader/textreader

@@ -39,20 +48,20 @@ index d9541ca..c28b49c 100644
  # Shell scripts that call the example programs.
  check_SCRIPTS =3D \
    dom_build/make_check.sh \
-@@ -147,10 +164,10 @@ dist_noinst_DATA =3D \
+@@ -147,10 +166,10 @@ dist_noinst_DATA =3D \
  # file are located in different directories.
  dom_read_write/make_check.sh: Makefile
        echo '# Generated and used by "make check"' >$@
 -      echo 'dom_read_write/dom_read_write "$(srcdir)/dom_read_write/examp=
le.xml" dom_read_write/example_output.xml >/dev/null' >>$@
-+      echo 'dom_read_write/.libs/dom_read_write "$(srcdir)/dom_read_write=
/example.xml" dom_read_write/example_output.xml >/dev/null' >>$@
++      echo 'cd dom_read_write && .libs/dom_read_write "example.xml" examp=
le_output.xml >/dev/null' >>$@
        chmod +x $@

 -script_template =3D cd "$(srcdir)/<!progname!>" && "$(abs_builddir)/<!pro=
gname!>/<!progname!>" >/dev/null
-+script_template =3D cd "$(srcdir)/<!progname!>" && ".libs/<!progname!>" >=
/dev/null
++script_template =3D cd "<!progname!>" && ".libs/<!progname!>" >/dev/null
  standard_scripts =3D $(filter-out dom_read_write/make_check.sh,$(check_SC=
RIPTS))

  # All other script files are generated like so:
-@@ -162,3 +179,18 @@ $(standard_scripts): Makefile
+@@ -162,3 +181,18 @@ $(standard_scripts): Makefile
  CLEANFILES =3D \
    dom_read_write/example_output.xml \
    $(check_SCRIPTS)
@@ -65,7 +74,7 @@ index d9541ca..c28b49c 100644
 +      $(MKDIR_P) $(DESTDIR)/examples
 +      cp --parents $(check_DOTLIBS) $(DESTDIR)/examples
 +      cp --parents $(check_SCRIPTS) $(DESTDIR)/examples
-+      $(foreach i, $(dist_noinst_DATA), cp --parents $(srcdir)/$(i) $(DES=
TDIR)/examples;)
++      cd $(srcdir) && cp --parents $(dist_noinst_DATA) $(DESTDIR)/example=
s
 +      cp Makefile $(DESTDIR)/examples
 +      $(MKDIR_P) $(DESTDIR)/macros
 +      cp $(srcdir)/../macros/test-driver $(DESTDIR)/macros
--
1.9.1


The details of this company are as follows:
G4S Technology Limited, Registered Office: Challenge House, International D=
rive, Tewkesbury, Gloucestershire GL20 8UQ, Registered in England No. 23823=
38.

This communication may contain information which is confidential, personal =
and/or privileged.

It is for the exclusive use of the intended recipient(s).
If you are not the intended recipient(s), please note that any distribution=
, forwarding, copying or use of this communication or the information in it=
 is strictly prohibited.

Any personal views expressed in this e-mail are those of the individual sen=
der and the company does not endorse or accept responsibility for them.

Prior to taking any action based upon this e-mail message, you should seek =
appropriate confirmation of its authenticity.

This e-mail has been scanned for all viruses by MessageLabs.

--_002_AAE0766F5AF36B46BAB7E0EFB927320633FFF45DAFGBTWK10E001Te_
Content-Type: application/octet-stream;
	name="0001-Libxmlxx-ptest-target-paths-fix.patch"
Content-Description: 0001-Libxmlxx-ptest-target-paths-fix.patch
Content-Disposition: attachment;
	filename="0001-Libxmlxx-ptest-target-paths-fix.patch"; size=3380;
	creation-date="Mon, 16 Jun 2014 14:50:25 GMT";
	modification-date="Mon, 16 Jun 2014 14:46:24 GMT"
Content-Transfer-Encoding: base64

RnJvbSAxMzVlZjUxNTJiNWI1MGUyMzA5NDBjMjgyMmIyZWI0MzcxMDcyYmIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBOaWNrIExld2lzIDxuaWNrLmxld2lzQHVzYS5nNHMuY29tPgpE
YXRlOiBNb24sIDE2IEp1biAyMDE0IDE0OjM5OjIwICswMTAwClN1YmplY3Q6IFtQQVRDSF0gTGli
eG1seHggcHRlc3QgdGFyZ2V0IHBhdGhzIGZpeAoKU2lnbmVkLW9mZi1ieTogTmljayBMZXdpcyA8
bmljay5sZXdpc0B1c2EuZzRzLmNvbT4KLS0tCiAuLi4vbGlieG1sL2xpYnhtbCsrLTIuMzcuMS9s
aWJ4bWwrK19wdGVzdC5wYXRjaCAgICB8IDIzICsrKysrKysrKysrKysrKy0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L21ldGEtb2UvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwrKy0yLjM3LjEvbGlieG1sKytfcHRl
c3QucGF0Y2ggYi9tZXRhLW9lL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sKystMi4zNy4xL2xp
YnhtbCsrX3B0ZXN0LnBhdGNoCmluZGV4IDFlODQ3YmUuLjgyOTYwZjEgMTAwNjQ0Ci0tLSBhL21l
dGEtb2UvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwrKy0yLjM3LjEvbGlieG1sKytfcHRlc3Qu
cGF0Y2gKKysrIGIvbWV0YS1vZS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbCsrLTIuMzcuMS9s
aWJ4bWwrK19wdGVzdC5wYXRjaApAQCAtMTIsMTAgKzEyLDE5IEBAIGluZGV4IGQ0YWFkYjEuLjBl
MzY3NTYgMTAwNjQ0CiAgIyBPcHRpb25hbDogYXV0by1nZW5lcmF0ZSB0aGUgQ2hhbmdlTG9nIGZp
bGUgZnJvbSB0aGUgZ2l0IGxvZyBvbiBtYWtlIGRpc3QKICBpbmNsdWRlICQodG9wX3NyY2Rpcikv
bWFjcm9zL2Rpc3QtY2hhbmdlbG9nLmFtCiBkaWZmIC0tZ2l0IGEvZXhhbXBsZXMvTWFrZWZpbGUu
YW0gYi9leGFtcGxlcy9NYWtlZmlsZS5hbQotaW5kZXggZDk1NDFjYS4uYzI4YjQ5YyAxMDA2NDQK
K2luZGV4IGQ5NTQxY2EuLmMyN2UwODggMTAwNjQ0CiAtLS0gYS9leGFtcGxlcy9NYWtlZmlsZS5h
bQogKysrIGIvZXhhbXBsZXMvTWFrZWZpbGUuYW0KLUBAIC0zNiw2ICszNiwyMyBAQCBjaGVja19Q
Uk9HUkFNUyA9IFwKK0BAIC0xOSw2ICsxOSw4IEBAIEFNX0NQUEZMQUdTID0gLUkkKHRvcF9idWls
ZGRpcikgLUkkKHRvcF9zcmNkaXIpIC1JLiAkKExJQlhNTFhYX0NGTEFHUykKKyBBTV9DWFhGTEFH
UyA9ICQoTElCWE1MWFhfV1hYRkxBR1MpCisgTERBREQgPSAkKHRvcF9idWlsZGRpcikvbGlieG1s
KysvbGlieG1sKystJChMSUJYTUxYWF9BUElfVkVSU0lPTikubGEgJChMSUJYTUxYWF9MSUJTKQor
IAorK0xPR19EUklWRVIgPSAkKFNIRUxMKSAuLi9tYWNyb3MvdGVzdC1kcml2ZXIKKysKKyBjaGVj
a19QUk9HUkFNUyA9IFwKKyAgIGRvbV9idWlsZC9kb21fYnVpbGQgXAorICAgZG9tX3BhcnNlX2Vu
dGl0aWVzL2RvbV9wYXJzZV9lbnRpdGllcyBcCitAQCAtMzYsNiArMzgsMjMgQEAgY2hlY2tfUFJP
R1JBTVMgPSBcCiAgICBzY2hlbWF2YWxpZGF0aW9uL3NjaGVtYXZhbGlkYXRpb24gXAogICAgdGV4
dHJlYWRlci90ZXh0cmVhZGVyCiAgCkBAIC0zOSwyMCArNDgsMjAgQEAgaW5kZXggZDk1NDFjYS4u
YzI4YjQ5YyAxMDA2NDQKICAjIFNoZWxsIHNjcmlwdHMgdGhhdCBjYWxsIHRoZSBleGFtcGxlIHBy
b2dyYW1zLgogIGNoZWNrX1NDUklQVFMgPSBcCiAgICBkb21fYnVpbGQvbWFrZV9jaGVjay5zaCBc
Ci1AQCAtMTQ3LDEwICsxNjQsMTAgQEAgZGlzdF9ub2luc3RfREFUQSA9IFwKK0BAIC0xNDcsMTAg
KzE2NiwxMCBAQCBkaXN0X25vaW5zdF9EQVRBID0gXAogICMgZmlsZSBhcmUgbG9jYXRlZCBpbiBk
aWZmZXJlbnQgZGlyZWN0b3JpZXMuCiAgZG9tX3JlYWRfd3JpdGUvbWFrZV9jaGVjay5zaDogTWFr
ZWZpbGUKICAJZWNobyAnIyBHZW5lcmF0ZWQgYW5kIHVzZWQgYnkgIm1ha2UgY2hlY2siJyA+JEAK
IC0JZWNobyAnZG9tX3JlYWRfd3JpdGUvZG9tX3JlYWRfd3JpdGUgIiQoc3JjZGlyKS9kb21fcmVh
ZF93cml0ZS9leGFtcGxlLnhtbCIgZG9tX3JlYWRfd3JpdGUvZXhhbXBsZV9vdXRwdXQueG1sID4v
ZGV2L251bGwnID4+JEAKLSsJZWNobyAnZG9tX3JlYWRfd3JpdGUvLmxpYnMvZG9tX3JlYWRfd3Jp
dGUgIiQoc3JjZGlyKS9kb21fcmVhZF93cml0ZS9leGFtcGxlLnhtbCIgZG9tX3JlYWRfd3JpdGUv
ZXhhbXBsZV9vdXRwdXQueG1sID4vZGV2L251bGwnID4+JEAKKysJZWNobyAnY2QgZG9tX3JlYWRf
d3JpdGUgJiYgLmxpYnMvZG9tX3JlYWRfd3JpdGUgImV4YW1wbGUueG1sIiBleGFtcGxlX291dHB1
dC54bWwgPi9kZXYvbnVsbCcgPj4kQAogIAljaG1vZCAreCAkQAogIAogLXNjcmlwdF90ZW1wbGF0
ZSA9IGNkICIkKHNyY2RpcikvPCFwcm9nbmFtZSE+IiAmJiAiJChhYnNfYnVpbGRkaXIpLzwhcHJv
Z25hbWUhPi88IXByb2duYW1lIT4iID4vZGV2L251bGwKLStzY3JpcHRfdGVtcGxhdGUgPSBjZCAi
JChzcmNkaXIpLzwhcHJvZ25hbWUhPiIgJiYgIi5saWJzLzwhcHJvZ25hbWUhPiIgPi9kZXYvbnVs
bAorK3NjcmlwdF90ZW1wbGF0ZSA9IGNkICI8IXByb2duYW1lIT4iICYmICIubGlicy88IXByb2du
YW1lIT4iID4vZGV2L251bGwKICBzdGFuZGFyZF9zY3JpcHRzID0gJChmaWx0ZXItb3V0IGRvbV9y
ZWFkX3dyaXRlL21ha2VfY2hlY2suc2gsJChjaGVja19TQ1JJUFRTKSkKICAKICAjIEFsbCBvdGhl
ciBzY3JpcHQgZmlsZXMgYXJlIGdlbmVyYXRlZCBsaWtlIHNvOgotQEAgLTE2MiwzICsxNzksMTgg
QEAgJChzdGFuZGFyZF9zY3JpcHRzKTogTWFrZWZpbGUKK0BAIC0xNjIsMyArMTgxLDE4IEBAICQo
c3RhbmRhcmRfc2NyaXB0cyk6IE1ha2VmaWxlCiAgQ0xFQU5GSUxFUyA9IFwKICAgIGRvbV9yZWFk
X3dyaXRlL2V4YW1wbGVfb3V0cHV0LnhtbCBcCiAgICAkKGNoZWNrX1NDUklQVFMpCkBAIC02NSw3
ICs3NCw3IEBAIGluZGV4IGQ5NTQxY2EuLmMyOGI0OWMgMTAwNjQ0CiArCSQoTUtESVJfUCkgJChE
RVNURElSKS9leGFtcGxlcwogKwljcCAtLXBhcmVudHMgJChjaGVja19ET1RMSUJTKSAkKERFU1RE
SVIpL2V4YW1wbGVzCiArCWNwIC0tcGFyZW50cyAkKGNoZWNrX1NDUklQVFMpICQoREVTVERJUikv
ZXhhbXBsZXMKLSsJJChmb3JlYWNoIGksICQoZGlzdF9ub2luc3RfREFUQSksIGNwIC0tcGFyZW50
cyAkKHNyY2RpcikvJChpKSAkKERFU1RESVIpL2V4YW1wbGVzOykKKysJY2QgJChzcmNkaXIpICYm
IGNwIC0tcGFyZW50cyAkKGRpc3Rfbm9pbnN0X0RBVEEpICQoREVTVERJUikvZXhhbXBsZXMKICsJ
Y3AgTWFrZWZpbGUgJChERVNURElSKS9leGFtcGxlcwogKwkkKE1LRElSX1ApICQoREVTVERJUikv
bWFjcm9zCiArCWNwICQoc3JjZGlyKS8uLi9tYWNyb3MvdGVzdC1kcml2ZXIgJChERVNURElSKS9t
YWNyb3MKLS0gCjEuOS4xCgo=

--_002_AAE0766F5AF36B46BAB7E0EFB927320633FFF45DAFGBTWK10E001Te_--
