Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MCa3o-0006Ct-Cr
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 16:06:20 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MCZuw-0001wZ-M0
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 14:57:10 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1MCZuw-0007m6-Ea
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 14:57:10 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A291D9C.7040900@cbnco.com>
References: <1243308909-9724-1-git-send-email-msmith@cbnco.com>
	<1244207469.2611.163.camel@mill.internal.reciva.com>
	<4A291D9C.7040900@cbnco.com>
Date: Fri, 05 Jun 2009 14:57:10 +0100
Message-Id: <1244210230.2611.169.camel@mill.internal.reciva.com>
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
X-List-Received-Date: Fri, 05 Jun 2009 14:06:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-06-05 at 09:29 -0400, Michael Smith wrote:
> This is in the defconfig (CONFIG_UDHCPC_DEFAULT_SCRIPT). We might be 
> able to get around it by passing 
> -DCONFIG_UDHCPC_DEFAULT_SCRIPT=${datadir}/udhcpc/default.script as a CFLAG.

Ah, so it is.

How about changing the defconfig file to read:

CONFIG_UDHCPC_DEFAULT_SCRIPT="!DATADIR!/udhcpc/default.script"

and then, in do_configure, replacing the straight "install" with
something like:

sed 's#!DATADIR!#${datadir}#' < ${WORKDIR}/defconfig > ${S}/.config

Those folks with custom defconfigs shouldn't notice any difference
unless they were unlucky enough to have written "!DATADIR!" somewhere in
them. :-}

p.




