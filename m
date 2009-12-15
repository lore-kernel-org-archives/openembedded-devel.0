Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NKUBg-0003YC-P5
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Dec 2009 10:59:27 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NKU9z-0002TL-MV
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Dec 2009 09:57:39 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NKU9z-0007du-DH
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Dec 2009 09:57:39 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <op.u4y295q0mn1qzu@guohr-laptop-ubuntu>
References: <op.u4y295q0mn1qzu@guohr-laptop-ubuntu>
Date: Tue, 15 Dec 2009 09:57:35 +0000
Message-Id: <1260871055.779.337.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Compile eglibc for x86 failed.
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
X-List-Received-Date: Tue, 15 Dec 2009 09:59:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-12-15 at 17:28 +0800, Guo Hongruan wrote:
> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r4/build-i586-oe-linux/elf/librtld.os:  
> In function `_dl_tlsdesc_dynamic':
> (.text+0x141f5): undefined reference to `__i686.get_pc_thunk.bx'
> collect2: ld returned 1 exit status

See tls_i486.patch from recipes/glibc/files/.

p.




