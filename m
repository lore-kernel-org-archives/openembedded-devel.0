Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1ODl6U-0000Cn-8f
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 May 2010 23:10:46 +0200
Received: by pwj5 with SMTP id 5so2020077pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 May 2010 14:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=U4QSjffl4RKT9S2j1kX5WfxhsmfgNjDi0hyoo6Xi0ec=;
	b=x/YX/C3SUJSRyThpcyxrzxHpvlaePOqssdlVQARWzs1g5bIlWqKEnqu45Ymxz6bg0T
	RnsVlr8TMfwbE8sytSN4rTlHGDlzFvEKe4NbdkhLOxB7TYoqIZi5q93Z0FvwhwEbYU/y
	kfpCNEXBiiEKmLtn2q8Yrkesm3MihdjNCPBFk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=EGvyo2dNTAG/KMiBYXdJT/1LT0LJTTWqC/YVUyz8HTArMlXgA6hWpeWAiFC8f0w+Nm
	XQc25dR1M+p+TVxdekqWS5uBrbX3fA6cJdHCplIHltXZfBBsuP5rQVo7MHuN5y21fbI6
	Skm4fBmYI4PAuIleWa1lPeYA/7sXXwhKY7NR8=
MIME-Version: 1.0
Received: by 10.141.100.15 with SMTP id c15mr2925845rvm.221.1274043990668; 
	Sun, 16 May 2010 14:06:30 -0700 (PDT)
Received: by 10.141.51.17 with HTTP; Sun, 16 May 2010 14:06:30 -0700 (PDT)
In-Reply-To: <hso7dv$2lh$1@dough.gmane.org>
References: <AANLkTikuptIZDURk9aJb5xqB22op3_cnR1OU7iQ0JfY0@mail.gmail.com>
	<hso7dv$2lh$1@dough.gmane.org>
Date: Sun, 16 May 2010 18:06:30 -0300
Message-ID: <AANLkTinzfd9OTFGIFxcCCdaxgXZ3lJm1OorWVxg0njNG@mail.gmail.com>
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
Subject: Re: [PATCH] Add lksctp tools
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
X-List-Received-Date: Sun, 16 May 2010 21:10:46 -0000
X-Groupsio-MsgNum: 19357
Content-Type: multipart/mixed; boundary=000e0cd1382a7df89c0486bc7b0b

--000e0cd1382a7df89c0486bc7b0b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The same thing.

---
 recipes/lksctp-tools/lksctp-tools.inc      |    3 +--
 recipes/lksctp-tools/lksctp-tools_1.0.7.bb |    4 ----
 2 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/recipes/lksctp-tools/lksctp-tools.inc
b/recipes/lksctp-tools/lksctp-tools.inc
index 678531e..02ec988 100644
--- a/recipes/lksctp-tools/lksctp-tools.inc
+++ b/recipes/lksctp-tools/lksctp-tools.inc
@@ -1,8 +1,7 @@
 DESCRIPTION =3D "The Linux Kernel Stream Control Transmission Protocol
(lksctp) project"
 SECTION =3D "libs"
 PRIORITY =3D "optional"
-LICENSE =3D "GPLv2"
-#DEPENDS_virtclass-native =3D "python-native"
+LICENSE =3D "LGPLv2"

 S =3D "${WORKDIR}/${BPN}-${PV}"

diff --git a/recipes/lksctp-tools/lksctp-tools_1.0.7.bb
b/recipes/lksctp-tools/lksctp-tools_1.0.7.bb
index 34c2ce5..1d4faa3 100644
--- a/recipes/lksctp-tools/lksctp-tools_1.0.7.bb
+++ b/recipes/lksctp-tools/lksctp-tools_1.0.7.bb
@@ -3,9 +3,5 @@ PR =3D "${INC_PR}.0"

 SRC_URI =3D "${SOURCEFORGE_MIRROR}/lksctp/lksctp-tools-${PV}.tar.gz"

-PARALLEL_MAKE =3D ""
-CCACHE =3D ""
-
-
 SRC_URI[md5sum] =3D "047562b40537eb3be5d5ec3ae0a2198b"
 SRC_URI[sha256sum] =3D
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

