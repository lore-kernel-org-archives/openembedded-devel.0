Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GSvzu-0004UR-U9
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Sep 2006 15:32:19 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 135AAC2A17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Sep 2006 23:27:18 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23302-01
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Sep 2006 23:27:13 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id D4540C1739
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Sep 2006 23:27:13 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id B94E110F1F32; Thu, 28 Sep 2006 23:27:13 +1000 (EST)
Date: Thu, 28 Sep 2006 23:27:13 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20060928132713.GA32288@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	openembedded-devel@lists.openembedded.org
References: <E1GStq9-0003dN-FU@linuxtogo.org>
Mime-Version: 1.0
In-Reply-To: <E1GStq9-0003dN-FU@linuxtogo.org>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: [oe-commits] org.oe.dev glibc 2.4: Apply recently added patches only fo x86.
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
X-List-Received-Date: Thu, 28 Sep 2006 13:32:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 28, 2006 at 01:14:05PM +0200, "pfalcon commit" wrote:
> glibc 2.4: Apply recently added patches only fo x86.
> * Fixes breakage on ARM.
> * Don't bump PR (previous commit neither did), to save long rebuilds.
> Few people affected should use "bitbake glibc -c rebuild".
> * Fixes #1443.
> * Approved by Michael 'Mickey' Lauer <mickey at tm.informatik.uni-frankfurt de>.

I've tested here and those two patches break glibc 2.4 for my main
targets which are sh4 (titan), i486 (wrap) and i586 (epia), building
on an x86_64 host. The breakage basically exactly the same as in
#1443.

I'm not sure what "x86" problem is that they are meant to fix (look
like they are just wiring up syscalls to use in place of glibc equivs
for the *at calls), but at least for me they actually break things on
i486 and i586.

Looks to me like the need more thinking/testing before being included
for anything.

-- 
 Jamie Lenehan <lenehan@twibble.org>


