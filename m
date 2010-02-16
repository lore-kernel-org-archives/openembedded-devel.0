Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1NhLRv-0001pd-RU
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Feb 2010 12:18:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 78F8E2CA12;
	Tue, 16 Feb 2010 11:12:08 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i4dDtnK5oETE; Tue, 16 Feb 2010 11:12:04 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 5FCE82CA11;
	Tue, 16 Feb 2010 11:12:03 +0000 (UTC)
Message-ID: <4B7A7E6B.20508@gmail.com>
Date: Tue, 16 Feb 2010 12:15:55 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1266316492.6436.127.camel@rex>
In-Reply-To: <1266316492.6436.127.camel@rex>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: bitbake-dev@lists.berlios.de
Subject: Re: RFC: Improve our default conf file setup
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
X-List-Received-Date: Tue, 16 Feb 2010 11:18:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Richard Purdie ha scritto, Il 16/02/2010 11:34:
> Hi,
> 
> I've been thinking for a while that our "look for a conf/bitbake.conf"
> approach to finding our configuration is rather dated and inflexible.
> Talking to others I think they feel the same way and its time to take a
> step back and think about what we actually need. I've tried to do this
> and I have a proposal based on what I found.
> 
> The fundamental problem currently is that the build directory is not in
> control of what bitbake does. We require BBPATH to be set to some magic
> value, find bitbake.conf, this transfers control back to a single file
> (local.conf) which then further influences things further. The build
> directory has to be combined with the right BBPATH setting.
> 
> Furthermore, we have the powerful overlay extension mechanism but when
> adding an overlay, you have to change BBPATH, BBFILES and a load of
> other things to correctly integrate any overlay into a build.
> 
> So taking a step back, what's needed is for the build directory to have
> the basic configuration contained within it and no need for some magic
> BBPATH. Overlays should ship with configuration information attached to
> them.
> 
> I therefore propose that before conf/bitbake.conf, bitbake looks for a
> conf/bblayers.conf. This file sets a variable BBLAYERS.
> 
> BBLAYERS is simply a list of overlay directories to include for the
> given build directory.
> 
> For *each* overlay listed, bitbake will then include conf/layer.conf.
> This is the main change in behaviour for bitbake since normally only one
> file of a given name would ever be included but I think this makes sense
> to give us some new functionality.
> 
> These layer.conf files are free to do whatever they need such as adding
> paths to BBPATH, BBFILES and so on (I see new variables being added
> which is to be encouraged e.g. extra site files). Experimenting, its
> obvious the one thing you need in a layer.conf file is the layer
> directory name so I've let bitbake set this in the LAYERDIR variable.
> 
> LAYERDIR is a tricky thing since you always want to do immediate
> expansion on it since it will change later. This is going to catch
> people out but so be it, it works really well.
> 
> The nice thing about this approach is that its in keeping with the way
> bitbake works, but its powerful and easily extensible and uses the
> existing configuration syntax, parser and so on.
> 
> I wrote a patch for Poky illustrating how this thing could be used which
> is included below.
> 
> Its also totally backwards compatible. If bblayers.conf doesn't exist,
> it uses the old behaviour and you can mix and match them if you're
> careful too.
> 
> Does anyone have any feedback on this approach?
> 
> Cheers,
> 

Richard,
I agree with this proposal, also beacuse I have been doing an intensive
use of overlays.
But I'd prefer a single configuration file containing everything rather
than a myriad of small ones.
BTW the totally backwards compatibility makes me comfortable with your
proposal.

Cheers,

--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
         http://www.KaeilOS.com


