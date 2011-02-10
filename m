Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PnVGR-0002Op-25
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 13:04:47 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PnVFQ-0002A2-RE
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 13:03:44 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D53C412.9090804@dresearch.de>
References: <4D53C412.9090804@dresearch.de>
Date: Thu, 10 Feb 2011 12:03:55 +0000
Message-ID: <1297339435.2178.23.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: base-files vs. FHS-2.3
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
X-List-Received-Date: Thu, 10 Feb 2011 12:04:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-02-10 at 11:55 +0100, Steffen Sledz wrote:
> While dealing with the /var subdirs i hit some differences between Filesystem Hierarchy Standard (current FHS-2.3) and the base-files package.
> 
> One point is that /var/tmp is symlinked to volatile/tmp but according to the standard this dir contains "Temporary files *preserved between system reboots* ".
> 
> Also /var/cache is symlinked to volatile/cache but the standard describes "The data must remain valid between invocations of the application *and rebooting the system.* " what i would read in the way that /var/cache should be persistent too.
> 
> May be there are other differences.
> 
> In my opinion the symlinking in base-files is buggy and should be fixed. Or am i wrong here?

It probably would be good to have a version of base-files which was
fully FHS conformant.  But there are a significant number of OE target
systems where it is simply impossible to comply with these requirements
since there is no persistent read/write storage available: the only
choice is between flash (persistent but read-only) and ramdisk
(read-write but volatile).  

Clearly, placing /var/tmp or /var/cache in a readonly location is
unlikely to produce any useful results so linking them into volatile/ is
the least bad option in that situation.  Any change to base-files would
need to be done with some level of care in order to not break those
kinds of setups which do work today.  I guess it should be a DISTRO
decision whether or not to adhere to the FHS in this area.

p.




