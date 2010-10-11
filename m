Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P5NZ7-0007A5-Nq
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 20:57:45 +0200
Received: by bwz9 with SMTP id 9so860717bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 11:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=IOb32at78gWv+EIW23HBC0DJ+Jq4blWFQ/6kZBd1c2o=;
	b=vxqbzhLAeE35MoMRj2D8Vig07VWx/gEj08gp4GFCh4fv+/oFGgYdLHIwHeQTbXxjvD
	hLL8WhG0Hep6HcUSjU6sZfycm9GP4sUqZ98Q2/qXT/g69/XgvrtXbcb3F0TEO6Je4Ntq
	u+uXzVrZDZnCZiUxb/GcLn6dSD8GtEmE8VID4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=jqoBeB+Dq7nIGdDGoL4WOZp3ytJbIUimnDQREISHctvoozgr31tbF2MGM1GmTq/60O
	ZLegtwlzYNHe1XJUfyC3VJloPtwFU9QTUNXS+j/Mhq5xH0qGaXwpAGRjz9H3jiiE4xc4
	+0MmwCe/4njz2iVZOD5yhg2UMRVUtXb7+ATb4=
Received: by 10.204.102.75 with SMTP id f11mr5437801bko.10.1286823437226;
	Mon, 11 Oct 2010 11:57:17 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id g12sm5794109bkb.14.2010.10.11.11.57.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 11 Oct 2010 11:57:10 -0700 (PDT)
Date: Mon, 11 Oct 2010 20:57:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101011185710.GD3465@jama>
References: <i8ufbd$27r$1@dough.gmane.org>
	<1286795697-9335-1-git-send-email-Martin.Jansa@gmail.com>
	<20101011184934.GA3461@rhein.zuhause.netz>
MIME-Version: 1.0
In-Reply-To: <20101011184934.GA3461@rhein.zuhause.netz>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] openjade: return oj-native-libosp-fix.patch, lost in BBCLASSEXTEND change fdf02c61607acb5046afaa11c5c682ab99f4d508
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
X-List-Received-Date: Mon, 11 Oct 2010 18:57:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 11, 2010 at 08:49:35PM +0200, Henning Heinold wrote:
> On Mon, Oct 11, 2010 at 01:14:57PM +0200, Martin Jansa wrote:
> > ---
> >  recipes/openjade/openjade_1.3.2.bb |    5 +++--
> >  1 files changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/recipes/openjade/openjade_1.3.2.bb b/recipes/openjade/openjade_1.3.2.bb
> > index 238586b..9462636 100644
> > --- a/recipes/openjade/openjade_1.3.2.bb
> > +++ b/recipes/openjade/openjade_1.3.2.bb
> > @@ -5,9 +5,10 @@ DESCRIPTION = "OpenJade is a suite of tools for validating, \
> >  processing, and applying DSSSL (Document Style Semantics and \
> >  Specification Language) stylesheets to SGML and XML documents."
> >  LICENSE = "BSD"
> > -PR = "r2"
> > +PR = "r3"
> >  SRC_URI = "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
> > -	   file://configure.patch \
> > +           file://oj-native-libosp-fix.patch \
> > +           file://configure.patch \
> >            "
> >  
> >  inherit autotools
> 
> Didnt you forgot the oj-native-libosp-fix.patch or came it from an earlier version?

no, it was lost from SRC_URI  in previous patch (replacing openjade-native with
BBCLASSEXTEND), but file is still there and doesn't seem to do any harm
to non-native version as well (so applied to both now).

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


