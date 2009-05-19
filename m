Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M6LDn-00063M-8s
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 May 2009 11:02:51 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1M6L6b-0005Fp-KT
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 May 2009 12:55:25 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 May 2009 12:55:22 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <20090517212442.6E35A1893E6@amethyst.openembedded.net>
	<877i0e2ejf.wl%peter@chubb.wattle.id.au>
	<1242718731.4226.72.camel@lenovo.internal.reciva.com>
In-Reply-To: <1242718731.4226.72.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200905191255.23223.khimov@altell.ru>
Subject: Re: [oe-commits] Roman I Khimov	: (e) 	glibc-package:	fix	kernel version passed to qemu
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
X-List-Received-Date: Tue, 19 May 2009 09:02:51 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 19 May 2009 11:38:51 Phil Blundell wrote:
> I think you misunderstood what I was proposing.  Glibc would continue to
> be configured just as it is now: the only difference would be that
> _qemu_ would be set to emulate the newest kernel version that it
> supports, rather than a fixed version as previously.

As I can tell from a quick glance, there is no special handling for different 
kernel versions in QEMU. It translates syscalls from target application to 
host kernel and if we tell it to fake kernel version reported to application 
it does so and nothing more (linux-user/syscall.c in qemu). So I don't think 
there is any newest kernel version supported by QEMU for any target, it just 
doesn't care.


