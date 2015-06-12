Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 72C887324E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jun 2015 08:16:16 +0000 (UTC)
Received: by igbsb11 with SMTP id sb11so6553446igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jun 2015 01:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=wrhe5o+jMrpSposjVgxVvnLvxlZkmYhJhZo8ZFk4hsE=;
	b=GQHLEyaqc48ehHSh+l9O5vFzhdV5Y1wvkHo8YQ+ZL//eYQA8L5WbzPCHZL7WeOwtW4
	oCrvmkIUDc4nDyvmkkPgJ2jIX/o0LdJ7XDHS+ZL8oNUpLmZaCE4jkOSmzbBo2Jmk+rBv
	SK54lytNjfoSEJ3FgYcApjF8jC7c8moYyQZKs/fKiQk7UqdV96HqS4Ap1nPBXi8J3H/7
	Gs5jgP4Koo84dmDSyNl9uO43TCa//ZeQXvd6xSfXNEIf+PYVd+yWUWsGxt9tC48puNGF
	HeIbVtfwvwMg904lQdFbv95JN9u8sZD8EJSAIptxXVmVswl/fZ6YV0Cj7oZnfqRkIU0R
	JYvA==
MIME-Version: 1.0
X-Received: by 10.50.80.19 with SMTP id n19mr2802566igx.30.1434096977419; Fri,
	12 Jun 2015 01:16:17 -0700 (PDT)
Received: by 10.36.1.197 with HTTP; Fri, 12 Jun 2015 01:16:17 -0700 (PDT)
Date: Fri, 12 Jun 2015 11:16:17 +0300
Message-ID: <CADnUhn1U1vmKZH2QcV_t9e1X9HC=BLZceB73G=zYxqpCBdFZSA@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: klibc_2.0.4.bb crashes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Jun 2015 08:16:16 -0000
Content-Type: text/plain; charset=UTF-8

Hi!

klibc_2.0.4.bb recipe linking crashes with following error messages.
arm-poky-linux-gnueabi-ld: error:
.../sysroots/am335x-evm/usr/lib/arm-poky-linux-gnueabi/4.9.2/libgcc.a(bpabi.o)
uses VFP register arguments, usr/klibc/libc.so does not
arm-poky-linux-gnueabi-ld: failed to merge target specific data of file
.../sysroots/am335x-evm/usr/lib/arm-poky-linux-gnueabi/4.9.2/libgcc.a(bpabi.o)

I'm checked out fido branch of meta-openembedded.

Any help warmly appreciated!

Thanks,
Matti

