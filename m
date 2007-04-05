Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HZZe3-0003W1-9I
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Apr 2007 23:37:27 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 4A5DB212504
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Apr 2007 17:37:33 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Thu, 05 Apr 2007 17:37:27 -0400
X-Sasl-enc: bHngoQ4G4PmsaKuQn9mt95Q5HU3zRmXTl8FtVjGBw6ib 1175809046
Received: from [127.0.0.1] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id 91FEC1CA39
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Apr 2007 17:37:26 -0400 (EDT)
Message-ID: <46156BCD.6060407@whitby.id.au>
Date: Fri, 06 Apr 2007 07:06:13 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.10 (Windows/20070221)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1597775703.20070405182752@gmail.com>
In-Reply-To: <1597775703.20070405182752@gmail.com>
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
X-List-Received-Date: Thu, 05 Apr 2007 21:37:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
>   So, to start with, I'd like to propose to make it possible for boot
> process to log to syslog. I have following in mind:
> 
> 4. Make /etc/init.d/syslogd.sh start earlier so it could capture as
> mush output as possible.

This is something that the syslog.file, syslog.buffer and syslog.network
scripts in packages/slugos-init/files/initscripts try to do.  Syslog to
buffer is started *as* *early* as possible.  Syslog to file is started
as soon as filesystems are mounted, and Syslog to network is started as
soon as the network is up.

[I'm not suggesting you copy those files directly, or use the
slugos-init package - this all needs to be generalised and subsumed into
the standard init package as part of the slugos reincorporation into
general OE.]

The packages/initscripts/initscripts-slugos_1.0.bb file will show the
init ordering changes that we did to make sure syslog started as early
as possible to help with debugging on a machine (NSLU2) which does not
have a user-visible console at all.

[Again, that recipe still needs to be subsumed into OE proper, so I will
be very interested in working with you to effectively replace the
initscripts-slugos recipe with a new improved initscripts recipe that
suits everyone.]

-- Rod


