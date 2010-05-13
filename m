Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OCUhG-0004LG-EO
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 11:27:17 +0200
Received: by fxm11 with SMTP id 11so993632fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 02:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=WoE1l42LMsKCOpHl4CGPnnpqPR0sXiRmJN5eYQgE77c=;
	b=Xq1zZpgFAMNsl1TdIs3Z9VGQ0yyQWdyaENT4RZMFC2e7VG9d/kyscOzYPv+0vvN/+s
	G3gHPtAGHAlHXctcmCweqxGFOOg9KTuBajdfS2PumS+0IjGtOpNqr0cASdIDvtLL0O17
	UbqS0a/JUxA8idqH8xAb27h43NRUMKrGU9Xt0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=VsH4REhR5hdgtUb6Z3u8nQJIxqYi4Q/7GqSiIO2lqAZMAEeIeA7Z/txRQGAwOVnWNB
	7mHrihcqKZbQJaHxkIUtZkBmX0QFT1sEjr0sGzwPEXhvI7cRmqRCE/dM7bh6flUF34bH
	CuZQ6KKmUe6UuYImI8A38dbx2vZ2kq/zUloLE=
Received: by 10.223.26.154 with SMTP id e26mr1517923fac.57.1273742599456;
	Thu, 13 May 2010 02:23:19 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm4966867fad.22.2010.05.13.02.23.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 13 May 2010 02:23:18 -0700 (PDT)
Date: Thu, 13 May 2010 11:23:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100513092320.GE3370@jama>
References: <alpine.DEB.2.00.1005121722300.14972@lynx>
	<201005131223.22252.khimov@altell.ru> <20100513084633.GC3370@jama>
	<201005131259.13508.khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <201005131259.13508.khimov@altell.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: some possible fixes in the OE web pages
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
X-List-Received-Date: Thu, 13 May 2010 09:27:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, May 13, 2010 at 12:59:13PM +0400, Roman I Khimov wrote:
> В сообщении от Четверг 13 мая 2010 12:46:33 автор Martin Jansa написал:
> > On Thu, May 13, 2010 at 12:23:22PM +0400, Roman I Khimov wrote:
> > > Well, as the problem is in the kernel really, I think everyone having
> > > this problem should push distro maintainers to update kernels with the
> > > tiny fix mentioned above. But as a workaround, yep, "0" setting might
> > > work (beware that it might also not work as in here:
> > > https://bugs.launchpad.net/ubuntu/+source/linux/+bug/423513
> > > ).
> > 
> > Another not tested workaround:
> > 
> > as qemu can work with (hopefully any) non-zero mmap_min_addr, maybe add
> > patch to linux-user/main.c that if it cannot read
> > /proc/sys/vm/mmap_min_addr then assume 65536 (ubuntu default)?
> 
> Fedora has the same default, so this should work.

Can we compare this simple test between working and non-working systems?

This is from working gentoo 2.6.34-rc7:

bitbake@jama ~/mmap-test $ wget http://build.shr-project.org/tests/jama/mmap-test.c
bitbake@jama ~/mmap-test $ gcc mmap-test.c -o mmap-test
bitbake@jama ~/mmap-test $ ./mmap-test
cannot read value from /proc/sys/vm/mmap_min_addr
bitbake@jama ~/mmap-test $ strace ./mmap-test
execve("./mmap-test", ["./mmap-test"], [/* 26 vars */]) = 0
brk(0)                                  = 0xded000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f7647150000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=22777, ...}) = 0
mmap(NULL, 22777, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f764714a000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\200\354\1\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=1424560, ...}) = 0
mmap(NULL, 3533704, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f7646bd5000
mprotect(0x7f7646d2a000, 2097152, PROT_NONE) = 0
mmap(0x7f7646f2a000, 20480, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x155000) = 0x7f7646f2a000
mmap(0x7f7646f2f000, 19336, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f7646f2f000
close(3)                                = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f7647149000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f7647148000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f7647147000
arch_prctl(ARCH_SET_FS, 0x7f7647148700) = 0
mprotect(0x7f7646f2a000, 16384, PROT_READ) = 0
mprotect(0x600000, 4096, PROT_READ)     = 0
mprotect(0x7f7647151000, 4096, PROT_READ) = 0
munmap(0x7f764714a000, 22777)           = 0
brk(0)                                  = 0xded000
brk(0xe0e000)                           = 0xe0e000
open("/proc/sys/vm/mmap_min_addr", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f764714f000
read(3, 0x7f764714f000, 1024)           = -1 EPERM (Operation not permitted)
fstat(1, {st_mode=S_IFCHR|0620, st_rdev=makedev(136, 16), ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f764714e000
write(1, "cannot read value from /proc/sys"..., 50cannot read value from /proc/sys/vm/mmap_min_addr
) = 50
close(3)                                = 0
munmap(0x7f764714f000, 4096)            = 0
exit_group(0)                           = ?

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


