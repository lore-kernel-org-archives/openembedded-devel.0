Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MCZLH-0003ez-W8
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 15:20:20 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MCZCP-0000Ew-IU
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 14:11:09 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1MCZCP-0007Ps-BC
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 14:11:09 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1243308909-9724-1-git-send-email-msmith@cbnco.com>
References: <1243308909-9724-1-git-send-email-msmith@cbnco.com>
Date: Fri, 05 Jun 2009 14:11:09 +0100
Message-Id: <1244207469.2611.163.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: [PATCH] busybox: allow building when prefix is "", not "/usr".
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
X-List-Received-Date: Fri, 05 Jun 2009 13:20:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-05-25 at 23:35 -0400, Michael Smith wrote:
> For insane backwards compatibility reasons (my own fault) I would like
> to be able to create packages with no /usr and /sbin == /bin. Most
> autoconf packages are happy about this; busybox just needs a little

I found one more issuette: busybox udhcpc still expects to find its
scripts in /usr/share/udhcpc irrespective of where ${datadir} actually
points to (/share in my case).  Can I persuade you to take a look at
that?

p.




