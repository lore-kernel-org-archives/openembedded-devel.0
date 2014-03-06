Return-Path: <cliff.brake@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9F0CB6F3AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Mar 2014 18:32:18 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id l6so2929275oag.25
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Mar 2014 10:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=sgoOkRK5kGEGnwt7TYEBG/h6Iuhm+VOUyf6mm51ARAE=;
	b=fpGdjchHEqvXh/naHQc4MBbQNMFr8BYwEada7LBuw3nzNlJcMQMRFBuAuC/3OXzmBA
	IqEQwtlpQPTtykDLxhCFMqYDL9khntZipNKPYMR+XDVcOPTlroNPV78+hG+x3Wj23MfO
	2uX07JjrTAH51AcppBIOEIZpYvBGdUiJF6VyHEZsESJ2Y6GfFFuVMQfRAxEEy8nrT0mp
	ZzRtZKHhsJMEk5WS35BBW9kQqU+sE8RxXn6m+stpuVHKqJicvK014vnWDdhQY1rm5hNM
	KTkSvvGzLaiOcd+EEViplSkmxAs7gaZocYUX6qTNo+abqquw96xRIATJMcPUWN3PkAtm
	gnDA==
MIME-Version: 1.0
X-Received: by 10.60.98.73 with SMTP id eg9mr1663232oeb.81.1394130739353; Thu,
	06 Mar 2014 10:32:19 -0800 (PST)
Sender: cliff.brake@gmail.com
Received: by 10.182.29.137 with HTTP; Thu, 6 Mar 2014 10:32:19 -0800 (PST)
In-Reply-To: <CAP71WjxZnBfp3agkiw+yGbLWE2p2gzgXGSQ+SBZi9zu+7-cpEQ@mail.gmail.com>
References: <CAP71WjxZnBfp3agkiw+yGbLWE2p2gzgXGSQ+SBZi9zu+7-cpEQ@mail.gmail.com>
Date: Thu, 6 Mar 2014 13:32:19 -0500
X-Google-Sender-Auth: wa0rd07VuQJjNSs0F2xSRK_nUEE
Message-ID: <CAOd_LFyAkzdc4T-FjWh20-iNd7omPEwdhvJecKapUUo3pC0XaA@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: using OE efficiently for development
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
X-List-Received-Date: Thu, 06 Mar 2014 18:32:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Nicolas,

This is the template I use for most projects:

https://github.com/cbrake/oe-build

Custom parts of the system that are under heavy development (kernel,
u-boot, apps) go in an externalsrc directory.

I use git submodules to manage everything, but repo would work as well.

One of my goals was to have everything in separate directories for
easy grepping:

sources
downloads
build/tmp
externalsrc
...

Here is another example using repo: https://github.com/kraj/angstrom-manifest

The OE build system is complex, but is very flexible and works very
well.  The flexibility of fetching sources in different ways is nice,
as different parts of the system really need different tools (are they
under heavy development, etc) vs forcing everything to be in git, etc.

Note sure if this helps, but may generate ideas.

Cliff

On Thu, Jan 16, 2014 at 6:25 PM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> hi there,
>
> i understand the subject is a bit weird.. i am seeking for advice or
> best practices. how would you recommend to deploy OE in a large team
> of devs where it is the main 'build' engine for the entire Linux
> system which is *being developed*. e.g. the developers are the
> 'upstream' developer, but the product/system can only be built with
> OE.
>
> e.g. an OE build does the right thing from an 'integration'
> perspective (fetch from SCM, apply patches, cleanup workspace, ...)
> but are there any recommendations or good practices to use OE in a
> 'development' workflow?
>
> I am familiar with externalsrc of course, but for a very large system
> with 100+ recipes this isn't very practical. for the project I am
> referring the current/legacy workflow is:
>
> 1- checkout all source code required to build the entire system (repo,
> gclient, ...)
> 2- for any development item hack anywhere in any component
> 3- use a top level 'build script'
> 4- iterate until code ready, and push to SCM
>
> Basically, that looks like Android development workflow to illustrate even more.
>
> Now, how do we plug OE in such a workflow? any experience with
> concrete product development would be very much appreciated.
>
> My initial idea (not implemented, just an idea) was to create a conf
> file (or a layer) that has the externalsrc definition for all the
> recipes in the layers under development (typically all the proprietary
> system bits). the idea is to create a workspace such as:
>
> myproduct
> |- oe
> |- upstream
>
> and in 'oe' folder put all the recipes, and in 'upstream' all the
> source code under development (git clone, svn checkout, ...). the
> entire workspace can be checkout with repo/gclient or anything else.
>
> the externsrc variables can point to project in 'upstream' folder such
> that switching from 'integration' mode to 'developer' mode would
> require to include the conf file.
>
> i am thinking that such a 'developer' pattern must be so common, that
> they should be a good solution for it already. of course i am assuming
> that doing (large) development in WORKDIR is not very practical, and
> that would 'force' a large team of developers to become very familiar
> with the inner working of OE (task, clean, rebuild, ..).
>
> any good story to share about how OE is used in such 'developer'
> workflow? if we compare to the Android workflow (no troll please!) an
> OE workflow is more 'difficult' to grasp, i hope you see what i mean.
>
> More generally, i also curious to discuss other typical developer use
> case, such as developing upstream using 'feature branches', ...
>
> thanks
>
> nicolas
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

