Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric.colleu@gmail.com>) id 1PNK6k-0004Pm-1V
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 07:54:34 +0100
Received: by qyk8 with SMTP id 8so817285qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 22:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=pvmweF+KLNi4uB0xV9mWoE3iJera4iPNqp4KCehMdv8=;
	b=f/cHW0p2HOn7eiKiLNQB7vI9lTbah8oKJfIWoU5qH7qGh2BQtk9pJndqutDCNBm8+0
	hpzbT7mQkWgVp78MQeAukCJRlVpahYXOfz2olQcq6sRWoT4cZLKjTKvwgxWkWJGLUXki
	gowiVouf9k2WzpFRnTZH3darKNzuq7CdE5OUc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=k6jPCZjMpRtz/wqAlYC1Om9eRF0DquT98MwdRyMwfeQXGQOkubFPs82Eu4mAn8ZX4r
	UFfObUDwxgobGdKrEBBlk+EXKKD3ZBvWTSaEAb1IiYDobaHyHQsduFBkW0VXIddMqkJm
	070cPJb73OW7qSqww+Qhwy7/1214J/pIMQ8/s=
MIME-Version: 1.0
Received: by 10.229.240.85 with SMTP id kz21mr5684975qcb.230.1291099993404;
	Mon, 29 Nov 2010 22:53:13 -0800 (PST)
Received: by 10.220.177.76 with HTTP; Mon, 29 Nov 2010 22:53:13 -0800 (PST)
In-Reply-To: <1290773704.28296.30.camel@mattotaupa>
References: <1290773704.28296.30.camel@mattotaupa>
Date: Tue, 30 Nov 2010 07:53:13 +0100
Message-ID: <AANLkTikA3awF9Ghc=Rgv5GUmfRxNLVD2XwW67wUvSiEM@mail.gmail.com>
From: Eric Colleu <eric.colleu@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: eric.colleu@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: xbmc: task `compile` fails with `/tools/TexturePacker/XBMCTex.cpp:394: undefined reference to `__lzo_init2'`
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
X-List-Received-Date: Tue, 30 Nov 2010 06:54:34 -0000
X-Groupsio-MsgNum: 26724
Content-Type: multipart/mixed; boundary=0016363101e579f61804963fa43b

--0016363101e579f61804963fa43b
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Try to add this patch to your xbmc recipe:

diff -Naur a/configure.in b/configure.in
--- a/configure.in 2010-07-17 16:50:02.838501479 +0200
+++ b/configure.in 2010-07-17 16:50:20.633376618 +0200
@@ -1205,12 +1205,6 @@
   final_message=3D"$final_message\n  MID Support:\tNo"
 fi

-if test -d "/usr/include/lzo"; then
-  INCLUDES=3D"$INCLUDES -I/usr/include/lzo"
-else
-  INCLUDES=3D"$INCLUDES"
-fi
-
 if test "x$use_ccache" !=3D "xno"; then
   AC_PATH_PROG(CCACHE,ccache,none)
   if test "$ac_cv_path_CCACHE" =3D "none"; then
diff -Naur xbmc-31903/tools/TexturePacker/XBMCTex.cpp
xbmc-31903.patch/tools/TexturePacker/XBMCTex.cpp
--- a/tools/TexturePacker/XBMCTex.cpp 2010-07-17 16:28:40.000000000 +0200
+++ b/tools/TexturePacker/XBMCTex.cpp 2010-07-17 16:50:20.634375824 +0200
@@ -37,7 +37,7 @@
 #endif

 #ifdef _LINUX
-#include <lzo1x.h>
+#include <lzo/lzo1x.h>
 #else
 #include "../../xbmc/lib/liblzo/LZO1X.H"
 #endif

Eric Colleu

2010/11/26 Paul Menzel <paulepanter@users.sourceforge.net>

> Dear OE folks,
>
>
> `bitbake -k xbmc` fails with the following error in task `compile`.
>
>        [=85]
>

--0016363101e579f61804963fa43b
Content-Type: text/x-patch; charset=US-ASCII; name="0012-correct-lzo-include.patch"
Content-Disposition: attachment; filename="0012-correct-lzo-include.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gh4fjb0c1

ZGlmZiAtTmF1ciBhL2NvbmZpZ3VyZS5pbiBiL2NvbmZpZ3VyZS5pbgotLS0gYS9jb25maWd1cmUu
aW4JMjAxMC0wNy0xNyAxNjo1MDowMi44Mzg1MDE0NzkgKzAyMDAKKysrIGIvY29uZmlndXJlLmlu
CTIwMTAtMDctMTcgMTY6NTA6MjAuNjMzMzc2NjE4ICswMjAwCkBAIC0xMjA1LDEyICsxMjA1LDYg
QEAKICAgZmluYWxfbWVzc2FnZT0iJGZpbmFsX21lc3NhZ2VcbiAgTUlEIFN1cHBvcnQ6XHRObyIK
IGZpCiAKLWlmIHRlc3QgLWQgIi91c3IvaW5jbHVkZS9sem8iOyB0aGVuCi0gIElOQ0xVREVTPSIk
SU5DTFVERVMgLUkvdXNyL2luY2x1ZGUvbHpvIgotZWxzZQotICBJTkNMVURFUz0iJElOQ0xVREVT
IgotZmkKLQogaWYgdGVzdCAieCR1c2VfY2NhY2hlIiAhPSAieG5vIjsgdGhlbgogICBBQ19QQVRI
X1BST0coQ0NBQ0hFLGNjYWNoZSxub25lKQogICBpZiB0ZXN0ICIkYWNfY3ZfcGF0aF9DQ0FDSEUi
ID0gIm5vbmUiOyB0aGVuCmRpZmYgLU5hdXIgeGJtYy0zMTkwMy90b29scy9UZXh0dXJlUGFja2Vy
L1hCTUNUZXguY3BwIHhibWMtMzE5MDMucGF0Y2gvdG9vbHMvVGV4dHVyZVBhY2tlci9YQk1DVGV4
LmNwcAotLS0gYS90b29scy9UZXh0dXJlUGFja2VyL1hCTUNUZXguY3BwCTIwMTAtMDctMTcgMTY6
Mjg6NDAuMDAwMDAwMDAwICswMjAwCisrKyBiL3Rvb2xzL1RleHR1cmVQYWNrZXIvWEJNQ1RleC5j
cHAJMjAxMC0wNy0xNyAxNjo1MDoyMC42MzQzNzU4MjQgKzAyMDAKQEAgLTM3LDcgKzM3LDcgQEAK
ICNlbmRpZgogCiAjaWZkZWYgX0xJTlVYCi0jaW5jbHVkZSA8bHpvMXguaD4KKyNpbmNsdWRlIDxs
em8vbHpvMXguaD4KICNlbHNlCiAjaW5jbHVkZSAiLi4vLi4veGJtYy9saWIvbGlibHpvL0xaTzFY
LkgiCiAjZW5kaWYK

--0016363101e579f61804963fa43b--
