Received: from mail-vc0-f176.google.com ([209.85.220.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1USllu-0002r2-JO
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Apr 2013 12:08:58 +0200
Received: by mail-vc0-f176.google.com with SMTP id hf12so2208905vcb.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2013 02:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=lnd8/zJ3bcRQItkG1WcJSKC/GBSeHUsZkSKmljuGAyg=;
	b=r9ykoQLBYQaDTjn4KCx/uk4MI5ibnngieM9eV5Hf9K0VNRzcyx5extwNx01CbO4qdj
	F93k9dtEnKYspffAp2oADWG62GYQ4I3C27ZAMMnyDtSNfpWADAQSfknFGqbnY2xlI1iV
	fgug+MPL0+MswCmA1JMdbwRnrmtVErhcFi/wp1fxXGSIJaeT/x4oP/WEb3J40+dEWR77
	A0yNpKYoPHZ31NL7VguAH96s8saD2gFh0++MPiVBZV294ln8d/6dsvp8TXGzu/r+d8WS
	IrAPMShdUEoTR/ovWioldf4TOKd8eaeV1/tIf25UGcrvEByUIi23H/WLNQlh+5PzqkDL
	sItQ==
MIME-Version: 1.0
X-Received: by 10.52.27.52 with SMTP id q20mr6759462vdg.16.1366278681326; Thu,
	18 Apr 2013 02:51:21 -0700 (PDT)
Sender: paul.betafive@gmail.com
Received: by 10.220.224.135 with HTTP; Thu, 18 Apr 2013 02:51:21 -0700 (PDT)
In-Reply-To: <CANyK_8cWf21+4CgXwJLE4-nxYGZwhXdpkQEW4MtfaQ5t=QdXMA@mail.gmail.com>
References: <CANyK_8frhEkQ3-ktHygKdQOWZB3cDVEsqLj_VK7ZeLLL-XEj5A@mail.gmail.com>
	<20130416111424.GJ10628@jama.dyndns-home.com>
	<CANyK_8cWf21+4CgXwJLE4-nxYGZwhXdpkQEW4MtfaQ5t=QdXMA@mail.gmail.com>
Date: Thu, 18 Apr 2013 10:51:21 +0100
X-Google-Sender-Auth: -j2CBXhWVAiaXdCAsF9Qj7VMSJk
Message-ID: <CANyK_8ft6aY8KFArMc35eKAZGYET5O++VpErsgWOrOZ9=r8vbA@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] vim 7.3
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
X-List-Received-Date: Thu, 18 Apr 2013 10:09:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

I've now got a recipe for vim-7.3.905 that's been tested on my
Raspberry Pi but I have a few questions before I submit a patch:

1) vim has new patch releases very often so if I stick with a fixed
version we'll fall behind quickly. However the default branch might
become vim-7.4 at some point in the future but I'm not sure we want to
move to that automatically. There isn't even a vim-7.4 development
branch in the upstream repository so that may be a long while away. Do
you have any advice on whether I should specify a fixed version or use
AUTOREV? It could also be possible to include both a vim_7.3.905.bb
file and a vim_hg.bb file.

2) Am I right changing SRC_URI in vim.inc to the mercurial URL and
just keep SRCREV in the .bb file?

3) There's a vimrc file kept along with the recipe for vim, I can't
see much useful in the git history of this file. There's also a
vimrc_example.vim file in the runtime files distributed with vim that
will keep up-to-date with any changes to syntax or features, should we
move to using this?

Thanks,

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


