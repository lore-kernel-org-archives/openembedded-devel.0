Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MQ7pi-0004HB-0E
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jul 2009 00:47:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 8CDCB507A01
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jul 2009 18:34:38 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27366-07 for <openembedded-devel@lists.openembedded.org>; 
	Sun, 12 Jul 2009 18:34:38 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 68171506FA3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jul 2009 18:34:38 -0400 (EDT)
Date: Sun, 12 Jul 2009 18:34:38 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <be7a9f3d0907111311t787312ddkea38b876829f88ad@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0907121822380.3621@juice.ott.cti.com>
References: <be7a9f3d0907101039i6a58c3aeof2fc3e1f40d24dd0@mail.gmail.com>
	<4A579CA5.2090708@cbnco.com>
	<be7a9f3d0907111311t787312ddkea38b876829f88ad@mail.gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: Mistakenly pushed changes without review, specially 6633c4c95a
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
X-List-Received-Date: Sun, 12 Jul 2009 22:47:48 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 11 Jul 2009, Otavio Salvador wrote:

> I'd like to fix it now to get it properly pushed.

Hi Otavio,

In bitbake.conf you moved the "Config file processing" section below 
"Include the rest of the config files." If I move it back up, it works.

Some of the included files (i.e. glibc.inc) append a colon and some values 
to OVERRIDES, and I think the parser might have been choking on the empty 
override (':' at the beginning).

You also changed OVERRIDES to use weak assignment (?=). I tested it both 
ways and it doesn't make any difference for me, but should this be weak?

I'm building in an overlay and my distro's config file appends a value to 
OVERRIDES, which may be why I saw it.

Mike


