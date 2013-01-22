Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <amy.fong@windriver.com>) id 1Txfkz-0001sA-UH
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 16:27:30 +0100
Received: from yow-afong-lx2.ottawa.windriver.com (yow-afong-lx2.wrs.com
	[128.224.146.164])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0MFBsIt019421
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 07:11:54 -0800 (PST)
Received: from afong by yow-afong-lx2.ottawa.windriver.com with local (Exim
	4.80) (envelope-from <amy.fong@windriver.com>) id 1TxfVx-0006S9-PY
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 10:11:53 -0500
Date: Tue, 22 Jan 2013 10:11:53 -0500
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130122151153.GA24789@windriver.com>
References: <20130118171332.GA12933@windriver.com>
	<20130121195838.GA10801@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20130121195838.GA10801@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking] [PATCH] autofs: fails to compile with openldap disabled
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
X-List-Received-Date: Tue, 22 Jan 2013 15:27:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 21, 2013 at 02:58:39PM -0500, Joe MacDonald wrote:
Hi Joe,

> Hey Amy,
> 
> [[oe] [meta-networking] [PATCH] autofs: fails to compile with openldap disabled] On 13.01.18 (Fri 12:13) Amy Fong wrote:
> 
> > commit 09947d772a36e4d2c2dc48356281bd3ce0a04b0c
> > Author: Amy Fong <amy.fong@windriver.com>
> > Date:   Fri Jan 18 11:10:35 2013 -0500
> > 
> >     autofs: fails to compile with openldap disabled
> >     
> >     As of 5.0.6, it appears that changes were introduced so that
> >     if you compile with openldap disabled and openldap headers are not
> >     available, then autofs fails to build.
> >     
> >     Since autofs no longer depends on openldap, remove the dependency
> >     
> >     Signed-off-by: Amy Fong <amy.fong@windriver.com>
> > 
> > diff --git a/recipes-daemons/autofs/autofs-5.0.7/fix_disable_ldap.patch b/recipes-daemons/autofs/autofs-5.0.7/fix_disable_ldap.patch
> > new file mode 100644
> > index 0000000..b62f955
> > --- /dev/null
> > +++ b/recipes-daemons/autofs/autofs-5.0.7/fix_disable_ldap.patch
> > @@ -0,0 +1,40 @@
> > +autofs: fails to compile with openldap disabled
> > +
> > +As of 5.0.6, it appears that changes were introduced so that 
> > +if you compile with openldap disabled and openldap headers are not
> > +available, then autofs fails to build.
> > +
> > +Signed-off-by: Amy Fong <amy.fong@windriver.com>
> 
> Did you say you'd already sent this upstream?  I can put in an
> upstream-status myself, but I'm not sure what it is right now.  :-)
> 
> Alternatively, a new version with the upstream-status is good too.
> 
> -J.

Nope, it wasn't sent upstream. I'd say that the upstream-status should be pending. :)

Thanks!
Amy


