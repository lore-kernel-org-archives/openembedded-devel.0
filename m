Received: from [209.85.132.249] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elena.valhalla@gmail.com>) id 1KsY7R-0008GY-5Z
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Oct 2008 09:27:01 +0200
Received: by an-out-0708.google.com with SMTP id b38so157587ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2008 00:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type:references;
	bh=6MetanX/RWvxuBMMRKHS64YDJEMsZaKZpKzT40OzE9o=;
	b=xgNKzIlUTjHAOtcsO/jzRHCuZ/YHWfCpS92Mj11DAHDZqXPV3KTsx0ZjlXQdfv8Mq+
	9qhjN+FWlfiCgLgqdLw72lFMz0/7KOEv7cpw4tGALR81082kzR6jF6EZB4Jh9O4OZStJ
	YS3ylmoBQWLR6Zw3yG+dmrhPR3VU5KujnoU2c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:references;
	b=Er2PEUccIPB2zCurGjxYA2MLOw2uPEZkvhwSu2BLD9Q7E2+FLmv6GhM0v+WT5Fz/rC
	xOGDlGj8vc5sBlI2a9bb/N9kCtTuVgrXugWJNeUowGiigp/Vt7B0AT5Xqz50t6WwYonc
	kDqLCjgIocqy03efJxW4U4R2x74ILCd2fXdVs=
Received: by 10.100.31.10 with SMTP id e10mr11191175ane.12.1224660395523;
	Wed, 22 Oct 2008 00:26:35 -0700 (PDT)
Received: by 10.100.139.7 with HTTP; Wed, 22 Oct 2008 00:26:35 -0700 (PDT)
Message-ID: <5c5e5c350810220026o1adcbd70vad18af00ada90793@mail.gmail.com>
Date: Wed, 22 Oct 2008 09:26:35 +0200
From: "Elena of Valhalla" <elena.valhalla@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <5c5e5c350810140623t33258c83i6f945b8212b44eb6@mail.gmail.com>
MIME-Version: 1.0
References: <5c5e5c350810140623t33258c83i6f945b8212b44eb6@mail.gmail.com>
Subject: ctorrent recipes, a mistake of mine in the bugtracker and problems with autotools versions
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
X-List-Received-Date: Wed, 22 Oct 2008 07:27:01 -0000
X-Groupsio-MsgNum: 6332
Content-Type: multipart/mixed; 
	boundary="----=_Part_19517_5391015.1224660395483"

------=_Part_19517_5391015.1224660395483
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Sorry for the double post: I found out that this ML would probably be
more appropriate after I sent this mail to the users mailing list and
didn't receive an answer

A few month ago I had posted on the bugtracker a recipe for the
enhanced version of ctorrent

http://bugs.openembedded.net/show_bug.cgi?id=4278

I have then found a few problems that can be easily fixed and another
one I need help with (the number 4 in this email)

=== PROBLEM 1 (distraction of mine) ===

