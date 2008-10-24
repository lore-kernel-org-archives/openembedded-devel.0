Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1KtOQH-0006Az-MY
	for openembedded-devel@openembedded.org; Fri, 24 Oct 2008 17:17:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m9OFHM0L002582
	for <openembedded-devel@openembedded.org>;
	Fri, 24 Oct 2008 16:17:22 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02505-02 for <openembedded-devel@openembedded.org>;
	Fri, 24 Oct 2008 16:17:16 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m9OFHAYg002564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 24 Oct 2008 16:17:10 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <f96d234e0810240638u1026aec9y6b258bba5708315f@mail.gmail.com>
References: <20081023230928.GA21151@denix.org>
	<f96d234e0810240638u1026aec9y6b258bba5708315f@mail.gmail.com>
Date: Fri, 24 Oct 2008 16:17:10 +0100
Message-Id: <1224861430.6356.20.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: Add http_proxy and ftp_proxy to BitBake white list
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
X-List-Received-Date: Fri, 24 Oct 2008 15:17:58 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Fri, 2008-10-24 at 09:38 -0400, Cliff Brake wrote:
> On Thu, Oct 23, 2008 at 7:09 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > Hi,
> >
> > I'd like to propose to add http_proxy and ftp_proxy environment variables to
> > BitBake's white list of preserved environment variables. They are usually set
> > to be used by fetching tools like wget for users behind a firewall/proxy.
> > Thanks.
> 
> In my latest tests, it does not seem like http_proxy is used by the bb
> fetcher even when it is included in BB_ENV_EXTRAWHITE.  Has anyone
> else seen this?

Yes, I've just added some extra support for this to the bitbake in Poky.
I'll aim to get that (and some other changes) pushed upstream this
weekend.

Cheers,

Richard



