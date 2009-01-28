Received: from [209.85.198.250] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1LS5nY-0007oV-Ut
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jan 2009 09:29:25 +0100
Received: by rv-out-0708.google.com with SMTP id f25so7501933rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2009 00:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=EcwPjG7nTry+5ttnCw32FZYQT0630RB3jDKfNIyAot0=;
	b=UdyZo42L3eaUsKmymf92aHudDtpyGtL6PmlNkQ6wyLIe5yROJEBk19RS0lQg/QndWT
	6kaq+w2PLgehODx3csRlNONIsQ1aT1bpa2E70YIIOE1cktjx5/SsZQVzEWoo0UkwENzp
	mXpYqM/NXJTExgP4irg/dsWZdsDrZBC1OBDag=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=b7ke5jJUu5OLkz9/XF9+zNPe260+wd+OnV2RLN1PMx/jlAgZSVvr3spaUXXU9abna+
	fp9PEUQ/NfgPuvz8gCLsRNXTPTCDVpvX1sbkvnU/JXGYpZYwc7vCYY7XwnG0oKSq8REA
	Xant4w4FAz4w2Sd2DX7Ex1Ud9miy/6DjyrJbs=
MIME-Version: 1.0
Received: by 10.141.90.13 with SMTP id s13mr1085774rvl.5.1233130907491; Wed, 
	28 Jan 2009 00:21:47 -0800 (PST)
Date: Wed, 28 Jan 2009 00:21:47 -0800
Message-ID: <a7f8874a0901280021u2d3bcbd9w2e6f47bfca00bb81@mail.gmail.com>
From: Hans Henry von Tresckow <hvontres@gmail.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] Added rsnapshot
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
X-List-Received-Date: Wed, 28 Jan 2009 08:29:25 -0000
X-Groupsio-MsgNum: 7457
Content-Type: multipart/mixed; boundary=000e0cd23b82b3deba046186a960

--000e0cd23b82b3deba046186a960
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

From 6d8f2311c513392996aef7bf61114977c859412b Mon Sep 17 00:00:00 2001
From: Henry von Tresckow <hvontres@gmail.com>
Date: Wed, 28 Jan 2009 00:19:45 -0800
Subject: [PATCH] Added rsnapshot

---
 conf/checksums.ini                    |    4 ++++
 packages/rsnapshot/rsnapshot_1.3.1.bb |   15 +++++++++++++++
 2 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 packages/rsnapshot/rsnapshot_1.3.1.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index e3a8253..9d412a2 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -18570,6 +18570,10 @@
sha256=27ffe0392ae193eb04786a2159c099a00fe38ccdaebcebd72afc842c528bb6d3
 md5=4e855372c4a533b9ed605503156e6e04
 sha256=3dbd653b27fc855bf86dfe0ac06ed9bf59c8b85c9bcb4b5488528b30c59970f4

