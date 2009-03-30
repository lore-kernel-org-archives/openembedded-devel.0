Received: from [213.39.232.198] (helo=mail.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <di@fh-wedel.de>) id 1LoIUi-0007n1-Vu
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 16:29:45 +0200
Received: by mail.fh-wedel.de (Postfix, from userid 959)
	id 2378B547D5; Mon, 30 Mar 2009 16:27:37 +0200 (CEST)
Date: Mon, 30 Mar 2009 16:27:37 +0200
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090330142737.GA12011@fh-wedel.de>
MIME-Version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: sane-toolchain-glibc.inc and old g++ versions
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
X-List-Received-Date: Mon, 30 Mar 2009 14:29:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

 the include file sane-toolchain-glibc.inc contains this line:

| CXXFLAGS += "-fvisibility-inlines-hidden" 

This option is not supported by g++ 3.3.4 which is used for
mtx-1/2/3. I am aware that this compiler is rather old, however
it is known to produce stable code for the above platforms. 

If possible, I would like to use the sane-toolchain.inc in my
conf/distro/nylon.conf, but this does not seem possible
straightaway. There seem to be two obvious solutions:

 a) I don't use sane-toolchain.inc and need to merge any changes
    in it and its includes into my configuration file by hand

 b) I move all but the offending line into a new file
    sane-toolchain-glibc-oldg++.inc (or whatever name I assign to
    it), include it in sane-toolchain-glibc.inc and set
    PREFERRED_LIBC to "glibc-oldg++" in conf/distro/nylon.conf;
    this of course would be a (hopefully not harmful) change
    to a mechanism used by all the other distros

Needless to say, I'd prefer option (b), if it were fine with
you?

Cheers,

Martin

-- 
----------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
Katz' Law: Man and nations will act rationally when all other 
           possibilities have been exhausted. 


