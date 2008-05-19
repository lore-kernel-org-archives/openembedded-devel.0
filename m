Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Jy0vH-0001KK-PX
	for openembedded-devel@openembedded.org; Mon, 19 May 2008 10:40:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m4J8cYP3002093
	for <openembedded-devel@openembedded.org>;
	Mon, 19 May 2008 09:38:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01881-05 for <openembedded-devel@openembedded.org>;
	Mon, 19 May 2008 09:38:29 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m4J8cOHG002087
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 19 May 2008 09:38:24 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0805181548o7efe0dc5h5c79b0dccc0d4300@mail.gmail.com>
References: <c384c5ea0805141436m9f5151dje832c2da95379127@mail.gmail.com>
	<1210869726.7097.93.camel@localhost.localdomain>
	<c384c5ea0805151151v35e28a99i2ccb39157d5d47f6@mail.gmail.com>
	<1210887932.7097.107.camel@localhost.localdomain>
	<c384c5ea0805161444m831aa10pdd558b05990f258d@mail.gmail.com>
	<1211061548.5272.21.camel@dax.rpnet.com>
	<c384c5ea0805181548o7efe0dc5h5c79b0dccc0d4300@mail.gmail.com>
Date: Mon, 19 May 2008 09:38:24 +0100
Message-Id: <1211186304.6105.3.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Stop on multiple providers but none explicitly	specified
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 19 May 2008 08:40:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Mon, 2008-05-19 at 00:48 +0200, Leon Woestenberg wrote:
> Richard,
> 
> On Sat, May 17, 2008 at 11:59 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> > On Fri, 2008-05-16 at 23:44 +0200, Leon Woestenberg wrote:
> >> PROVIDER_PREFERENCE seems a bridge too far for me, but hey, any
> >> solution that solves it is better then the current situation.
> >
> > Its the only solution I can see which addresses the problem but it does
> > further complicate the providers logic in bitbake which is already
> > painful and in need of rewriting :/. Other solutions welcome...
> >
> The idea of bailing out when no preferred provider has been set is
> (1) simple
> (2) deterministic
> (3) simple
> 
> Why make it harder then necessary? The stuff is complicated enough as
> it is, especially for new ppl.

The above is harder than necessary. You run bitbake, find something
isn't set, set it, run bitbake, find something else isn't set, set it,
run bitbake, etc.

"Simple" from the user perspective is that it just works and you don't
have to set anything.

IMO, in 95% of cases a user wants the default virtual provider. The only
problem is that at present bitbake has no way of working out what that
is...

If this worked properly there should be no more nasty issues with
external-toolchain bothering people and angstroms distro.conf should
become a lot simpler...

Cheers,

Richard



