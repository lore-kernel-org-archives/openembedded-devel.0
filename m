Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1PZ694-0002sT-9F
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Jan 2011 19:25:38 +0100
Received: (qmail 21051 invoked by uid 1003); 1 Jan 2011 18:25:16 -0000
Received: from unknown (HELO ?192.168.1.167?)
	(philip@opensdr.com@74.107.167.114)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	1 Jan 2011 18:25:16 -0000
Message-ID: <4D1F718C.60601@balister.org>
Date: Sat, 01 Jan 2011 13:25:16 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1293810428-31078-1-git-send-email-fransmeulenbroeks@gmail.com>	<1293810428-31078-2-git-send-email-fransmeulenbroeks@gmail.com>	<ifl85e$ets$1@dough.gmane.org>	<AANLkTikBC4nhO1ZSkuYcyoEPNonS4YeXCP6vzKJ3d3Fr@mail.gmail.com>	<iflbfm$rlm$1@dough.gmane.org>
	<AANLkTi=fQY0ovo=UU4+cJLSj4J68Nu2uiFne37zUBOQX@mail.gmail.com>
In-Reply-To: <AANLkTi=fQY0ovo=UU4+cJLSj4J68Nu2uiFne37zUBOQX@mail.gmail.com>
Subject: Re: [PATCH 2/2] omap4430-panda: fix u-boot
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
X-List-Received-Date: Sat, 01 Jan 2011 18:25:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/01/2011 01:12 PM, Frans Meulenbroeks wrote:
>
> We have a broken recipe and I feel it should be fixed.

Broken only for some OE use cases. Not broken for others.

The wrong solution to the problem is to replace a recipe that works for 
the people who use it with a recipe that creates untested output. U-boot 
is a fiddly piece of software, updates should be tested on hardware 
before they are pushed.

Let's keep the focus on the real issue here, disappearing sources versus 
recipes that produce untested output.

Disappearing sources are an issue beyond just rebased git repos. Distros 
that provide binaries to end users must provide for this event to 
provide GPL compliance. So it really is not a big deal.

Philip


