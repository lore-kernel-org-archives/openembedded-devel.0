Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9F1AC78842
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 16:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 5CECC31E176D;
	Thu,  1 Mar 2018 17:14:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id JcTr-q3kxxMM; Thu,  1 Mar 2018 17:14:14 +0100 (CET)
Received: from t460p (p57A611C8.dip0.t-ipconnect.de [87.166.17.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 6757A31E176C;
	Thu,  1 Mar 2018 17:14:14 +0100 (CET)
Date: Thu, 1 Mar 2018 17:14:13 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: Justin Bronder <jsbronder@cold-front.org>
Message-ID: <20180301171413.1076cb68@t460p>
In-Reply-To: <20180301154702.GJ23655@lasswell>
References: <20180226201605.29261-1-jsbronder@cold-front.org>
	<20180301163636.494655bb@t460p> <20180301154702.GJ23655@lasswell>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: cppzmq: 4.2.3 update
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2018 16:14:15 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 1 Mar 2018 10:47:02 -0500
Justin Bronder <jsbronder@cold-front.org> wrote:

> On 01/03/18 16:36 +0100, Andreas Oberritter wrote:
> > Hi Justin,
> > 
> > On Mon, 26 Feb 2018 15:16:04 -0500
> > Justin Bronder <jsbronder@cold-front.org> wrote:
> >   
> > > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> > > ---
> > >  meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > > index a64745c94..9e8ad5151 100644
> > > --- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > > +++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > > @@ -4,8 +4,8 @@ LICENSE = "MIT"
> > >  LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
> > >  DEPENDS = "zeromq"
> > >  
> > > -SRCREV = "68a7b09cfce01c4c279fba2cf91686fcfc566848"
> > > -PV = "4.1.5+git${SRCPV}"
> > > +PV = "4.2.3"
> > > +SRCREV = "v${PV}"  
> > 
> > we usually don't use tags in SRCREV, because tags may change over time, and
> > therefore bitbake has to query the server each time it parses the recipe, IIRC.  
> 
> Ok.  Should I submit a v2 with the file rename that akuster808 suggested and
> pulling a tarball instead?

I'd say keep the filename and just update PV to 4.2.3+git${SRCPV} in v2. This
reduces the number of changed lines in case SRCREV gets advanced to a commit
between 4.2.3 and a future release.

Regards,
Andreas

