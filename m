Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MQSRV-0008Ak-GW
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jul 2009 22:48:09 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KMQ00CLTMHKPAB0@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	13 Jul 2009 15:34:38 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 19FCA14AF5F; Mon,
	13 Jul 2009 16:34:32 -0400 (EDT)
Date: Mon, 13 Jul 2009 16:34:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090713203432.GC8275@denix.org>
References: <E1MQNDW-0007ur-Rm@melo.openembedded.org>
	<200907132005.09088.marcin@juszkiewicz.com.pl>
	<20090713185246.GB8275@denix.org>
	<f96d234e0907131307q462bc083h3cf25bfe6d4492fd@mail.gmail.com>
	<4A5B96D2.8050407@gmail.com>
MIME-version: 1.0
In-reply-to: <4A5B96D2.8050407@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [oe-commits] Marco Cavallini : Added linux version	recipes/linux/linux-2.6. 29 for taskit Stamp9G20 Evaluation Board
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
X-List-Received-Date: Mon, 13 Jul 2009 20:48:09 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jul 13, 2009 at 10:19:30PM +0200, Marco Cavallini wrote:
> Cliff Brake ha scritto:
> > On Mon, Jul 13, 2009 at 2:52 PM, Denys Dmytriyenko<denis@denix.org> wrote:
> >> On Mon, Jul 13, 2009 at 08:05:08PM +0200, Marcin Juszkiewicz wrote:
> >>> Dnia poniedzia??ek, 13 lipca 2009 o 17:13:22 git version control
> >>> napisa??(a):
> >>>
> >>> Please read CommitPolicy in wiki - first line of commit is summary and
> >>> should fit in 7x chars (weekly changelog script cuts at 78 chars) and
> >>> next lines are used for description. Also those two changes should be
> >>> squashed into one ("git rebase -i origin" would be useful command for
> >>> next patch set).
> >> Aren't policies required to be read by new developers when git access is
> >> granted? There used to be a welcome message sent by Mickey with helpful links
> >> to the Wiki. Is it still the case? Just wondering...
> > 
> > I have not seen such a message, but I suggest that
> > http://wiki.openembedded.net/index.php/New_commit_rights be updated to
> > contain any relevant information.  I'll start sending a link to this
> > page with new commit rights that I add.
> 
> Yes, if there are so many rules, would be a good idea to document all
> them in a signle place :-)
> I did my best updating what is editable :
> http://wiki.openembedded.net/index.php/Commit_log_example

Thanks. Taking into consideration the policies and common practices of 
other git-based projects, especially kernel.org ones, there are some 
small changes/nitpicks to consider:

- separate the short one-line description and the long description (if 
present) with an empty line. That would help with extracting and applying 
patches using git (git-format-patch/git-am), because the short decription 
becomes the Subject of the patch/email and if there is no emtpy line after it, 
the long description may get lost when the patch is sent over the email.

- don't start every line of the long description with a star "*" - this one is 
not technical but aestetical...

Everything else seems fine and corresponds to the common practices of the Open 
Source Community. :)

-- 
Denys


