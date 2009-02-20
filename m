Received: from [59.124.115.149] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nytowl@openmoko.org>) id 1LaWev-00080j-K5
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Feb 2009 15:47:22 +0100
Received: from s0106001c100a3234.cg.shawcable.net ([70.73.132.19]
	helo=[172.16.14.101]) by aakash.openmoko.org with esmtpsa (SSL
	3.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <nytowl@openmoko.org>) id 1LaWcL-00030G-RD
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Feb 2009 22:44:53 +0800
From: Angus Ainslie <nytowl@openmoko.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200902201035.30522.openembedded@haerwu.biz>
References: <1235075079.6859.211.camel@alap>
	<200902201035.30522.openembedded@haerwu.biz>
Date: Fri, 20 Feb 2009 07:44:31 -0700
Message-Id: <1235141071.6859.223.camel@alap>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-SA-Exim-Connect-IP: 70.73.132.19
X-SA-Exim-Mail-From: nytowl@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: Re: [PATCH] add paroli autostart
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
X-List-Received-Date: Fri, 20 Feb 2009 14:47:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-02-20 at 10:35 +0100, Marcin Juszkiewicz wrote:
> On Thursday 19 of February 2009 21:24:39 Angus Ainslie wrote:
> 
> >  packages/images/fso-paroli-image.bb |   12 +++++++++---
> >  1 files changed, 9 insertions(+), 3 deletions(-)
> 
> > -# no extra apps
> > -GTK_INSTALL = ""
> > +# not many extra apps
> > +GTK_INSTALL = " \
> > +   vala-terminal \
> > +"
> 
> Was this block planned to be in this commit too? Looks like got 
> committed by mistake.
> 
> > +  paroli-autostart \
> 
> As this looks like what that commit had to do (at least description says 
> it).
> 
> Regards, 

I had meant to include both sections. My description wasn't verbose
enough. 

Until I fix the autostart patch this will just cause the build to fail.
So if it isn't applied yet please hold off.

Thanks
Angus



