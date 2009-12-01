Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1NFQU7-0006bo-DY
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 12:01:34 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1NFQSb-0003VZ-Qx
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 10:59:57 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1NFQSb-0000Z3-GB
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 10:59:57 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LFD.2.00.0912010544560.8109@localhost>
References: <ad82c8890912010126u374499a4jdbd39414b67558fb@mail.gmail.com>
	<ac9c93b10912010229g2b53c52fw671178a33c644114@mail.gmail.com>
	<20091201103917.GC4345@xora.vm.bytemark.co.uk>
	<alpine.LFD.2.00.0912010544560.8109@localhost>
Date: Tue, 01 Dec 2009 10:59:54 +0000
Message-Id: <1259665194.4332.317.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: pb@reciva.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Error while running bibake
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
X-List-Received-Date: Tue, 01 Dec 2009 11:01:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-12-01 at 05:45 -0500, Robert P. J. Day wrote:
>   if you feel that strongly about it, why not just have bitbake refuse
> to run as root?  seems like a simple solution.

sanity.bbclass does already include a check for non-root:

        if 0 == os.getuid():
                raise_sanity_error("Do not use Bitbake as root.")

I think that ought to be sufficient.  Folks who override the sanity
checking do so at their own risk.

p.




