Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MsYiP-0007zQ-Uk
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Sep 2009 11:09:49 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MsYhl-0002Sr-5K
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Sep 2009 10:09:05 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1MsYhk-0002CA-UM
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Sep 2009 10:09:05 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200909281752.11487.anarsoul@gmail.com>
References: <200909281752.11487.anarsoul@gmail.com>
Date: Tue, 29 Sep 2009 10:09:00 +0100
Message-Id: <1254215340.12689.643.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: udev problems on angstrom-2008.1
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
X-List-Received-Date: Tue, 29 Sep 2009 09:09:49 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-09-28 at 17:52 +0300, Vasily Khoruzhick wrote:
> udevd-event[1918]: mknod(/dev/vcS, 020660, (7,0) failed: No space left on 
> device

You probably need to increase the inode allocation for tmpfs.  See the
mount(8) manpage where it talks about the nr_inodes option.

p.




