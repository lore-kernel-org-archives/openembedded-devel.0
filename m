Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <zecke@selfish.org>) id 1IuWwZ-0000C7-Ij
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2007 18:31:27 +0100
Received: from dsl-62-220-14-162.berlikomm.net ([62.220.14.162]
	helo=abughraib.localdomain) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1IuWuT-0000wI-7S
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2007 18:29:17 +0100
Message-Id: <AC6F0C81-8564-4172-925E-FCE0FD09A895@selfish.org>
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <008f01c82b8a$89c8ab50$6e01a8c0@twilight>
Mime-Version: 1.0 (Apple Message framework v915)
X-Priority: 3
Date: Tue, 20 Nov 2007 18:29:16 +0100
References: <20071119120819.GA17788@lenovo><C7148B94-6A92-42DE-BF35-75B409DAA8E7@selfish.org><4741FB41.7080602@trolltech.com>
	<1195551213.6337.9.camel@localhost.localdomain>
	<008f01c82b8a$89c8ab50$6e01a8c0@twilight>
X-Mailer: Apple Mail (2.915)
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
X-List-Received-Date: Tue, 20 Nov 2007 17:31:28 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


Am 20.11.2007 um 16:32 schrieb Mike (mwester):
>
> Unless it is the intent to create a barrier to entry?

A couple of  groups I consider:

1.) People knowing what they do:
	-If they want to use a Makefile they should use it and I'm totally  
happy with that (Mike I count you here)

2.) System Integrators:
	-They should understand what bitbake is doing and what OE is doing.  
They will need it for doing their job. And a Makefile is not helping  
them, Documentation will help them. They will evolve to 1.) and can do  
what they want...

3.) Users of a Distribution (NSLu2, OpenMoko, Angstrom) that want to  
build:
       - It is a distribution decision on how they want to bootstrap  
people and a Makefile seems to work for them. And I'm totally fine and  
happy with that because in case of issues the distro support team will  
support the users.
       - E.g. familiar has a nice use of zenity/dialog for that.


4.) People that want to add a package/fix a package in OE:
       - Our documentation could be better and we rely on good support  
on mailinglists and irc. How to improve? Better documentation? Anyway  
I don't think a Makefile will help here...

5.) Makefile for OE:
     - What MACHINE to set, what DISTRO to set, what tweaks to add?  
Who is deciding that? E.g. with the current proposal it is qemux86 and  
angstrom. OpenEmbedded is more than Angstrom, more than qemux86 and  
you would have to write more wrappers to hide the configuration. But  
what we do is just postponing the exposure to Monotone, OE and BitBake  
and I don't think this is clever. So IMO and others it doesn't make  
sense to have a MasterMakefile for OE because we target so many  
different things and it would be utterly complex to always do the  
right thing. e.g. we could use the MasterMakefile of NSLu2 as a  
template and put that into contrib so distributions can decide to use  
that, but again for OE it just doesn't make sense.

    - Making it harder to entry? Actually I think it is partially  
true: I have the impression that a Makefile for OE attracts users that  
will do the following:

     make foo
      ... "ERROR: You need to apt-get install make"

   Random User: The Makefile doesn't work it says "ERROR: You need to  
apt-get install make". What should I do?

    <wearing OE hat>I want users that have basic reading and  
comprehension capabilities. And honestly I think I'm not asking for  
too much here.</wearing OE hat>


And the last words: If I'm in a project or a company targetting  
something special I will do number three and use Richards approach and  
write sourcable shell scripts for the configuration. But then again I  
can do that there because I know what I target and I know what my work  
mates are supposed to do/use. For OE as multipurpose meta data  
repository I believe a Makefile doesn't make sense (think of make  
MACHINE=neo DISTRO=foo build-package-foo).

I think the key is to differentiate and I hope I did that. So a  
Makefile, zenity script, sourceable shell scripts in a contrib/distro- 
decisions/ as a template pool might make sense...


love
    z.



