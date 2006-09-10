Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GMYNz-0001Sd-CC
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Sep 2006 01:06:47 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id CB1317322F;
	Mon, 11 Sep 2006 09:03:29 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10250-05; Mon, 11 Sep 2006 09:03:26 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 1B96D4E482;
	Mon, 11 Sep 2006 09:03:26 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 13A9BE67448; Mon, 11 Sep 2006 09:03:26 +1000 (EST)
Date: Mon, 11 Sep 2006 09:03:26 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: Martin Dietze <di@fh-wedel.de>
Message-ID: <20060910230325.GA9890@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	Martin Dietze <di@fh-wedel.de>,
	openembedded-devel@lists.openembedded.org
References: <E1GLfnq-00056C-UM@linuxtogo.org>
	<20060909044327.GA10580@twibble.org>
	<1157808636.32698.3.camel@gandalf.tm.informatik.uni-frankfurt.de>
	<20060910085502.GH17558@fh-wedel.de>
Mime-Version: 1.0
In-Reply-To: <20060910085502.GH17558@fh-wedel.de>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Sun, 10 Sep 2006 23:06:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 10, 2006 at 10:55:02AM +0200, Martin Dietze wrote:
> On Sat, September 09, 2006, Michael 'Mickey' Lauer wrote:
> 
> > > You added libpcre and removed pcre and in the process you've also:
> > > 
> > >  - Broken 20+ recipes which DEPEND on pcre. These would all need to
> > >    be modified to depend on libpcre now instead.
> 
> Something made me think there was no such package (pcre). Seems 

Ah, that make sense. I could have fixed this all up when you
submitted it, but I could not decide on exactly what you were doing,
so wanted some confirmation on that first.

> like I need to reduce my number of working hours :/ 

I think we all need that ;)

> Will fix this as first thing on Monday.

Others have fixed most of it by now (the missing LICENSE is about all
that needs to be added now). It's probably a good idea to just
compare the old (now deleted) pcre/pcre_4.4.bb with your new
libpcre/libpcre_4.4.bb and make sure everything from the old one is
in there.

Thanks.

-- 
 Jamie Lenehan <lenehan@twibble.org>


