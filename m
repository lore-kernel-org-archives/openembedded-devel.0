Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1ODUmK-0005Ag-DU
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 May 2010 05:44:38 +0200
Received: by pwj5 with SMTP id 5so1832121pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 May 2010 20:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=2j4JoJgNK8eYetXGEinZ22o6jzK8TLHBaaZD9iWtN7E=;
	b=uHsLKhNXtChgVaQObxDKRnWr9Ad9HfISla0BoZl8LMjB/cB24SaomIC93L9idnZCsy
	u7eVscSnS2fLttL1oth5VGdqixVqjuBaHelfIseDnNWvImEfWapWboGEGIogy9tus0Oc
	EhhPbvW2C5gmhdnuGTLjnTVPsKxqZNXMXv0NE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=FfvNciJodc8tqJ3DYIz/b4LCWMNoVpR4SkZzTWcJsLSZr/7E1IJRuN7RGG+acjv2cH
	Wmq6LyrLXzQIuiQS8U9RYm9znqdKgVAPPam9kJgcDK7HcF97GOiY984IFTvqwVc4oaJj
	KIw4dXuQ6y5F6c1zcnMrFREfXBrwtuEwdo9Pk=
MIME-Version: 1.0
Received: by 10.141.89.17 with SMTP id r17mr2262618rvl.185.1273981237150; Sat, 
	15 May 2010 20:40:37 -0700 (PDT)
Received: by 10.141.51.17 with HTTP; Sat, 15 May 2010 20:40:37 -0700 (PDT)
Date: Sun, 16 May 2010 00:40:37 -0300
Message-ID: <AANLkTikuptIZDURk9aJb5xqB22op3_cnR1OU7iQ0JfY0@mail.gmail.com>
From: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Add lksctp tools
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
X-List-Received-Date: Sun, 16 May 2010 03:44:39 -0000
X-Groupsio-MsgNum: 19337
Content-Type: multipart/mixed; boundary=000e0cd137b617466f0486addf5b

--000e0cd137b617466f0486addf5b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

---
 recipes/lksctp-tools/lksctp-tools.inc      |   29 ++++++++++++++++++++++++=
++++
 recipes/lksctp-tools/lksctp-tools_1.0.7.bb |   11 ++++++++++
 2 files changed, 40 insertions(+), 0 deletions(-)
 create mode 100644 recipes/lksctp-tools/lksctp-tools.inc
 create mode 100644 recipes/lksctp-tools/lksctp-tools_1.0.7.bb

