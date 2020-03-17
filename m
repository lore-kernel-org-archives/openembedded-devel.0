Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
	by mail.openembedded.org (Postfix) with ESMTP id 17D3360B33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 22:41:23 +0000 (UTC)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com
	([174.114.57.56]:58382 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jEKtn-005daE-N1; Tue, 17 Mar 2020 18:41:24 -0400
Date: Tue, 17 Mar 2020 18:41:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Ross Burton <ross@burtonini.com>
In-Reply-To: <06ab2bbe-0bba-6b5c-1fd8-53ad3db16936@burtonini.com>
Message-ID: <alpine.LFD.2.21.2003171833550.3944@localhost.localdomain>
References: <alpine.LFD.2.21.2003171319540.14640@localhost.localdomain>
	<06ab2bbe-0bba-6b5c-1fd8-53ad3db16936@burtonini.com>
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
X-List-Received-Date: Tue, 17 Mar 2020 22:41:24 -0000
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Mar 2020, Ross Burton wrote:

> On 17/03/2020 17:22, Robert P. J. Day wrote:
> >    just noticed that ./meta-oe/recipes-extended/indent/indent_2.2.12.bb
> > on master branch contains the line:
> >
> >    FILES_${PN}-doc += "/usr/doc/indent/indent.html"
> >
> > should that not properly read:
> >
> >    FILES_${PN}-doc += "${prefix}/doc/indent/indent.html"
> >
> > or am i misreading something?
>
> Recipes should never use /usr directly unless they're relocating
> something from e.g. ${D}/usr/lib to ${D}${libdir}.
>
> The recipe should be telling the Makefiles to install into ${docdir}
> (typically, /usr/share/doc).

  ah, of course ... i can submit a patch for that shortly.

rday

