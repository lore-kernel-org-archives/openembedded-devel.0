Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Llmvi-0001WW-GG
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Mar 2009 17:23:15 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGY001SOW3MLSIM@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	23 Mar 2009 11:21:28 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C575B6B83B5; Mon,
	23 Mar 2009 12:21:21 -0400 (EDT)
Date: Mon, 23 Mar 2009 12:21:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090323162121.GA23484@denix.org>
References: <1237246365-32076-1-git-send-email-denis@denix.org>
	<1237246365-32076-4-git-send-email-denis@denix.org>
	<87y6uw4nwo.fsf@neumann.lab.ossystems.com.br>
MIME-version: 1.0
In-reply-to: <87y6uw4nwo.fsf@neumann.lab.ossystems.com.br>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH 3/3] base.bbclass: fix base_get_scmbasepath() to	look for recipes/ and fall back to packages/ while parsing BBFILES
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
X-List-Received-Date: Mon, 23 Mar 2009 16:23:16 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 23, 2009 at 05:57:27AM -0300, Otavio Salvador wrote:
> Denys Dmytriyenko <denis@denix.org> writes:
> 
> 
> [...]
> 
> > --- a/classes/base.bbclass
> > +++ b/classes/base.bbclass
> > @@ -773,7 +773,13 @@ python base_do_unpack() {
> >  def base_get_scmbasepath(d):
> >  	import bb
> >  	path_to_bbfiles = bb.data.getVar( 'BBFILES', d, 1 ).split()
> > -	return path_to_bbfiles[0][:path_to_bbfiles[0].rindex( "packages" )]
> > +
> > +	try:
> > +		index = path_to_bbfiles[0].rindex( "recipes" )
> > +	except ValueError:
> > +		index = path_to_bbfiles[0].rindex( "packages" )
> > +
> > +	return path_to_bbfiles[0][:index]
> >  
> >  def base_get_metadata_monotone_branch(d):
> >  	monotone_branch = "<unknown>"
> 
> In my opinion, while it makes life easier the result of it is mixed
> environments.
> 
> I'm still using packages/ in our local distro and I haven't yet found
> the time to merge current tree since we've a lot of local recipes that
> will break and this change could make it simple but I still refrain
> about having it included.
> 
> It looks like the logical thing is kind of "force" people to handle it.

First you said you are not ready to make the switch, and then you are saying 
we need to force people into it... :)

Anyway, it doesn't matter anymore, as this code has been replaced completely 
by one of kergoth's recent commits.

-- 
Denys


