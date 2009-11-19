Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NB98X-0005zD-Pw
	for openembedded-devel@openembedded.org; Thu, 19 Nov 2009 16:41:36 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAJFau1Z016606
	for <openembedded-devel@openembedded.org>; Thu, 19 Nov 2009 15:36:56 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WQf9CLq2nOOT for <openembedded-devel@openembedded.org>;
	Thu, 19 Nov 2009 15:36:56 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAJFanlB016562
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>; Thu, 19 Nov 2009 15:36:51 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Nov 2009 15:39:44 +0000
Message-Id: <1258645184.5229.46.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE.dev staging changes - Progress so far
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
X-List-Received-Date: Thu, 19 Nov 2009 15:41:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Its been 10 days since I posted the summary and started pushing some of
the changes. There have been some bumps but the changes so far seem to
have settled down quite well.

The proposals and status is as follows:

a) Adopt the removal of the layout_* variables from Poky.

Done.

b) Change the do_populate_staging/do_stage functions to use the results 
   from the do_install step as proposed in other emails

Implemented but many recipes still use the legacy path.

c) Adopt the native.bbclass changes from Poky to allow use of 
   BBCLASSEXTEND = "native"

Done.

d) Start removing legacy do_stage functions and convert exclusively to 
   the new model

Not really started yet. Poky has now converted all of its recipes to the
new model and has no legacy staging however so there are plenty of
examples out there.

e) Start converting recipes to BBCLASSEXTEND = "native"

Not really started yet. Poky has conversions of many recipes.

f) Merge the new canadian SDK classes from Poky and start a gradual 
   conversion to them with a view to obsoleting the existing sdk and 
   canadian recipes.

The classes have been merged.

g) Rename "do_populate_staging" to "do_populate_sysroot" and 
   "TMPDIR/staging" to "TMPDIR/sysroots" to reflect how much this 
   directory has changed and to truly reflect its contents. The word 
   "staging" confuses a lot of new users in my experience.

Implemented in Poky but not ported to OE yet.

h) Enable packaged staging as default, with a view to making it
   mandatory after a suitable transition period.

Not done yet.


So to summarise, the list of tasks remaining is therefore:

a) Generate a list of recipes using legacy staging during parsing and 
   save it into tmp?
b) Start to convert recipes to use do_install for staging. Poky has 
   many examples.
c) Start to add BBCLASSEXTEND = "native" to recipes
d) Start to add BBCLASSEXTEND = "nativesdk" to recipes
e) Port the "do_populate_staging" to "do_populate_sysroot" change from 
   Poky to OE.dev
f) Enable packaged staging as default.


Cheers,

Richard






