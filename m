Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NHG7W-0005fA-CT
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 13:21:49 +0100
Received: by yxe5 with SMTP id 5so1488537yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 04:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=Tzqga/8k0ULHvUWIoIR517L6IW8NBXPDrYrwjQv6h6Y=;
	b=hlFv/NtgUz4s9Spb4P6Yo0UYn0lLsinkojiCmHA3Lc93sQJlfV7co5YDocrPem23i3
	n0yWGhVVSG050TeErhnk3K0Nh75nLI5a64yqhm70J7H1kpIEe48h8LnSDpC6kiPYxRH4
	Rcx+ZaHRiyNiU6E1GuXpajRml0tIitrKT3wAE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=afps3tGkih5ZSIGQ3osCdu/bvFfyRZZIv/4/DUF+a8I1y9fjSDOgTua+++YdR26ZFX
	tv7fI/za4KgOKyvPgydbiFmq9KLPx5gGV0pLgzhoSJx7xDVb16nrwR+XN7FPppjIaw40
	+DHHQvarYe9OKpvRPk4a9cg8Z1X37G7O3rfEc=
MIME-Version: 1.0
Received: by 10.100.243.34 with SMTP id q34mr5055964anh.150.1260102007043; 
	Sun, 06 Dec 2009 04:20:07 -0800 (PST)
Date: Sun, 6 Dec 2009 13:20:06 +0100
Message-ID: <ac9c93b10912060420j17c88f67x2a08d25a3a7776a1@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: qt-x11-free build issue
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
X-List-Received-Date: Sun, 06 Dec 2009 12:21:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

Noticed this pass by on the screen while building another package:

NOTE: Running task 1728 of 2418 (ID: 129,
/home/frans/oe/openembedded/recipes/qt4/qt4-x11-free_4.5.2.bb,
do_populate_staging)
NOTE: Legacy staging mode for
/home/frans/oe/openembedded/recipes/qt4/qt4-x11-free_4.5.2.bb
NOTE: Running task 1729 of 2418 (ID: 131,
/home/frans/oe/openembedded/recipes/qt4/qt4-x11-free_4.5.2.bb,
do_package)
NOTE: The path does not
exist:/home/frans/oe/tmp_angstrom/work/armv5te-angstrom-linux-gnueabi/qt4-x11-free-4.5.2-r13.3/image/usr/lib/qt4/plugins/accessible/
NOTE: The path does not
exist:/home/frans/oe/tmp_angstrom/work/armv5te-angstrom-linux-gnueabi/qt4-x11-free-4.5.2-r13.3/image/usr/lib/qt4/plugins/decorations/
NOTE: The path does not
exist:/home/frans/oe/tmp_angstrom/work/armv5te-angstrom-linux-gnueabi/qt4-x11-free-4.5.2-r13.3/image/usr/lib/qt4/plugins/gfxdrivers/
NOTE: The path does not
exist:/home/frans/oe/tmp_angstrom/work/armv5te-angstrom-linux-gnueabi/qt4-x11-free-4.5.2-r13.3/image/usr/lib/qt4/plugins/graphicssystems/
NOTE: The path does not
exist:/home/frans/oe/tmp_angstrom/work/armv5te-angstrom-linux-gnueabi/qt4-x11-free-4.5.2-r13.3/image/usr/lib/qt4/plugins/mousedrivers/
NOTE: The path does not
exist:/home/frans/oe/tmp_angstrom/work/armv5te-angstrom-linux-gnueabi/qt4-x11-free-4.5.2-r13.3/image/usr/lib/qt4/plugins/styles/

Guess some mkdirs is missing, but probably the real solution is to
move to the new staging.
(but I am not daring enough yet to touch qt)

FM


