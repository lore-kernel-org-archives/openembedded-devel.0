Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7A8C18E0D
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:52 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.62980.1699041166512237170
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Dp0vmFuK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=G7j942KK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b96bed226-a437ca30-2f37-4d5c-8309-9cb54e45e54d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jE1WWSC2woJuRTeVhrt6I+oMKoF1kKvbH6pVNViqOmQ=;
	b=Dp0vmFuKi5BAijYyOYhVl8Zf+DYYMrh1cZak7HIydE01bv2qe6f7T7zQBzSAs7Eh
	IRu0dhfov6yOAs7mkm3QcyftuVLEmgAFtaEiCpLdh/LDaLdgnS0+ux+CRF0Z+FP+4IP
	t4wuSF3f7t09z783GqyLshbZLBnqpAP/NZhZncgw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jE1WWSC2woJuRTeVhrt6I+oMKoF1kKvbH6pVNViqOmQ=;
	b=G7j942KKxnEAZ031jrDSOhIADORKxppDu0KLnWxcLWSICucEJ83eMsFf62UqdaXq
	jzMdvXt2bBtxrNVYgGPfEP6chLjlxMDr1KZ1KxIwehfpGDZey3yPlrdc8YR9qcLhBhW
	d1NmRqA/wxMzthN1OCqHiuMyXrFNxOUotd63IQHk=
Content-Type: multipart/mixed; boundary="===============0701455969104780309=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] links-x11: upgrading to 2.29 FAILED
Message-ID: <0101018b96bed226-a437ca30-2f37-4d5c-8309-9cb54e45e54d-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105984

--===============0701455969104780309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *links-x11* to *2.29* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-links-x11-upgrade-2.26-2.29.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 9af618231bd2c8731cc341b5a85826235ad079df Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 15:18:27 +0000
Subject: [PATCH] links-x11: upgrade 2.26 -> 2.29

---
 ...patch => 0001-original-patch-ac-prog-cxx.patch.patch} | 7 +++----
 .../links/{links-x11_2.26.bb => links-x11_2.29.bb}       | 9 ++++++---
 2 files changed, 9 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/links/files/{ac-prog-cxx.patch => 0001-original-patch-ac-prog-cxx.patch.patch} (73%)
 rename meta-oe/recipes-support/links/{links-x11_2.26.bb => links-x11_2.29.bb} (71%)

diff --git a/meta-oe/recipes-support/links/files/ac-prog-cxx.patch b/meta-oe/recipes-support/links/files/0001-original-patch-ac-prog-cxx.patch.patch
similarity index 73%
rename from meta-oe/recipes-support/links/files/ac-prog-cxx.patch
rename to meta-oe/recipes-support/links/files/0001-original-patch-ac-prog-cxx.patch.patch
index 0406b700d..73a25695c 100644
--- a/meta-oe/recipes-support/links/files/ac-prog-cxx.patch
+++ b/meta-oe/recipes-support/links/files/0001-original-patch-ac-prog-cxx.patch.patch
@@ -1,15 +1,14 @@
-From c00668541f68c17a5e453a4dcc2a86022b20af87 Mon Sep 17 00:00:00 2001
+From 53e54a6bc5d53d0ede4aea9be9e274a8f14ed4a6 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 30 Jul 2012 23:52:49 +0200
+Subject: [PATCH] %% original patch: ac-prog-cxx.patch
 
 ---
-Upstream-Status: Pending
-
  configure.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.in b/configure.in
-index 7c15b6b..9896631 100644
+index 54d6107..6a2e581 100644
 --- a/configure.in
 +++ b/configure.in
 @@ -23,7 +23,7 @@ AM_CONFIG_HEADER(config.h)
diff --git a/meta-oe/recipes-support/links/links-x11_2.26.bb b/meta-oe/recipes-support/links/links-x11_2.29.bb
similarity index 71%
rename from meta-oe/recipes-support/links/links-x11_2.26.bb
rename to meta-oe/recipes-support/links/links-x11_2.29.bb
index 4c8d935cc..acb44b8d6 100644
--- a/meta-oe/recipes-support/links/links-x11_2.26.bb
+++ b/meta-oe/recipes-support/links/links-x11_2.29.bb
@@ -7,10 +7,13 @@ inherit features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI += " file://links2.desktop \
-             http://www.xora.org.uk/oe/links2.png;name=icon"
+SRC_URI += "http://links.twibright.com/download/links-${PV}.tar.bz2 \
+           file://links2.desktop \
+           http://www.xora.org.uk/oe/links2.png;name=icon \
+           file://0001-original-patch-ac-prog-cxx.patch.patch \
+           "
 
