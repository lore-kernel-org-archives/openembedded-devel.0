Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1ODUng-0000Tn-Q1
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 May 2010 05:46:03 +0200
Received: by pva18 with SMTP id 18so46914pva.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 May 2010 20:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=BpL2QJbmKqIZk8qXmzGi8zeHGk2bYcfmVB+W45XZlFo=;
	b=XIkgg2bUKMmbfDXLskmlZZmisAakZUi/uuRD5LxJNobgXMToxkldl43+yJ7xC4LgRA
	DnaBY/mY1uMgoVMyKUE4n7blWsbp+ZuhT8CxSZxSeSd9+6DYRLnlvexEcLsbr8ghIPYN
	pQI/S/cXjtnhsNm5ufW7SILTcX37xHuCtJUUs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=JHCVRP0m+fv3CHzxNKO7c5wzz+BgxJ6E+Feeo4KKPHkJXyOLgEl1o4+h4FwgkSRGkH
	dyqIXARpYo3kQgPsAju3Ovw25ZOkLrB54HFw24IDGZ1M6qTO76ba/wEO7NU563HYlDkQ
	Sdj23Mu5RwR77YgIQBBloVjKXNqlAAX1TNrho=
MIME-Version: 1.0
Received: by 10.141.106.21 with SMTP id i21mr2290316rvm.40.1273981314893; Sat, 
	15 May 2010 20:41:54 -0700 (PDT)
Received: by 10.141.51.17 with HTTP; Sat, 15 May 2010 20:41:54 -0700 (PDT)
Date: Sun, 16 May 2010 00:41:54 -0300
Message-ID: <AANLkTikfszFRLw6Ct-aEAUcu1xs8hRLdQRROW8OswCb7@mail.gmail.com>
From: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Add cgreen. Library to do unit test for C language
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
X-List-Received-Date: Sun, 16 May 2010 03:46:03 -0000
X-Groupsio-MsgNum: 19338
Content-Type: multipart/mixed; boundary=000e0cd13bc8b987450486ade39d

--000e0cd13bc8b987450486ade39d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

---
 recipes/cgreen/cgreen.inc    |   15 +++++++++++++++
 recipes/cgreen/cgreen_svn.bb |   21 +++++++++++++++++++++
 2 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 recipes/cgreen/cgreen.inc
 create mode 100644 recipes/cgreen/cgreen_svn.bb

diff --git a/recipes/cgreen/cgreen.inc b/recipes/cgreen/cgreen.inc
new file mode 100644
index 0000000..9c71db5
--- /dev/null
+++ b/recipes/cgreen/cgreen.inc
@@ -0,0 +1,15 @@
+DESCRIPTION =3D "Cgreen is a unit test framework for C language"
+SECTION =3D "libs"
+PRIORITY =3D "optional"
+LICENSE =3D "GPLv2"
+
+S =3D "${WORKDIR}/${BPN}-${PV}"
+
+INC_PR =3D "r0"
+
+BBCLASSEXTEND =3D "native sdk"
+
+inherit cmake
+
+#FILES_${PN}-dev +=3D "${bindir}/*-config"
+#FILES_${PN}-utils =3D ""
diff --git a/recipes/cgreen/cgreen_svn.bb b/recipes/cgreen/cgreen_svn.bb
new file mode 100644
index 0000000..88dad6d
--- /dev/null
+++ b/recipes/cgreen/cgreen_svn.bb
@@ -0,0 +1,21 @@
+require cgreen.inc
+
+SRCREV =3D "334"
+PR =3D "${INC_PR}.0"
+
+S =3D "${WORKDIR}/cgreen"
+
+SRC_URI =3D "svn://cgreen.svn.sourceforge.net/svnroot/cgreen/trunk;module=
=3Dcgreen;proto=3Dhttps"
+
+EXTRA_OECONF =3D ""
+EXTRA_OEMAKE =3D "INSTALL_PREFIX=3D${D}"
+
+EXTRA_OECMAKE =3D ""
+
+OECMAKE_SOURCEPATH =3D "../cgreen"
+
+PARALLEL_MAKE =3D ""
+CCACHE =3D ""
+
+
+
--=20
1.7.0.4


--=20
-----------------------------------------------------------
Jo=C3=A3o Henrique Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil
BSD051283
LPI 1
http://www.joaohfreitas.eti.br

