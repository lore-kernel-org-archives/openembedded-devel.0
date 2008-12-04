Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1L8AvN-0000eG-2r
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Dec 2008 10:55:09 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id BF14B6280B8;
	Thu,  4 Dec 2008 10:51:35 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 04 Dec 2008 10:51:35 +0100
Message-Id: <1228384295.14968.63.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1.1 
Subject: broken shared-mime-info and MIME typing
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
X-List-Received-Date: Thu, 04 Dec 2008 09:55:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Looking at MIME binding, I found that it is now completely broken.

We have mime.class, that provides install-time generating of the
database.

shared-mime-info attempts to provide compile-time generating of the
database. As it does not contain freedesktop.org.xml, any package using
mime.class calling update-mime-database will remove 99% of entries in
the MIME database.

Creating database during the build time is not possible yet and would
require significant changes in update-mime-database (or writing a
different tool):
There is no way to create /usr/share/mime/magic, subclasses, mime.cache
during the build time => it must be done during installation. Note that
mime.cache is a binary file.


Proposal:

- Install freedesktop.org.xml again.
- Change mime.class:
  - Change scripts: First test, whether update-mime-database is
    installed, if yes, then call it.
  - mime class should not RDEPEND on shared-mime-info (now it depends,
    but it is missing there and may cause installation errors)
  - mime_prerm should be probably postrm => update database after
    package removal
- default to --disable-update-mimedb

Alternatives:

- Write update-mime-database alternative capable to build magic without
  freedesktop.org.xml.
- Patch update-mime-database to allow compressed packages/*.xml.
- Return to compile time and write a tool capable to create MIME
  database for all packages available in the feed as the part of
  package-index creation. It would need a special XDG_* variables
  settings, so applications will be able to collect magic from all
  repositories.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



