Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1OLwBS-0006WT-0m
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 12:37:26 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 3AE6711000A0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jun 2010 12:33:00 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 96FF1110009C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jun 2010 12:32:59 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225144133.adsl.alicedsl.de
	[92.225.144.133]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jun 2010 12:32:59 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 2016A3C12F; Tue,  8 Jun 2010 12:32:58 +0200 (CEST)
Date: Tue, 8 Jun 2010 12:32:57 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100608103257.GA4805@rhein.zuhause.netz>
References: <E1OLvSl-0003gY-9Y@melo.openembedded.org>
	<20100608095356.GF1403@jama>
MIME-Version: 1.0
In-Reply-To: <20100608095356.GF1403@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Henning Heinold : zziplib: convert to BBCLASSEXTEND and use new patch system
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
X-List-Received-Date: Tue, 08 Jun 2010 10:37:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 08, 2010 at 11:53:56AM +0200, Martin Jansa wrote:
> On Tue, Jun 08, 2010 at 09:51:15AM +0000, git version control wrote:
> > Module: openembedded.git
> > Branch: org.openembedded.dev
> > Commit: 8031ee4953f3510d53022ce0e53bc903d3089f30
> > URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=8031ee4953f3510d53022ce0e53bc903d3089f30
> > 
> > Author: Henning Heinold <heinold@inf.fu-berlin.de>
> > Date:   Tue Jun  8 01:34:58 2010 +0200
> > 
> > zziplib: convert to BBCLASSEXTEND and use new patch system
> > 
> > ---
> > 
> > diff --git a/recipes/zziplib/zziplib_0.13.49.bb b/recipes/zziplib/zziplib_0.13.49.bb
> > index 3aecb74..256b13d 100644
> > --- a/recipes/zziplib/zziplib_0.13.49.bb
> > +++ b/recipes/zziplib/zziplib_0.13.49.bb
> > @@ -3,8 +3,9 @@ require zziplib.inc
> >  PR = "r2"
> >  
> >  SRC_URI += "\
> > -  file://zip_c.patch \
> > -  file://zziplib-autoconf.patch \
> > +  file://zip_c.patch;apply=yes \
> > +  file://zziplib-autoconf.patch;apply=yes \
> > +  file://automake.patch;apply=yes \
> 
> Isn't apply=yes default for .patch, .diff extensions? Why did you need
> to add it?
> 
> Thanks
> 
> Regards,
> -- 
> Jansa 'JaMa' Martin     jabber: Martin.Jansa@gmail.com

Hi,

didn't think about it, but it don't hurts.

Bye Henning


