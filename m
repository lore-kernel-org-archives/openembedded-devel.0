Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1L5f4c-0004xW-4E
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Nov 2008 12:30:18 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 20A78146C001
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Nov 2008 12:27:15 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gglubl$651$1@ger.gmane.org>
References: <200811271142.31596.valentin.longchamp@epfl.ch>
	<gglubl$651$1@ger.gmane.org>
Date: Thu, 27 Nov 2008 12:27:14 +0100
Message-Id: <1227785234.15027.53.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1 
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
X-List-Received-Date: Thu, 27 Nov 2008 11:30:18 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> On 27-11-08 11:42, Valentin Longchamp wrote:
> > Hello,
> >
> > Sorry if it is a repost, but I have got not answer and have not seen my mail
> > in the mailing-list archives, so I send it again
> 
> I know the problem exists for some people, but I have never been able to 
> reproduce it. People having this problem should debug why ncurses 
> suddenly decides to mess up its .la files. Or better, look at the .la 
> files to see what's triggering insane.bbclass

>>I had read that this could have something to do with the fact that -tmp was in 
>>the name of the tmp build dir. However it is not the case

I guess it may be the case. Somebody mentioned a theory, that it is
caused by TMPDIR set in the local.conf. Your local.conf sets TMPDIR.

Could you comment TMPDIR out and then rebuild your image from scratch?

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