+[http://downloads.sourceforge.net/rsnapshot/rsnapshot-1.3.1.tar.gz]
+md5=588f92995dcf60a6ea6df8d94a017e7e
+sha256=94b6c77e40628935f42a191bdc28ad93b1f132fde456ee76ee87763f1eddc75e
+
 [http://www.claws-mail.org/downloads/plugins/rssyl-0.10.tar.gz]
 md5=01a123319f2a32ecff7e560b95c2e4df
 sha256=d6bfdee4fd31c0e0089c6edab594eefaa5b7b95f0b783f1156dffadf1a90d820
diff --git a/packages/rsnapshot/rsnapshot_1.3.1.bb
b/packages/rsnapshot/rsnapshot_1.3.1.bb
new file mode 100644
index 0000000..2ea32c7
--- /dev/null
+++ b/packages/rsnapshot/rsnapshot_1.3.1.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Rsnapshot Backup System"
+HOMEPAGE = "http://www.rsnapshot.org/"
+LICENSE = "GPLv2"
+SECTION = "console/networking"
+PR = "r0"
+
+RDEPENDS += " perl rsync logrotate"
+RRECOMENTS += " ssh"
+
+#SRC_URI= "http://www.rsnapshot.org/downloads/rsnapshot-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/rsnapshot/rsnapshot-${PV}.tar.gz"
+
+inherit autotools
+
+
-- 
1.5.4.3



-- 
Henry von Tresckow (hvontres)
Bill Cosby  - "A word to the wise ain't necessary - it's the stupid
ones that need the advice."

--000e0cd23b82b3deba046186a960
Content-Type: text/x-diff; charset=US-ASCII; name="0001-Added-rsnapshot.patch"
Content-Disposition: attachment; filename="0001-Added-rsnapshot.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fqhqai3f0

RnJvbSA2ZDhmMjMxMWM1MTMzOTI5OTZhZWY3YmY2MTExNDk3N2M4NTk0MTJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIZW5yeSB2b24gVHJlc2Nrb3cgPGh2b250cmVzQGdtYWlsLmNv
bT4KRGF0ZTogV2VkLCAyOCBKYW4gMjAwOSAwMDoxOTo0NSAtMDgwMApTdWJqZWN0OiBbUEFUQ0hd
IEFkZGVkIHJzbmFwc2hvdAoKLS0tCiBjb25mL2NoZWNrc3Vtcy5pbmkgICAgICAgICAgICAgICAg
ICAgIHwgICAgNCArKysrCiBwYWNrYWdlcy9yc25hcHNob3QvcnNuYXBzaG90XzEuMy4xLmJiIHwg
ICAxNSArKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwg
MCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlcy9yc25hcHNob3QvcnNu
YXBzaG90XzEuMy4xLmJiCgpkaWZmIC0tZ2l0IGEvY29uZi9jaGVja3N1bXMuaW5pIGIvY29uZi9j
aGVja3N1bXMuaW5pCmluZGV4IGUzYTgyNTMuLjlkNDEyYTIgMTAwNjQ0Ci0tLSBhL2NvbmYvY2hl
Y2tzdW1zLmluaQorKysgYi9jb25mL2NoZWNrc3Vtcy5pbmkKQEAgLTE4NTcwLDYgKzE4NTcwLDEw
IEBAIHNoYTI1Nj0yN2ZmZTAzOTJhZTE5M2ViMDQ3ODZhMjE1OWMwOTlhMDBmZTM4Y2NkYWViY2Vi
ZDcyYWZjODQyYzUyOGJiNmQzCiBtZDU9NGU4NTUzNzJjNGE1MzNiOWVkNjA1NTAzMTU2ZTZlMDQK
IHNoYTI1Nj0zZGJkNjUzYjI3ZmM4NTViZjg2ZGZlMGFjMDZlZDliZjU5YzhiODVjOWJjYjRiNTQ4
ODUyOGIzMGM1OTk3MGY0CiAKK1todHRwOi8vZG93bmxvYWRzLnNvdXJjZWZvcmdlLm5ldC9yc25h
cHNob3QvcnNuYXBzaG90LTEuMy4xLnRhci5nel0KK21kNT01ODhmOTI5OTVkY2Y2MGE2ZWE2ZGY4
ZDk0YTAxN2U3ZQorc2hhMjU2PTk0YjZjNzdlNDA2Mjg5MzVmNDJhMTkxYmRjMjhhZDkzYjFmMTMy
ZmRlNDU2ZWU3NmVlODc3NjNmMWVkZGM3NWUKKwogW2h0dHA6Ly93d3cuY2xhd3MtbWFpbC5vcmcv
ZG93bmxvYWRzL3BsdWdpbnMvcnNzeWwtMC4xMC50YXIuZ3pdCiBtZDU9MDFhMTIzMzE5ZjJhMzJl
Y2ZmN2U1NjBiOTVjMmU0ZGYKIHNoYTI1Nj1kNmJmZGVlNGZkMzFjMGUwMDg5YzZlZGFiNTk0ZWVm
YWE1YjdiOTVmMGI3ODNmMTE1NmRmZmFkZjFhOTBkODIwCmRpZmYgLS1naXQgYS9wYWNrYWdlcy9y
c25hcHNob3QvcnNuYXBzaG90XzEuMy4xLmJiIGIvcGFja2FnZXMvcnNuYXBzaG90L3JzbmFwc2hv
dF8xLjMuMS5iYgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi4yZWEzMmM3Ci0t
LSAvZGV2L251bGwKKysrIGIvcGFja2FnZXMvcnNuYXBzaG90L3JzbmFwc2hvdF8xLjMuMS5iYgpA
QCAtMCwwICsxLDE1IEBACitERVNDUklQVElPTiA9ICJSc25hcHNob3QgQmFja3VwIFN5c3RlbSIK
K0hPTUVQQUdFID0gImh0dHA6Ly93d3cucnNuYXBzaG90Lm9yZy8iCitMSUNFTlNFID0gIkdQTHYy
IgorU0VDVElPTiA9ICJjb25zb2xlL25ldHdvcmtpbmciCitQUiA9ICJyMCIKKworUkRFUEVORFMg
Kz0gIiBwZXJsIHJzeW5jIGxvZ3JvdGF0ZSIKK1JSRUNPTUVOVFMgKz0gIiBzc2giCisKKyNTUkNf
VVJJPSAiaHR0cDovL3d3dy5yc25hcHNob3Qub3JnL2Rvd25sb2Fkcy9yc25hcHNob3QtJHtQVn0u
dGFyLmd6IgorU1JDX1VSSSA9ICIke1NPVVJDRUZPUkdFX01JUlJPUn0vcnNuYXBzaG90L3JzbmFw
c2hvdC0ke1BWfS50YXIuZ3oiCisKK2luaGVyaXQgYXV0b3Rvb2xzCisKKwotLSAKMS41LjQuMwoK

--000e0cd23b82b3deba046186a960--
