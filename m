Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MnY4b-00025A-6Y
	for openembedded-devel@openembedded.org; Tue, 15 Sep 2009 15:28:00 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n8FDPM8K024072; Tue, 15 Sep 2009 14:25:22 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yyIwETfuJM2m; Tue, 15 Sep 2009 14:25:22 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n8FDPEhU024061
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 15 Sep 2009 14:25:19 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1253002300.4490.1103.camel@lenovo.internal.reciva.com>
References: <1252881838-19764-1-git-send-email-Martin.Jansa@gmail.com>
	<1253002300.4490.1103.camel@lenovo.internal.reciva.com>
Date: Tue, 15 Sep 2009 14:23:48 +0100
Message-Id: <1253021029.30165.12.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: bitbake-dev@lists.berlios.de
Subject: Re: [PATCH] Allow % as wildcard in the end of	PREFERRED_VERSION_pkg
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
X-List-Received-Date: Tue, 15 Sep 2009 13:28:00 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-09-15 at 09:11 +0100, Phil Blundell wrote:
> On Mon, 2009-09-14 at 00:43 +0200, Martin Jansa wrote:
> > +def isPreferredVersion(pe, pv, pr, preferred_e, preferred_v, preferred_r):
> > +    """
> > +    Check if the version pe,pv,pr is the preferred one.
> > +    If there is preferred version defined and ends with '%', then pv has to start with that version after removing the '%' in the end,
> > +    """
> >  
> > +    if (pv == preferred_v or (preferred_v != None and preferred_v.endswith('%') and pv.startswith(preferred_v[:len(preferred_v)-1]))):
> > +        if (pr == preferred_r or preferred_r == None):
> > +            if (pe == preferred_e or preferred_e == None):
> > +                return true
> > +    return false
> > +    
> 
> I'm not totally comfortable that this patch is semantically well-formed.
> If you start allowing wildcards then the idea of "the preferred version"
> becomes somewhat ill-defined since, obviously, the wildcard might match
> any number of files.  I'm not quite sure what the problem is that you
> are trying to solve, but my initial reaction is that (whatever the
> problem is) it would probably be better solved another way.

I can see what this patch is driving at as I've been in this position
before and its ugly. By default you usually want git recipes to have the
lowest preference. You then usually want to have some "bleeding" distro
config which changes those recipes to the default and selects them.
Raising their default preference and overriding any other
PREFERRED_VERSION is harder than it looks requiring two lines of config
whereas with the patch it allows this operation to be made easier and
works more as you'd expect.

On the other hand I do have doubts about the strange syntax which
doesn't match anything else we use and is a valid concern. The multiple
git recipes issue is an interesting one and I don't know how that would
work or whether we'd see it in practise.

That point in the code is a hotpoint and we need something low overhead
(i.e. not regexp) which this patch is.

I am seriously tempted to add something though as there is a missing
chunk of control here...

Cheers,

Richard



