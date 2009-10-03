Received: from [209.85.210.175] (helo=mail-yx0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sashang@gmail.com>) id 1MttUc-000269-Do
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Oct 2009 03:33:05 +0200
Received: by yxe5 with SMTP id 5so1742934yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Oct 2009 18:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=t6LpCAHVSAUeQB7zYSFz+/CFGNLDGCxcgl7Kzg0Ed/Y=;
	b=fTFR3UKj/uaEFTLC6/c4IPHyN9QbFErVfShO3zrnOpUFfdJmgSxXjwQrgptLugWENO
	OCn4DtP62md3YdLsJHfo3AJckp4qgpq8p5xq8UeBCLpYrMVaQROYK6C4vjgxSmfSs2GW
	9tU2tgPsed2tZ6R8OR5EEHdWyDLXQMIEaPQ1k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=lyNxkmHVoZcEfOjBADWcAvVxuLfeeyYfWuL7APW43BeBnv1dloIa81Y5dOMoWyV2ip
	klIm2xzLxW3RTHyLksgBuYH/upcqzozVhYwq7YwVCw4jGtJzFaKXFamRMGC3sNnGDZvW
	cA6UmN4sN5aVgJWti7PXCTFRUHgkasQT2QKX4=
MIME-Version: 1.0
Received: by 10.101.5.34 with SMTP id h34mr3539682ani.150.1254533536132; Fri, 
	02 Oct 2009 18:32:16 -0700 (PDT)
Date: Sat, 3 Oct 2009 11:32:16 +1000
Message-ID: <23738f080910021832k712d31dcra5e2fda045a892e6@mail.gmail.com>
From: Sashan Govender <sashang@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: sashang@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: building module-init-tools-cross fails
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
X-List-Received-Date: Sat, 03 Oct 2009 01:33:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm trying out openembedded but get this error:

ERROR: function do_compile failed
ERROR: log data follows
(/home/sashan/code/openembedded/build/tmp/work/i486-oe-linux-gnu/module-init-tools-cross-3.2.2-r5/temp/log.do_compile.12217)
| NOTE: make
| gcc  -isystem/home/sashan/code/openembedded/build/tmp/staging/x86_64-linux/usr/include
-O2 -g -Wunused -Wall -static
-L/home/sashan/code/openembedded/build/tmp/staging/x86_64-linux/usr/lib
-Wl,-rpath-link,/home/sashan/code/openembedded/build/tmp/staging/x86_64-linux/usr/lib
-Wl,-rpath,/home/sashan/code/openembedded/build/tmp/staging/x86_64-linux/usr/lib
-Wl,-O1 -o insmod.static insmod.o
| /usr/bin/ld: cannot find -lc
| collect2: ld returned 1 exit status
| make: *** [insmod.static] Error 1
| FATAL: oe_runmake failed

This is my local.conf file:

DL_DIR = "${HOME}/archives"
BBFILES = ${OEBASE}/openembedded/recipes/*/*.bb
BBMASK = ""
PREFERRED_PROVIDERS = "virtual/qte:qte virtual/libqpe:libqpe-opie"
PREFERRED_PROVIDERS += " virtual/libsdl:libsdl-x11"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
PREFERRED_PROVIDERS += "
virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
MACHINE = "x86"
TARGET_OS = "linux"
DISTRO = "minimal"
IMAGE_FSTYPES = "jffs2 tar"
BINCLUDELOGS = "yes"

What am I missing?


