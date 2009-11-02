Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1N4xGs-0001Wy-Mt
	for openembedded-devel@openembedded.org; Mon, 02 Nov 2009 14:48:37 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nA2DiVoM025274
	for <openembedded-devel@openembedded.org>; Mon, 2 Nov 2009 13:44:31 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id H02H2ASwv2Kr for <openembedded-devel@openembedded.org>;
	Mon,  2 Nov 2009 13:44:31 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nA2DiRPQ025257
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>; Mon, 2 Nov 2009 13:44:29 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Mon, 02 Nov 2009 13:43:27 +0000
Message-Id: <1257169407.11338.71.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Staging - time to end the current mess?
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
X-List-Received-Date: Mon, 02 Nov 2009 13:48:39 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

At OEDEM two years ago I proposed radically altering the way staging
worked. For those that don't remember the bad old days, the staging
directory layout didn't match that of the target file system meaning
every recipe needed a custom do_stage and things were a mess.

We changed the layout allowing the use of the gcc/binutils sysroot
options and also started widespread use of autotools_stage_all and I'd
say things look much improved compared to how they were.

Anyone who has looked at the packaged-staging code will probably agree
there is still a way to go though - its horrendously complicated. We
also do a lot of duplication. I'd like to propose a new simple way of
doing things. We'd have the following work flow:


[...]
do_compile - up to here all as usual
do_install - Everything installs into a DESTDIR (including -native)
do_package - Takes a copy of the DESTDIR, applies any .la/.pc mangling
             then splits into packages as usual
do_populate_staging - Takes a copy of the DESTDIR, mangles, installs 
             into staging and creates staging packages from this

Firstly, does any disagree with this approach or can we all agree its a
nice objective?

Pros:

* Only one "make install"
* We can start to work out the differences between do_install and 
  do_stage and minimise them (there should be none bar .la mangling)
* Cleaner and simpler do_stage step
* Packaged-Staging becomes much simpler
* Builds should be faster as staging timestamp snapshots are not 
  required and staging lock taking should be minimal.

Cons:

* Very different to what we have now - how to get there?
* Likely to be some breakage in any transition

I really like the idea in principle, in practise its hard to get there
incrementally without breaking things. I'm trying to come up with some
code which does that and I'm hoping to have something for OEDEM.

For now I'd like to ask if there is agreement we need to do this and
support to make this happen?

Cheers,

Richard





