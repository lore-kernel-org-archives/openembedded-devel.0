Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1Iy4PZ-0006OY-3E
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2007 12:52:01 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 6B7B157E60
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2007 06:48:53 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Fri, 30 Nov 2007 06:48:53 -0500
X-Sasl-enc: +bOaUJnk4cetPmCO3QJXwTFIKK66tJuB+UWDF2YVwqre 1196423333
Received: from [192.168.18.13] (CPE-121-209-18-182.sa.bigpond.net.au
	[121.209.18.182])
	by mail.messagingengine.com (Postfix) with ESMTP id BB24E17917
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2007 06:48:52 -0500 (EST)
Message-ID: <474FF886.7060308@whitby.id.au>
Date: Fri, 30 Nov 2007 22:18:22 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <474EA852.7090306@whitby.id.au>	<474ECF9A.6050603@student.utwente.nl>
	<b6ebd0a50711290902te78ad84hd8cf64829a66c95@mail.gmail.com>
In-Reply-To: <b6ebd0a50711290902te78ad84hd8cf64829a66c95@mail.gmail.com>
X-Enigmail-Version: 0.95.5
Subject: Re: RFC: auto eth0 and auto eth1 in netbase
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
X-List-Received-Date: Fri, 30 Nov 2007 11:52:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Chris Larson wrote:
> Afaik, the execution of the hotplug/coldplug scripts on startup should
> generate the hotplug events for the ethernet interfaces and bring them
> up that way.  In debian, the hotplug scripts bring them up with ifup
> --allow=hotplug [iface], such that you need an 'allow-hotplug eth0' in
> interfaces to have them brought up that way.  I'm too rusty with OE to
> say how we do it today, but it's not likely that auto is needed.

Unfortunately, the busybox ifup applet does not support the
allow-hotplug keyword.

Based on the feedback, I'll add 'auto eth0'.

-- Rod


