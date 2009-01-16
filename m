Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1LNrDz-0004Jo-Qo
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jan 2009 17:07:11 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id E96B66280F9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2009 17:00:27 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d1b08f940901160534n2d204a36r43494e1a6ed855c5@mail.gmail.com>
References: <d1b08f940901150928h56ede408u2d070606fbe6b7bc@mail.gmail.com>
	<1232109249.4988.2686.camel@hammer.suse.cz>
	<d1b08f940901160534n2d204a36r43494e1a6ed855c5@mail.gmail.com>
Date: Fri, 16 Jan 2009 17:00:27 +0100
Message-Id: <1232121627.4988.2795.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1.1 
Subject: Re: ARM bootloaders (Zaurus) and CMDLINE
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
X-List-Received-Date: Fri, 16 Jan 2009 16:07:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Andrea Adami wrote:

> For reference I'll post the disassembled bootloader as found in this post:
> 
> http://www.oesf.org/forum/index.php?showtopic=3361&hl=only+root
> 
> This was back in 2004...preparatory work for the extended updater
> capable to resize nand (sources in survive / fsro_resize.c).

Thanks for the reference.

> So, writing a new partition schema is possible...the problem is read
> it with 2.6.2x kernels!

My previous mail contains a patch porting nandlogical to kernel 2.6
userspace. Porting to kernel space may require some work.

Kernel 2.4 used a trick - user space utility called writerominfo read
some of these values and sent them to kernel.


Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



