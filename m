Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Ni9kV-0000vp-F5
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 18:01:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1IGwVXO019451
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 16:58:31 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18936-09 for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 16:58:26 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1IGwPvm019445
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 16:58:25 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <b6ebd0a51002180813q171a3d41kef83d708f4ba6eea@mail.gmail.com>
References: <1266316492.6436.127.camel@rex>
	<b6ebd0a51002160616m462683b3nd2f4b17524395ddf@mail.gmail.com>
	<1266334604.6436.159.camel@rex>
	<201002181009.07359.marcin@juszkiewicz.com.pl>
	<b6ebd0a51002180813q171a3d41kef83d708f4ba6eea@mail.gmail.com>
Date: Thu, 18 Feb 2010 16:58:23 +0000
Message-ID: <1266512303.6436.1199.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
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
X-List-Received-Date: Thu, 18 Feb 2010 17:01:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-02-18 at 09:13 -0700, Chris Larson wrote:
> With COLLECTIONS (and BBLAYERS could work similarly), all the overlay
> priorities and bbpath ordering are automatically determined based on the
> order of entries in the variable.  Documented as highest-to-lowest.
> 
> Note that I'm not necessarily arguing against the use of a per-layer
> configuration file, as this seems like it would be quite useful, but I
> question the need for the boilerplate.

Its certainly possible to put defaults in which would handle the
"standard" case. My main dislike is having to hardcode behaviour and
variable handing into bitbake in that case. 

The idea that adding an empty layer.conf file breaks a previously
working overlay seems counter intuitive too...

Cheers,

Richard






