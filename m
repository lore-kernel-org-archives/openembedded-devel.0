Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 0699671BA0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 12:36:03 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20170220123602221_0684
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 12:36:02 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [174.118.92.171] (port=54404 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cfnC8-0006UD-Hw for openembedded-devel@lists.openembedded.org;
	Mon, 20 Feb 2017 07:35:56 -0500
Date: Mon, 20 Feb 2017 07:35:54 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20170220121915.GC3266@jama>
Message-ID: <alpine.LFD.2.20.1702200735001.1518@localhost.localdomain>
References: <alpine.LFD.2.20.1702200641270.22953@localhost.localdomain>
	<alpine.LFD.2.20.1702200709170.28884@localhost.localdomain>
	<20170220121915.GC3266@jama>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: Re: "Can't install krb5-dev-1.13.6-r0@ppc7400: no package provides krb5 = 1.13.6-r0"
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
X-List-Received-Date: Mon, 20 Feb 2017 12:36:04 -0000
Content-Type: text/plain; charset=US-ASCII

On Mon, 20 Feb 2017, Martin Jansa wrote:

> On Mon, Feb 20, 2017 at 07:10:56AM -0500, Robert P. J. Day wrote:

> >   a simple solution was to add the line:
> >
> > ALLOW_EMPTY_krb5 = "1"
> >
> > to my local.conf. is that really the proper fix?
>
> Removing the runtime dependency on krb5 from krb5-dev is usually
> preferred, search ML it was discussed few times.

  ok, wouldn't be doing my job if i didn't ask ... why isn't this
change just added to the recipe file?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


