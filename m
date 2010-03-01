Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Nm2EV-0004WF-IO
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 10:48:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 76432A5014
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Mar 2010 09:45:22 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 0jdz8ejfGVPT
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Mar 2010 09:45:22 +0000 (GMT)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 21D27A5010
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Mar 2010 09:45:22 +0000 (GMT)
Received: by xora-desktop.xora.org.uk (Postfix, from userid 500)
	id 480BC24548; Mon,  1 Mar 2010 09:45:15 +0000 (GMT)
Date: Mon, 1 Mar 2010 09:45:15 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100301094515.GI30145@xora-desktop.xora.org.uk>
References: <1266605268-5957-1-git-send-email-clarson@kergoth.com>
	<hmg0mh$ou0$1@dough.gmane.org> <hmg1p8$suj$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hmg1p8$suj$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] package.bbclass: when running 'file', be explicit about the path to the magic
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
X-List-Received-Date: Mon, 01 Mar 2010 09:48:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 01, 2010 at 10:35:36AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> I think I know what's happening.
> 
> On my (debian) buildhost I have file 4.26. (Re)building file-native 5.04
> gives me:
> 
> ./staging/x86_64-linux/usr/share/misc/magic.mgc
> 
> Graeme has file 5.03 on his buildhost and has
> 
> ./staging/x86_64-linux/usr/share/file/magic
> 
> So it seems that the buildhost contamination also affects file-native :(
> 
Its not contamination, its just simply that file 5.XX moved its magic
file to /usr/share/misc/

Im still building 4.21 for some reason so dont see this.

Graeme



