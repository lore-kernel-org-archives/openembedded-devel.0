Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JCESw-0006K1-41
	for openembedded-devel@openembedded.org; Tue, 08 Jan 2008 14:26:02 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m08DJ41n029785
	for <openembedded-devel@openembedded.org>; Tue, 8 Jan 2008 13:19:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29467-08 for <openembedded-devel@openembedded.org>;
	Tue,  8 Jan 2008 13:18:57 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m08DInma029757
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 8 Jan 2008 13:18:49 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <47836C9B.3000407@gmx.net>
References: <47836C9B.3000407@gmx.net>
Date: Tue, 08 Jan 2008 13:18:47 +0000
Message-Id: <1199798327.6053.11.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: add osso version of libtool and libatk
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
X-List-Received-Date: Tue, 08 Jan 2008 13:26:02 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-01-08 at 13:29 +0100, Robert Schuster wrote:
> on IRC it was suggested to put this on the mailing list.
> 
> I want some osso versions (Maemo-specific) of some software packages in
> OE to be able to build compatible packages:
> 
> http://bugs.openembedded.org/show_bug.cgi?id=3384
> 
> If no one objects I would like to apply the patches there.

I have two concerns:

a) libtool at least duplicates a lot of recipe, we should be encouraging
more .inc usage.
b) packages is becoming large and unwieldy

There could be a case for splitting packages into say:

packages/ 
packages-gpe/
packages-maemo/
packages-openmoko/
packages-opie/

Sadly these two points don't work well together since .inc/patch sharing
with collections enabled doesn't work. This is something I think we need
to fix as a priority.

The advantage to b) is I can then remove groups of files from the
equation easily and speed up parsing and reduce the chances of bad
things like  maemo packages breaking my normal ones...

This disadvantage is that you end up with libtool in two places and if
one is updated, the other could be missed.

Reluctantly I'd therefore say it could be committed now if an .inc file
is created for libtool and maybe improved for atk but we should consider
the wider issue.

I'd also make a case for given vendor 'hacked' versions a
DEFAULT_PREFERENCE = "-1" so you have to explicitly select them.

Cheers,

Richard







