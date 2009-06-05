Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MCXjG-0003Vu-Dd
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 13:36:58 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MCXaP-0005aw-A0
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 12:27:49 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MCXaP-0006Za-5I
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 12:27:49 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1244061064-25155-1-git-send-email-msmith@cbnco.com>
References: <1244060096.5049.60.camel@lenovo.internal.reciva.com>
	<1244061064-25155-1-git-send-email-msmith@cbnco.com>
Date: Fri, 05 Jun 2009 12:27:47 +0100
Message-Id: <1244201267.2611.140.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: [PATCH 1/2] busybox: let update-alternatives create all symlinks, and use INC_PR
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
X-List-Received-Date: Fri, 05 Jun 2009 11:36:58 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-06-03 at 16:31 -0400, Michael Smith wrote:
> Back in 2005, commit 5e01906b set this up; in f7f1ac27 the recipe
> was changed to keep all the links in the package.
> 
> This changes it back, and also removes special treatment of the
> links for crond, httpd, udhcpd, hwclock, and udhcpc.
> 
> Signed-off-by: Michael Smith <msmith@cbnco.com>

Thanks, looks good (and it works for me with the "micro" distro).  I
checked this in.

p.