The first problem is a mistake of mine: after a while I lost the first
bug (probably didn't receive the email when it was closed, and
couldn't find it when searching for open bugs), so I though I didn't
submit it and opened another bug

http://bugs.openembedded.net/show_bug.cgi?id=4506

can please someone mark it as a duplicate of the one above? I tried to
do so but it doesn't seem to work: do I need some permission?

=== PROBLEM 2 (with fix) ===

Then, I've tried to test the (modified) ctorrent recipes in the dev
tree, but I've found a couple of problems:

at first the ctorrent_3.3.1.bb recipe didn't build anything; that was
easily found to be a directory name problem, solved by adding

S = "${WORKDIR}/ctorrent-dnh${PV}"

=== PROBLEM 3 (with fix) ===

The ctcs_1.4.1.bb recipe had another problem caused by a missing " in  the
DESCRIPTION += This is the controller of the enhanced version"
              ^
line

=== PROBLEM 4 (help required) ===

The next problem seems to be related to the autotools version:
ctorrent dies in the do_configure task with the error:

aclocal.m4:14: error: this file was generated for autoconf dnh3.3.1.
You have another version of autoconf.  If you want to use that,
you should regenerate the build system entirely.

(full log attached - note that the same error happens also without icecc)

Here I'm at a loss: I've googled for a solution to this kinds of
error, but I couldn't find anything except for some hackish
workarounds

could somebody please point me to some related documentation, so that
I can try and finish fixing the recipe and then post working patches
on the bugtracker

thanks in advance

-- 
Elena of Valhalla

homepage: http://www.trueelena.org
email: elena.valhalla@gmail.com

------=_Part_19517_5391015.1224660395483
Content-Type: application/x-gzip; name=log.do_configure.31114.gz
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fmajp2hx0
Content-Disposition: attachment; filename=log.do_configure.31114.gz

H4sICJWY9EgAA2xvZy5kb19jb25maWd1cmUuMzExMTQA7Vbfc9M4EH73X7FvBwOWGxo6TCAMxpfQ
zOSSTuJy8FQUeWNrsKWOJOcHf/2tnDahV9Npud7wQiYTW6tvP0m7364ymaaDHlh04AoEKVAY5BWg
WkmjVYXKwYobyRcl2h6cxelpP6qtiRZSRR4tokJXGGmMMlxFrrqMrOO5VHkkT16dhKVU9ebg8JJM
XOXWGV3t5nr39bdEcG9wK1YYbW2zh/b5Fq57L9rg9KWLKq200wpvLrGQbsG/3jLSwO+21IKXh2Hz
sh/lvEL7HJIkTk4HF78T8KsSMEoGSXKRJP2WGIa5EHvEp0/tkGfPriEfB7P5aDrp3xUgSm1btg7D
tsmCmyzsshesGzbSuLCiwIw5blj+LeC10xUFAZ58mJzD9egpdFjnKPjbSOdQwWILqa4gJVLcwhvX
PN8ZzArumNDV2wB2H64yiEvc0NMg/FkbdOG4dt/gDc/Kd7mqmTb5WxYEib7cGpkXDl4cHZ3A0CDC
XC/dmpPfUNcq405qRcFRggVpIS3Qd+lh9gr2mhoUNg3K6toIhKU2IIiXREBPlUnPYBlAWiCxkv9k
GpCn4cptXwMpAnBFp/N+fw1myWk8SeP3o/Eo/QxkGo7SyWA+h+F0BjE1uVk6Ss7H8QzOzmdn0/mA
BfF5Ov3oeTvBpOmYgw2K2vn1fSAN0i6WEIYrNAttkd6kIpWWJb3RosJbcCPKOsO+d7jUkjprOIJb
Glhr87Ut85GgZQz14/CYHbNOaI4OlkwVjTEixh8XSwtnU9ekGoy4aIog7LRu6kEcwSEiFCfl0Pgw
ZZJMZN/CF/bHDYj/lTkJiHHRa3JVW+/xAUmRG3cDa2qlaK4HV2v9LyH8j+d/jBjuZXNHpJzhggiD
KxdWdXudbg/QGG1o1hfSUpYIa24hR4WGO8yaEvCcjWCvT82Cz7qGgq+Q6lpToRkgJVsqKtDLPZzq
a7SELSHXVFfgNCXKlyV3zwNvtYWuywwMXq/WlOyilmS0W+vQ/69wpINyy/69a4+ksoCS6nSnoKrr
sHdHGG/fblUXlpxOnMFaugJwIx0Q3NX0z+Xk+F6aG8uF07ps19xD9rIPse8Eu7p/bJ3+mPjBcn0k
qu+aHTVfHzTbb+603xr9CY3+lNzuIh/GaTzufX9h4e4WoxDu/FjwD/gTyRUQDAAA

------=_Part_19517_5391015.1224660395483--
