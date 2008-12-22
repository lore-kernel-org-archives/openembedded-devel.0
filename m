Received: from [209.85.218.15] (helo=mail-bw0-f15.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LEmHU-0003oy-Be
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Dec 2008 16:01:17 +0100
Received: by bwz8 with SMTP id 8so4974768bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Dec 2008 06:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=Quin88VhWUnBAgpH2UWUSCVGdEtm+HfNfQWTri3EadA=;
	b=jtgY6PfJCsS+lyvqEec/wDA2wjJF6zaFpBCg8ojzi22v1KJOP0P41t5wITwnmguups
	QwBYptKyVBOpB0fEHQJlvYjKBIax579DEUoYZBubnxgNncUH8KegAt3Dqt59LEMEBaX0
	mzzmbNXzFgIRjX9glETLqgzQfFNNTkq8+qvUA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=lQWyc4znuCVWBzbRBWPg2lA6xI7J9Px18H8S9A6jI+F8yKkM5Cv0bcfA+2OhzP9ZVD
	Hkue76FniPw3C5a5AI0FqffC1rPXhLLPgR8xSC2s3szpOfbJk4p/y6hCGD+Ty1Yo2l6E
	1S2YJ2r9G8L4xaPL9fDvCN/UJLVeezVXl2WKI=
Received: by 10.181.214.8 with SMTP id r8mr2341964bkq.206.1229957780235;
	Mon, 22 Dec 2008 06:56:20 -0800 (PST)
Received: by 10.180.252.10 with HTTP; Mon, 22 Dec 2008 06:56:20 -0800 (PST)
Message-ID: <d1b08f940812220656u73035a94i83aa41d4480ccf53@mail.gmail.com>
Date: Mon, 22 Dec 2008 15:56:20 +0100
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: libc and ARM_INSTRUCTION_SET
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
X-List-Received-Date: Mon, 22 Dec 2008 15:01:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
I'm testing uclibcgnueabi on c7x0.

Two doubts:

1) arm / thumb

Now armv5te machine defaults to "thumb" and uclibc fails do_compile:
http://tinderbox.openembedded.net/public/logs/2601805.txt

My solution offhand is to set ARM_INSTRUCTION_SET = "arm" in
uclibc.inc but perhaps someone can sort out a proper patch.

I checked how the settings are for glibc and well, the same string is in:
glibc.inc and (why?) in glibc-2.5.bb and glibc-2.7.bb which are
including glibc.inc...

2) is it actual and correct that uclibc and klibc are machine-specific?

#recent versions uclibc require real kernel headers
PACKAGE_ARCH = "${MACHINE_ARCH}"

Well, for klibc I'd say yes, it's bound to the kernel but still...I ask.

Thanks in advance

Andrea


