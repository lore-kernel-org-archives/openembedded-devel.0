Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 3716777513
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Mar 2017 13:39:50 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1488461991; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=VmMtFnEq/EMIrbDvkE5MFfGF5aI+S8W2Uac2Pcud7EA=;
	b=Fc31jVf8RrUjE9aUIaiD0UUeIU4b+dd+K2I1ogTSHqRF9HFGcGV4KBJwiuB3Tp06xCPmDYGc
	GuUKAALBxQBCuq6CRArLQsg/ScnzeobPxO97ERGT9QEvAe/yEG+BmHDJ74lrHbnEybxrEIMI
	zFBTHR0hsk/DNeAuy/vndfeyNRQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Content-Type;
	b=FMnaYKC80TDvcrE3gYqlklMIt+/ZGw3MGZDmIgdFRxeYHBJHlImBWU1zOTQaP/CvkbrMZN
	eYawHWPZE1/Llmvj5eFq2E6ZegNy2bmepvuXTbF+d+LghZLl80/TXRWuUCqKeiy3kWNt/c90
	BTxViEfIsz7QKnd/Pe5lgNHSRoPZg=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mxa.mailgun.org with ESMTP id 58b820a6.7faf0c1b3830-smtp-out-n01;
	Thu, 02 Mar 2017 13:39:50 -0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id 203so118589319ith.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Mar 2017 05:39:50 -0800 (PST)
X-Gm-Message-State: AMke39n56arsZqnUxVVAB0N2c4OLpYrRMcg7GXhDXQF3vkadFtVTv86g5i9jB+i0hqcFEbbiNAnEJCPgDypfTA==
X-Received: by 10.36.82.22 with SMTP id d22mr10291585itb.0.1488461990225; Thu,
	02 Mar 2017 05:39:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.17 with HTTP; Thu, 2 Mar 2017 05:39:49 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1703020815110.14308@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703020815110.14308@uk63952.mitel.com>
From: Derek Straka <derek@asterius.io>
Date: Thu, 2 Mar 2017 08:39:49 -0500
X-Gmail-Original-Message-ID: <CADNbA1o_PQuAMf_-zwDFwbJsxud2NjffiDa+q9Wa16sFRJ5hWQ@mail.gmail.com>
Message-ID: <CADNbA1o_PQuAMf_-zwDFwbJsxud2NjffiDa+q9Wa16sFRJ5hWQ@mail.gmail.com>
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Thu, 02 Mar 2017 13:39:51 -0000
Content-Type: text/plain; charset=UTF-8

The URL https://pypi.python.org/pypi/ndg_httpsclient/0.4.2 gets a 301 and
redirects to https://pypi.python.org/pypi/ndg-httpsclient/0.4.2.  FWIW, the
recipe hasn't been blacklisted in master for a while.

-Derek

On Thu, Mar 2, 2017 at 8:26 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   in my wanderings, i noticed the following line in the include file
> recipes-devtools/python/python-ndg-httpsclient.inc:
>
>   PYPI_PACKAGE = "ndg_httpsclient"
>
> however, that appears to be incorrect -- the correct name over at
> pypi.python.org is, in fact, "ndg-httpsclient" (making the assignment
> to PYPI_PACKAGE superfluous, yes?)
>
>   https://pypi.python.org/pypi/ndg-httpsclient/0.4.2
>
> one would think that would cause problems; however, the python3
> version of the recipe is blacklisted for the following reason:
>
>   http://errors.yoctoproject.org/Errors/Details/130615/
>
> so one would never get the opportunity to see the build error. still,
> wouldn't that cause the python2 version of the recipe to fail? that
> one isn't blacklisted.
>
>   thoughts?
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

