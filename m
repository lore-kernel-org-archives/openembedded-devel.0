Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OJQpB-0006rj-Go
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 14:44:12 +0200
Received: from [62.7.80.98] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OJQl7-0004KZ-MZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 13:39:53 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1OJQl7-00037m-Eb
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 13:39:53 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100601123346.GC5446@jama>
References: <76E258664B189C4CBEF125491CA11ECC9445E0CF7C@KCINPUNHJCMS01.kpit.com>
	<76E258664B189C4CBEF125491CA11ECC9445E0CF7D@KCINPUNHJCMS01.kpit.com>
	<20100601123346.GC5446@jama>
Date: Tue, 01 Jun 2010 13:39:52 +0100
Message-ID: <1275395992.6382.176.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-Broken-Reverse-DNS: no host name found for IP address 62.7.80.98
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: glibc_2.9.bb do_package failed
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
X-List-Received-Date: Tue, 01 Jun 2010 12:44:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-06-01 at 14:33 +0200, Martin Jansa wrote:
> On Tue, Jun 01, 2010 at 05:35:03PM +0530, Soumya R wrote:
> > qemu-arm: relocation error: qemu-arm: symbol fcntl, version GLIBC_2.0 not defined in file libpthread.so.0 with link time reference
> > NOTE: Task failed: localedef returned an error (command was PATH="/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/bin/armv5te-angstrom-linux-gnueabi:/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/bin/armv5te-angstrom-linux-gnueabi:/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/sbin:/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/bin:/home/likewise-open/KPIT/soumyar/oe/build/tmp/cross/armv5te//bin:/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/sbin:/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/bin:/likewise-open/KPIT/soumyar/oe/bitbake/bin:/likewise-open/KPIT/soumyar/oe/bitbake/bin:/likewise-open/KPIT/soumyar/oe/bitbake/bin:/home/likewise-open/KPIT/soumyar/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games" I18NPATH="/home/likewise-open/KPIT/soumyar/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r36.3/locale-tree/
> >  usr/share/i18n" qemu-arm -s 1048576 -r 2.6.24 -L /home/likewise-open/KPIT/soumyar/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r36.3/locale-tree -E LD_LIBRARY_PATH=/home/likewise-open/KPIT/soumyar/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r36.3/locale-tree/lib  /home/likewise-open/KPIT/soumyar/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r36.3/locale-tree/bin/localedef --force --old-style --no-archive --prefix=/home/likewise-open/KPIT/soumyar/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r36.3/locale-tree --inputfile=/usr/share/i18n/locales/es_NI --charmap=UTF-8 es_NI).
>
> Are you using latest qemu-native from OE? Otherwise you still need 0 in mmap_min_addr.
> 
> Try to run that command by hand in console to see if it's the same issue.

This doesn't look like an mmap_min_addr kind of problem.  It seems like
there is some mismatch between the version of libpthread that qemu was
compiled against and the one that it is running against.  The only
obvious cause that springs to mind would be if you were sharing the
build tree between multiple hosts, and the host where qemu was compiled
is not the same as the one where it's trying to run.

> Strange, there is plenty of discussion and possible solutions discussed
> here in this ML...

I'm not sure that this particular issue has come up here before, or at
least not frequently.

p.




