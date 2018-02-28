Return-Path: <jsbronder@cold-front.org>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 9942F7847D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 15:27:17 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 6A08621A92;
	Wed, 28 Feb 2018 10:27:16 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute7.internal (MEProxy); Wed, 28 Feb 2018 10:27:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=uewB35R2h7iAaVISEv4j6FDjyjQDDoXm+NDgIir7khs=; b=xtdpX
	Ou2bMjCb5VV7QUDhCOb5c0Ko89vOOKJK1t0YiMlN+zes/LC9W2SZ+M+bE2N1JiSR
	CmYBiJ/bTPwNlU5CeIaqgKDntfF5xvU7JV1cjOgMxHTT3Xn/XOEiOIAwHYgCI8Ar
	z4Vn6PlqcLLdfcaHNRlt/gnot2/cICrQDMUoMg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=uewB35R2h7iAaVISEv4j6FDjyjQDD
	oXm+NDgIir7khs=; b=nA/4A5mspm+BHpjBlhfi12xENZayrhRqi/rtJuxolJbf0
	wpk4RBv939PwYdg130NZ3BSA/w+fzPzuFNuvQeJk5/vWmeEEIRWztSEKNle3dUM4
	RmlS0sfauinHzCnowYCFVdS50cZ2b9rrtP6R5FxW3M+Z6BrbRE3qf2jVpKzR6vdY
	Hkt+pCkhEy+q36Diskc21WdcQ16NC5Accif/01JDEDpB9rn1l6Dpoz+2sUK4L6BE
	tazxcettvkE7HPpuCO/4NqBwt1cA5doReeIBaAhjloUUlpIdGitWC8yW5zL6tK6r
	rsrmuvm4OvxHP0Fbfp0yMsNAc18wmIrB6TJzh96iA==
X-ME-Sender: <xms:VMqWWgqjxDwZqDXX4oClCzXz235OXYOyU6n1zSVHIsujrOKKGArzQg>
Received: from localhost (cold-front.org [173.230.129.52])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2A46C7E4EC;
	Wed, 28 Feb 2018 10:27:16 -0500 (EST)
Date: Wed, 28 Feb 2018 10:27:15 -0500
From: Justin Bronder <jsbronder@cold-front.org>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20180228152715.GF23655@lasswell>
Mail-Followup-To: Justin Bronder <jsbronder@cold-front.org>,
	akuster808 <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20180226201605.29261-1-jsbronder@cold-front.org>
	<806bddf2-7986-14b0-3470-23a47731ef60@gmail.com>
MIME-Version: 1.0
In-Reply-To: <806bddf2-7986-14b0-3470-23a47731ef60@gmail.com>
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
X-List-Received-Date: Wed, 28 Feb 2018 15:27:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 27/02/18 21:51 -0800, akuster808 wrote:
> 
> 
> On 02/26/2018 12:16 PM, Justin Bronder wrote:
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
> If the recipe is renamed to cppzmq_4.2.3.bb, will that work too?

Keep the patch and also rename?  Yeah, I'd find that more clear but I wasn't
sure if using the git checkout (and hence _git suffix) was a feature so I didn't
want to change it.

> 
> - armin
> > +SRCREV = "v${PV}"
> >  
> >  SRC_URI = "git://github.com/zeromq/cppzmq.git"
> >  
> 

-- 
Justin Bronder

