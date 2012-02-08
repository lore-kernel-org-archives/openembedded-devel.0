Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=378c49496=rich.pixley@palm.com>)
	id 1RuwO6-0001az-GV for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 02:31:58 +0100
X-IronPort-AV: E=Sophos;i="4.73,380,1325491200"; d="scan'208";a="11506250"
Received: from unknown (HELO ushqusdns3.palm.com) ([148.92.223.90])
	by smtp-relay2.palm.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	07 Feb 2012 17:22:49 -0800
Received: from flamingo.palm.com ([148.92.244.134])
	by ushqusdns3.palm.com (8.14.4/8.14.4) with ESMTP id q181McAc025813;
	Tue, 7 Feb 2012 17:22:38 -0800
Message-ID: <4F31CE69.4050107@palm.com>
Date: Tue, 07 Feb 2012 17:22:49 -0800
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120202 Thunderbird/11.0
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: bitbake confusion
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
X-List-Received-Date: Wed, 08 Feb 2012 01:31:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I've just started working with current OE, (Palm has been branched for 
several years).  And I'm a bit confused about how bitbake is supposed to 
work these days.

In the output below, how do I tell where the file with the erroneous 
line might be?  I mean, I can grep, but that won't necessarily tell me 
which file bitbake thought led to the failing include.

What am I missing?

--rich

-*- mode: compilation; default-directory: "/home/rich/projects/webos/" -*-
Compilation started at Tue Feb  7 17:17:22

time make
BBPATH=`pwd`/build:`pwd`/openembedded `pwd`/bitbake/bin/bitbake -v -D 
bootstrap-image
DEBUG: Removed the following variables from the environment: HISTFILE, 
LESS, SSH_CLIENT, CVS_RSH, EMACS, MAKEFLAGS, LANGUAGE, SFDIR, SHLVL, 
HISTSIZE, TMPDIR, EMACSCLIENT, MFLAGS, CVSROOT, NETHACKOPTIONS, EDITOR, 
INSIDE_EMACS, ignoreeof, XENVIRONMENT, ENV, COLUMNS, TERMCAP, SSH_TTY, 
MAKELEVEL, TAPE, GWMPATH, RNINIT, MAIL, SSH_CONNECTION, PAGER, MORE
DEBUG: Clearing SRCREV cache due to cache policy of: clear
DEBUG: Using cache in 
'/home/rich/projects/webos/tmp/cache/bb_codeparser.dat' for codeparser cache
DEBUG: collecting .bb files
DEBUG: Using cache in 
'/home/rich/projects/webos/tmp/cache/eglibc/beagleboard'
Loading cache: 100% || ETA:  00:00:00
Loaded 5 entries from dependency cache.
DEBUG: Using cache in 
'/home/rich/projects/webos/tmp/cache/bb_codeparser.dat' for codeparser cache
ERROR: Could not include required file abiword-2.5.inc
ERROR: Command execution failed: Exited with 1

Summary: There was 1 ERROR message shown, returning a non-zero exit code.
make: *** [all] Error 1

real    0m2.060s
user    0m1.764s
sys    0m0.304s

Compilation exited abnormally with code 2 at Tue Feb  7 17:17:24



