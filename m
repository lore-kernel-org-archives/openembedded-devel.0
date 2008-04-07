Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Jin5H-0008C0-LQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Apr 2008 10:52:11 +0200
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id D13666280C4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Apr 2008 10:52:10 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200804041020.39696.geoffrey@pager.net>
References: <200804041020.39696.geoffrey@pager.net>
Date: Mon, 07 Apr 2008 10:54:28 +0200
Message-Id: <1207558468.3169.5.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.0 
Subject: Re: Changing recipe files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Apr 2008 08:52:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Geoffrey Wossum wrote:

> For whatever reason, though, the system doesn't seem to pick up my change.  
> I've tried running "bitbake -c rebuild gdb-cross".  I've tried bumping up the 
> PR value in recipe file.  I've tried wiping out the work directory for 
> gdb-cross.  Still doesn't want to use my modified version of do_stage().  
> Every time I look in the run.do_stage.xxxxx it's the old version of 
> do_stage().  I figure I could wipe out my entire build tree and the change 
> would be caught, but I don't want to wait 2.5 hours to rebuild everything.  

Normally, it's sufficient to call bitbake or even only temp/run.do_*
again. If you need to call again succeeded step, you need to remove
relevant stamp from tmp/stamps (or completely wipe out package build
directory and all package stamps).

> What is the magic incantation for my change to take effect?

But in Friday I failed using this way for unknown reason. After wiping
entire build tree, it works again as expected.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



