Received: from [209.85.218.210] (helo=mail-bw0-f210.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <arteqw@gmail.com>) id 1MjSfW-0007fj-40
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 08:53:10 +0200
Received: by bwz6 with SMTP id 6so420754bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Sep 2009 23:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=+q9jDa/TrfAohcepw3Byg0l7TzXnmTMDSjI8dt+am3U=;
	b=PZML6E8cBCwMjj2N//jy0ZksPOInu84ZBOLao9uS/Z33UAgeLtsyjPS/G9qFW6xJCH
	65f91FkVwHW1s+91f6uNF0YYRwDshMnmsvzs7emiUUIKctyGq4XumtNNPryqk8rBIy35
	rzDZD4DqBW4Inm9yyl+z+H562BPOCJoDMlkOY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=qslYR0A+h+57+YI5Lver6knyFF7py+gd5BTAKZOIDHS0u7ZKsXcqgyFQIP/K83EUfK
	DSGAOCi08l5h0bNv6cCWbQpat98oDZOTMa+U5gg4Hz2VRG4hrhcKveSVNjpMFMY6WT8s
	2uHWt+15pLj9+rR1Xntm7ftlx6bVTWmw1yS6g=
MIME-Version: 1.0
Received: by 10.204.7.144 with SMTP id d16mr8650670bkd.209.1252046052965; Thu, 
	03 Sep 2009 23:34:12 -0700 (PDT)
In-Reply-To: <20090903231617.GA27116@rhein.zuhause.netz>
References: <431b13f90909021248y7e0cc019pfb388fe9b3d2fc8e@mail.gmail.com>
	<20090903113150.GA22344@rhein.zuhause.netz>
	<431b13f90909031309l2cf9bea0rae96d4b015776682@mail.gmail.com>
	<20090903231617.GA27116@rhein.zuhause.netz>
Date: Fri, 4 Sep 2009 08:34:12 +0200
Message-ID: <431b13f90909032334u268006d1t88fa437d76883be8@mail.gmail.com>
From: Artur Wronowski <arteqw@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] add nzbget and libpar2
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
X-List-Received-Date: Fri, 04 Sep 2009 06:53:11 -0000
X-Groupsio-MsgNum: 12944
Content-Type: multipart/mixed; boundary=001517588cfa3ac0170472bab0b9

--001517588cfa3ac0170472bab0b9
Content-Type: text/plain; charset=UTF-8

2009/9/4 Henning Heinold <heinold@inf.fu-berlin.de>:
> Hi again,
>
> sorry didnt saw this on the first glance please use git format-patch
> So its easier to push it in, with your datas.

Here it is, new patch :-)


-- 
Pozdrawiam, Artur
http://artekw.net / GG: 151817 / JID: artekw@jabberpl.org

--001517588cfa3ac0170472bab0b9
Content-Type: text/x-patch; charset=US-ASCII; name="0001-add-nzbget-and-libpar2.patch"
Content-Disposition: attachment; 
	filename="0001-add-nzbget-and-libpar2.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fz6jvrjt0

