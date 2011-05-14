Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <christian.betz@gmail.com>) id 1QLFpj-0004KK-R3
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 May 2011 16:28:43 +0200
Received: by fxm19 with SMTP id 19so2538533fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 May 2011 07:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=PaPgblPNVAVX3wCXg/X6UD0PONKqeRveZLxpEE1t56o=;
	b=s0l6dteocKHr6jrhTd+s8n+Oix56otzDZYnHikZ6D09yo/N5D2pjEwceVNOIsfEOZ6
	HMD2Ciusr1mbFaJqAL1TAQzBHKOLjmP/7QjYGFfea2wPT8x5ZOx9Q5/+PDn5J7qLy9z2
	1PC8SgQyjkv1STJ6LxfHBBfiJaqWuVHOfNshM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=kBe4abGCRDJQtIIiNd1Icri3jAG94og+5oWv8Mtix+ngO8hu9KNi7j7V196Rv41f6f
	X0CIWjfF0Tmwj0i9tizwdhJYVEaxUFfKu9OaADGtVYXaDlRwcBSCnL1nzAVpul38pb8V
	22/wAalKPVhvPMda68TnP1HUu+joWZCQUgSvg=
MIME-Version: 1.0
Received: by 10.223.27.18 with SMTP id g18mr1162624fac.52.1305383153727; Sat,
	14 May 2011 07:25:53 -0700 (PDT)
Received: by 10.223.13.8 with HTTP; Sat, 14 May 2011 07:25:53 -0700 (PDT)
Date: Sat, 14 May 2011 10:25:53 -0400
Message-ID: <BANLkTikVtDGTO=04H8kkPdJLH2UtN9JR2A@mail.gmail.com>
From: Christian Betz <christian.betz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: patch for acpid-1.0.10, building for i586-generic on x86_64
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
X-List-Received-Date: Sat, 14 May 2011 14:28:43 -0000
X-Groupsio-MsgNum: 32023
Content-Type: multipart/mixed; boundary=00151748e0a82c784b04a33d338a

--00151748e0a82c784b04a33d338a
Content-Type: text/plain; charset=ISO-8859-1

acpid-1.0.10 fails building due to a compiler warning:

 libnetlink.c:521:56: error: comparison between signed and unsigned
integer expressions

I noticed another user mentioning this issue not too long ago. I can't
say whether the i586 machine type or x86_64 host is the issue, but the
fix is easy: just add a missing cast.

Christian

----

This is a patch to a patch since the entire libnetlink.c file is part
of the existing netlink.diff patch

--- a/recipes/acpid/acpid-1.0.10/netlink.diff
+++ b/recipes/acpid/acpid-1.0.10/netlink.diff
@@ -2019,7 +2019,7 @@ diff -ruN acpid-1.0.10/libnetlink.c
acpid-1.0.10-netlink2/libnetlink.c
 +
 +int addraw_l(struct nlmsghdr *n, int maxlen, const void *data, int len)
 +{
-+      if ((int)NLMSG_ALIGN(n->nlmsg_len) + NLMSG_ALIGN(len) > maxlen) {
++      if ((int)NLMSG_ALIGN(n->nlmsg_len) + (int)NLMSG_ALIGN(len) > maxlen) {
 +              fprintf(stderr, "addraw_l ERROR: message exceeded
bound of %d\n",maxlen);
 +              return -1;
 +      }

--00151748e0a82c784b04a33d338a
Content-Type: text/x-patch; charset=US-ASCII; name="netlink.diff.diff"
Content-Disposition: attachment; filename="netlink.diff.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gnon4fzw0

ZGlmZiAtLWdpdCBhL3JlY2lwZXMvYWNwaWQvYWNwaWQtMS4wLjEwL25ldGxpbmsuZGlmZiBiL3Jl
Y2lwZXMvYWNwaWQvYWNwaWQtMS4wLjEwL25ldGxpbmsuZGlmZgppbmRleCA2MzVjNTUwLi5lYmRl
YzU4IDEwMDY0NAotLS0gYS9yZWNpcGVzL2FjcGlkL2FjcGlkLTEuMC4xMC9uZXRsaW5rLmRpZmYK
KysrIGIvcmVjaXBlcy9hY3BpZC9hY3BpZC0xLjAuMTAvbmV0bGluay5kaWZmCkBAIC0yMDE5LDcg
KzIwMTksNyBAQCBkaWZmIC1ydU4gYWNwaWQtMS4wLjEwL2xpYm5ldGxpbmsuYyBhY3BpZC0xLjAu
MTAtbmV0bGluazIvbGlibmV0bGluay5jCiArCiAraW50IGFkZHJhd19sKHN0cnVjdCBubG1zZ2hk
ciAqbiwgaW50IG1heGxlbiwgY29uc3Qgdm9pZCAqZGF0YSwgaW50IGxlbikKICt7Ci0rCWlmICgo
aW50KU5MTVNHX0FMSUdOKG4tPm5sbXNnX2xlbikgKyBOTE1TR19BTElHTihsZW4pID4gbWF4bGVu
KSB7CisrCWlmICgoaW50KU5MTVNHX0FMSUdOKG4tPm5sbXNnX2xlbikgKyAoaW50KU5MTVNHX0FM
SUdOKGxlbikgPiBtYXhsZW4pIHsKICsJCWZwcmludGYoc3RkZXJyLCAiYWRkcmF3X2wgRVJST1I6
IG1lc3NhZ2UgZXhjZWVkZWQgYm91bmQgb2YgJWRcbiIsbWF4bGVuKTsKICsJCXJldHVybiAtMTsK
ICsJfQo=

--00151748e0a82c784b04a33d338a--
