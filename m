Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vadmium@gmail.com>) id 1PSlwC-0001Pz-31
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 08:38:12 +0100
Received: by wyb40 with SMTP id 40so1241405wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Dec 2010 23:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=A6dZsGxo/H4xyDyrPVBm4KI7OKjq8dDNxPfGJkrsqAg=;
	b=OIell3ucnYkg1Ce8UUZDsD4sRkakEXOSY4IpkTzLQvTYLtdVlMhDMGZd+7T2aTbBou
	6WjbGeDw7/M52vBtC/Pw8VkBaop5gdmRxRc6f+ht72Ll6Q1MGMtmyXe9BkQtIr2Kmx02
	stnNBs8J2NcP7Eufv1sat+/GruLkf+d/KNw/w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=IxcFAKwQ5u28IemZyZVPrlUWypSXq7YrUjhqXFmW37Fo/TDNxb2cetQe00oLYv3xZ1
	dDgBUak45+1quQRrYNBp/2iQnWDcSzWiXftM8n1HGHubLAk3jsYrtb+pCy01+aa5/KPH
	Mndx5BT75B54W1mofFkbIb+iL7wBmsf3/evmY=
MIME-Version: 1.0
Received: by 10.216.23.18 with SMTP id u18mr341931weu.92.1292398594431; Tue,
	14 Dec 2010 23:36:34 -0800 (PST)
Sender: vadmium@gmail.com
Received: by 10.216.17.203 with HTTP; Tue, 14 Dec 2010 23:36:34 -0800 (PST)
Date: Wed, 15 Dec 2010 07:36:34 +0000
X-Google-Sender-Auth: NuFxXbAOUyWQYzre3ZmMM35XJ-A
Message-ID: <AANLkTimMz5m27fxSGVw-YyOAH2=Wbye2Ug71mZ9t+py1@mail.gmail.com>
From: Martin Panter <vadmium+floss@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: vadmium@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Stop Libtool relinking against host's /usr/lib (file format not recognised)
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
X-List-Received-Date: Wed, 15 Dec 2010 07:38:12 -0000
X-Groupsio-MsgNum: 27168
Content-Type: multipart/mixed; boundary=0016364c7e8b21240204976dff0a

--0016364c7e8b21240204976dff0a
Content-Type: text/plain; charset=UTF-8

So far in my attempt to build Angstrom for my Beagle board I've found
two instances where Libtool is trying to "relink" against host
libraries.

The first looks like it's already been fixed in the past with a patch
to Libtool (recipes/libtool/libtool-2.2.6b/cross_compile.patch), but
at least for me that fix is being bypassed. The patch changes the
ltmain.m4sh source file but in the Libtool tarball there is already an
ltmain.sh generated file which seems to be used instead.

It looks like running Libtool's "bootstrap" script regenerates
libtool.sh, and I've changed my code to do this according to the
attached "libtool-bootstrap.diff.txt".

The second instance is with SDL which seems to provide its own Libtool
script. It looks like Git commit
a23202736001afe7f520ef64e2431d9f994130b8 (2010-11-14) removed a patch
that previously fixed my problem, so I restored the relevant bit
according to the attached "sdl-libtool-host-dir.diff.txt".

The original problem that led me to this was that it was failing at a
Free type "install" step. (And then later for the SDL install step.)
For reference, the Free type messages were something like this,
paraphrased to remove the ridiculously long path names:

