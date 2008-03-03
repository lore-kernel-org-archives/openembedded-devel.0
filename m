Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1JW3Qk-0002gr-Mn
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Mar 2008 06:41:47 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 9DD52AC7E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Mar 2008 00:40:33 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Mon, 03 Mar 2008 00:40:33 -0500
X-Sasl-enc: 2s+hci1+O2GZC8xXVzmo1sGftLWyxVI53KDSEIaS+Y3n 1204522833
Received: from [192.168.248.18] (98.mue2.phnx.la6ca01r1.dsl.att.net
	[12.102.2.98])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 3EC3631A54
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Mar 2008 00:40:33 -0500 (EST)
Message-ID: <47CB8F2D.2060704@whitby.id.au>
Date: Mon, 03 Mar 2008 16:09:57 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <c384c5ea0803021104s4470cb31o45e1295b7564e876@mail.gmail.com>
In-Reply-To: <c384c5ea0803021104s4470cb31o45e1295b7564e876@mail.gmail.com>
X-SA-Exim-Connect-IP: 66.111.4.28
X-SA-Exim-Mail-From: rod@whitby.id.au
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: content addressable fetching of packages, through MD5SUM or SHA1SUM?
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
X-List-Received-Date: Mon, 03 Mar 2008 05:41:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Leon Woestenberg wrote:
> I wonder if someone knows about a content addressable file server, or
> content addressable URL server?
> 
> The idea is that the bitbake fetcher does not use the SRC_URI provided
> URL per se, but can fall back to use the SHA1SUM or MD5SUM to ask
> "something" for alternative locations of the package.

Perhaps just put all the sources in a big git repository.  Then you can 
get them directly by SHA1.

-- Rod


