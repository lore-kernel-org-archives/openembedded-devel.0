Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HbWiw-0004QI-Fw
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2007 08:54:34 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id C9568215FE4;
	Wed, 11 Apr 2007 02:54:54 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Wed, 11 Apr 2007 02:54:34 -0400
X-Sasl-enc: Z/4WMgwj/2WWjkuCmReaVcZwO91theLWb+shXFkZioVg 1176274474
Received: from [127.0.0.1] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id 62D551DD6B;
	Wed, 11 Apr 2007 02:54:33 -0400 (EDT)
Message-ID: <461C85D6.1010105@whitby.id.au>
Date: Wed, 11 Apr 2007 16:23:10 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.10 (Windows/20070221)
MIME-Version: 1.0
To: Paul Sokolovsky <pmiscml@gmail.com>
References: <1597775703.20070405182752@gmail.com>
	<46156BCD.6060407@whitby.id.au> <02429232.20070410152736@gmail.com>
In-Reply-To: <02429232.20070410152736@gmail.com>
X-Enigmail-Version: 0.94.0.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Adding sanity to OE startup process
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
X-List-Received-Date: Wed, 11 Apr 2007 06:54:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
>   I expected SlugOS project to be important stakeholder for such
> changes, so I appreciate your response, Rob! I had a look at
> slugos-init's syslog handling, and for sure it looks well done and
> should be generalized to the whole OE.

Thanks.  It was mostly done by John Bowler.  Any bugs introduced since
then are my responsibility :-)

>   I guess, at this point, I should just play with it to understand
> how it works better (for example, a question I have in mind: each of
> syslog.{buffer, file, network} appears to just run syslogd with new
> commandline params, not restart it or send signal; is this reliable
> (e.g. documented)? Well, as I tell, I should try it myself first I
> guess.)

Good question.  I thought that only *one* of them would get started,
based on the contents of the destination field in /etc/sysconf.conf at
boot.  Is that not what you're seeing?

-- Rod


