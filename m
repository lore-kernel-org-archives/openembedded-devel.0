Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LeC1j-0002m2-Fz
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Mar 2009 18:34:12 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KFW00IFL39I601Q@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	02 Mar 2009 11:29:43 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4533B6B83A8; Mon,
	02 Mar 2009 12:29:42 -0500 (EST)
Date: Mon, 02 Mar 2009 12:29:42 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090302172942.GA615@denix.org>
References: <20090217022412.GA3240@denix.org> <20090217225424.GC9047@denix.org>
MIME-version: 1.0
In-reply-to: <20090217225424.GC9047@denix.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Enterprise kills BBMASK
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
X-List-Received-Date: Mon, 02 Mar 2009 17:34:36 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Feb 17, 2009 at 05:54:24PM -0500, Denys Dmytriyenko wrote:
> On Mon, Feb 16, 2009 at 09:24:12PM -0500, Denys Dmytriyenko wrote:
> > Sorry for the "sensational" subject... :)
> > 
> > Basically, some time back I noticed that BBMASK stopped working. I didn't have 
> > time to look into it, until today. One of Mickey's commits broke the tree, 
> > because bunch of recipes require a missing .inc file, leading to Bitbake 
> > parsing failure.
> > 
> > Now, trying to set BBMASK leads to nothing. The problem is with 
> > conf/enterprise.conf, which re-sets it to empty if ENTERPRISE_DISTRO is not 
> > set. So, not matter what you set BBMASK to in your local.conf, it ends up 
> > being empty. Unfortunately, it can't be done with "+=", as it has to be a 
> > regular expression...
> > 
> > Any ideas how to fix it?
> 
> So, does it mean nobody cares that BBMASK is broken? Or maybe I didn't explain 
> the problem clearly enough the first time? :)

Thanks to Chris "kergoth" for coming up with the below code for conf/enterprise.conf,
which makes BBMASK work again! Any objections for commiting it? Zecke?

# For the enterprise edition we want to avoid certain packages by default.
BBMASK ?= ""
OLDBBMASK := "${BBMASK}"
BBMASK = "${@base_conditional('ENTERPRISE_DISTRO', '1', base_conditional('OLDBBMASK', '', '', '(${OLDBBMASK})|', d) + '(mp3blaster|mpg123|mpg321|smpeg|liba52|lame|libmad|mpeg2dec|xmms-mad|madplay|python-mad|opie-mediaplayer1-libmadplugin|ffmpeg|mplayer)', '${OLDBBMASK}', d)}"

-- 
Denys


