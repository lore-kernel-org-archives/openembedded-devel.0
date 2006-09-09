Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GM2xw-0001gZ-EM for openembedded-devel@lists.openembedded.org;
	Sat, 09 Sep 2006 15:33:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 2658296E;
	Sat,  9 Sep 2006 15:30:40 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 32433-05; Sat,  9 Sep 2006 15:30:36 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 4CECE93F;
	Sat,  9 Sep 2006 15:30:36 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: openembedded-devel@lists.openembedded.org, Martin Dietze <di@fh-wedel.de>
In-Reply-To: <20060909044327.GA10580@twibble.org>
References: <E1GLfnq-00056C-UM@linuxtogo.org>
	<20060909044327.GA10580@twibble.org>
Organization: VanilleMedia
Date: Sat, 09 Sep 2006 15:30:35 +0200
Message-Id: <1157808636.32698.3.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Subject: Re: [oe-commits] PCRE breakage [libpcre: added new port]
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
X-List-Received-Date: Sat, 09 Sep 2006 13:33:48 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

(NOTE: Forwarded to Martin Dietze since I'm not sure whether he's
subscribed to the list yet)

Am Samstag, den 09.09.2006, 14:43 +1000 schrieb Jamie Lenehan:
> On Fri, Sep 08, 2006 at 02:49:50PM +0200, "MartinDietze commit" wrote:
> > libpcre: added new port.
> 
> You added libpcre and removed pcre and in the process you've also:
> 
>  - Broken 20+ recipes which DEPEND on pcre. These would all need to
>    be modified to depend on libpcre now instead.
> 
>  - Removed the clearning of PARALLEL_MAKE so libpcre no longer builds
>    for anyone doing parallel builds.
> 
>  - It looks like you've also removed the fix which was added to stop
>    libtool linking against the host libriares when somethings it
>    attempts to link in libpcre on x86_64 hosts.
> - Removed the LICENSE field from the recipe as well.
> 
> I think the change of name is ok, since it's only a library and the
> new naming matches what happens on other platforms but you really
> should also fix up all of the above issues.

Martin, can you please fix these things?

If you don't have already, make sure you subscribe to this list -- we
have made it a policy that all people with commit access also need to be
subscribed here in order to see comments to their commits.

Thanks,

-- 
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




