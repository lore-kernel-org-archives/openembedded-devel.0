Return-Path: <jsbronder@cold-front.org>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 084C878991
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 20:32:30 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 9942A213C4;
	Fri,  2 Mar 2018 15:32:31 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Fri, 02 Mar 2018 15:32:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=Dvx3tA5yamZlsh9suHb+RMiZi1t1INiMZ3Q0GnQ3StM=; b=Gt9RO
	Mz6TG23GgImIG14ST3gjhpDg7Qgnq95uf/Zf4oTGUR/J+tQTsvAJ6sbGDIf3GZaw
	tkE50+s9RMYml+CSPecbepyJVQNCWG23THUY+WnnaD0XrNjSeINTMpq2eimLfmUQ
	7xW4GtKsVe7qdRBlfmLlsdrhRMxuEk51eplVrk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=Dvx3tA5yamZlsh9suHb+RMiZi1t1I
	NiMZ3Q0GnQ3StM=; b=PFAZLaEd7vWbKyEz6bhI96XO2yURt2taX239oWcpSwEDa
	KNIXo+uAn5l6UvfOWDW+nGjlM1Smu2Ss7QEtFKyQmTFm58ohQUDDOHmdVAXSgrnC
	bhYFRzdUdSnustXbxFTK/WEKirA78JsYtxpDSm/50UVO8NVmIgxsxcGWQNspaWna
	S2TuYF6+1E9LJnQ9WcoJA0cv228i41ShcEfj91OGozceEoYlOeBqJZAZBJPh4c8A
	Co8rrxvqz7ZYShWpwgFUA1jrkYOSXna1uBe9tdLd2LBHD28Uo+nCLNKwZ3qyAJ8e
	8UdIDTjzNKeRHUBYtI/tFNn94RaLTL4QPHobR4+Mg==
X-ME-Sender: <xms:37SZWmjqjkuT72WN5G3fZ7c-mo3-HFfa2BZqJJ0fRNDnb1iYM0-2iA>
Received: from localhost (cold-front.org [173.230.129.52])
	by mail.messagingengine.com (Postfix) with ESMTPA id E686524830;
	Fri,  2 Mar 2018 15:32:30 -0500 (EST)
Date: Fri, 2 Mar 2018 15:32:30 -0500
From: Justin Bronder <jsbronder@cold-front.org>
To: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <20180302203230.GK23655@lasswell>
Mail-Followup-To: Justin Bronder <jsbronder@cold-front.org>,
	Andreas Oberritter <obi@opendreambox.org>,
	openembedded-devel@lists.openembedded.org
References: <20180226201605.29261-1-jsbronder@cold-front.org>
	<20180301163636.494655bb@t460p> <20180301154702.GJ23655@lasswell>
	<20180301171413.1076cb68@t460p>
MIME-Version: 1.0
In-Reply-To: <20180301171413.1076cb68@t460p>
User-Agent: Mutt/1.7.2 (2016-11-26)
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
X-List-Received-Date: Fri, 02 Mar 2018 20:32:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 01/03/18 17:14 +0100, Andreas Oberritter wrote:
> On Thu, 1 Mar 2018 10:47:02 -0500
> Justin Bronder <jsbronder@cold-front.org> wrote:
> 
> > On 01/03/18 16:36 +0100, Andreas Oberritter wrote:
> > > Hi Justin,
> > > 
> > > On Mon, 26 Feb 2018 15:16:04 -0500
> > > Justin Bronder <jsbronder@cold-front.org> wrote:
> > >   
> > > > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> > > > ---
> > > >  meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > > > index a64745c94..9e8ad5151 100644
> > > > --- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > > > +++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > > > @@ -4,8 +4,8 @@ LICENSE = "MIT"
> > > >  LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
> > > >  DEPENDS = "zeromq"
> > > >  
> > > > -SRCREV = "68a7b09cfce01c4c279fba2cf91686fcfc566848"
> > > > -PV = "4.1.5+git${SRCPV}"
> > > > +PV = "4.2.3"
> > > > +SRCREV = "v${PV}"  
> > > 
> > > we usually don't use tags in SRCREV, because tags may change over time, and
> > > therefore bitbake has to query the server each time it parses the recipe, IIRC.  
> > 
> > Ok.  Should I submit a v2 with the file rename that akuster808 suggested and
> > pulling a tarball instead?
> 
> I'd say keep the filename and just update PV to 4.2.3+git${SRCPV} in v2. This
> reduces the number of changed lines in case SRCREV gets advanced to a commit
> between 4.2.3 and a future release.

Thanks, v2 sent.

-- 
Justin Bronder

