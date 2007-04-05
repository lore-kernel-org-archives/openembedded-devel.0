Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HZa8I-000429-Gb
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Apr 2007 00:08:42 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id AA5F9212288
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Apr 2007 18:08:48 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Thu, 05 Apr 2007 18:08:42 -0400
X-Sasl-enc: d66fvlATI3vs/6wfPGYBFzx9KpyoGg89WLdxxfzL01q5 1175810922
Received: from [127.0.0.1] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id C870C22334
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Apr 2007 18:08:41 -0400 (EDT)
Message-ID: <46157321.1050607@whitby.id.au>
Date: Fri, 06 Apr 2007 07:37:29 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.10 (Windows/20070221)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1597775703.20070405182752@gmail.com>	<46156BCD.6060407@whitby.id.au>
	<46156E12.9090002@dominion.kabel.utwente.nl>
In-Reply-To: <46156E12.9090002@dominion.kabel.utwente.nl>
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
X-List-Received-Date: Thu, 05 Apr 2007 22:08:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Rod Whitby schreef:
>>> Paul Sokolovsky wrote:
>>>>   So, to start with, I'd like to propose to make it possible for boot
>>>> process to log to syslog. I have following in mind:
>>>>
>>>> 4. Make /etc/init.d/syslogd.sh start earlier so it could capture as
>>>> mush output as possible.
>>> This is something that the syslog.file, syslog.buffer and syslog.network
>>> scripts in packages/slugos-init/files/initscripts try to do.  Syslog to
>>> buffer is started *as* *early* as possible.  Syslog to file is started
>>> as soon as filesystems are mounted, and Syslog to network is started as
>>> soon as the network is up.
> 
> Sounds pretty neat, does the buffer get flushed to file as well?

At the moment, no.  You get to choose the destination in
/etc/syslog.conf, and it only logs to that destination.

(e.g. if you need early debugging, you have to set it to buffer)

-- Rod


