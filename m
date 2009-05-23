Received: from [213.39.232.198] (helo=mail.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <di@fh-wedel.de>) id 1M7mmF-0007JO-Qt
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 May 2009 10:40:23 +0200
Received: by mail.fh-wedel.de (Postfix, from userid 959)
	id 5A70E547E4; Sat, 23 May 2009 10:32:37 +0200 (CEST)
Date: Sat, 23 May 2009 10:32:37 +0200
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090523083237.GA28055@fh-wedel.de>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: glibc-dbg used by anyone?
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
X-List-Received-Date: Sat, 23 May 2009 08:40:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

 sorry for the repost, but the problem persists on my system.

In glibc-package.bbclass there is a glibc-dbg in the PACKAGES
list. However after a build (nylon/mtx-1, glibc 2.3.3) I find
empty binaries in the .debug dirs under install and image.
Looking at the recipes I find that glibc is built with
"--disable-debug".

So I'd like to know if this package can be built successfully
and / or is used by anyone else? If not, would anyone mind just
removing it from the list of packages in glibc-package.bbclass?

Cheers,

Martin

-- 
----------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
Die Freiheit ist uns ein schoenes Weib. 
Sie hat einen Ober- und Unterleib.


