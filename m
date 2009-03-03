Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LeKG1-00073h-0F
	for openembedded-devel@openembedded.org; Tue, 03 Mar 2009 03:21:21 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090303021721.NEXD22254.fed1rmmtao106.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 2 Mar 2009 21:17:21 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id NSHK1b00a4dMFYL04SHKuY; Mon, 02 Mar 2009 21:17:20 -0500
X-Authority-Analysis: v=1.0 c=1 a=0xdhnJmhlijF5fh9aicA:9
	a=kQ_QzpIjzVubO2vQ3y3GnHyw1RkA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Mon, 2 Mar 2009 19:17:19 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090303021719.GK26343@smtp.west.cox.net>
References: <49AB58CA.7090406@tait.co.nz> <gohslm$3bl$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gohslm$3bl$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: fatal: Not a git repository
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
X-List-Received-Date: Tue, 03 Mar 2009 02:21:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 03, 2009 at 12:12:38AM +0000, Vitus Jensen wrote:
> Am Mon, 02 Mar 2009 16:55:54 +1300 schrieb Douglas Royds:
> 
> > Anyone else getting this?
> > 
> >     NOTE: Handling BitBake files: / (6587/6587) [100 %] NOTE: Parsing
> >     finished. 6302 cached, 0 parsed, 285 skipped, 0 masked. NOTE: Cache
> >     is clean, not saving.
> >     NOTE: build 200903021645: started
> >     fatal: Not a git repository <----------------------
> > 
> >     OE Build Configuration:
> >     BB_VERSION        = "1.8.12"
> >     ...
> 
> 
> Yes, it happens on every build.  I guess bitbake is testing the current 
> directory via git and would include the current head in the build number.
> 
> > The same complaint seems to crop up at various points during a build, as
> > well.
> > 
> > Suggestions?
> 
> Just ignore.  Besides called "fatal" it isn't fatal at all.

Well, to git it's fatal :)  Someone should dig to where the call is and
redirect stderr somewhere, I suspect..

-- 
Tom Rini


