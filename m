Received: from [209.85.211.178] (helo=mail-yw0-f178.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vishnudas@gmail.com>) id 1MU1iy-0002x9-9z
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jul 2009 19:04:56 +0200
Received: by ywh8 with SMTP id 8so69013ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2009 09:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=VflXTCLKgbMCnpXwu3SEfTqmVEJfOsDLrJccjrgMuxk=;
	b=GlfUqvDBtHuWFJf1Jg8D2CLNfz1yGzM1hKS+MiaIzx2KPqCyJz/hsAryCZIOnZfzfY
	IS7T8fbqDKTt1VfJjd7blDjy+KKdPAnrcgRqmUYrrdRdkKXJbaOQgAMPpFIKetvXFDBX
	fzon3tf+24vdPRXSIjJtpmh/fIaYNKTvBGA8g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=CN3hYP1EB+BiiBsft/X7FSeFeAPLr102yZCmmNykaCo0HUFHK3lPy949w7vgr7SynN
	9qnBv7E2kR2YMW3SFEhmuur4wvNIL/ZKbItJPwSrelX30hmtvX8KVdeLRJVW7Wu4SOqs
	8ShxP4JQIzhdFSpMVbHCW12xRVg2LPvUYcsRI=
MIME-Version: 1.0
Received: by 10.100.250.16 with SMTP id x16mr3167083anh.25.1248367837912; Thu, 
	23 Jul 2009 09:50:37 -0700 (PDT)
Date: Thu, 23 Jul 2009 09:50:37 -0700
Message-ID: <d405a6580907230950r63577d33u3175579e170ab105@mail.gmail.com>
From: Vishnudas P <vishnudas@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] [stable/2009] fix for gstreamer-ti looking at current directory for codec combos
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
X-List-Received-Date: Thu, 23 Jul 2009 17:04:56 -0000
X-Groupsio-MsgNum: 12057
Content-Type: multipart/mixed; boundary=0016369fa259871f0b046f624942

--0016369fa259871f0b046f624942
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi

This patch runs againt Stable/2009 and fixes gstreamer-ti so that
applications can run anywhere instead of being restricted to
/usr/share/ti-codec-combos.

The changes are
  - Added patch to gstreamer-ti_svn.bb for configuring combo server path.
  - Reverted patch http://patchwork.openembedded.org/patch/263/

Regards
Vishnudas

--0016369fa259871f0b046f624942
Content-Type: application/octet-stream; 
	name="gst-ti-codec-path-fix-stable2009.patch"
Content-Disposition: attachment; 
	filename="gst-ti-codec-path-fix-stable2009.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fxgpwqop0

