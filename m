Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nazgee@gmail.com>) id 1NkbuR-0000Qv-1h
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 12:29:36 +0100
Received: by wwb22 with SMTP id 22so1764679wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2010 03:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=Ibp5uf8n270UkSzv8X1Gr6Mh4zqnTUGDIis81gqxmXY=;
	b=wy5MLCrRScjoEEOfQKo3+BowVhc9o7JUX0Lysiw2OSh8MBlY9KA9vbAFWD1z32HTrY
	YMybd4Rc3RLJyojbdsjelUoLczzt6RBOmgxq5Ij6fAm3mkZ5idDmp2cEYAnVdd04e8D1
	FC+0e7FaKWFwXD0Rqv17A+u4L3NoUCxCUTAzE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=wnbd/6GVwHs6xo6PyCdF8j0Gcu9aqm1cSl8VbC57gSMr4ZzcVqQ9CpUSaM2tHTRVCa
	x/1tMaXcHDQaeZYjrMOdao8B0Hxl4vl0oFNz58d5SMzbVu+ELeK2mPvYhdCHYNPAs8Bk
	zhLVU2wf8zeccr1HLiBeqfoO6L10OpL4mmKe0=
MIME-Version: 1.0
Received: by 10.216.164.85 with SMTP id b63mr554313wel.111.1267097208970; Thu, 
	25 Feb 2010 03:26:48 -0800 (PST)
In-Reply-To: <13c1beb11002250321g6099bc44oebd182fa8c4f8d1c@mail.gmail.com>
References: <13c1beb11002250321g6099bc44oebd182fa8c4f8d1c@mail.gmail.com>
Date: Thu, 25 Feb 2010 12:26:48 +0100
Message-ID: <13c1beb11002250326u7d45777dqdbfbb43c0c5fca77@mail.gmail.com>
From: =?ISO-8859-2?Q?Micha=B3_Stawinski?= <nazgee@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: nazgee@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [PATCH][mtd-utils][how to] Numonyx chip support
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
X-List-Received-Date: Thu, 25 Feb 2010 11:29:36 -0000
X-Groupsio-MsgNum: 17067
Content-Type: multipart/mixed; boundary=0016e6497e38095d0704806b0f56

--0016e6497e38095d0704806b0f56
Content-Type: text/plain; charset=ISO-8859-1

Hi all,
I am a newb in working with open projects, so please take it easy if I'll do
something wrong.

Below (and in the attachment) is "git format-patch" output.
It introduces support for Numonyx memories, that have oobsize=64 and
pagesize=4096, that are used e.g. in OMAP3, igep0020b machine.

Solution is very straightforward, though you'll probably reject my patch, as
diff contains full path to files that i altered (not relative to mtd-utils).
I hope however, that you can tell me how to generate patches for sepcific
packages correctly, so it won't contain whole path (e.g.
a/build/tmp-igep0020/work/armv7a-angstrom-linux-gnueabi/mtd-utils-1.3.1-r0/git/nanddump.c)

That is how I've done it:
- "git pull"      //to update oe dev branch
- bitbake mtd-utils      //to get *.c files refreshed
- git checkout -b mtd_utils      //to create my new development branch
- git add
build/tmp-igep0020/work/armv7a-angstrom-linux-gnueabi/mtd-utils-1.3.1-r0/git/nanddump.c
//to add files I am going to alter
- git commit     //to create a starting point for my development
- :::editing=>compiling=>testing:::
- git commit     //to check in changes I've made
- git format-patch HEAD^     //to create patch from changes I've made

What am I doing wrong? Sources of packages like mitd-utils are not added to
.git repository in OE tree, and when I add it manually to it (as above), and
then create patch, whole path relative to OR root is generated, which makes
my patch useles to other builds than the one I did (IGEPv2).

I really'd like to contribute, but I can't find any how-to realted to *.c
sources editing (*.bb editing is straightforward, as these files are already
in oe git tree).

//==================================================
---
 .../mtd-utils-1.3.1-r0/git/nanddump.c              |    1 +
 .../mtd-utils-1.3.1-r0/git/nandwrite.c             |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git
