Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NR8SQ-0003zT-Gz
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jan 2010 19:12:13 +0100
Received: from [85.210.22.104] (helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NR8QT-0000hQ-7i
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jan 2010 18:10:09 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1262452243-8187-1-git-send-email-Martin.Jansa@gmail.com>
References: <1262452243-8187-1-git-send-email-Martin.Jansa@gmail.com>
Date: Sat, 02 Jan 2010 18:10:05 +0000
Message-ID: <1262455806.2553.90.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.22.104
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] sanity.bbclass: Reading /proc/sys/vm/mmap_min_addr is not permitted with 2.6.33+ on host
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
X-List-Received-Date: Sat, 02 Jan 2010 18:12:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2010-01-02 at 18:10 +0100, Martin Jansa wrote:
> * With 2.6.33-rc2-00252-ge9e5521 on my host I noticed that
>   "cat /proc/sys/vm/mmap_min_addr" returns now
>   "cat: /proc/sys/vm/mmap_min_addr: Operation not permitted"
>   Its probably becuse of
>   http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=0e1a6ef2dea88101b056b6d9984f3325c5efced3
>   But I'm not sure if checking CAP_SYS_RAWIO even for reading this value
>   is intentional or just bug which should be fixed in kernel.
> 
> * This patch prints notice about need to check that value yourself (as
>   root) instead of failing with "ERROR: IO Error: [Errno 1] Operation
>   not permitted"
> 
> * Its not optimal, because this notice is shown every time you run
>   bitbake (even after checking/setting 0 to mmap_min_addr if you have
>   kernel not allowing to read it
> 

That does sound fairly unsatisfactory.  Printing a diagnostic on every
build, with no way for the user to suppress it, surely can't be the way
of the future.

If you can't tell whether mmap_min_addr is set correctly or not then it
would probably be better to not show the diagnostic at all.  Perhaps you
could investigate patching qemu to print a more meaningful message if it
actually encounters a mmap() failure of this kind.

p.




