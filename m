Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S0qeO-0002nO-Qc
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 09:37:13 +0100
Received: by daln34 with SMTP id n34so1938210dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 00:28:49 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.74.74 as permitted sender) client-ip=10.68.74.74; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.74.74 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.74.74])
	by 10.68.74.74 with SMTP id r10mr4631681pbv.83.1330072129837 (num_hops
	= 1); Fri, 24 Feb 2012 00:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=sJaZl3PoOu2SGR4B7SSsiyW39DEa0dDz9HcwQW8fykc=;
	b=G2rLGu+nChIGmPRNRzXCb0G/uygKod72OPvl0e35V4q5kNCQJwKoq15IzBKvcdogXK
	dQs1tGarD1TuY9f+4KM/FJv1l7e2nYqSe848NHRZKkO/fL6u9cXNZzBsITs7RzvXw/Y8
	A5/nnx9jZvD0oyYkNGNWr3a/3iTBmZgokdWB4=
Received: by 10.68.74.74 with SMTP id r10mr3859266pbv.83.1330072129595;
	Fri, 24 Feb 2012 00:28:49 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id r10sm3788242pbs.12.2012.02.24.00.28.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 00:28:48 -0800 (PST)
Date: Fri, 24 Feb 2012 00:29:39 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120224082939.GC2519@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1329940246-28769-1-git-send-email-msm@freescale.com>
	<CAMKF1soS46XnYge0YoU5Zt+4tUX5SJKP=BhdHhn0CR+Hi9avjQ@mail.gmail.com>
	<CAEsOVNcYjwCPq625HP3Oj5hswupj-qNnGCxKFmS2VCkYwpU_ZA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEsOVNcYjwCPq625HP3Oj5hswupj-qNnGCxKFmS2VCkYwpU_ZA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-oe] gcc-4_6-branch-linaro-backports.inc: allow GCC-4_6-BRANCH-LINARO-BACKPORTS to be overridden
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
X-List-Received-Date: Fri, 24 Feb 2012 08:37:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (23/02/12 01:43), McClintock Matthew-B29882 wrote:
> On Wed, Feb 22, 2012 at 3:22 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Wed, Feb 22, 2012 at 11:50 AM, Matthew McClintock <msm@freescale.com> wrote:
> >> This is useful when we want to include meta-oe as is, and also
> >> want to modify the toolchain such that these patches don't apply
> >> cleanly
> >
> > I think the right thing to do is to spin this out into a layer of its
> > own. which we discussed on another thread.
> > if your intention is to just get non/oe-core overridden recipes from
> > meta-oe. This patch not really incorrect
> > but can be then avoided.
> 
> How can I avoid this? If I add the meta-oe layer and I'm using gcc-4.6
> then these seem to always get pulled in via SRC_URI_append? Is there a
> better work around here?

Right now no unless we move it out into a layer of its own

> 
> gcc-4.6.bbappend:
> 
> SRC_URI_append = " ${GCC-4_6-BRANCH-LINARO-BACKPORTS}"
> 
> -M
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