a/build/tmp-igep0020/work/armv7a-angstrom-linux-gnueabi/mtd-utils-1.3.1-r0/git/nanddump.c
b/build/tmp-igep0020/work/armv7a-angstrom-linux-gnueabi/mtd-utils-1.3.1-r0/git/nanddump.c
index 6926c66..dfc15de 100644
---
a/build/tmp-igep0020/work/armv7a-angstrom-linux-gnueabi/mtd-utils-1.3.1-r0/git/nanddump.c
+++
b/build/tmp-igep0020/work/armv7a-angstrom-linux-gnueabi/mtd-utils-1.3.1-r0/git/nanddump.c
@@ -210,6 +210,7 @@ int main(int argc, char * const argv[])

     /* Make sure device page sizes are valid */
     if (!(meminfo.oobsize == 128 && meminfo.writesize == 4096) &&
+            !(meminfo.oobsize == 64 && meminfo.writesize == 4096) &&
             !(meminfo.oobsize == 64 && meminfo.writesize == 2048) &&
             !(meminfo.oobsize == 32 && meminfo.writesize == 1024) &&
             !(meminfo.oobsize == 16 && meminfo.writesize == 512) &&
diff --git
a/build/tmp-igep0020/work/armv7a-angstrom-linux-gnueabi/mtd-utils-1.3.1-r0/git/nandwrite.c
b/build/tmp-igep0020/work/armv7a-angstrom-linux-gnueabi/mtd-utils-1.3.1-r0/git/nandwrite.c
index b77edd6..bd45879 100644
---
a/build/tmp-igep0020/work/armv7a-angstrom-linux-gnueabi/mtd-utils-1.3.1-r0/git/nandwrite.c
+++
b/build/tmp-igep0020/work/armv7a-angstrom-linux-gnueabi/mtd-utils-1.3.1-r0/git/nandwrite.c
@@ -294,6 +294,7 @@ int main(int argc, char * const argv[])
     if (!(meminfo.oobsize == 16 && meminfo.writesize == 512) &&
             !(meminfo.oobsize == 8 && meminfo.writesize == 256) &&
             !(meminfo.oobsize == 64 && meminfo.writesize == 2048) &&
+            !(meminfo.oobsize == 64 && meminfo.writesize == 4096) &&
             !(meminfo.oobsize == 128 && meminfo.writesize == 4096)) {
         fprintf(stderr, "Unknown flash (not normal NAND)\n");
         close(fd);
-- 
1.6.3.3

--0016e6497e38095d0704806b0f56
Content-Type: application/octet-stream; 
	name="0001-Add-oobsize-64-and-writesize-4096-as-normal-nand-e.g.patch"
Content-Disposition: attachment; 
	filename="0001-Add-oobsize-64-and-writesize-4096-as-normal-nand-e.g.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g63gqytn0

RnJvbSBmZGZlMWRkOGExNjMyYjU1OTRjYjc4ZDlkMzVlZjcxODBlOGYyZDExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNaWNoYWwgU3Rhd2luc2tpICduYXpnZWUgPG5hemdlZUBnbWFp
bC5jb20+CkRhdGU6IFRodSwgMjUgRmViIDIwMTAgMDM6NTA6MDkgKzAxMDAKU3ViamVjdDogW1BB
VENIXSBBZGQgb29ic2l6ZSA2NCBhbmQgd3JpdGVzaXplIDQwOTYgYXMgbm9ybWFsIG5hbmQgKGUu
Zy4gSUdFUHYyIHVzZXMgaXQpCgotLS0KIC4uLi9tdGQtdXRpbHMtMS4zLjEtcjAvZ2l0L25hbmRk
dW1wLmMgICAgICAgICAgICAgIHwgICAgMSArCiAuLi4vbXRkLXV0aWxzLTEuMy4xLXIwL2dpdC9u
YW5kd3JpdGUuYyAgICAgICAgICAgICB8ICAgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYnVpbGQvdG1wLWlnZXAwMDIw
L3dvcmsvYXJtdjdhLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkvbXRkLXV0aWxzLTEuMy4xLXIwL2dp
dC9uYW5kZHVtcC5jIGIvYnVpbGQvdG1wLWlnZXAwMDIwL3dvcmsvYXJtdjdhLWFuZ3N0cm9tLWxp
bnV4LWdudWVhYmkvbXRkLXV0aWxzLTEuMy4xLXIwL2dpdC9uYW5kZHVtcC5jCmluZGV4IDY5MjZj
NjYuLmRmYzE1ZGUgMTAwNjQ0Ci0tLSBhL2J1aWxkL3RtcC1pZ2VwMDAyMC93b3JrL2FybXY3YS1h
bmdzdHJvbS1saW51eC1nbnVlYWJpL210ZC11dGlscy0xLjMuMS1yMC9naXQvbmFuZGR1bXAuYwor
KysgYi9idWlsZC90bXAtaWdlcDAwMjAvd29yay9hcm12N2EtYW5nc3Ryb20tbGludXgtZ251ZWFi
aS9tdGQtdXRpbHMtMS4zLjEtcjAvZ2l0L25hbmRkdW1wLmMKQEAgLTIxMCw2ICsyMTAsNyBAQCBp
bnQgbWFpbihpbnQgYXJnYywgY2hhciAqIGNvbnN0IGFyZ3ZbXSkKIAogCS8qIE1ha2Ugc3VyZSBk
ZXZpY2UgcGFnZSBzaXplcyBhcmUgdmFsaWQgKi8KIAlpZiAoIShtZW1pbmZvLm9vYnNpemUgPT0g
MTI4ICYmIG1lbWluZm8ud3JpdGVzaXplID09IDQwOTYpICYmCisJCQkhKG1lbWluZm8ub29ic2l6
ZSA9PSA2NCAmJiBtZW1pbmZvLndyaXRlc2l6ZSA9PSA0MDk2KSAmJgogCQkJIShtZW1pbmZvLm9v
YnNpemUgPT0gNjQgJiYgbWVtaW5mby53cml0ZXNpemUgPT0gMjA0OCkgJiYKIAkJCSEobWVtaW5m
by5vb2JzaXplID09IDMyICYmIG1lbWluZm8ud3JpdGVzaXplID09IDEwMjQpICYmCiAJCQkhKG1l
bWluZm8ub29ic2l6ZSA9PSAxNiAmJiBtZW1pbmZvLndyaXRlc2l6ZSA9PSA1MTIpICYmCmRpZmYg
LS1naXQgYS9idWlsZC90bXAtaWdlcDAwMjAvd29yay9hcm12N2EtYW5nc3Ryb20tbGludXgtZ251
ZWFiaS9tdGQtdXRpbHMtMS4zLjEtcjAvZ2l0L25hbmR3cml0ZS5jIGIvYnVpbGQvdG1wLWlnZXAw
MDIwL3dvcmsvYXJtdjdhLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkvbXRkLXV0aWxzLTEuMy4xLXIw
L2dpdC9uYW5kd3JpdGUuYwppbmRleCBiNzdlZGQ2Li5iZDQ1ODc5IDEwMDY0NAotLS0gYS9idWls
ZC90bXAtaWdlcDAwMjAvd29yay9hcm12N2EtYW5nc3Ryb20tbGludXgtZ251ZWFiaS9tdGQtdXRp
bHMtMS4zLjEtcjAvZ2l0L25hbmR3cml0ZS5jCisrKyBiL2J1aWxkL3RtcC1pZ2VwMDAyMC93b3Jr
L2FybXY3YS1hbmdzdHJvbS1saW51eC1nbnVlYWJpL210ZC11dGlscy0xLjMuMS1yMC9naXQvbmFu
ZHdyaXRlLmMKQEAgLTI5NCw2ICsyOTQsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqIGNv
bnN0IGFyZ3ZbXSkKIAlpZiAoIShtZW1pbmZvLm9vYnNpemUgPT0gMTYgJiYgbWVtaW5mby53cml0
ZXNpemUgPT0gNTEyKSAmJgogCQkJIShtZW1pbmZvLm9vYnNpemUgPT0gOCAmJiBtZW1pbmZvLndy
aXRlc2l6ZSA9PSAyNTYpICYmCiAJCQkhKG1lbWluZm8ub29ic2l6ZSA9PSA2NCAmJiBtZW1pbmZv
LndyaXRlc2l6ZSA9PSAyMDQ4KSAmJgorCQkJIShtZW1pbmZvLm9vYnNpemUgPT0gNjQgJiYgbWVt
aW5mby53cml0ZXNpemUgPT0gNDA5NikgJiYKIAkJCSEobWVtaW5mby5vb2JzaXplID09IDEyOCAm
JiBtZW1pbmZvLndyaXRlc2l6ZSA9PSA0MDk2KSkgewogCQlmcHJpbnRmKHN0ZGVyciwgIlVua25v
d24gZmxhc2ggKG5vdCBub3JtYWwgTkFORClcbiIpOwogCQljbG9zZShmZCk7Ci0tIAoxLjYuMy4z
Cgo=

--0016e6497e38095d0704806b0f56--
