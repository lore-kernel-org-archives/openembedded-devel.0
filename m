Received: from [213.39.232.198] (helo=mail.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <di@fh-wedel.de>) id 1MDO23-0006Us-3O
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 21:27:51 +0200
Received: by mail.fh-wedel.de (Postfix, from userid 959)
	id 39BC2547D3; Sun,  7 Jun 2009 21:18:25 +0200 (CEST)
Date: Sun, 7 Jun 2009 21:18:25 +0200
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090607191824.GB28536@fh-wedel.de>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <20090607175542.GA26712@fh-wedel.de> <h0h0el$60i$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <h0h0el$60i$1@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Still not solved: glibc-dbg and insane.bbclass
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
X-List-Received-Date: Sun, 07 Jun 2009 19:27:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, June 07, 2009, Koen Kooi wrote:

> What's exactly breaking? It's perfectly legal (and needed for depchains!) 
> for -dbg package to be empty.

This is the QA error I am getting:

| % cat log.qa_package
| wrong architecture, glibc-dbg, /work/mipsel-nylon-linux/glibc-2.3.3-r17/install/glibc-dbg/lib/.debug/ld-2.3.3.so
| wrong architecture, glibc-dbg, /work/mipsel-nylon-linux/glibc-2.3.3-r17/install/glibc-dbg/lib/.debug/libc-2.3.3.so

And this is what the files look like:

| % file  /var/src/OE/tmp/work/mipsel-nylon-linux/glibc-2.3.3-r17/install/glibc-dbg/lib/.debug/ld-2.3.3.so
| /var/src/OE/tmp/work/mipsel-nylon-linux/glibc-2.3.3-r17/install/glibc-dbg/lib/.debug/ld-2.3.3.so: ELF 32-bit LSB no file type, no machine, invalid version (SYSV)
| % file  /var/src/OE/tmp/work/mipsel-nylon-linux/glibc-2.3.3-r17/install/glibc-dbg/lib/.debug/libc-2.3.3.so
| /var/src/OE/tmp/work/mipsel-nylon-linux/glibc-2.3.3-r17/install/glibc-dbg/lib/.debug/libc-2.3.3.so: ELF 32-bit LSB no file type, no machine, invalid version (SYSV)

The files are practicall empty (here libc-2.3.3.so): 

7f 45 4c 46  01 01 01 00  00 00 00 00  00 00 00 00  .ELF............
00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  ................
00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  ................
00 00 00 00  01 00 00 00  03 00 00 00  00 00 00 00  ................
00 00 00 00  00 00 00 00  0b 00 00 00  00 00 00 00  ................
00 00 00 00  01 00 00 00  00 00 00 00               ............

For whatever reason the build creates those files in .debug
even though the build is performed without debug code.

Cheers,

M'bert

-- 
----------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
"This has been the most frustrating week in my life for a very long time."
 -- Australian soccer legend Paul Wade at Australia vs. Brazil in 1999 --


