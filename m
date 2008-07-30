Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1KOELv-0005qo-0z
	for openembedded-devel@openembedded.org; Wed, 30 Jul 2008 18:16:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m6UGErYP025059
	for <openembedded-devel@openembedded.org>;
	Wed, 30 Jul 2008 17:14:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24811-07 for <openembedded-devel@openembedded.org>;
	Wed, 30 Jul 2008 17:14:47 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m6UGEk3U025053
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 30 Jul 2008 17:14:46 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <489084EE.9070407@whitby.id.au>
References: <1217340989.5482.10.camel@dax.rpnet.com>
	<488FAE77.7050107@whitby.id.au>
	<200807300920.37221.openembedded@haerwu.biz>
	<f96d234e0807300429j2fff8df0oc494e4a5beb9f8ff@mail.gmail.com>
	<87myjz34uv.fsf@neumann.lab.ossystems.com.br>
	<4890678A.5040005@balister.org>
	<1217428116.5510.26.camel@dax.rpnet.com>
	<489084EE.9070407@whitby.id.au>
Date: Wed, 30 Jul 2008 17:14:47 +0100
Message-Id: <1217434487.5510.64.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Git Migration Status
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 30 Jul 2008 16:16:39 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I'm going to skip the rest of your argument, I don't agree the other
bits but this bit did does lead to something important: 

On Thu, 2008-07-31 at 00:42 +0930, Rod Whitby wrote:
> Richard Purdie wrote:
> > 2. The kernel uses a pull model for development and people check IDs for
> > some sanity before pulling. With the push model we're going for we don't
> > have that luxury.
> 
> That is true.  However, you also need to account for a multi-level push 
> model, where the second and subsequent levels may not have the same 
> restrictions on IDs that you are proposing for the master OE repository. 
>   In this case, the author and committer will really be two different 
> people, and you want to have real contact email addresses for both.

This isn't a problem as you describe as nowhere did I suggest making
committer == author or require any changes to author. It does bring
something else slightly related to mind though.

Say I have some tree outside OE and I commit things to is as a developer
with no access to OE directly. "We" then want to merge that into OE.
Even assuming the commit hooks allow this (there are ways and means) we
immediately lose our namespace protection. There are 101 other scenarios
that would allow this to happen and they show that namespace protection
is pointless with git.

Note that your AUTHORS file would also break with this approach unless
at merge time you grep the external tree for all email addresses and
then add them which would be tedious at best.

I think we've lost sight of the original problems so lets go back to
them:

The points I had in mind with this was to:

a) stop insane IDs entering the repository (ich@1.2.3.4)
b) gain something we could feed into the final mtn -> git and bkcvs -> 
   git conversions which would make more sense of the data. 
   "crofton@openembedded.org" really isn't a useful identifier.
c) ensure we have accurate records about our committers on the wiki
d) remove problems trying to associate related commit IDs e.g.  when 
   someone changes email address frequently and solve that problem once 
   and for all.

We can prove d) is impossible above so lets forget it. c) below partly
covers it though.

For b) I'd propose making a list of the monotone IDs we have and asking
for opinions of what to do with them. I'm happy for
"rpurdie@openembedded.org" to become "Richard Purdie <rpurdie@rpsys.net>
for example and that will increase the usefulness of the metadata (some
username mappings are much harder to guess). I already have a list of
bkcvs ids to monotone IDs so this just leaves the the monotone -> git
mappings. Is anyone willing to volunteer to collect a list?

For c), we should make updating the wiki part of the procedure for
having an ssh key added for access to the git server. Whilst some people
have protested in the past I'd like to see people's email addresses
listed there including any aliases they commit under. They're going to
appear on the web representations of git anyway. This means if an
address is dead we have an idea of what the live one might be. We can
also probably collect this information from the wiki in a script about
defunct addresses and have gitweb and cgit use it when displaying the
IDs if I remember rightly.

For a) I guess the best we can do is add some checking for insane commit
and author IDs like containing "localhost", not setting a name or
containing an IP address. I'd also like to add something to the commit
policy about only committing using sane IDs, commits with invalid IDs
are at risk of being reverted.

How does that sound?

Richard





