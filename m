Received: from fallback7.mail.ru ([94.100.176.135] helo=fallback3.mail.ru)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nyrl@mail.ru>) id 1PTm89-0000rW-Uh
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 03:02:42 +0100
Received: from f131.mail.ru (f131.mail.ru [217.69.128.87])
	by fallback3.mail.ru (mPOP.Fallback_MX) with ESMTP id E8E118976F0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Dec 2010 19:38:42 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail; 
	h=Message-Id:Content-Type:Reply-To:Date:Mime-Version:Subject:To:From;
	bh=Z9mGSNo+2lOv68eOQo9p4C3rpRcTftNe2ZFD5kj1Xgo=; 
	b=fYqoOh3AG0ZkKLMj7BWJ8V1mSIBLZkREdszHDG7644lhBqxHemGuk11IYIPWNEZtUy9RQCh1w4cSjc0iQzwu3wxaaE/5kleYnVWfnGilWZ8JGTicS8cTSLTW/Uhs87zV;
Received: from mail by f131.mail.ru with local id 1PTdKG-0007aj-00
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Dec 2010 19:38:36 +0300
Received: from [79.173.78.16] by win.mail.ru with HTTP;
	Fri, 17 Dec 2010 19:38:36 +0300
From: Denis Dydychkin <nyrl@mail.ru>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0
X-Mailer: mPOP Web-Mail 2.19
X-Originating-IP: [79.173.78.16]
Date: Fri, 17 Dec 2010 19:38:36 +0300
Message-Id: <E1PTdKG-0007aj-00.nyrl-mail-ru@f131.mail.ru>
X-Spam: Not detected
X-Mras: Ok
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [RFC] Local files search in overlay folders first
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
X-List-Received-Date: Sat, 18 Dec 2010 02:02:48 -0000
X-Groupsio-MsgNum: 27241
Content-Type: multipart/mixed;
	boundary="----QfT1LvY3-1NNsqHbwVanBLBhn:1292603916"

------QfT1LvY3-1NNsqHbwVanBLBhn:1292603916
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: quoted-printable


> Chris Larson clarson at kergoth.com=20
> Thu Dec 16 16:26:30 CET 2010=20

>> What I generally want is to simply replace defconfig with my own witho=
ut changing recipe and touching other patches.
>> ....
>> It does not work for release-2010.12 of OE and it does not seems to wo=
rk in master either.
>> ...
>> I believe that changing FILESPATHBASE so that it will look in "recipes=
/linux/linux-davinci/omapl137" subfolder
>> for each entry in BBPATH in defined order would solve my problem. For =
given example having=20
>> FILESPATHBASE defines as "<topdir>/overlay/recipes/linux:<topdir>/oe/r=
ecipes/linux" would be enough.

> Yes, that's correct, and is a common approach among those utilizing
> collections/layers, but I don't believe it's in OE in any form.  A
> .conf for the user/distro to include would likely be a bit cleaner
> than a bbclass.

Thank you for answer Christopher.

I've changed it to .inc and it seems to work; there was also typo in prev=
ious file.
=20
I attach localfiles-loopup.inc in case it is handful for OE.
In few words: it picks FILE_DIRNAME, tries to guess prefix based on BBPAT=
H entries, then joins suffix with each BBPATH entry. The result is put in=
to FILESPATHBASE which is used to pick local files.=20
At the same time I do not understand how BBFILE_COLLECTIONS works, so the=
re might be problems with it.


------QfT1LvY3-1NNsqHbwVanBLBhn:1292603916
Content-Type: application/octet-stream; name="localfiles-lookup.inc"
Content-Disposition: attachment
Content-Transfer-Encoding: base64

IyBSZXBsYWNlIEZJTEVTUEFUSEJBU0UgdG8gZm9yY2UgQml0YmFrZSB0byBsb29rIGluIGV2ZXJ5
IGZvbGRlciAKIyAgZGVmaW5lZCBpbiBCQlBBVEggd2hlbiB0cnlpbmcgdG8gZmluZCBsb2NhbCBm
aWxlcwoKZGVmIGxvY2FsZmlsZXNfbG9va3VwX0ZJTEVTUEFUSEJBU0UgKGRuLCBkKToKCWltcG9y
dCBiYgoJYmJwYXRoTGlzdCA9IGJiLmRhdGEuZ2V0VmFyKCdCQlBBVEgnLCBkKS5zcGxpdCgnOicp
Cglmb3IgZnAgaW4gYmJwYXRoTGlzdDoKCQlpZiBkbi5zdGFydHN3aXRoKGZwKToKCQkJc3VmZml4
ID0gZG4ucmVwbGFjZShmcCwgJycsIDEpCgkJCXJlc3VsdCA9ICcnCgkJCWZvciBsaSBpbiBiYnBh
dGhMaXN0OgogCQkJCXJlc3VsdCArPSAnOicrb3MucGF0aC5ub3JtcGF0aChsaSsiLyIrc3VmZml4
KQoJCQlyZXR1cm4gcmVzdWx0LnN0cmlwKCc6JykKCXJldHVybiBkbgoKRklMRVNQQVRIQkFTRSA9
ICIke0Bsb2NhbGZpbGVzX2xvb2t1cF9GSUxFU1BBVEhCQVNFKGJiLmRhdGEuZ2V0VmFyKCdGSUxF
X0RJUk5BTUUnLCBkLCAxKSwgZCl9IgoK

------QfT1LvY3-1NNsqHbwVanBLBhn:1292603916--
