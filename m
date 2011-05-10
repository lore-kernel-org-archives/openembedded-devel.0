Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QJo7Z-0006uK-2M
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 16:41:09 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QJnzZ-0007G8-Bq
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 16:32:53 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DC9363B.6070909@nedap.com>
References: <4DC8F3A2.2090005@nedap.com>	<20110510100020.GA10493@mx.loc>
	<1305022004.8000.149.camel@phil-desktop>	<4DC91B33.9080807@nedap.com>
	<1305025696.8000.155.camel@phil-desktop> <4DC91E4E.3070109@nedap.com>
	<4DC9363B.6070909@nedap.com>
Date: Tue, 10 May 2011 15:38:19 +0100
Message-ID: <1305038299.8000.178.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: x86_64
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
X-List-Received-Date: Tue, 10 May 2011 14:41:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-10 at 14:57 +0200, Jaap de Jong wrote:
> bitbake ends with
> | 
> /media/OpenEmbedded/release-2010.12/tmp/sysroots/i686-linux/usr/x86_64/x86_64-angstrom-linux/bin/ld: 
> cannot find /lib64/libc.so.6 inside 
> /media/OpenEmbedded/release-2010.12/tmp/sysroots/x86_64-angstrom-linux
> 
> There is only a lib directory and no lib64 directory...

It seems that there is some disagreement between binutils and your C
library about where the libs should be stored.  Which DISTRO
configuration are you using?

If you make a symlink from lib -> lib64 inside the sysroot, does that
allow the build to continue?

p.