RnJvbSAwMzMxZGIzNzhjZjc5ODgxMzcwMGNjYjdjZWQyNjY2N2JhZDdiNTg3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBcnR1ciBXcm9ub3dza2kgPGFydGVxd0BnbWFpbC5jb20+CkRh
dGU6IEZyaSwgNCBTZXAgMjAwOSAwODoyODoxMyArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIGFkZCBu
emJnZXQgYW5kIGxpYnBhcjIKCi0tLQogcmVjaXBlcy9saWJwYXIyL2xpYnBhcjJfMC4yLmJiICAg
ICAgICAgfCAgIDE0ICsrKysrKysrKysrKysrCiByZWNpcGVzL256YmdldC9uemJnZXRfMC42LjAu
YmIgICAgICAgICB8ICAgMjIgKysrKysrKysrKysrKysrKysrKysrKwogcmVjaXBlcy9uemJnZXQv
bnpiZ2V0XzAuNy4wLXRlc3RpbmcuYmIgfCAgIDIyICsrKysrKysrKysrKysrKysrKysrKysKIDMg
ZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBt
b2RlIDEwMDY0NCByZWNpcGVzL2xpYnBhcjIvbGlicGFyMl8wLjIuYmIKIGNyZWF0ZSBtb2RlIDEw
MDY0NCByZWNpcGVzL256YmdldC9uemJnZXRfMC42LjAuYmIKIGNyZWF0ZSBtb2RlIDEwMDY0NCBy
ZWNpcGVzL256YmdldC9uemJnZXRfMC43LjAtdGVzdGluZy5iYgoKZGlmZiAtLWdpdCBhL3JlY2lw
ZXMvbGlicGFyMi9saWJwYXIyXzAuMi5iYiBiL3JlY2lwZXMvbGlicGFyMi9saWJwYXIyXzAuMi5i
YgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi5iMzM3YzVmCi0tLSAvZGV2L251
bGwKKysrIGIvcmVjaXBlcy9saWJwYXIyL2xpYnBhcjJfMC4yLmJiCkBAIC0wLDAgKzEsMTQgQEAK
K0RFU0NSSVBUSU9OID0gIlByb3ZpZGluZyBhIHRvb2wgdG8gYXBwbHkgdGhlIGRhdGEtcmVjb3Zl
cnkgY2FwYWJpbGl0eSBjb25jZXB0cyBvZiBSQUlELWxpa2Ugc3lzdGVtcyB0byB0aGUgcG9zdGlu
ZyAmIHJlY292ZXJ5IG9mIG11bHRpLXBhcnQgYXJjaGl2ZXMgb24gVXNlbmV0LiIKK1NFQ1RJT04g
PSAibGlicyIKK0xJQ0VOU0UgPSAiR1BMIgorSE9NRVBBR0UgPSAiaHR0cDovL3BhcmNoaXZlLnNv
dXJjZWZvcmdlLm5ldC8iCitERVBFTkRTID0gImxpYnNpZ2MrKy0yLjAiCisKK1NSQ19VUkkgPSAi
JHtTT1VSQ0VGT1JHRV9NSVJST1J9L3BhcmNoaXZlL2xpYnBhcjIvbGlicGFyMi0ke1BWfS50YXIu
Z3oiCisKK2luaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZworCitkb19zdGFnZSgpIHsKKwlhdXRv
dG9vbHNfc3RhZ2VfYWxsCit9CisKZGlmZiAtLWdpdCBhL3JlY2lwZXMvbnpiZ2V0L256YmdldF8w
LjYuMC5iYiBiL3JlY2lwZXMvbnpiZ2V0L256YmdldF8wLjYuMC5iYgpuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwLi43OWZmN2M0Ci0tLSAvZGV2L251bGwKKysrIGIvcmVjaXBlcy9u
emJnZXQvbnpiZ2V0XzAuNi4wLmJiCkBAIC0wLDAgKzEsMjIgQEAKK0RFU0NSSVBUSU9OID0gIk5a
QkdldCBpcyBhIGNvbW1hbmQtbGluZSBiYXNlZCBiaW5hcnkgbmV3c2dyYWJiZXIgZm9yIG56YiBm
aWxlcywgd3JpdHRlbiBpbiBDKysiCitTRUNUSU9OID0gIm5ldCIKK0xJQ0VOU0UgPSAiR1BMIgor
SE9NRVBBR0UgPSAiaHR0cDovL256YmdldC5zb3VyY2Vmb3JnZS5uZXQvTWFpbl9QYWdlIgorREVQ
RU5EUyA9ICJsaWJzaWdjKystMi4wIGxpYnBhcjIgbmN1cnNlcyBsaWJ4bWwyIG9wZW5zc2wiCitQ
UiA9ICJyMCIKKworU1JDX1VSSSA9ICIke1NPVVJDRUZPUkdFX01JUlJPUn0vbnpiZ2V0L256Ymdl
dC1zdGFibGUvbnpiZ2V0LSR7UFZ9LnRhci5neiIKKworaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29u
ZmlnCisKK2RvX3N0YWdlKCkgeworCWF1dG90b29sc19zdGFnZV9hbGwKK30KKworRVhUUkFfT0VD
T05GID0gIi0td2l0aC10bHNsaWI9T3BlblNTTCBcCisJCS0td2l0aC1saWJjdXJzZXMtbGlicmFy
aWVzPSR7U1RBR0lOR19MSUJESVJ9IFwKKwkJLS13aXRoLWxpYmN1cnNlcy1pbmNsdWRlcz0ke1NU
QUdJTkdfSU5DRElSfSBcCisJCS0td2l0aC1saWJwYXIyLWxpYnJhcmllcz17U1RBR0lOR19JTkNE
SVJ9IFwKKwkJLS13aXRoLWxpYnBhcjItaW5jbHVkZXM9e1NUQUdJTkdfSU5DRElSfSBcCisJCS0t
d2l0aC1vcGVuc3NsLWxpYnJhcmllcz17U1RBR0lOR19JTkNESVJ9IFwKKwkJLS13aXRoLW9wZW5z
c2wtaW5jbHVkZXM9e1NUQUdJTkdfSU5DRElSfSIKZGlmZiAtLWdpdCBhL3JlY2lwZXMvbnpiZ2V0
L256YmdldF8wLjcuMC10ZXN0aW5nLmJiIGIvcmVjaXBlcy9uemJnZXQvbnpiZ2V0XzAuNy4wLXRl
c3RpbmcuYmIKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uMjg5YjU4MAotLS0g
L2Rldi9udWxsCisrKyBiL3JlY2lwZXMvbnpiZ2V0L256YmdldF8wLjcuMC10ZXN0aW5nLmJiCkBA
IC0wLDAgKzEsMjIgQEAKK0RFU0NSSVBUSU9OID0gIk5aQkdldCBpcyBhIGNvbW1hbmQtbGluZSBi
YXNlZCBiaW5hcnkgbmV3c2dyYWJiZXIgZm9yIG56YiBmaWxlcywgd3JpdHRlbiBpbiBDKysuIFRl
c3RpbmcgdmVyc2lvbi4iCitTRUNUSU9OID0gIm5ldCIKK0xJQ0VOU0UgPSAiR1BMIgorSE9NRVBB
R0UgPSAiaHR0cDovL256YmdldC5zb3VyY2Vmb3JnZS5uZXQvTWFpbl9QYWdlIgorREVQRU5EUyA9
ICJsaWJzaWdjKystMi4wIGxpYnBhcjIgbmN1cnNlcyBsaWJ4bWwyIG9wZW5zc2wiCitQUiA9ICJy
MCIKKworU1JDX1VSSSA9ICIke1NPVVJDRUZPUkdFX01JUlJPUn0vbnpiZ2V0L256YmdldC1zdGFi
bGUvbnpiZ2V0LSR7UFZ9LXIzNDIudGFyLmd6IgorCitpbmhlcml0IGF1dG90b29scyBwa2djb25m
aWcKKworZG9fc3RhZ2UoKSB7CisJYXV0b3Rvb2xzX3N0YWdlX2FsbAorfQorCitFWFRSQV9PRUNP
TkYgPSAiLS13aXRoLXRsc2xpYj1PcGVuU1NMIFwKKwkJLS13aXRoLWxpYmN1cnNlcy1saWJyYXJp
ZXM9JHtTVEFHSU5HX0xJQkRJUn0gXAorCQktLXdpdGgtbGliY3Vyc2VzLWluY2x1ZGVzPSR7U1RB
R0lOR19JTkNESVJ9IFwKKwkJLS13aXRoLWxpYnBhcjItbGlicmFyaWVzPXtTVEFHSU5HX0lOQ0RJ
Un0gXAorCQktLXdpdGgtbGlicGFyMi1pbmNsdWRlcz17U1RBR0lOR19JTkNESVJ9IFwKKwkJLS13
aXRoLW9wZW5zc2wtbGlicmFyaWVzPXtTVEFHSU5HX0lOQ0RJUn0gXAorCQktLXdpdGgtb3BlbnNz
bC1pbmNsdWRlcz17U1RBR0lOR19JTkNESVJ9IgotLSAKMS42LjQuMgoK

--001517588cfa3ac0170472bab0b9--