-SRC_URI[sha256sum] = "f05b3577f25dbe63e491c424f0ecb31f7bfadce9b2bc2f111dfed049c004c9cb"
+SRC_URI[sha256sum] = "22aa96c0b38e1a6f8f7ed9d7a4167a47fc37246097759ef6059ecf8f9ead7998"
 SRC_URI[icon.sha256sum] = "eddcd8b8c8698aa621d1a453943892d77b72ed492e0d14e0dbac5c6a57e52f47"
 
 S = "${WORKDIR}/links-${PV}"
-- 
2.39.2


--===============0701455969104780309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4992 entries from dependency cache.
Parsing recipes...
Summary: There were 3 ERROR messages, returning a non-zero exit code.
ERROR: /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links_2.29.bb: Unable to get checksum for links SRC_URI entry ac-prog-cxx.patch: file could not be found
The following paths were searched:
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links-2.29/poky/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links/poky/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/files/poky/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links-2.29/qemux86-64/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links/qemux86-64/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/files/qemux86-64/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links-2.29/qemuall/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links/qemuall/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/files/qemuall/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links-2.29/x86-64/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links/x86-64/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/files/x86-64/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links-2.29/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/files/ac-prog-cxx.patch
ERROR: /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links-x11_2.29.bb: Unable to get checksum for links-x11 SRC_URI entry ac-prog-cxx.patch: file could not be found
The following paths were searched:
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links-x11-2.29/poky/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links-x11/poky/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/files/poky/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links-x11-2.29/qemux86-64/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links-x11/qemux86-64/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/files/qemux86-64/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links-x11-2.29/qemuall/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links-x11/qemuall/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/files/qemuall/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links-x11-2.29/x86-64/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links-x11/x86-64/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/files/x86-64/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links-x11-2.29/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/links-x11/ac-prog-cxx.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-support/links/files/ac-prog-cxx.patch
ERROR: Parsing halted due to errors, see error messages above

--===============0701455969104780309==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-links-x11-upgrade-2.26-2.29.patch"

