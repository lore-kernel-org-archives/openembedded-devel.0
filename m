Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JJdJV-0005zp-0j
	for openembedded-devel@openembedded.org; Tue, 29 Jan 2008 00:22:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m0SNMxlv022612
	for <openembedded-devel@openembedded.org>; Mon, 28 Jan 2008 23:22:59 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21488-09 for <openembedded-devel@openembedded.org>;
	Mon, 28 Jan 2008 23:22:51 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m0SNMpQH022583
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 28 Jan 2008 23:22:51 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20080129011635.42467fc9@widy.localdomain>
References: <20080129011635.42467fc9@widy.localdomain>
Date: Mon, 28 Jan 2008 23:22:50 +0000
Message-Id: <1201562570.4687.79.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] A case of distro config overriding DISTRO var
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
X-List-Received-Date: Mon, 28 Jan 2008 23:22:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-01-29 at 01:16 +0200, Paul Sokolovsky wrote:
> I'd like to know what's the idea behind overriding DISTRO var from the
> value being set by user? For example, angstrom.inc does:
> 
> DISTRO = "angstrom" 

It means that the override in active use becomes "angstrom" and we don't
have 1001 different overrides (angstrom2007, angstrom1008 etc.) all over
the tree.

> The problem with is that real distro name is lost, as thus
> cannot be passed to some other tool (e.g., bbimage).
> 
> If there're good reasons to do that, and we would be lazy enough to
> convert to something like: DISTRO_FOO = "${DISTRO}" in bitbake.conf,
> and let those good reasons apply to DISTRO_FOO, which must replace
> DISTRO in the appropriate places, then I at least propose to do:
> 
> DISTRO_ORIGINAL := "${DISTRO}"
> 
> in bitbake.conf, so we always have real distro config name handy.

What you didn't say is where exactly in bitbake.conf you are going to
define that?

You need to put the := directly before the code that changes DISTRO.
Yes, you could add this in bitbake.conf after local.conf and before
including ${DISTRO}.conf but that seems ugly to me.

I'd prefer USERDISTRO = "${DISTRO}" in bitbake.conf and then having
angstrom overriding that using := if it really has to...

Regards,

Richard




