Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 6ABE8701D0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jul 2014 11:54:26 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20140727115426255
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jul 2014 11:54:26 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [99.240.204.5] (port=56328 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XBN1w-0008L9-TN for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jul 2014 07:54:20 -0400
Date: Sun, 27 Jul 2014 07:54:12 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
In-Reply-To: <CABcZANmro1OOnNZjAM-mkPjxV7wTUOpKHR9AQrqJTMhV5LOs5g@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1407270753350.4789@localhost>
References: <alpine.LFD.2.11.1407210555370.10857@localhost>
	<CABcZANkamKKfYkMBnit4H8go-_BY_0ePWbg32Fx6oCjNVspiwg@mail.gmail.com>
	<alpine.LFD.2.11.1407260841510.28771@localhost>
	<CABcZANmro1OOnNZjAM-mkPjxV7wTUOpKHR9AQrqJTMhV5LOs5g@mail.gmail.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: Re: i'm assuming some "do_<task>[dirs] =" directives are redundant, yes?
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
X-List-Received-Date: Sun, 27 Jul 2014 11:54:27 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 26 Jul 2014, Christopher Larson wrote:

> On Sat, Jul 26, 2014 at 5:43 AM, Robert P. J. Day <rpjday@crashcourse.ca>
> wrote:
>
> > On Mon, 21 Jul 2014, Christopher Larson wrote:
> >
> > > On Mon, Jul 21, 2014 at 2:59 AM, Robert P. J. Day <rpjday@crashcourse.ca
> > >
> > > wrote:
> > >
> > > >
> > > >   pedantic observation -- i notice in base.bbclass:
> > > >
> > > > do_unpack[dirs] = "${WORKDIR}"
> > > >
> > > >   and over in patch.bbclass:
> > > >
> > > > addtask patch after do_unpack
> > > > do_patch[dirs] = "${WORKDIR}"
> > > >
> > > >   so given that patching has been added as a task after unpacking,
> > > > wouldn't ${WORKDIR} already be guaranteed to exist? doesn't hurt, of
> > > > course, and no, i have no intention of trying to clean any of that up
> > > > :-), i just wanted to clarify the actual mechanics.
> > >
> > >
> > > 'dirs' isn't just a list of dirs to create, it also sets the current
> > > working directory for the task. The last directory listed is where
> > > the path is set.
> >
> >   is that documented anywhere? the "variable flags" section of the
> > bitbake user manual says nothing about that last obviously significant
> > property.
>
> Good question, I have no idea :) Clearly it should be somewhere.

  ok, i'll shoehorn it in there somewhere.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


