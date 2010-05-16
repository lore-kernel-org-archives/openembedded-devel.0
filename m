Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1ODl5q-0008Fa-Gk
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 May 2010 23:09:54 +0200
Received: by pwj5 with SMTP id 5so2019922pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 May 2010 14:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=7aFGm99gKuXgSUl1QYyCF8ooCMczaAH/5sRWMn6EwLs=;
	b=R+GiZ+1aLOmxzPBe24RRlQaEdi6gewhNU1S82B/Tq2J0/TUZhe96B90qMO8F+cCE39
	c0OpPlGoUCXp/nDy4adB+SfV00mjuDKx+5FY/jTXTd0AoKbMXXjAMqvkFdo3dBts9tT3
	6GrY7x/5iqyiJimQZwzokKDdMp9VZ9/8V78GI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ImRn5tpM6Zb8Ttj3fVWIIm751PXT5gRmTQyTddYdCglCwbSnNSFvmszuwovJYx1q2Z
	ob/SRgFNgqUEXUtYp5HokwS0e/gxkCK3d3TEeb0/C9aa7OG5nyi/386BbsoMUEm8maxD
	M1KXesvCEL1dijIvXZGA2qaUcnGVVKb+lp18k=
MIME-Version: 1.0
Received: by 10.141.90.7 with SMTP id s7mr2973191rvl.38.1274043939196; Sun, 16 
	May 2010 14:05:39 -0700 (PDT)
Received: by 10.141.51.17 with HTTP; Sun, 16 May 2010 14:05:39 -0700 (PDT)
In-Reply-To: <hso7fa$2lh$2@dough.gmane.org>
References: <AANLkTikfszFRLw6Ct-aEAUcu1xs8hRLdQRROW8OswCb7@mail.gmail.com>
	<hso7fa$2lh$2@dough.gmane.org>
Date: Sun, 16 May 2010 18:05:39 -0300
Message-ID: <AANLkTilux_HTutdHJZKh7hipzViaahkx7OtLOI6RFaVj@mail.gmail.com>
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
Subject: Re: [PATCH] Add cgreen. Library to do unit test for C language
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
X-List-Received-Date: Sun, 16 May 2010 21:09:55 -0000
X-Groupsio-MsgNum: 19356
Content-Type: multipart/mixed; boundary=000e0cd111a26c909d0486bc784a

--000e0cd111a26c909d0486bc784a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Nothing special. This was a mistake.

---
 recipes/cgreen/cgreen.inc    |    2 --
 recipes/cgreen/cgreen_svn.bb |    6 ------
 2 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/recipes/cgreen/cgreen.inc b/recipes/cgreen/cgreen.inc
index 9c71db5..eb3307e 100644
--- a/recipes/cgreen/cgreen.inc
+++ b/recipes/cgreen/cgreen.inc
@@ -11,5 +11,3 @@ BBCLASSEXTEND =3D "native sdk"

 inherit cmake

-#FILES_${PN}-dev +=3D "${bindir}/*-config"
-#FILES_${PN}-utils =3D ""
diff --git a/recipes/cgreen/cgreen_svn.bb b/recipes/cgreen/cgreen_svn.bb
index 88dad6d..65f2f34 100644
--- a/recipes/cgreen/cgreen_svn.bb
+++ b/recipes/cgreen/cgreen_svn.bb
@@ -13,9 +13,3 @@ EXTRA_OEMAKE =3D "INSTALL_PREFIX=3D${D}"
 EXTRA_OECMAKE =3D ""

 OECMAKE_SOURCEPATH =3D "../cgreen"
-
-PARALLEL_MAKE =3D ""
-CCACHE =3D ""
-
-
-
--=20
1.7.0.4


--=20
-----------------------------------------------------------
Jo=C3=A3o Henrique Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil
BSD051283
LPI 1
http://www.joaohfreitas.eti.br

--000e0cd111a26c909d0486bc784a
Content-Type: text/x-diff; charset=US-ASCII; name="0008-Remove-mistake-configs.patch"
Content-Disposition: attachment; 
	filename="0008-Remove-mistake-configs.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g9acsmh00

RnJvbSBlYzVmODM1Zjc4YmQ0Y2ZlZTdkYTMyMDJjZTA3NWIyYzZkYjNmNWMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKb2FvIEguIEZyZWl0YXMgPGpvYW9oZkBnbWFpbC5jb20+CkRh
dGU6IFN1biwgMTYgTWF5IDIwMTAgMTg6MDA6MzQgLTAzMDAKU3ViamVjdDogW1BBVENIIHYyIDgv
OV0gUmVtb3ZlIG1pc3Rha2UgY29uZmlncwoKLS0tCiByZWNpcGVzL2NncmVlbi9jZ3JlZW4uaW5j
ICAgIHwgICAgMiAtLQogcmVjaXBlcy9jZ3JlZW4vY2dyZWVuX3N2bi5iYiB8ICAgIDYgLS0tLS0t
CiAyIGZpbGVzIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9yZWNpcGVzL2NncmVlbi9jZ3JlZW4uaW5jIGIvcmVjaXBlcy9jZ3JlZW4vY2dyZWVu
LmluYwppbmRleCA5YzcxZGI1Li5lYjMzMDdlIDEwMDY0NAotLS0gYS9yZWNpcGVzL2NncmVlbi9j
Z3JlZW4uaW5jCisrKyBiL3JlY2lwZXMvY2dyZWVuL2NncmVlbi5pbmMKQEAgLTExLDUgKzExLDMg
QEAgQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgc2RrIgogCiBpbmhlcml0IGNtYWtlCiAKLSNGSUxF
U18ke1BOfS1kZXYgKz0gIiR7YmluZGlyfS8qLWNvbmZpZyIKLSNGSUxFU18ke1BOfS11dGlscyA9
ICIiCmRpZmYgLS1naXQgYS9yZWNpcGVzL2NncmVlbi9jZ3JlZW5fc3ZuLmJiIGIvcmVjaXBlcy9j
Z3JlZW4vY2dyZWVuX3N2bi5iYgppbmRleCA4OGRhZDZkLi42NWYyZjM0IDEwMDY0NAotLS0gYS9y
ZWNpcGVzL2NncmVlbi9jZ3JlZW5fc3ZuLmJiCisrKyBiL3JlY2lwZXMvY2dyZWVuL2NncmVlbl9z
dm4uYmIKQEAgLTEzLDkgKzEzLDMgQEAgRVhUUkFfT0VNQUtFID0gIklOU1RBTExfUFJFRklYPSR7
RH0iCiBFWFRSQV9PRUNNQUtFID0gIiIKIAogT0VDTUFLRV9TT1VSQ0VQQVRIID0gIi4uL2NncmVl
biIKLQotUEFSQUxMRUxfTUFLRSA9ICIiCi1DQ0FDSEUgPSAiIgotCi0KLQotLSAKMS43LjAuNAoK

--000e0cd111a26c909d0486bc784a--