--000e0cd13bc8b987450486ade39d
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0005-Add-cgreen.-Library-to-do-unit-test-for-C-language.patch"
Content-Disposition: attachment; 
	filename="0005-Add-cgreen.-Library-to-do-unit-test-for-C-language.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g99bjvlp0

RnJvbSBjYzNhYTI2ZGViNjI3NzQ0MzRhZTAwMzdkYzliZWM5MjM3ZjQxNmQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKb2FvIEguIEZyZWl0YXMgPGpvYW9oZkBnbWFpbC5jb20+CkRh
dGU6IFNhdCwgMTUgTWF5IDIwMTAgMTU6NDE6MjYgLTAzMDAKU3ViamVjdDogW1BBVENIIDUvN10g
QWRkIGNncmVlbi4gTGlicmFyeSB0byBkbyB1bml0IHRlc3QgZm9yIEMgbGFuZ3VhZ2UKCi0tLQog
cmVjaXBlcy9jZ3JlZW4vY2dyZWVuLmluYyAgICB8ICAgMTUgKysrKysrKysrKysrKysrCiByZWNp
cGVzL2NncmVlbi9jZ3JlZW5fc3ZuLmJiIHwgICAyMSArKysrKysrKysrKysrKysrKysrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBt
b2RlIDEwMDY0NCByZWNpcGVzL2NncmVlbi9jZ3JlZW4uaW5jCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cmVjaXBlcy9jZ3JlZW4vY2dyZWVuX3N2bi5iYgoKZGlmZiAtLWdpdCBhL3JlY2lwZXMvY2dyZWVu
L2NncmVlbi5pbmMgYi9yZWNpcGVzL2NncmVlbi9jZ3JlZW4uaW5jCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAuLjljNzFkYjUKLS0tIC9kZXYvbnVsbAorKysgYi9yZWNpcGVzL2Nn
cmVlbi9jZ3JlZW4uaW5jCkBAIC0wLDAgKzEsMTUgQEAKK0RFU0NSSVBUSU9OID0gIkNncmVlbiBp
cyBhIHVuaXQgdGVzdCBmcmFtZXdvcmsgZm9yIEMgbGFuZ3VhZ2UiCitTRUNUSU9OID0gImxpYnMi
CitQUklPUklUWSA9ICJvcHRpb25hbCIKK0xJQ0VOU0UgPSAiR1BMdjIiCisKK1MgPSAiJHtXT1JL
RElSfS8ke0JQTn0tJHtQVn0iCisKK0lOQ19QUiA9ICJyMCIKKworQkJDTEFTU0VYVEVORCA9ICJu
YXRpdmUgc2RrIgorCitpbmhlcml0IGNtYWtlCisKKyNGSUxFU18ke1BOfS1kZXYgKz0gIiR7Ymlu
ZGlyfS8qLWNvbmZpZyIKKyNGSUxFU18ke1BOfS11dGlscyA9ICIiCmRpZmYgLS1naXQgYS9yZWNp
cGVzL2NncmVlbi9jZ3JlZW5fc3ZuLmJiIGIvcmVjaXBlcy9jZ3JlZW4vY2dyZWVuX3N2bi5iYgpu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi44OGRhZDZkCi0tLSAvZGV2L251bGwK
KysrIGIvcmVjaXBlcy9jZ3JlZW4vY2dyZWVuX3N2bi5iYgpAQCAtMCwwICsxLDIxIEBACityZXF1
aXJlIGNncmVlbi5pbmMKKworU1JDUkVWID0gIjMzNCIKK1BSID0gIiR7SU5DX1BSfS4wIgorCitT
ID0gIiR7V09SS0RJUn0vY2dyZWVuIgorCitTUkNfVVJJID0gInN2bjovL2NncmVlbi5zdm4uc291
cmNlZm9yZ2UubmV0L3N2bnJvb3QvY2dyZWVuL3RydW5rO21vZHVsZT1jZ3JlZW47cHJvdG89aHR0
cHMiCisKK0VYVFJBX09FQ09ORiA9ICIiCitFWFRSQV9PRU1BS0UgPSAiSU5TVEFMTF9QUkVGSVg9
JHtEfSIKKworRVhUUkFfT0VDTUFLRSA9ICIiCisKK09FQ01BS0VfU09VUkNFUEFUSCA9ICIuLi9j
Z3JlZW4iCisKK1BBUkFMTEVMX01BS0UgPSAiIgorQ0NBQ0hFID0gIiIKKworCisKLS0gCjEuNy4w
LjQKCg==

--000e0cd13bc8b987450486ade39d--
