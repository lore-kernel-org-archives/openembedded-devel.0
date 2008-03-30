Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1JfxpV-0008QD-5k
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Mar 2008 15:44:13 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 11474A8BA1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Mar 2008 09:44:12 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Sun, 30 Mar 2008 09:44:12 -0400
X-Sasl-enc: Bh3seru7rfwXq+qWbArwa9yXG/1eSBD/TXy4INjksXlf 1206884651
Received: from [192.168.18.11] (unknown [121.209.24.91])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 35D69E204
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Mar 2008 09:44:10 -0400 (EDT)
Message-ID: <47EF991C.2040001@whitby.id.au>
Date: Mon, 31 Mar 2008 00:13:56 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <c384c5ea0803300616k3a3219ek6d48878f57ed4ef9@mail.gmail.com>
In-Reply-To: <c384c5ea0803300616k3a3219ek6d48878f57ed4ef9@mail.gmail.com>
Subject: Re: base.bbclass: Enable overwrite flag for unzip command
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
X-List-Received-Date: Sun, 30 Mar 2008 13:44:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Leon Woestenberg wrote:
> During rebuilds I noticed unpacking a zip a second time fails, whereas tar
> silently succeeds, overwriting files.
...
> I will shortly commit the following change (after a test), which enables
> overwrite behaviour for unzip:
> 
> -base.bbclass:574:               cmd = 'unzip -q'
> +base.bbclass:574:               cmd = 'unzip -q -o'

+1 - I had the same problem arise today with ixp4xx-npe-native.

-- Rod


