Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GPEr5-0007pr-Vz for openembedded-devel@lists.openembedded.org;
	Mon, 18 Sep 2006 10:51:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 0B420963
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2006 10:47:56 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 04956-08 for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2006 10:47:52 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 5884493B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2006 10:47:52 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <ad39a30f0609180015wc6ba838vff48fef6d7d41f7d@mail.gmail.com>
References: <ad39a30f0609180015wc6ba838vff48fef6d7d41f7d@mail.gmail.com>
Organization: VanilleMedia
Date: Mon, 18 Sep 2006 10:47:52 +0200
Message-Id: <1158569272.13420.28.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Subject: Re: opie-freetype issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Sep 2006 08:51:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Montag, den 18.09.2006, 15:15 +0800 schrieb Leon Zhang:
>       hey, I am trying to fix the bug about opie-freetype.

Which bug are we talking about?

>  I found that the
> current package can't install anything into "tmp/work/armv5te-linux/opie-
> freetype-1.2.2-r0/install/". So, I write a patch which add "do_install"
> function to install something into the directory. Here is the patch,

That's redundant. Opie installs plugins during the opie_install task as
per opie.bbclass.

-- 
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




