Received: from [217.200.184.87] (helo=fepna03-svc.tim.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gremlin@gremlin.it>) id 1LdM2H-0000sc-NF
	for openembedded-devel@openembedded.org; Sat, 28 Feb 2009 11:03:09 +0100
Received: from sesha.loc ([217.203.130.38]) by fepna03-svc.tim.it
	(InterMail vM.6.01.06.03 201-2131-130-104-20060516) with ESMTP
	id <20090228095930.UNT17899.fepna03-svc.tim.it@sesha.loc>
	for <openembedded-devel@openembedded.org>;
	Sat, 28 Feb 2009 10:59:30 +0100
Message-ID: <49A90A73.90109@gremlin.it>
Date: Sat, 28 Feb 2009 10:57:07 +0100
From: Alessandro GARDICH <gremlin@gremlin.it>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200902131728.08634.openembedded@haerwu.biz>	<20090224064639.GE2172@smtp.west.cox.net>	<1235492001.27962.60.camel@andromeda>	<8763izyarp.fsf@neumann.lab.ossystems.com.br>	<fce2a370902241036y359e2c7cv1126a62c8627d2bb@mail.gmail.com>	<20090224185059.GL2172@smtp.west.cox.net>	<87wsbfw9zy.fsf@neumann.lab.ossystems.com.br>	<20090225022507.GP2172@smtp.west.cox.net>	<go4d36$khh$1@ger.gmane.org>	<20090225213536.GT2172@smtp.west.cox.net>
	<49A69032.9050505@opensimpad.org>
In-Reply-To: <49A69032.9050505@opensimpad.org>
Subject: Re: checksums situation
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
X-List-Received-Date: Sat, 28 Feb 2009 10:03:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Bernhard Guillon wrote:
> Tom Rini wrote:
>> This is one of my points.  People think we have security from our
>> current checksum list, but we do not.
>>
>>   
> Then we have to make clear that the checksums are for integrity only and 
> not for security.
> It is impossible for us to do security. E.g. most sourceforge projects 
> do not sign their packages. We would need to review the source of every 
> package to see if it does stuff it should not do. We would also need to 
> track security updates for packages - which we should do anyway.
> 
> Best regards
> Bernhard Guillon
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


Sincerely I don't feel the need of "security" in OE but that is.

In my opinion the checking of the sources is a feature we can have but 
for sure not in a global checksum.ini file, it's unmanageable.
Every recipe, in which is defined a source can have a checksum, as 
someone else proposed is a better solution.

Talking about security in a strict way, check the sources have in my 
opinion no sense, an "evil" recipe could fetch a well signed source of 
ssh (as example) and apply a patch to add a back door.
Checking can be useful but not for security reason, at most just to be 
sure the source is what expect to be.

How checksum behave is source is a latest revision of a VCS ?

Other point, I completely dislike the current behaviour : if a source 
haven't a checksum  fail do build. No please ... the default could be a 
warning not a fail!

I'm sure 90% or OE users got a failure, ask for help and now have 
OE_STRICT_CHECKSUMS = "" in their local.conf ... have it sense ???

In my opinion the default behaviour have to be a warning, for who is 
sensible to a (false) security they can enforce the behaviour (suck as 
-Werror for gcc) but no more.
A warning at the end of bitbake build could also be useful, something 
like "your final image contain non checked sources", but not a FAIL!


Last but more important : why the hell this feature is in the default 
dev branch ??? why wasn't created a "checksum" branch to test it !!!
One thing make OE UNUSABLE for day to day work is the BAD behaviour :
- think a feature
- start (but not finish) to implement it
- push
- make dev branch fail to build
- start to correct/finish the feature
damn, we got git to be easy to branch to test new features!!!


--
  /-------------------------------------------------------------\
|           Alessandro Gardich : gremlin#gremlin!it             |
  >-------------------------------------------------------------<
|  I never saw a wild thing sorry for itself.                   |
|  A small bird will drop frozen dead from a bough              |
|  without ever having felt sorry for itself.                   |
  \-------------------------------------------------------------/



