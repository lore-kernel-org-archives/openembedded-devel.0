Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id D13A96FF78
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2016 09:05:02 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20161124090455724_0486
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2016 09:04:55 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [216.191.234.70] (port=54572 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c9pxY-0001g8-Tq for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2016 04:04:49 -0500
Date: Thu, 24 Nov 2016 04:03:43 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <B0BDB8C7-A743-409A-BF59-AF7AFDB18061@gmail.com>
Message-ID: <alpine.LFD.2.20.1611240402030.22768@ca624034.mitel.com>
References: <alpine.LFD.2.20.1611231326510.15876@localhost.localdomain>
	<5E80B6DC-66EC-499B-84D0-41A5D4F1A1BC@gmail.com>
	<alpine.LFD.2.20.1611231624420.18557@localhost.localdomain>
	<04A98AEA-497D-4919-B83E-27C442F24FB9@gmail.com>
	<alpine.LFD.2.20.1611231725430.20812@localhost.localdomain>
	<B0BDB8C7-A743-409A-BF59-AF7AFDB18061@gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: Re: mozjs/unhandled signal 11/64k page patch/__powerpc64__ ???
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
X-List-Received-Date: Thu, 24 Nov 2016 09:05:05 -0000
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Nov 2016, Khem Raj wrote:

>
> > On Nov 23, 2016, at 2:26 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> > On Wed, 23 Nov 2016, Khem Raj wrote:
> >
> >>
> >>> On Nov 23, 2016, at 1:26 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >>>
> >>> On Wed, 23 Nov 2016, Khem Raj wrote:
> >>>
> >>>> can you reproduce it on version 24 as well ?
> >>>
> >>> not sure what you mean ... this is running on a qemuppc image. i
> >>> haven't tried running this on fedora 24 itself. what exactly do you
> >>> want me to try?
> >>>
> >>
> >> I meant version of mozjs
> >
> >  this is version 17.
>
> OK, I think 24 has such issues taken care of. I am not near code
> right now. but it will be good to check if something is already
> fixed there for this

  is it just me, or is the SRC_URI in mozjs_17.0.0.bb a bit weird?

SRC_URI = " \
    http://ftp.mozilla.org/pub/mozilla.org/js/${BPN}${PV}.tar.gz \
                               ^^^^^^^^^^^ ???

there's no such directory structure.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


