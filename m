Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SbTPv-0004O6-UI
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jun 2012 11:17:40 +0200
Received: by wgbdr1 with SMTP id dr1so3515339wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2012 02:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:to:mime-version:x-mailer;
	bh=oTvWUMLb0jFuh5553w7APaVJ0ge9C/mZr57gV4bSfW4=;
	b=GM2n8szSlUpxiW9toziJLaBSZ6JrHV8tIp2sZd/tSCbQ1tgPVyUOC+QnKvuPeV1APi
	FGeAnz4GJvbSsRi4m2hsH5Nu0PqirYjuNtbGGTNaHxIFsdVq+v8/YocW3XCLPHrCBFmF
	RhknspglDsEsTpyNObB0uyfBgBV/p/GqLSUe3k76J5srFvJHe8SHbsNFkDlIj8K6M3eX
	MZHfh/GlVfPgDvbn+nS/DZpNnOO1jx+54xJZBe0jrGCGx2MYgjGwueZH1mr3es1BYEcY
	a+xqtGhSDeh1g8GrbZo0OuYtgVFAl56+u5UDi+jwNEiK5uy2hZ0Xxr6u6AB+Z+GShi78
	e1mQ==
Received: by 10.216.137.147 with SMTP id y19mr2878889wei.33.1338800835380;
	Mon, 04 Jun 2012 02:07:15 -0700 (PDT)
Received: from [192.168.1.35] (197.Red-79-150-15.dynamicIP.rima-tde.net.
	[79.150.15.197])
	by mx.google.com with ESMTPS id gv4sm30351691wib.8.2012.06.04.02.07.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jun 2012 02:07:14 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Mon, 4 Jun 2012 11:07:12 +0200
Message-Id: <D40848EB-C66A-47B6-B3C0-CF743A8E032A@gmail.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
Subject: Understanding what qemuppc emulates and getting it to emulate a ppc440 CPU
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
X-List-Received-Date: Mon, 04 Jun 2012 09:17:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
      I'd like some help understanding what qemuppc emulates, while =
building the using yocto core-image-sato.

I've originally built my yocto images for a virtex5 machine, and would =
like to test it on an emulator. The Virtex-5 FXT processor is an FPGA =
which contains an embedded  PowerPC440 CPU

Now if I specify machine=3Dqemuppc, wouldn't that just be generic =
PowerPC CPU?=20

There are so many ppc CPU variants, like ppc405, ppc440, ppc603e, etc.

Can the yocto build environment be modified so that the qemuppc emulator =
emulates at least the ppc440 CPU subset?

Best regards,

Elvis Dowson