RnJvbSA5YWY2MTgyMzFiZDJjODczMWNjMzQxYjVhODU4MjYyMzVhZDA3OWRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNToxODoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
bmtzLXgxMTogdXBncmFkZSAyLjI2IC0+IDIuMjkKCi0tLQogLi4ucGF0Y2ggPT4gMDAwMS1vcmln
aW5hbC1wYXRjaC1hYy1wcm9nLWN4eC5wYXRjaC5wYXRjaH0gfCA3ICsrKy0tLS0KIC4uLi9saW5r
cy97bGlua3MteDExXzIuMjYuYmIgPT4gbGlua3MteDExXzIuMjkuYmJ9ICAgICAgIHwgOSArKysr
KystLS0KIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpbmtzL2ZpbGVzL3thYy1wcm9nLWN4eC5w
YXRjaCA9PiAwMDAxLW9yaWdpbmFsLXBhdGNoLWFjLXByb2ctY3h4LnBhdGNoLnBhdGNofSAoNzMl
KQogcmVuYW1lIG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpbmtzL3tsaW5rcy14MTFfMi4yNi5i
YiA9PiBsaW5rcy14MTFfMi4yOS5iYn0gKDcxJSkKCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lw
ZXMtc3VwcG9ydC9saW5rcy9maWxlcy9hYy1wcm9nLWN4eC5wYXRjaCBiL21ldGEtb2UvcmVjaXBl
cy1zdXBwb3J0L2xpbmtzL2ZpbGVzLzAwMDEtb3JpZ2luYWwtcGF0Y2gtYWMtcHJvZy1jeHgucGF0
Y2gucGF0Y2gKc2ltaWxhcml0eSBpbmRleCA3MyUKcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVz
LXN1cHBvcnQvbGlua3MvZmlsZXMvYWMtcHJvZy1jeHgucGF0Y2gKcmVuYW1lIHRvIG1ldGEtb2Uv
cmVjaXBlcy1zdXBwb3J0L2xpbmtzL2ZpbGVzLzAwMDEtb3JpZ2luYWwtcGF0Y2gtYWMtcHJvZy1j
eHgucGF0Y2gucGF0Y2gKaW5kZXggMDQwNmI3MDBkLi43M2EyNTY5NWMgMTAwNjQ0Ci0tLSBhL21l
dGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpbmtzL2ZpbGVzL2FjLXByb2ctY3h4LnBhdGNoCisrKyBi
L21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpbmtzL2ZpbGVzLzAwMDEtb3JpZ2luYWwtcGF0Y2gt
YWMtcHJvZy1jeHgucGF0Y2gucGF0Y2gKQEAgLTEsMTUgKzEsMTQgQEAKLUZyb20gYzAwNjY4NTQx
ZjY4YzE3YTVlNDUzYTRkY2MyYTg2MDIyYjIwYWY4NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gNTNlNTRhNmJjNWQ1M2QwZWRlNGFlYTliZTllMjc0YThmMTRlZDRhNiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IE1hcnRpbiBKYW5zYSA8TWFydGluLkphbnNhQGdtYWlsLmNv
bT4KIERhdGU6IE1vbiwgMzAgSnVsIDIwMTIgMjM6NTI6NDkgKzAyMDAKK1N1YmplY3Q6IFtQQVRD
SF0gJSUgb3JpZ2luYWwgcGF0Y2g6IGFjLXByb2ctY3h4LnBhdGNoCiAKIC0tLQotVXBzdHJlYW0t
U3RhdHVzOiBQZW5kaW5nCi0KICBjb25maWd1cmUuaW4gfCAyICstCiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUu
aW4gYi9jb25maWd1cmUuaW4KLWluZGV4IDdjMTViNmIuLjk4OTY2MzEgMTAwNjQ0CitpbmRleCA1
NGQ2MTA3Li42YTJlNTgxIDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmluCiArKysgYi9jb25maWd1
cmUuaW4KIEBAIC0yMyw3ICsyMyw3IEBAIEFNX0NPTkZJR19IRUFERVIoY29uZmlnLmgpCmRpZmYg
LS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saW5rcy9saW5rcy14MTFfMi4yNi5iYiBi
L21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpbmtzL2xpbmtzLXgxMV8yLjI5LmJiCnNpbWlsYXJp
dHkgaW5kZXggNzElCnJlbmFtZSBmcm9tIG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpbmtzL2xp
bmtzLXgxMV8yLjI2LmJiCnJlbmFtZSB0byBtZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9saW5rcy9s
aW5rcy14MTFfMi4yOS5iYgppbmRleCA0YzhkOTM1Y2MuLmFjYjQ0YjhkNiAxMDA2NDQKLS0tIGEv
bWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGlua3MvbGlua3MteDExXzIuMjYuYmIKKysrIGIvbWV0
YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGlua3MvbGlua3MteDExXzIuMjkuYmIKQEAgLTcsMTAgKzcs
MTMgQEAgaW5oZXJpdCBmZWF0dXJlc19jaGVjawogIyBkZXBlbmRzIG9uIHZpcnR1YWwvbGlieDEx
CiBSRVFVSVJFRF9ESVNUUk9fRkVBVFVSRVMgPSAieDExIgogCi1TUkNfVVJJICs9ICIgZmlsZTov
L2xpbmtzMi5kZXNrdG9wIFwKLSAgICAgICAgICAgICBodHRwOi8vd3d3LnhvcmEub3JnLnVrL29l
L2xpbmtzMi5wbmc7bmFtZT1pY29uIgorU1JDX1VSSSArPSAiaHR0cDovL2xpbmtzLnR3aWJyaWdo
dC5jb20vZG93bmxvYWQvbGlua3MtJHtQVn0udGFyLmJ6MiBcCisgICAgICAgICAgIGZpbGU6Ly9s
aW5rczIuZGVza3RvcCBcCisgICAgICAgICAgIGh0dHA6Ly93d3cueG9yYS5vcmcudWsvb2UvbGlu
a3MyLnBuZztuYW1lPWljb24gXAorICAgICAgICAgICBmaWxlOi8vMDAwMS1vcmlnaW5hbC1wYXRj
aC1hYy1wcm9nLWN4eC5wYXRjaC5wYXRjaCBcCisgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImYwNWIzNTc3ZjI1ZGJlNjNlNDkxYzQyNGYwZWNiMzFmN2JmYWRjZTliMmJjMmYx
MTFkZmVkMDQ5YzAwNGM5Y2IiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjJhYTk2YzBiMzhlMWE2
ZjhmN2VkOWQ3YTQxNjdhNDdmYzM3MjQ2MDk3NzU5ZWY2MDU5ZWNmOGY5ZWFkNzk5OCIKIFNSQ19V
UklbaWNvbi5zaGEyNTZzdW1dID0gImVkZGNkOGI4Yzg2OThhYTYyMWQxYTQ1Mzk0Mzg5MmQ3N2I3
MmVkNDkyZTBkMTRlMGRiYWM1YzZhNTdlNTJmNDciCiAKIFMgPSAiJHtXT1JLRElSfS9saW5rcy0k
e1BWfSIKLS0gCjIuMzkuMgoK

--===============0701455969104780309==--