--000e0cd1382a7df89c0486bc7b0b
Content-Type: text/x-diff; charset=US-ASCII; name="0009-Remove-mistake-configs.patch"
Content-Disposition: attachment; 
	filename="0009-Remove-mistake-configs.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g9acw2gw0

RnJvbSAzYjQ3OTQ0MjNkMjRkYWZmNmE5YmVkYzRmMmYzNjQ4ZGMzYTIzMjA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKb2FvIEguIEZyZWl0YXMgPGpvYW9oZkBnbWFpbC5jb20+CkRh
dGU6IFN1biwgMTYgTWF5IDIwMTAgMTg6MDA6NDYgLTAzMDAKU3ViamVjdDogW1BBVENIIHYyIDkv
OV0gUmVtb3ZlIG1pc3Rha2UgY29uZmlncwoKLS0tCiByZWNpcGVzL2xrc2N0cC10b29scy9sa3Nj
dHAtdG9vbHMuaW5jICAgICAgfCAgICAzICstLQogcmVjaXBlcy9sa3NjdHAtdG9vbHMvbGtzY3Rw
LXRvb2xzXzEuMC43LmJiIHwgICAgNCAtLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9yZWNpcGVzL2xrc2N0cC10b29scy9s
a3NjdHAtdG9vbHMuaW5jIGIvcmVjaXBlcy9sa3NjdHAtdG9vbHMvbGtzY3RwLXRvb2xzLmluYwpp
bmRleCA2Nzg1MzFlLi4wMmVjOTg4IDEwMDY0NAotLS0gYS9yZWNpcGVzL2xrc2N0cC10b29scy9s
a3NjdHAtdG9vbHMuaW5jCisrKyBiL3JlY2lwZXMvbGtzY3RwLXRvb2xzL2xrc2N0cC10b29scy5p
bmMKQEAgLTEsOCArMSw3IEBACiBERVNDUklQVElPTiA9ICJUaGUgTGludXggS2VybmVsIFN0cmVh
bSBDb250cm9sIFRyYW5zbWlzc2lvbiBQcm90b2NvbCAobGtzY3RwKSBwcm9qZWN0IgogU0VDVElP
TiA9ICJsaWJzIgogUFJJT1JJVFkgPSAib3B0aW9uYWwiCi1MSUNFTlNFID0gIkdQTHYyIgotI0RF
UEVORFNfdmlydGNsYXNzLW5hdGl2ZSA9ICJweXRob24tbmF0aXZlIgorTElDRU5TRSA9ICJMR1BM
djIiCiAKIFMgPSAiJHtXT1JLRElSfS8ke0JQTn0tJHtQVn0iCiAKZGlmZiAtLWdpdCBhL3JlY2lw
ZXMvbGtzY3RwLXRvb2xzL2xrc2N0cC10b29sc18xLjAuNy5iYiBiL3JlY2lwZXMvbGtzY3RwLXRv
b2xzL2xrc2N0cC10b29sc18xLjAuNy5iYgppbmRleCAzNGMyY2U1Li4xZDRmYWEzIDEwMDY0NAot
LS0gYS9yZWNpcGVzL2xrc2N0cC10b29scy9sa3NjdHAtdG9vbHNfMS4wLjcuYmIKKysrIGIvcmVj
aXBlcy9sa3NjdHAtdG9vbHMvbGtzY3RwLXRvb2xzXzEuMC43LmJiCkBAIC0zLDkgKzMsNSBAQCBQ
UiA9ICIke0lOQ19QUn0uMCIKIAogU1JDX1VSSSA9ICIke1NPVVJDRUZPUkdFX01JUlJPUn0vbGtz
Y3RwL2xrc2N0cC10b29scy0ke1BWfS50YXIuZ3oiCiAKLVBBUkFMTEVMX01BS0UgPSAiIgotQ0NB
Q0hFID0gIiIKLQotCiBTUkNfVVJJW21kNXN1bV0gPSAiMDQ3NTYyYjQwNTM3ZWIzYmU1ZDVlYzNh
ZTBhMjE5OGIiCiBTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTkyMGU4OWQxMTBjZmY5ODQ3ZjFkODZh
MWQ3YTIzYTE1NmE4YWJjYzllNjVhMzU2NTVkNjg3ZmQwODM3NzU5NSIKLS0gCjEuNy4wLjQKCg==

--000e0cd1382a7df89c0486bc7b0b--
