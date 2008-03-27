Received: from [62.70.27.150] (helo=hoat.troll.no)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tcooksey@trolltech.com>) id 1JerFZ-0006sW-Rc
	for openembedded-devel@openembedded.org; Thu, 27 Mar 2008 13:30:34 +0100
Received: from hoat.troll.no (tedur.troll.no [62.70.27.154])
	by hoat.troll.no (Postfix) with SMTP id 195E720962
	for <openembedded-devel@openembedded.org>;
	Thu, 27 Mar 2008 13:30:32 +0100 (CET)
Received: from sx01.troll.no (sx01.troll.no [62.70.27.21])
	by hoat.troll.no (Postfix) with ESMTP id 12E8D2046F
	for <openembedded-devel@openembedded.org>;
	Thu, 27 Mar 2008 13:30:32 +0100 (CET)
Received: from sx01.troll.no (localhost.localdomain [127.0.0.1])
	by sx01.troll.no (8.13.8/8.13.8) with ESMTP id m2RCUVDk010537
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2008 13:30:31 +0100
Received: from tomdev.troll.no (tomdev.troll.no [10.3.5.39])
	by sx01.troll.no (Scalix SMTP Relay 11.3.0.11339)
	via ESMTP; Thu, 27 Mar 2008 13:30:31 +0100 (CET)
Date: Thu, 27 Mar 2008 13:30:49 +0100
From: Tom Cooksey <thomas.cooksey@trolltech.com>
To: openembedded-devel@openembedded.org
Message-ID: <200803271330.49774.thomas.cooksey@trolltech.com>
In-Reply-To: <200803271217.41967.thomas.cooksey@trolltech.com>
References: <200803271217.41967.thomas.cooksey@trolltech.com>
x-scalix-Hops: 1
Organization: Trolltech
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Subject: Re: LEAD_SONAME?
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
X-List-Received-Date: Thu, 27 Mar 2008 12:30:38 -0000
Content-Type: text/plain;
	charset="US-ASCII"
Content-Disposition: inline

On Thursday 27 March 2008 12:17:41 Tom Cooksey wrote:
> I'm guessing it's got something to do with automatic 
> dependency tracking? Do I just list the shared libraries my package 
> provides? If so, which version? The .so, .so.major, .so.major.minor or 
> the complete .so.major.minor.patch?

Ok, I've tried adding all the libraries the package contains to LEAD_SONAME,
but now it's complaining with this:

NOTE: Multiple matches (...) for LEAD_SONAME 'libQt*'

So I guess it's only designed for a single .so file? What about packages with
multiple .so files?

I see this is all going on in debian.bbclass. Does this mean .ipkgs are now
debs?

I am actually splitting off all the individual libraries into seperate packages,
so should I be defining LEAD_SONAME_foo?

I'm also getting a truely bizzare problem, possibly related, where .so files are
missing from the packages. If I look in ${WORKDIR}/install I get a directory
for each package I've defined. The packages which should have .so files in
${libdir} are missing these files. However, I also have some .so files (plugins)
in a different directory, and they are fine?

I'm very confused, please could someone shed some light for me?


Cheers,

Tom


