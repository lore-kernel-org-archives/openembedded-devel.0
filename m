Return-Path: <jsbronder@cold-front.org>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 4AD43784F6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 15:47:05 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id F08B8219A8;
	Thu,  1 Mar 2018 10:47:02 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Thu, 01 Mar 2018 10:47:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=wn9K4xo2Rq74rFt5pAuGr0UZ2NnvNoYjFUj+mGMaz5Q=; b=bg8Q3
	imxBRlin2UzdAL49OAMFWP5Po9zDegE171lZHjLo3IPpc3fDFENqAqtc393s1WsR
	l6ERahC/s0KHA4cIxIOurcdNILw45Al8uNvD4xnvS8MYUGaDIuvPUaDwsVjT8EBw
	oNo7pamiBfiSemcOSMq1dL48u07vLYf2sI+Spc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=wn9K4xo2Rq74rFt5pAuGr0UZ2NnvN
	oYjFUj+mGMaz5Q=; b=HBDEOFJh1i946Ea7hDULDt+mpq2qHXADh1GnDWcs04YU6
	j6tGL5CKJ3GbNrR7hoAnuZPRH/yYzRMoVqkECFE0RU/SgOl0PBPA0+bMYx4c0uv5
	0UM+/XzaqeDrl3+qSUG8QHlEmF5O7ClMJ1hiROGHAZTRFnHjd510ZmcM1zZEEZxS
	RVdfKJeWB2tfvfYj8FTOd8ePDTX+VWVtmbm3OA1cziawI4I48HhinPTZMxVDjQ4n
	/9qRnzo19BZeRFqT1rn6fLqL7SWi8IqYFVaqJyWBXiXNoX/S1X3haqU8E0nn3R6d
	ZF5jIqeRq/cUvMxygAwuvI3BgC270orWC54guLjNw==
X-ME-Sender: <xms:diCYWulQvNc97toZppDibcHAwRBjhGXIIR9QYtuA5m0ST89asptLSA>
Received: from localhost (cold-front.org [173.230.129.52])
	by mail.messagingengine.com (Postfix) with ESMTPA id A8D26246C8;
	Thu,  1 Mar 2018 10:47:02 -0500 (EST)
Date: Thu, 1 Mar 2018 10:47:02 -0500
From: Justin Bronder <jsbronder@cold-front.org>
To: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <20180301154702.GJ23655@lasswell>
Mail-Followup-To: Justin Bronder <jsbronder@cold-front.org>,
	Andreas Oberritter <obi@opendreambox.org>,
	openembedded-devel@lists.openembedded.org
References: <20180226201605.29261-1-jsbronder@cold-front.org>
	<20180301163636.494655bb@t460p>
MIME-Version: 1.0
In-Reply-To: <20180301163636.494655bb@t460p>
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
X-List-Received-Date: Thu, 01 Mar 2018 15:47:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 01/03/18 16:36 +0100, Andreas Oberritter wrote:
> Hi Justin,
> 
> On Mon, 26 Feb 2018 15:16:04 -0500
> Justin Bronder <jsbronder@cold-front.org> wrote:
> 
> > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> > ---
> >  meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > index a64745c94..9e8ad5151 100644
> > --- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > +++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > @@ -4,8 +4,8 @@ LICENSE = "MIT"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
> >  DEPENDS = "zeromq"
> >  
> > -SRCREV = "68a7b09cfce01c4c279fba2cf91686fcfc566848"
> > -PV = "4.1.5+git${SRCPV}"
> > +PV = "4.2.3"
> > +SRCREV = "v${PV}"
> 
> we usually don't use tags in SRCREV, because tags may change over time, and
> therefore bitbake has to query the server each time it parses the recipe, IIRC.

Ok.  Should I submit a v2 with the file rename that akuster808 suggested and
pulling a tarball instead?


-- 
Justin Bronder

