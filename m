Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RKTlK-00013Q-Bq for openembedded-devel@lists.openembedded.org;
	Sun, 30 Oct 2011 12:41:14 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RKTfR-0007lQ-A2 for openembedded-devel@lists.openembedded.org;
	Sun, 30 Oct 2011 12:35:09 +0100
Received: from seketeli.net ([91.121.166.71])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Oct 2011 12:35:09 +0100
Received: from dodji by seketeli.net with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Oct 2011 12:35:09 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Dodji Seketeli <dodji@seketeli.org>
Date: 30 Oct 2011 11:59:53 +0100
Organization: Me, myself and I
Sender: dodji@agbo.seketeli.net
Message-ID: <m3lis2bv86.fsf@agbo.seketeli.net>
References: <1318324122-16951-1-git-send-email-vitap@ti.com>
	<1318343515.14384.8.camel@mattotaupa>
	<AC090B9732AB2B4DB7FF476E907FE660013BAEBD36@dnce02.ent.ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: seketeli.net
X-Operating-System: CentOS 5.7
X-URL: http://www.seketeli.net/~dodji
User-Agent: Gnus/5.09 (Gnus v5.9.0) Emacs/21.4
Subject: Re: [PATCH] bluez4_4.95.bb: new recipe for building bluez-4.95
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
X-List-Received-Date: Sun, 30 Oct 2011 11:41:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

"Preskovsky, Vita" <vitap@ti.com> a écrit:

> There are two possible locations for this package:
> http://www.mirrorservice.org/sites/ftp.kernel.org/pub/linux/bluetooth/bluez-4.95.tar.gz
> http://www.angstrom-distribution.org/unstable/sources/bluez-4.95.tar.gz
> I changed the SRC_URI in my working directory for the first location
> and it worked fine. So with what location do you prefer the recipe
> will be released?
> 

Maybe a better way would be to use the `KERNELORG_MIRROR' variable as a
prefix of the url like in:

    SRC = "${KERNELORG_MIRROR}/pub/linux/bluetooth/bluez-4.95.tar.gz"

That will give users a chance to define KERNELORG_MIRROR -- in their
local.conf -- to a value that works for them.  That variable is set to
http://kernel.org by default in openembedded/bitbake.conf.

Also, please configure your email client to prefix the lines of the
message you are replying to with a sensible character string like ">
", just like most of us do on mailing list on the internet.  That
greatly improves legibility.

Thanks.

-- 
		Dodji



