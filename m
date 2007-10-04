Received: from [72.29.79.205] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1IdWAD-0005tt-H9
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2007 21:15:13 +0200
Received: from pd953ad30.dip0.t-ipconnect.de ([217.83.173.48]
	helo=[192.168.4.12])
	by rhodos.klever.net with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.67) (envelope-from <hacker@klever.net>) id 1IdW52-0004fI-2T
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2007 21:09:53 +0200
Message-ID: <47053A35.6040005@klever.net>
Date: Thu, 04 Oct 2007 21:08:37 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.6 (X11/20070911)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1191494488.2516.34.camel@toontown>
	<4704CC05.40206@klever.net>	<B9AD73C2-790F-43EE-9FC4-96F1B1FA9415@selfish.org>	<1191502502.2516.39.camel@toontown>
	<4704EAE3.8050702@klever.net>
	<b6ebd0a50710041136o48edfecbm6afd05d9b921d41f@mail.gmail.com>
In-Reply-To: <b6ebd0a50710041136o48edfecbm6afd05d9b921d41f@mail.gmail.com>
Subject: Re: monotone/git (was hello...)
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
X-List-Received-Date: Thu, 04 Oct 2007 19:15:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> 
> That's not correct.  You can push to a git repository over http/webdav
> to an apache2 server.
>

That's right, but I guess you also know of drawbacks of this method. To
mention one, having webdav *only* for push is somewhat strange, but
since at push time no hooks will be executed (which sucks by itself),
including update-server-info, the repository won't be quite
dumb-protocol-ready.

In short, your statement is theoretically correct, but the fact you
mentioned doesn't change anything.

I think I've heard about some patch providing push over git protocol,
which was dropped due to the lack of ssl connection support and there
were talks about reinstating it along with adding ssl support. But I
don't remember any details.

Love,
H


