Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MDPHb-0005W7-Rw
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 22:47:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 4B2704D3F3D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Jun 2009 16:38:35 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15410-08 for <openembedded-devel@lists.openembedded.org>; 
	Sun,  7 Jun 2009 16:38:35 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 1755E4D26B4
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Jun 2009 16:38:35 -0400 (EDT)
Date: Sun, 7 Jun 2009 16:38:35 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1244210230.2611.169.camel@mill.internal.reciva.com>
Message-ID: <Pine.LNX.4.64.0906071637260.27204@juice.ott.cti.com>
References: <1243308909-9724-1-git-send-email-msmith@cbnco.com>
	<1244207469.2611.163.camel@mill.internal.reciva.com>
	<4A291D9C.7040900@cbnco.com>
	<1244210230.2611.169.camel@mill.internal.reciva.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
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
X-List-Received-Date: Sun, 07 Jun 2009 20:48:00 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 5 Jun 2009, Phil Blundell wrote:

> On Fri, 2009-06-05 at 09:29 -0400, Michael Smith wrote:
> > This is in the defconfig (CONFIG_UDHCPC_DEFAULT_SCRIPT).
> 
> Ah, so it is.
> 
> How about changing the defconfig file to read:
> 
> CONFIG_UDHCPC_DEFAULT_SCRIPT="!DATADIR!/udhcpc/default.script"

OK, sounds good. I'll do that for busybox-1.13.2/defconfig, but I'll leave 
the defconfigs for distros (angstrom, slugos, kaeilos) as they were.

Mike


