Received: from [128.178.50.133] (helo=smtp2.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1L5iIK-0001PE-81
	for openembedded-devel@openembedded.org; Thu, 27 Nov 2008 15:56:40 +0100
Received: (qmail 2426 invoked by uid 107); 27 Nov 2008 14:53:34 -0000
Received: from mailav1.epfl.ch (128.178.50.190)
	by smtp2.epfl.ch with SMTP; 27 Nov 2008 14:53:34 -0000
Received: from (unknown [128.178.224.219]) by mailav1.epfl.ch with smtp
	id 0e41_29c1dc9a_bc93_11dd_8b9e_001143d18479;
	Thu, 27 Nov 2008 15:53:33 +0100
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp0.epfl.ch (AngelmatoPhylax SMTP proxy);
	Thu, 27 Nov 2008 15:53:34 +0100
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@openembedded.org>
Date: Thu, 27 Nov 2008 15:53:34 +0100
User-Agent: KMail/1.10.3 (Linux/2.6.27-7-generic; KDE/4.1.3; i686; ; )
References: <200811271142.31596.valentin.longchamp@epfl.ch>
	<1227785234.15027.53.camel@hammer.suse.cz>
	<ggm16o$feq$1@ger.gmane.org>
In-Reply-To: <ggm16o$feq$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200811271553.34260.valentin.longchamp@epfl.ch>
Subject: Re: sanity test problems at end of build
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
X-List-Received-Date: Thu, 27 Nov 2008 14:56:40 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 27 November 2008 12:44:24 Koen Kooi wrote:
> On 27-11-08 12:27, Stanislav Brabec wrote:
> > Koen Kooi wrote:
> >> On 27-11-08 11:42, Valentin Longchamp wrote:
> >>> Hello,
> >>>
> >>> Sorry if it is a repost, but I have got not answer and have not seen my
> >>> mail in the mailing-list archives, so I send it again
> >>
> >> I know the problem exists for some people, but I have never been able to
> >> reproduce it. People having this problem should debug why ncurses
> >> suddenly decides to mess up its .la files. Or better, look at the .la
> >> files to see what's triggering insane.bbclass
> >>
> >>> I had read that this could have something to do with the fact that -tmp
> >>> was in the name of the tmp build dir. However it is not the case
> >
> > I guess it may be the case. Somebody mentioned a theory, that it is
> > caused by TMPDIR set in the local.conf. Your local.conf sets TMPDIR.
> >
> > Could you comment TMPDIR out and then rebuild your image from scratch?
>
> That theory has already been debunked. Not setting TMPDIR opens up a
> whole other can of worms.
>

Well, maybe it has been debunked, but it did the trick for me ... but I really 
don't understand why.

Could it be possible that it is a dash/bash issue ? (both the systems I work 
on are ubuntu-based and use dash).

Regards

Valentin



