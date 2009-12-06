Received: from mail-ew0-f224.google.com ([209.85.219.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHO4w-0004KQ-8K
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 21:51:41 +0100
Received: by ewy24 with SMTP id 24so4787451ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 12:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=q28Dd+V0fu59qoRdBu+HO3nCQVUn5KQIHd39JyB3X7o=;
	b=GjxoLtouzpvY2zO7E3NAdZ/v/88xiy/SlM4KPvgseCXTbVSuQhSddPXNUSyWnS7Pf+
	QiYNzbIL4ffmEThTW6RYCZ+ARzEwdWRRbn5hOo6Qelh0yZLVhKUb+J6PrkhLGzCzG0KR
	UJ2seH0LL+4Q2xS1CVE0/YLu0rR+x9HsfmGgs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=mtMOku/JWL2RfP0q/ZEGtHvXcyZfA3fGD45fkhK0V8FxWmSq4WY8x4uRdAWUHLyLKZ
	wMU3QrcUevO3jsgEWH3T1So6n1n1CIIMDeztG+qwV7/fWc+tqWgm34dwdETEv2QxfY68
	f8Vjj4pK6VU369eEMzTdW4Ice3Id1JgwKl3bk=
MIME-Version: 1.0
Received: by 10.213.102.65 with SMTP id f1mr7092884ebo.61.1260132599058; Sun, 
	06 Dec 2009 12:49:59 -0800 (PST)
Date: Sun, 6 Dec 2009 21:49:59 +0100
Message-ID: <c384c5ea0912061249g6201f0adwc6ff58ff20d68331@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.219.224
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC] toolchain team question about libiberty.a
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
X-List-Received-Date: Sun, 06 Dec 2009 20:51:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

can we safely remove this from gcc/gcc-configure-cross.inc?

do_stage_append () {
        ...
        # We use libiberty from binutils
        rm -f ${CROSS_DIR}/lib/libiberty.a
        ...

I think it even races against binutils; on some of my (multithreaded)
builds I get it, sometimes not.

I need it for a new architecture.

Regards,
-- 
Leon