diff --git a/recipes/lksctp-tools/lksctp-tools.inc
b/recipes/lksctp-tools/lksctp-tools.inc
new file mode 100644
index 0000000..678531e
--- /dev/null
+++ b/recipes/lksctp-tools/lksctp-tools.inc
@@ -0,0 +1,29 @@
+DESCRIPTION =3D "The Linux Kernel Stream Control Transmission Protocol
(lksctp) project"
+SECTION =3D "libs"
+PRIORITY =3D "optional"
+LICENSE =3D "GPLv2"
+#DEPENDS_virtclass-native =3D "python-native"
+
+S =3D "${WORKDIR}/${BPN}-${PV}"
+
+INC_PR =3D "r0"
+
+BBCLASSEXTEND =3D "native"
+
+inherit autotools pkgconfig binconfig
+
+export LDFLAGS +=3D "-ldl"
+
+do_install_append_virtclass-native() {
+	:
+}
+
+DEBIANNAME_${PN} =3D "lksctp"
+
+PACKAGES =3D+ "${PN}-tools"
+FILES_${PN} =3D "${libexecdir}/* ${libdir}/lib*${SOLIBS} \
+            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
+            ${base_libdir}/*${SOLIBS}"
+
+FILES_${PN}-dev +=3D "${bindir}/*-config"
+FILES_${PN}-utils =3D ""
diff --git a/recipes/lksctp-tools/lksctp-tools_1.0.7.bb
b/recipes/lksctp-tools/lksctp-tools_1.0.7.bb
new file mode 100644
index 0000000..34c2ce5
--- /dev/null
+++ b/recipes/lksctp-tools/lksctp-tools_1.0.7.bb
@@ -0,0 +1,11 @@
+require lksctp-tools.inc
+PR =3D "${INC_PR}.0"
+
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/lksctp/lksctp-tools-${PV}.tar.gz"
+
+PARALLEL_MAKE =3D ""
+CCACHE =3D ""
+
+
+SRC_URI[md5sum] =3D "047562b40537eb3be5d5ec3ae0a2198b"
+SRC_URI[sha256sum] =3D
"e920e89d110cff9847f1d86a1d7a23a156a8abcc9e65a35655d687fd08377595"
--=20
1.7.0.4


--=20
-----------------------------------------------------------
Jo=C3=A3o Henrique Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil
BSD051283
LPI 1
http://www.joaohfreitas.eti.br

--000e0cd137b617466f0486addf5b
Content-Type: text/x-patch; charset=US-ASCII; name="0006-Add-lksctp-tools.patch"
Content-Disposition: attachment; filename="0006-Add-lksctp-tools.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g99bh0x70

RnJvbSA0Yjk2NWU0Y2E1OWFjZTIyMGUwOGU1MWQ0ZmUyOGYzODZlNDJkODNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKb2FvIEguIEZyZWl0YXMgPGpvYW9oZkBnbWFpbC5jb20+CkRh
dGU6IFNhdCwgMTUgTWF5IDIwMTAgMTU6NDQ6NTcgLTAzMDAKU3ViamVjdDogW1BBVENIIDYvN10g
QWRkIGxrc2N0cCB0b29scwoKLS0tCiByZWNpcGVzL2xrc2N0cC10b29scy9sa3NjdHAtdG9vbHMu
aW5jICAgICAgfCAgIDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHJlY2lwZXMvbGtz
Y3RwLXRvb2xzL2xrc2N0cC10b29sc18xLjAuNy5iYiB8ICAgMTEgKysrKysrKysrKwogMiBmaWxl
cyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IHJlY2lwZXMvbGtzY3RwLXRvb2xzL2xrc2N0cC10b29scy5pbmMKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCByZWNpcGVzL2xrc2N0cC10b29scy9sa3NjdHAtdG9vbHNfMS4wLjcuYmIKCmRpZmYg
LS1naXQgYS9yZWNpcGVzL2xrc2N0cC10b29scy9sa3NjdHAtdG9vbHMuaW5jIGIvcmVjaXBlcy9s
a3NjdHAtdG9vbHMvbGtzY3RwLXRvb2xzLmluYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwLi42Nzg1MzFlCi0tLSAvZGV2L251bGwKKysrIGIvcmVjaXBlcy9sa3NjdHAtdG9vbHMv
bGtzY3RwLXRvb2xzLmluYwpAQCAtMCwwICsxLDI5IEBACitERVNDUklQVElPTiA9ICJUaGUgTGlu
dXggS2VybmVsIFN0cmVhbSBDb250cm9sIFRyYW5zbWlzc2lvbiBQcm90b2NvbCAobGtzY3RwKSBw
cm9qZWN0IgorU0VDVElPTiA9ICJsaWJzIgorUFJJT1JJVFkgPSAib3B0aW9uYWwiCitMSUNFTlNF
ID0gIkdQTHYyIgorI0RFUEVORFNfdmlydGNsYXNzLW5hdGl2ZSA9ICJweXRob24tbmF0aXZlIgor
CitTID0gIiR7V09SS0RJUn0vJHtCUE59LSR7UFZ9IgorCitJTkNfUFIgPSAicjAiCisKK0JCQ0xB
U1NFWFRFTkQgPSAibmF0aXZlIgorCitpbmhlcml0IGF1dG90b29scyBwa2djb25maWcgYmluY29u
ZmlnCisKK2V4cG9ydCBMREZMQUdTICs9ICItbGRsIgorCitkb19pbnN0YWxsX2FwcGVuZF92aXJ0
Y2xhc3MtbmF0aXZlKCkgeworCToKK30KKworREVCSUFOTkFNRV8ke1BOfSA9ICJsa3NjdHAiCisK
K1BBQ0tBR0VTID0rICIke1BOfS10b29scyIKK0ZJTEVTXyR7UE59ID0gIiR7bGliZXhlY2Rpcn0v
KiAke2xpYmRpcn0vbGliKiR7U09MSUJTfSBcCisgICAgICAgICAgICAke3N5c2NvbmZkaXJ9ICR7
c2hhcmVkc3RhdGVkaXJ9ICR7bG9jYWxzdGF0ZWRpcn0gXAorICAgICAgICAgICAgJHtiYXNlX2xp
YmRpcn0vKiR7U09MSUJTfSIKKworRklMRVNfJHtQTn0tZGV2ICs9ICIke2JpbmRpcn0vKi1jb25m
aWciCitGSUxFU18ke1BOfS11dGlscyA9ICIiCmRpZmYgLS1naXQgYS9yZWNpcGVzL2xrc2N0cC10
b29scy9sa3NjdHAtdG9vbHNfMS4wLjcuYmIgYi9yZWNpcGVzL2xrc2N0cC10b29scy9sa3NjdHAt
dG9vbHNfMS4wLjcuYmIKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uMzRjMmNl
NQotLS0gL2Rldi9udWxsCisrKyBiL3JlY2lwZXMvbGtzY3RwLXRvb2xzL2xrc2N0cC10b29sc18x
LjAuNy5iYgpAQCAtMCwwICsxLDExIEBACityZXF1aXJlIGxrc2N0cC10b29scy5pbmMKK1BSID0g
IiR7SU5DX1BSfS4wIgorCitTUkNfVVJJID0gIiR7U09VUkNFRk9SR0VfTUlSUk9SfS9sa3NjdHAv
bGtzY3RwLXRvb2xzLSR7UFZ9LnRhci5neiIKKworUEFSQUxMRUxfTUFLRSA9ICIiCitDQ0FDSEUg
PSAiIgorCisKK1NSQ19VUklbbWQ1c3VtXSA9ICIwNDc1NjJiNDA1MzdlYjNiZTVkNWVjM2FlMGEy
MTk4YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlOTIwZTg5ZDExMGNmZjk4NDdmMWQ4NmExZDdh
MjNhMTU2YThhYmNjOWU2NWEzNTY1NWQ2ODdmZDA4Mzc3NTk1IgotLSAKMS43LjAuNAoK

--000e0cd137b617466f0486addf5b--
