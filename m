Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JMjE6-00083c-2Q
	for openembedded-devel@openembedded.org; Wed, 06 Feb 2008 13:18:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m16CIHs2030206
	for <openembedded-devel@openembedded.org>; Wed, 6 Feb 2008 12:18:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29808-09 for <openembedded-devel@openembedded.org>;
	Wed,  6 Feb 2008 12:18:13 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m16CIAuj030189
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 6 Feb 2008 12:18:10 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <47A91B74.9040605@palm.com>
References: <47A78C40.8000308@palm.com>
	<1202166317.4788.105.camel@localhost.localdomain>	<47A7CBE6.70401@palm.com>
	<1202248991.4619.5.camel@localhost.localdomain>
	<47A91B74.9040605@palm.com>
Date: Wed, 06 Feb 2008 12:18:10 +0000
Message-Id: <1202300290.8393.6.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: getVar. setVar, "d", etc.
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
X-List-Received-Date: Wed, 06 Feb 2008 12:18:07 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-02-05 at 18:29 -0800, Rich Pixley wrote:
> When does d change?
> 
> I've got the following bb file which produces results which puzzle me.  
> What I'm seeing is that the two values for d are different instances and 
> that the second function doesn't see the variable which was set in the 
> first because they're using different dictionaries.
> 
> --rich
> 
> def setting(d):
> 
>     import bb
> 
>     print "setting sets in ", d, "\n"
> 
>     bb.data.setVar('FOO', 'bar', d)
> 
>     return "setting"
> 
> X := ${@setting(d)}
> 
> def getting(d):
> 
>     import bb
> 
>     got = bb.data.getVar('FOO', d)
> 
>     print "getting gets %s from " % (got), d, "\n"
> 
>     return "getting"
> 
> Y := ${@getting(d)}

The problem is that you're doing this in ":=" context. The immediate
expansion operator means we have to expand the data overrides before
parsing the variables so overrides work as expected. This makes a copy
of the data object so the result of the setVar is lost inside the
setting function.

Using "X = ${@setting(d)}" instead should make the above example work if
I remember how this works correctly.

Once again I should remind people that := is usually a bad idea (see
recent discussions).

Regards,

Richard



