Received: from [64.233.166.181] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <papercrane@gmail.com>) id 1GK8vS-0002Ca-Lb
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Sep 2006 09:31:22 +0200
Received: by py-out-1112.google.com with SMTP id i75so2123567pye
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Sep 2006 00:28:42 -0700 (PDT)
Received: by 10.35.128.1 with SMTP id f1mr9534453pyn;
	Mon, 04 Sep 2006 00:28:42 -0700 (PDT)
Received: by 10.35.119.19 with HTTP; Mon, 4 Sep 2006 00:28:42 -0700 (PDT)
Message-ID: <432beae0609040028l59aa15cfrebcf105c6eb250c8@mail.gmail.com>
Date: Mon, 4 Sep 2006 00:28:42 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: bitbake freeze
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Sep 2006 07:31:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I just remembered the old "freeze" command that John Bowler wrote a
while ago and tried to use it. Unfortunately it doesn't seem to work
with the current OE. I started hacking it and decided I should try
python instead. After hacking some python in freeze.bb's do_build I
realized I needed some features of bitbake but wasn't sure how to
access them from a bb file. I ended up patching the bitbake shell to
include a "freeze" command which does what I wanted it to.

http://oe.reversefold.com/bitbake-freeze.patch

I realize the shell isn't really the right place for this and that
this might be nicer in a bb file somewhere but this is how I could get
it working.

It currently makes an assumption about the relationship between TMPDIR
and the conf directory (where local.conf resides). This should be
configurable.

It also has code to both go through the Packages file in the default
feed and to go through the directories in the work directory. While
the Packages idea was a good one it doesn't take into account -native
packages and therefore won't work 100% on its own. The code to go
through the work directories assumes a 2 deep structure (as the
multi-machine code does it). Since this is a confurable thing (part of
OE) this wouldn't work in bitbake either really... Likely the Packages
code should just be removed entirely as it's superfluous (the work
directories give you everything) and it makes an assumption about feed
structure and how up to date the feed's Packages is.

It also always assumes that you want anything in the directory where
your provider's bb files are. This could be changed to give the
original provider's bb file and not replace it with *.bb. It could
even perhaps do both (as John's previous freeze did).

Let me know what you think and any suggestions for making the code better.

-- 
Justin Patrin