ZGlmZiAtLWdpdCBhL3JlY2lwZXMvZHNwbGluay9nc3RyZWFtZXItdGlfc3ZuLmJiIGIvcmVjaXBl
cy9kc3BsaW5rL2dzdHJlYW1lci10aV9zdm4uYmIKaW5kZXggYWI3MDVmMy4uZDg3ZmFiOCAxMDA2
NDQKLS0tIGEvcmVjaXBlcy9kc3BsaW5rL2dzdHJlYW1lci10aV9zdm4uYmIKKysrIGIvcmVjaXBl
cy9kc3BsaW5rL2dzdHJlYW1lci10aV9zdm4uYmIKQEAgLTEsMTAgKzEsMTEgQEAKIERFUEVORFMg
PSAidGktY29kZWMtZW5naW5lIHRpLWRtYWkgZ3N0cmVhbWVyIGdzdC1wbHVnaW5zLWJhc2UgZ3N0
LXBsdWdpbnMtZ29vZCBnc3QtcGx1Z2lucy11Z2x5IGxpYmlkM3RhZyBsaWJvaWwgbGlibWFkIgog
CiBTUkNfVVJJID0gInN2bjovL2dmb3JnZS50aS5jb20vc3ZuL2dzdHJlYW1lcl90aS90cnVuaztt
b2R1bGU9Z3N0cmVhbWVyX3RpO3Byb3RvPWh0dHBzO3VzZXI9YW5vbnltb3VzO3Bzd2Q9JycgXAor
ICAgICAgICAgICBmaWxlOi8vY29kZWMtY29tYm8tcGF0aC1maXgucGF0Y2g7cGF0Y2g9MSBcIAog
ICAgICAgICAgICIKIFNSQ1JFViA9ICIxNjAiCiAKLVBSID0gInI3IgorUFIgPSAicjgiCiAKICMg
QWdhaW4sIG5vICcuJyBpbiBQV0QgYWxsb3dlZCA6KAogUFYgPSAiMCtzdm5yJHtTUkNSRVZ9IgpA
QCAtMzIsMTQgKzMzLDYgQEAgZXhwb3J0IFhEQ19QTEFURk9STQogI0dDQXJtdjVULmNjLm9wdHMg
PSAiU0VETUVfQ0NBUkNIIjsKICNHQ0FybXY1VC5jYy4kc2VhbCgib3B0cyIpOwogCi1kb19jb25m
aWd1cmVfcHJlcGVuZCgpIHsKLQlmb3IgaSBpbiAke1N9L3NyYy8qLmNmZyA7IGRvCi0JCXNlZCAt
aSAtZSBzOlwuL2VuY29kZUNvbWJvLng2NFA6JHtkYXRhZGlyfS90aS1jb2RlYy1jb21ib3MvZW5j
b2RlQ29tYm8ueDY0UDpnIFwKLQkgICAgICAgICAgIC1lIHM6XC4vZGVjb2RlQ29tYm8ueDY0UDok
e2RhdGFkaXJ9L3RpLWNvZGVjLWNvbWJvcy9kZWNvZGVDb21iby54NjRQOmcgXAotCSAgICAgICAg
ICAgJGkKLQlkb25lCi19Ci0KIGRvX2NvbXBpbGVfcHJlcGVuZCgpIHsKIAlmb3IgaSBpbiAkKGZp
bmQgJHtTfSAtbmFtZSAiY29uZmlnLmJsZCIpIDsgZG8KIAkJICAgIHNlZCAtaSAtZSBzOlNFRE1F
X0NDQVJDSDonJHtUQVJHRVRfQ0NBUkNIfSc6ICRpCmRpZmYgLS1naXQgYS9yZWNpcGVzL2RzcGxp
bmsvdGktY29kZWMtY29tYm9zXzMuMTYuYmIgYi9yZWNpcGVzL2RzcGxpbmsvdGktY29kZWMtY29t
Ym9zXzMuMTYuYmIKaW5kZXggNmJhYjM1YS4uYzcwZjgzZSAxMDA2NDQKLS0tIGEvcmVjaXBlcy9k
c3BsaW5rL3RpLWNvZGVjLWNvbWJvc18zLjE2LmJiCisrKyBiL3JlY2lwZXMvZHNwbGluay90aS1j
b2RlYy1jb21ib3NfMy4xNi5iYgpAQCAtMTMsNyArMTMsNyBAQCBTID0gIiR7V09SS0RJUn0vb21h
cDM1MzBfZHZzZGtfY29tYm9zXzNfMTYiCiAKICMgWWVzLCB0aGUgeGRjIHN0dWZmIHN0aWxsIGJy
ZWFrcyB3aXRoIGEgJy4nIGluIFBXRAogUFYgPSAiMzE2IgotUFIgPSAicjE1IgorUFIgPSAicjE2
IgogCiBUQVJHRVQgPSAiYWxsIgogCkBAIC03NywxMCArNzcsNiBAQCBkb19pbnN0YWxsICgpIHsK
IGRvX3N0YWdlICgpIHsKIAlpbnN0YWxsIC1kICR7U1RBR0lOR19ESVJ9LyR7TVVMVElNQUNIX1RB
UkdFVF9TWVN9L3RpLWNvZGVjLWNvbWJvcwogCWNwIC1wUHJmICR7U30vKiAke1NUQUdJTkdfRElS
fS8ke01VTFRJTUFDSF9UQVJHRVRfU1lTfS90aS1jb2RlYy1jb21ib3MKLQlmb3IgY29kZWMgaW4g
ZW5jb2RlIGRlY29kZSA7IGRvCi0JCW1rZGlyIC1wICAke1NUQUdJTkdfRElSfS8ke01VTFRJTUFD
SF9UQVJHRVRfU1lTfS90aS1jb2RlYy1jb21ib3MvcGFja2FnZXMvdGkvc2RvL3NlcnZlcnMvJGNv
ZGVjL3BhY2thZ2UvaW5mby8ke2RhdGFkaXJ9L3RpLWNvZGVjLWNvbWJvcwotCQlsbiAtc2YgJHtT
VEFHSU5HX0RJUn0vJHtNVUxUSU1BQ0hfVEFSR0VUX1NZU30vdGktY29kZWMtY29tYm9zL3BhY2th
Z2VzL3RpL3Nkby9zZXJ2ZXJzLyRjb2RlYy9wYWNrYWdlL2luZm8vJGNvZGVjKiAke1NUQUdJTkdf
RElSfS8ke01VTFRJTUFDSF9UQVJHRVRfU1lTfS90aS1jb2RlYy1jb21ib3MvcGFja2FnZXMvdGkv
c2RvL3NlcnZlcnMvJGNvZGVjL3BhY2thZ2UvaW5mby8ke2RhdGFkaXJ9L3RpLWNvZGVjLWNvbWJv
cwotCWRvbmUKIH0KIAogRklMRVNfdGktY29kZWMtY29tYm9zID0gIiR7ZGF0YWRpcn0vdGktY29k
ZWMtY29tYm9zLyoiCmRpZmYgLS1naXQgYS9yZWNpcGVzL2RzcGxpbmsvZmlsZXMvY29kZWMtY29t
Ym8tcGF0aC1maXgucGF0Y2ggYi9yZWNpcGVzL2RzcGxpbmsvZmlsZXMvY29kZWMtY29tYm8tcGF0
aC1maXgucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA3NTUKaW5kZXggMDAwMDAwMC4uZWI2Mzk0YQot
LS0gL2Rldi9udWxsCisrKyBiL3JlY2lwZXMvZHNwbGluay9maWxlcy9jb2RlYy1jb21iby1wYXRo
LWZpeC5wYXRjaApAQCAtMCwwICsxLDEyIEBACitkaWZmIC1OYXVyIHRpY29kZWNwbHVnaW4ub3Jp
Zy9zcmMvZ3N0dGljb2RlY3BsdWdpbl9vbWFwMzUzMC5jZmcgdGljb2RlY3BsdWdpbi9zcmMvZ3N0
dGljb2RlY3BsdWdpbl9vbWFwMzUzMC5jZmcKKy0tLSB0aWNvZGVjcGx1Z2luLm9yaWcvc3JjL2dz
dHRpY29kZWNwbHVnaW5fb21hcDM1MzAuY2ZnCTIwMDktMDctMjEgMTI6MTM6NDMuMDAwMDAwMDAw
IC0wNzAwCisrKysgdGljb2RlY3BsdWdpbi9zcmMvZ3N0dGljb2RlY3BsdWdpbl9vbWFwMzUzMC5j
ZmcJMjAwOS0wNy0yMSAxMjoxNDoxNi4wMDAwMDAwMDAgLTA3MDAKK0BAIC0zOCw2ICszOCw4IEBA
CisgICAgICIuL2RlY29kZUNvbWJvLng2NFAiLAorICAgICAidGkuc2RvLnNlcnZlcnMuZGVjb2Rl
IgorICAgICApOworK2VuY0VuZ2luZS5zZXJ2ZXIgPSAiL3Vzci9zaGFyZS90aS1jb2RlYy1jb21i
b3MvZW5jb2RlQ29tYm8ueDY0UCI7CisrZGVjRW5naW5lLnNlcnZlciA9ICIvdXNyL3NoYXJlL3Rp
LWNvZGVjLWNvbWJvcy9kZWNvZGVDb21iby54NjRQIjsKKyAKKyAvKiBMb2FkIHN1cHBvcnQgZm9y
IHRoZSBETUFJIG1vZHVsZSAqLworIHZhciBETUFJID0geGRjLmxvYWRQYWNrYWdlKCd0aS5zZG8u
ZG1haScpOwo=

--0016369fa259871f0b046f624942--
