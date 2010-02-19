Received: from hsp-52.hspserver.com ([85.197.80.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ml@vdm-design.de>) id 1NiNNx-0000Qa-0x
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Feb 2010 08:34:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by hsp-52.hspserver.com (Postfix) with ESMTP id 14FC5A2C3AB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2010 08:32:10 +0100 (CET)
Received: from hsp-52.hspserver.com ([127.0.0.1])
	by localhost (hsp-52.hspserver.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 9CchBlkNAqQC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2010 08:32:07 +0100 (CET)
Received: from tomboy.localnet (pD9E141BE.dip.t-dialin.net [217.225.65.190])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hsp-52.hspserver.com (Postfix) with ESMTP id 87144A2C3A7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2010 08:32:07 +0100 (CET)
From: Thomas Zimmermann <ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Feb 2010 08:32:06 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.32-8.slh.2-sidux-amd64; KDE/4.3.4; x86_64; ;
	)
References: <1265979953-4327-1-git-send-email-ml@vdm-design.de>
	<hl9u05$48d$1@ger.gmane.org>
	<19c1b8a91002181628w7a30333an148bc00cb687ca36@mail.gmail.com>
In-Reply-To: <19c1b8a91002181628w7a30333an148bc00cb687ca36@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201002190832.06903.ml@vdm-design.de>
X-SA-Exim-Connect-IP: 85.197.80.179
X-SA-Exim-Mail-From: ml@vdm-design.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] eglibc:
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
X-List-Received-Date: Fri, 19 Feb 2010 07:34:52 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Am Freitag 19 Februar 2010 01:28:57 schrieb Khem Raj:
> On Sun, Feb 14, 2010 at 2:37 PM, Koen Kooi <k.kooi@student.utwente.nl> 
wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > On 14-02-10 23:33, Florian Boor wrote:
> >> Hi,
> >>
> >> Thomas Zimmermann schrieb:
> >>> * ldd has shebang #!/bin/bash: so add bash RDEPNDS
> >>
> >> last time I checked it worked with the Busybox built-in shell as well. I
> >> wonder if it would be a good idea to verify this and patch ldd for our
> >> purposes.
> >
> > like this:
> > http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/glibc/gli
> >bc-2.4/ldd-unbash.patch ?
> 
> or patch posted in http://sourceware.org/bugzilla/show_bug.cgi?id=832
> it lets it work as it is if shell is bash.
> 
> Thx
> 
> -Khem
I tried ldd today with busyboy and it was enough to replace just the shebang:

--- /usr/bin/ldd        Fri Feb 19 08:27:44 2010
+++ /usr/bin/ldd        Fri Feb 19 08:27:51 2010
@@ -1,4 +1,4 @@
-#! /bin/bash
+#! /bin/sh
 # Copyright (C) 1996-2008, 2009 Free Software Foundation, Inc.
 # This file is part of the GNU C Library.

I think this is because we have in eglibc:

if x=`set -o` && test "$x" != "${x#*pipefail}" && set -o pipefail ; then

and the second term fails, so set -o pipefail is never executed.

I will resend this patch.

Thomas


