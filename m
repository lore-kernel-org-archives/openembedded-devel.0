Received: from netcra.lnk.telstra.net ([203.45.127.186]
	helo=mail.ceegeebee.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chris@ceegeebee.com>) id 1NqjeZ-0000cS-Nh
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Mar 2010 09:58:40 +0100
Received: from mail.ceegeebee.com (localhost.localdomain [127.0.0.1])
	by mail.ceegeebee.com (8.13.8/8.13.8) with ESMTP id o2E8Vk3d009271
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Mar 2010 19:01:52 +1030
Received: (from chris@localhost)
	by mail.ceegeebee.com (8.13.8/8.13.8/Submit) id o2E8VkxT009270
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Mar 2010 19:01:46 +1030
Date: Sun, 14 Mar 2010 19:01:46 +1030
From: Chris Bennett <chris@ceegeebee.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100314083146.GA7866@mail.ceegeebee.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.2.3
	(mail.ceegeebee.com [127.0.0.1]);
	Sun, 14 Mar 2010 19:01:52 +1030 (CST)
X-SA-Exim-Connect-IP: 203.45.127.186
X-SA-Exim-Mail-From: chris@ceegeebee.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,WEIRD_PORT
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gnutls_2.8.5.bb
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
X-List-Received-Date: Sun, 14 Mar 2010 08:58:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi there,

I'm very new to openembedded-devel, and after experimenting with a
variety of recipes, I'm adapting the micro set of distro/recipes to my
needs.  I am having a problem building gnutls - I see in the git logs
that an update was done on 5/03/2010 to remove older versions and make
2.8.5 be the only one availbale.

My log of the error according to bitbake is:

[..]
| automake: unknown warning category `cross'
| doc/Makefile.am:27: ENABLE_GTK_DOC does not appear in AM_CONDITIONAL
| gtk-doc.make:7: GTK_DOC_USE_LIBTOOL does not appear in AM_CONDITIONAL
| doc/reference/Makefile.am:135:   `gtk-doc.make' included from here
| gtk-doc.make:50: ENABLE_GTK_DOC does not appear in AM_CONDITIONAL
| doc/reference/Makefile.am:135:   `gtk-doc.make' included from here
| gtk-doc.make:173: ENABLE_GTK_DOC does not appear in AM_CONDITIONAL
| doc/reference/Makefile.am:135:   `gtk-doc.make' included from here
| doc/reference/Makefile.am:147: ENABLE_GTK_DOC does not appear in AM_CONDITIONAL
| autoreconf: automake failed with exit status: 1
| FATAL: autoreconf execution failed.
NOTE: Task failed: /home/chris/oe/micro-dev/work/i686-oe-linux/gnutls-2.8.5-r0/temp/log.do_configure.14113
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/chris/oe/openembedded.org/recipes/gnutls/gnutls_2.8.5.bb do_configure failed
ERROR: Task 652 (/home/chris/oe/openembedded.org/recipes/gnutls/gnutls_2.8.5.bb, do_configure) failed
NOTE: Tasks Summary: Attempted 865 tasks of which 0 didn't need to be rerun and 1 failed.
ERROR: '/home/chris/oe/openembedded.org/recipes/gnutls/gnutls_2.8.5.bb' failed

I havn't seen anyone else report this, so I'm hoping someone can help
me to fix this as presumably others have this working.  I'm building
this on Ubuntu 9.04, git tree is up to date.  I've just tried
removing the  ~/oe/$DISTRO-dev/ folder, which I understand should
result in everything being recompiled again.  gnutls still failed with
the error above.

Any help would be appreciated.

Thanks,

Chris Bennett
cgb


