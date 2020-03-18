Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
	by mail.openembedded.org (Postfix) with ESMTP id D8D8A60223
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 11:00:17 +0000 (UTC)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
	([174.114.100.179]:36784 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jEWQs-007gSM-0k; Wed, 18 Mar 2020 07:00:18 -0400
Date: Wed, 18 Mar 2020 07:00:16 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Ross Burton <ross@burtonini.com>
In-Reply-To: <CAAnfSTu1O59FwuShBXQWTaOW7J4m1Hx5Wa_wCw6yRV-E6XNw8Q@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2003180649270.1808135@localhost.localdomain>
References: <alpine.LFD.2.21.2003171319540.14640@localhost.localdomain>
	<06ab2bbe-0bba-6b5c-1fd8-53ad3db16936@burtonini.com>
	<alpine.LFD.2.21.2003171856500.23572@localhost.localdomain>
	<CAAnfSTu1O59FwuShBXQWTaOW7J4m1Hx5Wa_wCw6yRV-E6XNw8Q@mail.gmail.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id:
	rpjday+crashcourse.ca/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: should indent recipe use "${prefix}" instead of "/usr"?
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
X-List-Received-Date: Wed, 18 Mar 2020 11:00:18 -0000
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Mar 2020, Ross Burton wrote:

> >   just to be clear, this depends on where the indent software
> > actually installs the documentation, yes? i'll have to check when
> > i get home as to were that stuff is actually placed. for all i
> > know, it *could* be under /usr/doc.
>
> Yes.
>
> That FILES suggests that the makefile is installing to /usr/doc/ and
> needs to be told somehow to use $docdir.

  never scared to look silly, but i just did a sample build (randomly
chose qemuarm64 MACHINE), added:

  IMAGE_FEATURES += "doc-pkgs"
  RM_WORK_EXCLUDE = "indent"

to local.conf, then ran:

  $ bitbake indent

to look at everything that was generated as part of the "indent" build
and how it was packaged, to understand what that:

  FILES_${PN}-doc += "/usr/doc/indent/indent.html"

line is doing in indent_2.2.12.bb, and maybe i'm misreading what was
produced, but the only documentation content produced and bundled
into the indent-doc rpm package was:

  $ rpm -qpl indent-doc-2.2.12-r0.aarch64.rpm
  /usr
  /usr/share
  /usr/share/man
  /usr/share/man/man1
  /usr/share/man/man1/indent.1
  $

so i'm confused as to that line's purpose ... thoughts?

rday

p.s. it's not like i'm obsessed with the indent package ... i'm more
interested in knowing whether i'm examining this the right way in case
it ever happens again.

