Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QtPdU-0001tI-TW
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 21:49:16 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QtPZ3-0006qI-JU
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 21:44:41 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CAOd_LFx5+NyXY4cTZ76yfccaFea8_WsFm2t_ZnkLk1xKD9Xzyw@mail.gmail.com>
References: <CAOd_LFx5+NyXY4cTZ76yfccaFea8_WsFm2t_ZnkLk1xKD9Xzyw@mail.gmail.com>
Date: Tue, 16 Aug 2011 20:44:36 +0100
Message-ID: <1313523876.3630.14.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: error building PXA270 target with oe-core/angstrom
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
X-List-Received-Date: Tue, 16 Aug 2011 19:49:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-16 at 15:32 -0400, Cliff Brake wrote:
> | ../libcpp/libcpp.a(files.o): In function `validate_pch':
> | files.c:(.text+0x1978): undefined reference to `fprintf_unlocked'
> | ../libcpp/libcpp.a(line-map.o): In function `linemap_check_files_exited':
> | line-map.c:(.text+0xfa): undefined reference to `fprintf_unlocked'
> | ../libcpp/libcpp.a(line-map.o): In function `linemap_add':
> | line-map.c:(.text+0x258): undefined reference to `fprintf_unlocked'
> | line-map.c:(.text+0x308): undefined reference to `fprintf_unlocked'
> | ../libcpp/libcpp.a(symtab.o): In function `ht_dump_statistics':
> | symtab.c:(.text+0x1cc): undefined reference to `fprintf_unlocked'

That looks rather like something is wrong with your host's build
environment.  Apparently gcc has decided that you have fprintf_unlocked
and using it would be a good idea.  AFAIK, there are no glibcs in the
wild which do actually implement fprintf_unlocked so it seems that gcc
must be mistaken in its belief.

I think you might need to do a bit of poking at config.log to see what's
up.

p.




