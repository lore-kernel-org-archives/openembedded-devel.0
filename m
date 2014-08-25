Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4F33165D00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Aug 2014 06:58:07 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id v10so19383354pde.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2014 23:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8fZXpEc/EiRDRFEqkyZ+qWPibmqRJxPFRxNlLkDDrWg=;
	b=OjmawZme4bid0rip0kwpgIQMq1maS84dCDWGOTMjD3qSMftqLOcWPyeXlacxkTPKQD
	mi+sGoGAUF8x6Sv/vxDDeo8n5bScqu8YNDpOBg+pOiZfEXC1tionnG9WO1iahT+fpY2G
	UvDzJtSAH62tHekxx519kqTIfO01I+hN0gbR2HsyyqAvwF0iOAd5fUONSQmO1vIE6KIQ
	7x29c7+6zrRH+A0dtAi4VD24doEqsM6LViEwVX9FoCL8+N2Bq+MgeUEvjZww5gLqfM5i
	YVYuN+kbZOWv/h+Apv+0+mLBnuPLiv3WHp5hv3Vb4x4RB5oD98gCXFIdMBnVE34k/qsW
	D+Cw==
X-Received: by 10.70.98.203 with SMTP id ek11mr25978513pdb.32.1408949885745;
	Sun, 24 Aug 2014 23:58:05 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id
	ki7sm36400858pbc.65.2014.08.24.23.58.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Aug 2014 23:58:05 -0700 (PDT)
Date: Mon, 25 Aug 2014 00:01:52 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140825070152.GG1014@haswell>
References: <674e63b93b3c0bfe18d58d6c11c1cc7a.squirrel@webmail.prtelecom.hu>
	<55c56fabb920e066ba8915e51fb4ecdf.squirrel@webmail.prtelecom.hu>
	<20140821111443.GX3660@jama>
MIME-Version: 1.0
In-Reply-To: <20140821111443.GX3660@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] PHP 5.5.15
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Aug 2014 06:58:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-21 13:14:43, Martin Jansa wrote:
> On Thu, Aug 21, 2014 at 12:13:05PM +0200, zboszor@pr.hu wrote:
> > > Hello,
> > >
> > > as a follow-up to my yesterday's mail about "[PATCH] Allow using a more
> > > recent php", here's the proof of the pudding.
> > >
> > > I needed GD support in PHP, and it turned out that PHP 5.4.x only supports
> > > GD 2.0, while current OE has 2.1. Not wanting to downgrade GD, I chose to
> > > upgrade PHP.
> > >
> > > I had to update imap-fix-autofoo.patch so it applies cleanly and I also
> > > had to fix https://bugs.php.net/bug.php?id=66103 so it can be cross
> > > compiled. (I also submitted the patch at the link).
> > >
> > > I enabled more extensions in PHP than what was in the previous version,
> > > this is what I needed locally.
> > >
> > > Comments?
> > >
> > > Feel free to use it in any way.
> > 
> > This time with the patch attached. :-)
> 
> Can you please send inline patch (preferably with git send-email as
> README suggests)?
> 
> There is also issue with some files not being tracked by sstate:
> [^/]*/usr/lib/php/\.channels.*
> [^/]*/usr/lib/php/\.registry.*
> [^/]*/usr/lib/php/\.depdb.*
> [^/]*/usr/lib/php/\.filemap
> [^/]*/usr/lib/php/\.lock
> 

they should be packaged in FILES_${PN}-pear, so sstate should track them
is it because they start with a 'dot' ?


