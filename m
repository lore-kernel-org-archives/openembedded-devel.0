Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rpurdie@rpsys.net>) id 1GZMpu-0005hP-Ph
	for openembedded-devel@openembedded.org; Mon, 16 Oct 2006 09:24:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id k9G7HonV001876
	for <openembedded-devel@openembedded.org>;
	Mon, 16 Oct 2006 08:17:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01822-01 for <openembedded-devel@openembedded.org>;
	Mon, 16 Oct 2006 08:17:48 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id k9G7HlAX001870
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 16 Oct 2006 08:17:48 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1160951360.8144.2.camel@lieve>
References: <1156715171.5536.60.camel@localhost.localdomain>
	<200610151544.28474.openembedded@hrw.one.pl>
	<161534574.20061016010222@gmail.com>  <1160951360.8144.2.camel@lieve>
Date: Mon, 16 Oct 2006 08:17:46 +0100
Message-Id: <1160983066.5565.3.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: What is task-base?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Oct 2006 07:24:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2006-10-16 at 00:29 +0200, Koen Kooi wrote: 
> Op ma, 16-10-2006 te 01:02 +0300, schreef Paul Sokolovsky:
> 
> >    If it can be made so clean, why do we have so tangled configs for
> > many machines, at least for PocketPC-based?
> 
> Historical reason, and we'd welcome a cleanup

Agreed.

> > For example, I doubt it's good idea to have IMAGE_FSTYPES
> > in machine configs - how that can be machine's property? 
> 
> Some bootloaders can be quite demanding, like the one for the spitz
> machine only likes tar.gz, not tar.bz2. It should be overridable,
> though.

Most of the Zaurus machines set that and its valid as the image type is
the one supported by the bootloader. Its not something I'd recommend in
general but makes sense there. (tar.gz for spitz, jffs2 for c7x0,
poodle, akita). After the machine sets it the distro and/or the user in
local.conf is free to alter or probably best of all append to the
variable.

Richard



