Received: from [213.39.232.198] (helo=mail.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <di@fh-wedel.de>) id 1LmG5u-0006NY-B8
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 00:31:43 +0100
Received: by mail.fh-wedel.de (Postfix, from userid 959)
	id D461D547D2; Wed, 25 Mar 2009 00:30:09 +0100 (CET)
Date: Wed, 25 Mar 2009 00:30:09 +0100
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090324233009.GC9461@fh-wedel.de>
MIME-Version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Strange name for cross binutils binaries
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
X-List-Received-Date: Tue, 24 Mar 2009 23:31:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

 just trying another build of OE for nylon/mtx-1 (which is
TARGET_ARCH "mipsel"). Compiling gcc-cross fails with this
message: 

| make[2]: mipsel-linux-ar: Command not found

Looking at tmp/cross, I find that the cross ar got installed
under this name: tmp/cross/mipsel/bin/mipsel-linux-mipsel-linux-ar

This does not seem right, or is there anything which I need to
adapt due to global bbclass/configuration changes?

Cheers,

Martin

-- 
----------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
* Free Speech Online!!! Support the Blue Ribbon Campaign! *


