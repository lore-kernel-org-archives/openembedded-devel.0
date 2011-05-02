Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radoslav@kolev.info>) id 1QGqFB-00011K-L6
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 12:20:45 +0200
Received: by vws2 with SMTP id 2so4728118vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 May 2011 03:18:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.75.165 with SMTP id d5mr5873337vdw.300.1304331488831; Mon,
	02 May 2011 03:18:08 -0700 (PDT)
Received: by 10.52.166.231 with HTTP; Mon, 2 May 2011 03:18:08 -0700 (PDT)
Date: Mon, 2 May 2011 13:18:08 +0300
Message-ID: <BANLkTik1xhYidSX6QugYpYv5BmXCL78JUA@mail.gmail.com>
From: Radoslav Kolev <radoslav@kolev.info>
To: openembedded-devel@lists.openembedded.org
Subject: buildindex is always 0, using BB_GIT_CLONE_FOR_SRCREV = "1"
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
X-List-Received-Date: Mon, 02 May 2011 10:20:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I'm trying to make a recipe which gets the newest revision from a git
repository.

Also to get upgradable packages on different build machines I have the

BB_GIT_CLONE_FOR_SRCREV = "1"

option set in my local.conf.

In the recipe I have

SRCREV = "${AUTOREV}"
PV = "0.4+gitr-${SRCPV}"

but I always get a PV of the form
0.4+gitr-0+f5bb7404c351a08cf405fbe8d667b446ae8e0ef5-r10 where the
buildindex stays at zero, even though new revisions are correctly
checked out from the git repository.

I added some print statements to bitbake/lib/bb/fetch/__init__.py and
git.py and it seems to work fine until some point.

The _sortable_buildindex in git.py returns the correct incrementing
value, also the first invocation of get_srcrev() returns a correct
value with incrementing buildindex like
168+f5bb7404c351a08cf405fbe8d667b446ae8e0ef5l. But then something
happens and in all subsequent invocations by bitbakeit get_srcrev()
always returns 0+f5bb7404c351a08cf405fbe8d667b446ae8e0ef5l.

Any help or ideas how to further debug the issue are greatly
appreciated.  I'm using bitbake 1.10.

Best regards,
Radoslav Kolev


