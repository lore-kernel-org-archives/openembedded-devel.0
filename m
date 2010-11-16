Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PI9XN-0005Xf-UK
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 01:36:42 +0100
Received: by yxd5 with SMTP id 5so46123yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Nov 2010 16:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=CtXmaTIwbgZdtjZFAcWZji09WN5bafr9FtP1rX+SQj8=;
	b=KrDMjZ4aHC6k9Hs7A/rTC86SqkcYsMSvRBEpfjLI66OhG+gIfreoDSbN4lEVjt4Gi5
	N0fKHKO4xeHafpY4xpYc7B90zzQK2Y43OKRG30lLAQjcsLDp68kQ0RECDkH9AkPRXaBR
	SVEjmczBp3VhTOc7f0Rtgo8mGfPSqMcdfgZBc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=myqgVSnnlW1HRuppiR+mJgnRFNKYvjupy27En3E5NUf5sHVj5EWjMEZThbABhxYMPv
	ICQPYqbwtIgXvNg4VcN5LZwU6jZsjCRjuyrgFUQXlgpAWg2aW7OCl4vzVmeyehrsx6Tl
	yoVyXQMDFgFToYRf6aw/KRSX4bppCiC9yrCdY=
Received: by 10.100.13.2 with SMTP id 2mr4672909anm.92.1289867736908;
	Mon, 15 Nov 2010 16:35:36 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	c39sm4352178anc.21.2010.11.15.16.35.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 15 Nov 2010 16:35:35 -0800 (PST)
Message-ID: <4CE1D1D1.1000009@gmail.com>
Date: Tue, 16 Nov 2010 11:05:29 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: emacs copying ${STAGING_DIR_TARGET} - wtf?
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
X-List-Received-Date: Tue, 16 Nov 2010 00:36:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

emacs.inc has this nugget in do_compile_prepend():
cp -pPR ${STAGING_DIR_TARGET}/* $treedir

During a world build, both emacs and emacs-x11 copy some 5GB into
their work dirs. This really seems like overkill.

Could someone familiar with building emacs take a look to see if
there is a reasonable alternative?

thanks,
-Graham

PS: emacs and emacs-x11 fail for me in do_compile.

NOTE: make -j 12 QEMU=qemu-mipsel  -s 1048576 -L /mnt/oe/tmp/work/mipsel-oe-linux/emacs-22.3-r1/qemu-treedir 
cd lib-src; make all - --jobserver-fds=3,22 -j \
	  CC='mipsel-oe-linux-gcc -march=mips32' CFLAGS='-isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os' CPPFLAGS='-D_BSD_SOURCE  -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux/usr/include' \
	  LDFLAGS='-L/mnt/oe/tmp/sysroots/mipsel-oe-linux/usr/lib -Wl,-rpath-link,/mnt/oe/tmp/sysroots/mipsel-oe-linux/usr/lib -Wl,-O1 -Wl,-znocombreloc' MAKE='make'
make[1]: Entering directory `/mnt/oe/tmp/work/mipsel-oe-linux/emacs-22.3-r1/emacs-22.3/lib-src'
Makefile:149: *** commands commence before first target.  Stop.
make[1]: Leaving directory `/mnt/oe/tmp/work/mipsel-oe-linux/emacs-22.3-r1/emacs-22.3/lib-src'
make: *** [lib-src] Error 2
FATAL: oe_runmake failed


