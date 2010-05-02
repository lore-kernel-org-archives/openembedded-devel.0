Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1O8gr6-0005V8-TD
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 May 2010 23:37:43 +0200
Received: by fxm11 with SMTP id 11so1558997fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 May 2010 14:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=rcqS7hjSRCQ1ovbk9rHd4hMcFSstXzvnR8vo3kWgEJw=;
	b=H36vCaxpH+6+ZOjpr+zKbgzqFC0pVDt+87/CPzPvWkpu8ogaXETS3J3qFEY1MOyIsr
	9ntTPTRt11AAT/xE8583jbqx5KDzBBiGcuUstfVXilmxrZNmS27BzcPY6CY1K/XzeAgN
	cydVERYmTHxnzS8xRfA6rMGsVjzARIM/oFXSo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=KdSoFIDT80Xgd++84SCvhnYYxG7ppRb6tYwKc09iHchJRpt9pjZS+lsrbXg5yxORj3
	pfEvCDfn5FCX4lu8P3MdfPj6nUYxTiJAlnu6n1Ob7sm2XCqMfjDmQUsKd5eikFJ4RxMb
	UMsrTv+D9xGxrFjnIFWf30hGhCWtc+Zmka1c4=
MIME-Version: 1.0
Received: by 10.223.143.67 with SMTP id t3mr2886307fau.16.1272836034958; Sun, 
	02 May 2010 14:33:54 -0700 (PDT)
Received: by 10.223.107.18 with HTTP; Sun, 2 May 2010 14:33:54 -0700 (PDT)
Date: Sun, 2 May 2010 18:33:54 -0300
Message-ID: <k2j88e33d221005021433zfe717154u6fd727c5e161ce6@mail.gmail.com>
From: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Add cmake sdk and update version
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
X-List-Received-Date: Sun, 02 May 2010 21:37:44 -0000
X-Groupsio-MsgNum: 18940
Content-Type: multipart/mixed; boundary=0023545bd404b897e50485a33bc8

--0023545bd404b897e50485a33bc8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi, this is a patch to build cmake as sdk.  I create the recipe to new
cmake 2.8.1.

Thanks

---
 recipes/cmake/cmake-sdk_2.6.4.bb |    5 +++++
 recipes/cmake/cmake-sdk_2.8.1.bb |    5 +++++
 recipes/cmake/cmake.inc          |    2 +-
 3 files changed, 11 insertions(+), 1 deletions(-)
 create mode 100644 recipes/cmake/cmake-sdk_2.6.4.bb
 create mode 100644 recipes/cmake/cmake-sdk_2.8.1.bb

diff --git a/recipes/cmake/cmake-sdk_2.6.4.bb b/recipes/cmake/cmake-sdk_2.6=
.4.bb
new file mode 100644
index 0000000..9eadb1e
--- /dev/null
+++ b/recipes/cmake/cmake-sdk_2.6.4.bb
@@ -0,0 +1,5 @@
+inherit sdk
+require cmake.inc
+
+SRC_URI[md5sum] =3D "50f387d0436696c4a68b5512a72c9cde"
+SRC_URI[sha256sum] =3D
"9cdd2152e37b05d0d40d334a1bb2dfc0250021797360f971c6ea3d457ac9fdf2"
diff --git a/recipes/cmake/cmake-sdk_2.8.1.bb b/recipes/cmake/cmake-sdk_2.8=
.1.bb
new file mode 100644
index 0000000..86356f7
--- /dev/null
+++ b/recipes/cmake/cmake-sdk_2.8.1.bb
@@ -0,0 +1,5 @@
+inherit sdk
+require cmake.inc
+
+SRC_URI[md5sum] =3D "feadc2e5ebbfed0efc90178583503725"
+SRC_URI[sha256sum] =3D
"7eae74ab7673974a68e395c211854d318f0af2d320590a670339ee8ee9422242"
diff --git a/recipes/cmake/cmake.inc b/recipes/cmake/cmake.inc
index ef6f5aa..631d846 100644
--- a/recipes/cmake/cmake.inc
+++ b/recipes/cmake/cmake.inc
@@ -5,7 +5,7 @@ DESCRIPTION =3D "A cross-platform, open-source make system"
 HOMEPAGE =3D "http://www.cmake.org/"
 LICENSE =3D "Berkeley-style license"
 SECTION =3D "console/utils"
-PR =3D "r2"
+PR =3D "r3"

 CMAKE_MAJOR_VERSION =3D
"${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).spl=
it('.')[1]}"
 SRC_URI =3D "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV=
}.tar.gz"
--=20
1.7.0.4


--=20
-----------------------------------------------------------
Jo=C3=A3o Henrique Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil
BSD051283
LPI 1
http://www.joaohfreitas.eti.br

--0023545bd404b897e50485a33bc8
Content-Type: text/x-diff; charset=US-ASCII; 
	name="0001-Add-cmake-sdk-and-update-version.patch"
Content-Disposition: attachment; 
	filename="0001-Add-cmake-sdk-and-update-version.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g8qdp3tz0