NOTE: make LIBTOOL=arm-angstrom-linux-gnueabi-libtool DESTDIR=${IMAGE} install
. . .
arm-angstrom-linux-gnueabi-libtool --mode=install
${SYS}/usr/bin/install -c ${OBJS}/libfreetype.la ${IMAGE}/usr/lib
arm-angstrom-linux-gnueabi-libtool: install: warning: relinking
`${OBJS}/libfreetype.la'
arm-angstrom-linux-gnueabi-libtool: relink:
arm-angstrom-linux-gnueabi-gcc . . . -L${SYS}/usr/lib
-L${IMAGE}/usr/lib -L/usr/lib -lz . . .
/usr/lib/libgcc_s.so: file not recognized: File format not recognized

It turned out that on my host computer (Arch linux x68_64) I indeed
have this /usr/lib/libgcc_s.so file. I temporarily moved it out of the
way and the relink and install worked fine. The linker seemed to be
trying to use that file because of the -L/usr/lib option passed to it,
and one of the changes in cross_compile.patch removes that -L/usr/lib
option.

-Martin

--0016364c7e8b21240204976dff0a
Content-Type: text/plain; charset=UTF-8; name="libtool-bootstrap.diff.txt"
Content-Disposition: attachment; filename="libtool-bootstrap.diff.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gh5rnhaz0

RnJvbSBiOTMwMGJjOTUwYjBkYjUzNDY3Nzg4NTQyZmU0MWIxOTRhZmNjNWJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJ0aW4gUGFudGVyIDx2YWRtaXVtIMOgIGdtYWlsLmNvbT4K
RGF0ZTogV2VkLCAxIERlYyAyMDEwIDAzOjUxOjUxICswMDAwClN1YmplY3Q6IFtQQVRDSF0gUnVu
IGxpYnRvb2wncyBib290c3RyYXAgdG8gcmVnZW5lcmF0ZSBsdG1haW4uc2ggZnJvbSB0aGUgcGF0
Y2hlZCBsdG1haW4ubTRzaAoKLS0tCiByZWNpcGVzL2xpYnRvb2wvbGlidG9vbF8yLjIuNmIuYmIg
fCAgICA0ICsrKysKIDEgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3JlY2lwZXMvbGlidG9vbC9saWJ0b29sXzIuMi42Yi5iYiBiL3Jl
Y2lwZXMvbGlidG9vbC9saWJ0b29sXzIuMi42Yi5iYgppbmRleCBhMTljYWFjLi42YWZlOTJhIDEw
MDY0NAotLS0gYS9yZWNpcGVzL2xpYnRvb2wvbGlidG9vbF8yLjIuNmIuYmIKKysrIGIvcmVjaXBl
cy9saWJ0b29sL2xpYnRvb2xfMi4yLjZiLmJiCkBAIC0xMyw2ICsxMywxMCBAQCBGSUxFU19saWJs
dGRsID0gIiR7bGliZGlyfS9saWJsdGRsLnNvLioiCiBGSUxFU19saWJsdGRsLWRldiA9ICIke2xp
YmRpcn0vbGlibHRkbC4qICR7aW5jbHVkZWRpcn0vbHRkbC5oIgogRklMRVNfbGlibHRkbC1kYmcg
PSAiJHtsaWJkaXJ9Ly5kZWJ1Zy8iCiAKK2RvX2NvbmZpZ3VyZV9wcmVwZW5kICgpIHsKKyAgICAg
ICAuL2Jvb3RzdHJhcAorfQorCiBkb19zdGFnZSAoKSB7CiAgICAgICAgaW5zdGFsbCAtZCAke1NU
QUdJTkdfSU5DRElSfS9saWJsdGRsCiAgICAgICAgaW5zdGFsbCAtbSAwNjQ0IGxpYmx0ZGwvbHRk
bC5oICR7U1RBR0lOR19JTkNESVJ9LwotLSAKMS43LjEKCg==

--0016364c7e8b21240204976dff0a
Content-Type: text/plain; charset=UTF-8; name="sdl-libtool-host-dir.diff.txt"
Content-Disposition: attachment; filename="sdl-libtool-host-dir.diff.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: file0

RnJvbSA3MzYzZjM3YjEwZWM4M2QyMmMwNmVlYWJkZjdjZmE4YmYxYWViOWM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJ0aW4gUGFudGVyIDx2YWRtaXVtIMOgIGdtYWlsLmNvbT4K
RGF0ZTogVGh1LCAyIERlYyAyMDEwIDAzOjQ0OjIwICswMDAwClN1YmplY3Q6IFtQQVRDSF0gUmVz
dG9yZSBsaWJ0b29sIHBhdGNoIHNvIHRoYXQgTGlidG9vbCBkb2Vzbid0ICJyZWxpbmsiIGFnYWlu
c3QgaG9zdCBsaWJyYXJpZXMKCi0tLQogcmVjaXBlcy9saWJzZGwvZmlsZXMvbGlidG9vbC1ob3N0
LWRpci5wYXRjaCB8ICAgMTYgKysrKysrKysrKysrKysrKwogcmVjaXBlcy9saWJzZGwvbGlic2Rs
LXgxMV8xLjIuMTQuYmIgICAgICAgICB8ICAgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNl
cnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMvbGli
c2RsL2ZpbGVzL2xpYnRvb2wtaG9zdC1kaXIucGF0Y2gKCmRpZmYgLS1naXQgYS9yZWNpcGVzL2xp
YnNkbC9maWxlcy9saWJ0b29sLWhvc3QtZGlyLnBhdGNoIGIvcmVjaXBlcy9saWJzZGwvZmlsZXMv
bGlidG9vbC1ob3N0LWRpci5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
Li5iM2Y0NDNmCi0tLSAvZGV2L251bGwKKysrIGIvcmVjaXBlcy9saWJzZGwvZmlsZXMvbGlidG9v
bC1ob3N0LWRpci5wYXRjaApAQCAtMCwwICsxLDE2IEBACitTdG9wIExpYnRvb2wgZnJvbSB0cnlp
bmcgdG8gcmVsaW5rIGFnYWluc3QgaG9zdCBsaWJyYXJpZXMgZHVyaW5nIGluc3RhbGwKK29wZXJh
dGlvbnMgYnkgdXNpbmcgdGhlIC1ML3Vzci9saWIgb3B0aW9uLiBTYW1lIGFzIHBhcnQgb2YgTGli
dG9vbCByZWNpcGUncworbGlidG9vbC0yLjIuNmIvY3Jvc3NfY29tcGlsZS5wYXRjaC4KK0luZGV4
OiBTREwtMS4yLjE0L2J1aWxkLXNjcmlwdHMvbHRtYWluLnNoCis9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CistLS0gU0RM
LTEuMi4xNC5vcmlnL2J1aWxkLXNjcmlwdHMvbHRtYWluLnNoCisrKysgU0RMLTEuMi4xNC9idWls
ZC1zY3JpcHRzL2x0bWFpbi5zaAorQEAgLTU3ODUsOCArNTc5MCw2IEBAIGZ1bmNfbW9kZV9saW5r
ICgpCisgCQlhZGQ9IiRsaWJkaXIvJGxpbmtsaWIiCisgCSAgICAgIGZpCisgCSAgICBlbHNlCist
CSAgICAgICMgV2UgY2Fubm90IHNlZW0gdG8gaGFyZGNvZGUgaXQsIGd1ZXNzIHdlJ2xsIGZha2Ug
aXQuCistCSAgICAgIGFkZF9kaXI9Ii1MJGxpYmRpciIKKyAJICAgICAgIyBUcnkgbG9va2luZyBm
aXJzdCBpbiB0aGUgbG9jYXRpb24gd2UncmUgYmVpbmcgaW5zdGFsbGVkIHRvLgorIAkgICAgICBp
ZiB0ZXN0IC1uICIkaW5zdF9wcmVmaXhfZGlyIjsgdGhlbgorIAkJY2FzZSAkbGliZGlyIGluCmRp
ZmYgLS1naXQgYS9yZWNpcGVzL2xpYnNkbC9saWJzZGwteDExXzEuMi4xNC5iYiBiL3JlY2lwZXMv
bGlic2RsL2xpYnNkbC14MTFfMS4yLjE0LmJiCmluZGV4IDU0MTdiYTMuLjQ2MmVhNjcgMTAwNjQ0
Ci0tLSBhL3JlY2lwZXMvbGlic2RsL2xpYnNkbC14MTFfMS4yLjE0LmJiCisrKyBiL3JlY2lwZXMv
bGlic2RsL2xpYnNkbC14MTFfMS4yLjE0LmJiCkBAIC0xNCw2ICsxNCw3IEBAIFNSQ19VUkkgPSAi
IFwKICAgaHR0cDovL3d3dy5saWJzZGwub3JnL3JlbGVhc2UvU0RMLSR7UFZ9LnRhci5neiBcCiAg
IGZpbGU6Ly9zZGxfYnVnXzg5NF9maXgucGF0Y2ggXAogICBmaWxlOi8vc2RsLm00IFwKKyAgZmls
ZTovL2xpYnRvb2wtaG9zdC1kaXIucGF0Y2ggXAogIgogCiBTID0gIiR7V09SS0RJUn0vU0RMLSR7
UFZ9IgotLSAKMS43LjEKCg==

--0016364c7e8b21240204976dff0a--
