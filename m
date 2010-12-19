Received: from fallback1.mail.ru ([94.100.176.18])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nyrl@mail.ru>) id 1PUNLR-0001Le-Hy
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Dec 2010 18:46:53 +0100
Received: from f212.mail.ru (f212.mail.ru [217.69.128.149])
	by fallback1.mail.ru (mPOP.Fallback_MX) with ESMTP id A23C21F89F32
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Dec 2010 20:41:04 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail; 
	h=Message-Id:Content-Type:Reply-To:Date:Mime-Version:Subject:To:From;
	bh=2OaoXzmlS4zUIV5dUIDxG58ZKgWV8IbQOXCUgR5ykBA=; 
	b=LskLHlt7Dw0fxWxTFPnAwgU9RlSJFg7noUcmryubbN6zXdKUFxJ2EbtEI+pYWJEE12dh2TJ6n9p68y7/IMeR1JCWsUAL/QKeuYGg5rsOX/Ci6D8mrDgkkaDgZVELVyz5;
Received: from mail by f212.mail.ru with local id 1PUNFl-0004B8-00
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Dec 2010 20:41:01 +0300
Received: from [95.55.187.105] by win.mail.ru with HTTP;
	Sun, 19 Dec 2010 20:41:01 +0300
From: Denis Dydychkin <nyrl@mail.ru>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0
X-Mailer: mPOP Web-Mail 2.19
X-Originating-IP: [95.55.187.105]
Date: Sun, 19 Dec 2010 20:41:01 +0300
Message-Id: <E1PUNFl-0004B8-00.nyrl-mail-ru@f212.mail.ru>
X-Spam: Not detected
X-Mras: Ok
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Source distribution broken?
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
X-List-Received-Date: Sun, 19 Dec 2010 17:46:53 -0000
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: quoted-printable



> Is the source distribution functionality broken?

> The only thing that is stored in the TMPDIR/deploy/glibc/sources is a M=
IT
> directory with the minimal-image/minimal-image.bb file.

> If set to something else instead of "do_build" like "do_compile" will t=
rigger a
> lot of src_distribute calls and copying of files for a lot of licenses =
to
> TMPDIR/deploy/glibc/sources.

Try bitbake minimal-image -c buildall

As far as I got it, do_build target is *not* invoked for each dependent p=
ackage while building image since it is not required (unlike do_compile w=
hich is required). To ensure that do_build is called for each packet belo=
nging to image, you should use do_buildall target for whole image.

I suppose (never tried) that calling bitbake minimal-image -c distribute_=
sources_all is enough to generate sources if you just need them.


