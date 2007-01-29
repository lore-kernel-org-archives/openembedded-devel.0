Received: from [64.233.182.188] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HBczJ-0003Vs-Ac
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Jan 2007 21:20:26 +0100
Received: by nf-out-0910.google.com with SMTP id l24so1977993nfc
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jan 2007 12:20:24 -0800 (PST)
Received: by 10.49.27.11 with SMTP id e11mr7971589nfj.1170102024108;
	Mon, 29 Jan 2007 12:20:24 -0800 (PST)
Received: from CUBE ( [82.193.96.236])
	by mx.google.com with ESMTP id l21sm23623025nfc.2007.01.29.12.20.23;
	Mon, 29 Jan 2007 12:20:23 -0800 (PST)
Date: Mon, 29 Jan 2007 22:20:27 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1618752295.20070129222027@gmail.com>
To: "Nelson Castillo" <nelson@emqbit.com>
In-Reply-To: <2accc2ff0701290940nbdceb0dkf25db7ea19826895@mail.gmail.com>
References: <2accc2ff0701290940nbdceb0dkf25db7ea19826895@mail.gmail.com>
MIME-Version: 1.0
Cc: Stefano Parusso <stefano@ir3arp.net>,
	openembedded-devel@lists.openembedded.org
Subject: Re: Stable versions of OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jan 2007 20:20:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Nelson,

Monday, January 29, 2007, 7:40:11 PM, you wrote:

> Hi.

> I've been following this document
> (http://wiki.emqbit.com//openembedded)
> by Stefano Parusso that explains how to build OE for a ARM board[1].

> It works for the snapshot for November the 7th and not for the most recent
> one. I read in the Getting Started wiki page[3]:

>   Once you have a "known good" version that works well on your
>   system, keep it! To update, clone a new copy; don't overwrite
>   that working version until it's known to be safe.

> So, I guess it means I should stay with the old metadata.

> My questions are:

>   * Does OE ever do "stable" releases?

    OE is a kind of "meta-distribution". To the large part, it leaves
definition of what is stable to specific distributions which are based
on it.

>   * If not, how do you make "stable" releases for yur plataforms?

    By creating branches for specific distributions. For example,
there's a branch for OpenZaurus. As OE uses distributed SCM, you more
or less easily can create and maintain your own private branch, merge
to it from .dev only what you consider stable for you. Even without
creating branch, you can get reasonable level of stability by
pinpointing versions of packages you like to use (in this case you
however at least depend on those versions not being removed, and old
stuff is regularly cleaned up from .dev)

> Regards,
> Nelson.-



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



