Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1REiT3-00063N-HE
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Oct 2011 16:10:33 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1REiNW-0004ZJ-JH; Fri, 14 Oct 2011 16:04:50 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Oct 2011 15:04:49 +0100
In-Reply-To: <4E984064.3010306@dresearch-fe.de>
References: <4E984064.3010306@dresearch-fe.de>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1318601090.22985.53.camel@phil-desktop>
Mime-Version: 1.0
Cc: Dirk Nilius <nilius@dresearch-fe.de>
Subject: Re: postinst problem: module vs. update-rc.d
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
X-List-Received-Date: Fri, 14 Oct 2011 14:10:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-10-14 at 16:00 +0200, Steffen Sledz wrote:
> The 'exit 1' leads to an error if $D contains a nonzero length string (what is the case in the OE image creation step at the build host) and suppresses the execution of the second (update-rc.d) part.
> 
> Because of this error the postinst is run a second time when the target device boots the first time ("opkg-cl configure" from /etc/rcS.d/S40configure).
> 
> The problem is that the update-rc.d execution (and therefor the creation of the new symlink into rcS.d) is done from within rcS itself. So the rcS.d/S90somescript will *not* be executed at this boot. :(
> 
> We see two possible solutions.
> 
> A) Don't use "inherit module update-rc.d" but write the pkg_postint ourselfs.
> 
> B) Create two packages (one for the module, one for the initscript) with a runtime dependency.
> 
> I don't like both of them. Any other ideas? Is it possible to force the order of postinst fragments (update-rc.d code before module code)?

I think either update-rc.d or update-rc.d.bbclass should probably invoke
the script as "start" when it installs it for the first time.

p.




