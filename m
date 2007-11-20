Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IuPbe-0004E9-Uo
	for openembedded-devel@openembedded.org; Tue, 20 Nov 2007 10:41:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lAK9dGGx008830
	for <openembedded-devel@openembedded.org>; Tue, 20 Nov 2007 09:39:16 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08524-09 for <openembedded-devel@openembedded.org>;
	Tue, 20 Nov 2007 09:39:12 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lAK9dCCD008823
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 20 Nov 2007 09:39:12 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <4742217C.9060506@whitby.id.au>
References: <20071119120819.GA17788@lenovo>
	<47419EA0.4030308@student.utwente.nl> <4742217C.9060506@whitby.id.au>
Date: Tue, 20 Nov 2007 09:39:10 +0000
Message-Id: <1195551550.6337.15.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Tue, 20 Nov 2007 09:41:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-11-20 at 10:21 +1030, Rod Whitby wrote:
> The challenge I put to yourself and a couple of other people from the OM
> core team in IRC a couple of weeks or months ago still stands:
> 
> Show how you can use bitbake such that you can cd into a build area, and
> type a *single* bitbake command to do a build, then cd into a different
> build area (with a different distro and machine) and type a *single*
> bitbake command to do a build there.  No other commands are allowed.
> 
> At the moment, you need to set many environment variables before bitbake
> can do it's job, and you need to reset them when you move into a
> different area to do a different build.  That's the reason why there are
> makefile wrappers around simple bitbake commands.
> 
> If we can fix the underlying problem (needing to type more than one
> command to build an image with bitbake), then I will fully support a
> move to get rid of all bitbake wrappers from all the Makefiles that I
> manage.
> 
> Instead of just saying that you won't tolerate something, how about
> understanding *why* that something is done, and then work together to
> improve the existing tools so that something no longer needs to be done
> cause the tools already cover that use case.

Would you agree that bitbake itself isn't painful to use? "bitbake xyz"
is just as simple as "make image" (or whatever)?

See my previous mail about how Poky handles this: "source script;
bitbake xyz". I realise this isn't the one stop shop you describe but I
think the fact bitbake is exposed to the user is a really positive move
and well worth the slight extra learning curve. The script being sourced
can even hint at the commands to run...

If the makefile worked like that, exposing the user to bitbake instead
of hiding it, most of the opposition to the makefile would be removed.

Cheers,

Richard



