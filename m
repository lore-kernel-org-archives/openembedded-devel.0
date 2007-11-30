Received: from [209.85.146.180] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <cliff.brake@gmail.com>) id 1Iy6hc-0002FG-Il
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2007 15:18:48 +0100
Received: by wa-out-1112.google.com with SMTP id l24so2988951waf
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2007 06:15:39 -0800 (PST)
Received: by 10.115.89.1 with SMTP id r1mr2406691wal.1196432139485;
	Fri, 30 Nov 2007 06:15:39 -0800 (PST)
Received: by 10.114.254.11 with HTTP; Fri, 30 Nov 2007 06:15:39 -0800 (PST)
Message-ID: <f96d234e0711300615kb15b49bif5d815156f3b12c3@mail.gmail.com>
Date: Fri, 30 Nov 2007 09:15:39 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: creating ipks for all package dependencies
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2007 14:18:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I recently ran into an issue where I bitbake'd subversion.  I then
tried to install subversion from an ipkg feed, and ipkg complained
about dependencies not being available (neon, etc).  It turns out that
bitbake does not run the do_package_write_ipk task due to recent
corrections in the way dependencies are handled, so the ipks for
subversion dependencies where not in the feeds.  Richard suggested
merging a task from poky that forces all ipk files to be generated.
It has not been merged in OE, and to use do the following:

bitbake <your recipe> -c buildall

This will force ipks for all dependencies of <your recipe> to be built
as well as the package you are building.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


