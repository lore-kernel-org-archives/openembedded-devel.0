Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id B5FDF73081
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Mar 2017 13:43:46 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20170302134344107_0486;
	Thu, 02 Mar 2017 13:43:44 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=41594 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cjR17-0007EE-52; Thu, 02 Mar 2017 08:43:37 -0500
Date: Thu, 2 Mar 2017 08:43:35 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: Derek Straka <derek@asterius.io>
In-Reply-To: <CADNbA1o_PQuAMf_-zwDFwbJsxud2NjffiDa+q9Wa16sFRJ5hWQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1703020842570.14789@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703020815110.14308@uk63952.mitel.com>
	<CADNbA1o_PQuAMf_-zwDFwbJsxud2NjffiDa+q9Wa16sFRJ5hWQ@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: PYPI_PACKAGE for (blacklisted) python[3]-ndg-httpsclient is incorrect
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
X-List-Received-Date: Thu, 02 Mar 2017 13:43:46 -0000
Content-Type: text/plain; charset=US-ASCII

On Thu, 2 Mar 2017, Derek Straka wrote:

> The URL https://pypi.python.org/pypi/ndg_httpsclient/0.4.2 gets a 301 and
> redirects to https://pypi.python.org/pypi/ndg-httpsclient/0.4.2.  FWIW, the
> recipe hasn't been blacklisted in master for a while.

  ah, i never bothered going down that extra directory level to notice
the redirection.

> On Thu, Mar 2, 2017 at 8:26 AM, Robert P. J. Day <rpjday@crashcourse.ca>
> wrote:
>
> >
> >   in my wanderings, i noticed the following line in the include file
> > recipes-devtools/python/python-ndg-httpsclient.inc:
> >
> >   PYPI_PACKAGE = "ndg_httpsclient"
> >
> > however, that appears to be incorrect -- the correct name over at
> > pypi.python.org is, in fact, "ndg-httpsclient" (making the assignment
> > to PYPI_PACKAGE superfluous, yes?)
> >
> >   https://pypi.python.org/pypi/ndg-httpsclient/0.4.2
> >
> > one would think that would cause problems; however, the python3
> > version of the recipe is blacklisted for the following reason:
> >
> >   http://errors.yoctoproject.org/Errors/Details/130615/
> >
> > so one would never get the opportunity to see the build error. still,
> > wouldn't that cause the python2 version of the recipe to fail? that
> > one isn't blacklisted.
> >
> >   thoughts?
> >
> > rday
> >
> > --
> >
> > ========================================================================
> > Robert P. J. Day                                 Ottawa, Ontario, CANADA
> >                         http://crashcourse.ca
> >
> > Twitter:                                       http://twitter.com/rpjday
> > LinkedIn:                               http://ca.linkedin.com/in/rpjday
> > ========================================================================
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