RnJvbSAyOTI4ZmJmYzU1NjdhOGIyZDJjN2E0YWVlNDU2OTk0MzIxNTM1MTQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKb2FvIEguIEZyZWl0YXMgPGpvYW9oZkBnbWFpbC5jb20+CkRh
dGU6IFN1biwgMiBNYXkgMjAxMCAxODoyNTowNCAtMDMwMApTdWJqZWN0OiBbUEFUQ0hdIEFkZCBj
bWFrZSBzZGsgYW5kIHVwZGF0ZSB2ZXJzaW9uCgotLS0KIHJlY2lwZXMvY21ha2UvY21ha2Utc2Rr
XzIuNi40LmJiIHwgICAgNSArKysrKwogcmVjaXBlcy9jbWFrZS9jbWFrZS1zZGtfMi44LjEuYmIg
fCAgICA1ICsrKysrCiByZWNpcGVzL2NtYWtlL2NtYWtlLmluYyAgICAgICAgICB8ICAgIDIgKy0K
IDMgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbnMoLSkKIGNyZWF0
ZSBtb2RlIDEwMDY0NCByZWNpcGVzL2NtYWtlL2NtYWtlLXNka18yLjYuNC5iYgogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHJlY2lwZXMvY21ha2UvY21ha2Utc2RrXzIuOC4xLmJiCgpkaWZmIC0tZ2l0IGEv
cmVjaXBlcy9jbWFrZS9jbWFrZS1zZGtfMi42LjQuYmIgYi9yZWNpcGVzL2NtYWtlL2NtYWtlLXNk
a18yLjYuNC5iYgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi45ZWFkYjFlCi0t
LSAvZGV2L251bGwKKysrIGIvcmVjaXBlcy9jbWFrZS9jbWFrZS1zZGtfMi42LjQuYmIKQEAgLTAs
MCArMSw1IEBACitpbmhlcml0IHNkaworcmVxdWlyZSBjbWFrZS5pbmMKKworU1JDX1VSSVttZDVz
dW1dID0gIjUwZjM4N2QwNDM2Njk2YzRhNjhiNTUxMmE3MmM5Y2RlIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjljZGQyMTUyZTM3YjA1ZDBkNDBkMzM0YTFiYjJkZmMwMjUwMDIxNzk3MzYwZjk3MWM2
ZWEzZDQ1N2FjOWZkZjIiCmRpZmYgLS1naXQgYS9yZWNpcGVzL2NtYWtlL2NtYWtlLXNka18yLjgu
MS5iYiBiL3JlY2lwZXMvY21ha2UvY21ha2Utc2RrXzIuOC4xLmJiCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAuLjg2MzU2ZjcKLS0tIC9kZXYvbnVsbAorKysgYi9yZWNpcGVzL2Nt
YWtlL2NtYWtlLXNka18yLjguMS5iYgpAQCAtMCwwICsxLDUgQEAKK2luaGVyaXQgc2RrCityZXF1
aXJlIGNtYWtlLmluYworCitTUkNfVVJJW21kNXN1bV0gPSAiZmVhZGMyZTVlYmJmZWQwZWZjOTAx
Nzg1ODM1MDM3MjUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2VhZTc0YWI3NjczOTc0YTY4ZTM5
NWMyMTE4NTRkMzE4ZjBhZjJkMzIwNTkwYTY3MDMzOWVlOGVlOTQyMjI0MiIKZGlmZiAtLWdpdCBh
L3JlY2lwZXMvY21ha2UvY21ha2UuaW5jIGIvcmVjaXBlcy9jbWFrZS9jbWFrZS5pbmMKaW5kZXgg
ZWY2ZjVhYS4uNjMxZDg0NiAxMDA2NDQKLS0tIGEvcmVjaXBlcy9jbWFrZS9jbWFrZS5pbmMKKysr
IGIvcmVjaXBlcy9jbWFrZS9jbWFrZS5pbmMKQEAgLTUsNyArNSw3IEBAIERFU0NSSVBUSU9OID0g
IkEgY3Jvc3MtcGxhdGZvcm0sIG9wZW4tc291cmNlIG1ha2Ugc3lzdGVtIgogSE9NRVBBR0UgPSAi
aHR0cDovL3d3dy5jbWFrZS5vcmcvIgogTElDRU5TRSA9ICJCZXJrZWxleS1zdHlsZSBsaWNlbnNl
IgogU0VDVElPTiA9ICJjb25zb2xlL3V0aWxzIgotUFIgPSAicjIiCitQUiA9ICJyMyIKIAogQ01B
S0VfTUFKT1JfVkVSU0lPTiA9ICIke0BiYi5kYXRhLmdldFZhcignUFYnLGQsMSkuc3BsaXQoJy4n
KVswXX0uJHtAYmIuZGF0YS5nZXRWYXIoJ1BWJyxkLDEpLnNwbGl0KCcuJylbMV19IgogU1JDX1VS
SSA9ICJodHRwOi8vd3d3LmNtYWtlLm9yZy9maWxlcy92JHtDTUFLRV9NQUpPUl9WRVJTSU9OfS9j
bWFrZS0ke1BWfS50YXIuZ3oiCi0tIAoxLjcuMC40Cgo=

--0023545bd404b897e50485a33bc8--
