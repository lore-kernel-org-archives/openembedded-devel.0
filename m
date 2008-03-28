Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JfAw1-0008Bb-TZ
	for openembedded-devel@openembedded.org; Fri, 28 Mar 2008 10:31:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2S9VfSp009106
	for <openembedded-devel@openembedded.org>; Fri, 28 Mar 2008 09:31:41 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08752-09 for <openembedded-devel@openembedded.org>;
	Fri, 28 Mar 2008 09:31:37 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2S9VW9k009100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 28 Mar 2008 09:31:32 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20080327174524.GG4938@smtp.west.cox.net>
References: <200803271217.41967.thomas.cooksey@trolltech.com>
	<200803271752.07855.thomas.cooksey@trolltech.com>
	<1206638031.4514.53.camel@dax.rpnet.com>
	<20080327174524.GG4938@smtp.west.cox.net>
Date: Fri, 28 Mar 2008 09:31:32 +0000
Message-Id: <1206696692.5029.22.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: LEAD_SONAME?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Mar 2008 09:31:42 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-03-27 at 10:45 -0700, Tom Rini wrote:
> On Thu, Mar 27, 2008 at 05:13:51PM +0000, Richard Purdie wrote:
> > On Thu, 2008-03-27 at 17:52 +0100, Tom Cooksey wrote:
> [snip]
> > > > Your options are:
> > > > 	- Ignore the warning
> > > My prefered option, but only if this is not causing my dissappearing library issue.
> > > 
> > > > 	- Define a LEAD_SONAME of your primary lib
> > > > 	- More finegrained packaging.
> > > Do you mean doing having LEAD_SONAME_foo, LEAD_SONAME_bar, etc. ? That
> > > could work?
> > 
> > No, select one e.g. if libfoo is the most "important", LEAD_SONAME =
> > "libfoo".
> 
> Ah, but what's up with wildcards in the field (ie glib-2.0) ?  Or ones
> that say "libfoo.so" (postgresql) or "libfoo.so.1" (uim) ?  People guessing
> incorrectly at the value?  Thanks!

If in doubt, use the source (debian.bbclass):

lead = bb.data.getVar('LEAD_SONAME', d, 1)
if lead:
	r = re.compile(lead)
	filtered = []
	for s in sonames:
	if r.match(s):
		filtered.append(s)

so its being used as a regexp against the sonames. A valid contents of
the field is something which provides a unique match.

Cheers,

Richard



