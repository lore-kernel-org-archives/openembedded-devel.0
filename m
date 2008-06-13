Received: from [209.85.128.186] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philipp.zabel@gmail.com>) id 1K76BZ-0002yE-K3
	for openembedded-devel@openembedded.org; Fri, 13 Jun 2008 12:07:09 +0200
Received: by fk-out-0910.google.com with SMTP id 19so2236504fkr.12
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Jun 2008 03:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=ncfh44VKHhP63Gem8Ocd8SoPdgb3+6Cag18jRWSjq/8=;
	b=dpb2L2EYBRdundmthwZnD6YQnUlmU8uIXFIdIWFwBvznV7S8t7GMHVzQL24iriWMkO
	QUN2VyEZDGi5wtnIUW/GB5guPzcbwsMOPnenNenYEoFSXGzycUzC2WzZLUuvO2q0YWZx
	YKH03IbucLYlklq7+5bBQjwXUkSSjdH+t+Y38=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=QMtW6rQ5c5LN1zTGrcBVTnIZYHD8Q63OAdgTzf47UllvMu6cJ5cV1DFNs1DqMLmyKY
	ocOW0Oot6RbHb/7wJjQFibBMu3UtM/xSkhRa9S5q3IyCA16ae7fEoIEyDJrnV/hK1X1b
	NFhRyYpg4SLQkeWmu2blkVsDJ9Wmt7zNXbFL4=
Received: by 10.82.145.7 with SMTP id s7mr153912bud.71.1213351619566;
	Fri, 13 Jun 2008 03:06:59 -0700 (PDT)
Received: by 10.82.119.12 with HTTP; Fri, 13 Jun 2008 03:06:59 -0700 (PDT)
Message-ID: <74d0deb30806130306tf5ca604t7238ab26d715e03@mail.gmail.com>
Date: Fri, 13 Jun 2008 12:06:59 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1213345201.13942.3.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <1213345201.13942.3.camel@dax.rpnet.com>
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: Switching SCM to git and commit/review policy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 13 Jun 2008 10:07:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Jun 13, 2008 at 10:20 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> After much discussion the OE core team unanimously agree that a change
> of SCM to git would be in the best interests of the project. The main
> reasons for this are:
>
> * more powerful merging/branching capabilities in git
> * better web facilities to browse changes
> * better performance
> * larger and more active userbase
> * lack of developer momentum with monotone
>
> There has been discussion about this on the developers list in the past
> where most viewpoints were well represented and we don't really feel
> that opening the choice of SCM for further discussion would be
> beneficial although obviously anyone is free to raise serious objections
> to this.

Good news.

> As always, there is a but. This change is conditional on being able to
> come up with a sensible commit and review policy for OE.dev. The core
> team does feel that the metadata quality has dropped over time in some
> areas and we need to have a better review process. The change to an SCM
> with good branch support is a vital part of this but not the only part.
>
> We've not made any decisions on what the commit/review policy should be,
> this is open for discussion. We're thinking it may take the form of some
> kind of kernel style Signed-off-by: tags and a switch to a partially
> pull based model rather than just push based as we use monotone so more
> than one developer handles any given change.

Personally, I'd like to see every patch to OE being sent to and
reviewed on the mailing list.
About a pull based model, wouldn't we need something like the kernels'
subsystem maintainers to share the load? Seeing that there already
seems to be a serious manpower problem, who would have the time to do
that?

> The timescales for switching are not yet established and whilst we have
> some server infrastructure in place, its not all there yet. Lets starts
> the discussion on commit and review policy and in the meantime we'll
> establish some timescales. I'd expect we'll aim to switch quite quickly
> now the hard decision is made.
>
> Finally, we'd like to mention that whilst some people have had issues
> with it, on balance, monotone has served us well and want to thank the
> monotone guys for the help and support they've given us.
>
> The OE Core Team

regards
Philipp


