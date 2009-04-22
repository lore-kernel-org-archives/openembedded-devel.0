Received: from [213.39.232.198] (helo=mail.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <di@fh-wedel.de>) id 1LweMt-0007E9-Fq
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 17:28:11 +0200
Received: by mail.fh-wedel.de (Postfix, from userid 959)
	id EF4E9547E6; Wed, 22 Apr 2009 17:23:37 +0200 (CEST)
Date: Wed, 22 Apr 2009 17:23:37 +0200
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090422152337.GA31588@fh-wedel.de>
MIME-Version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Does glibc-dbg exist?
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
X-List-Received-Date: Wed, 22 Apr 2009 15:28:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

 in glibc-package.bbclass there is a glibc-dbg in the PACKAGES
list. However after a build (nylon/mtx-1, glibc 2.3.3) I find
empty binaries in the .debug dirs under install and image.
Looking at the recipes I find that glibc is built with
"--disable-debug".

This does not seem consistent, or am I missing out on something?

Cheers,

Martin

-- 
----------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
Hier ich bin, steine Dich wie ein Wirbelwind.


