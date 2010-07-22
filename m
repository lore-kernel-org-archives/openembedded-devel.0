Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oc2aE-0000e2-Jv
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Jul 2010 22:41:36 +0200
Received: by bwz10 with SMTP id 10so1240952bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jul 2010 13:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=NCzHO9PEIZSPl2noJftMTNA1GUUqHlgedQZzWyVyLvc=;
	b=pgYKy67pdMJIoSzEHuoHj/nfT4Rd7tzzt0N+WuQyxYNVKu+2zH7jWaXkTy14PU7nuC
	0r5xKQkgPVzCNmXBCXkGNI5YeQF0K4dq2Zi7VZua7I+LTIisKu7tSESVmjAAWYKRMKS3
	O563RZJu3HTljtXTai7NeaV/0QNgkmC/gfoio=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=l9BSF8Tusk49udKH4cQAoO3T66pI3kVShMidUjoE41AMhiDS0qbSnw9rYoHsM9gQGS
	WmMAjOMIPuqG4bKHx0WiWMItefUxsbVr2ceEw8wERO9Qdi6qf8DJpb0PidtlRCoU4vtr
	42WHRKOEcQucfxeQNjQOvbCLdpvz85kRJ5XXM=
MIME-Version: 1.0
Received: by 10.204.81.14 with SMTP id v14mr2025640bkk.7.1279831279135; Thu, 
	22 Jul 2010 13:41:19 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Thu, 22 Jul 2010 13:41:19 -0700 (PDT)
Date: Thu, 22 Jul 2010 22:41:19 +0200
Message-ID: <AANLkTinwgeYKdpLSQs7pSftxdCcUeGBppIfYj5ChLnIV@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: gcc/gettext isssue ?
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
X-List-Received-Date: Thu, 22 Jul 2010 20:41:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

When building gcc I get:
NOTE: Gettext required but not in DEPENDS for file
/home/frans/oe/tmp_angstrom/work/nios2-linux/gcc-cross-4.1.2-r23.1/gcc-4.1.2/intl/
configure.ac.
Missing inherit gettext?

but gcc-common.inc (which is included indirectly from every gcc recipe)
says:
gcc-common.inc:inherit autotools gettext

What is wrong here?
How can I resolve this?

Frans

