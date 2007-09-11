Received: from [194.158.229.41] (helo=mail-ps.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dv@vollmann.ch>) id 1IVE7k-00050q-AA
	for openembedded-devel@openembedded.org; Wed, 12 Sep 2007 00:22:24 +0200
Received: from octo.vollmann.ch (212.98.43.140) by mail-ps.sunrise.ch (8.0.010)
	id 46CB871F003B6397 for openembedded-devel@openembedded.org;
	Wed, 12 Sep 2007 00:19:19 +0200
Received: from octo (localhost [127.0.0.1])
	by octo.vollmann.ch (8.11.2/8.11.2) with SMTP id l8BMMTn01884;
	Wed, 12 Sep 2007 00:22:29 +0200
Sender: dv@vollmann.ch
Message-ID: <46E71524.4CAFCDBC@vollmann.ch>
Date: Wed, 12 Sep 2007 00:22:29 +0200
From: Detlef Vollmann <dv@vollmann.ch>
Organization: vollmann engineering gmbh
X-Mailer: Mozilla 3.04 (X11; U; Linux 2.4.21 i686)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200709111318.52432.openembedded@haerwu.biz>
	<c384c5ea0709111037o723dda57x171c148a0f93a91a@mail.gmail.com>
	<1189545452.6163.65.camel@localhost.localdomain>
Subject: Re: Task-base is big :(
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
X-List-Received-Date: Tue, 11 Sep 2007 22:22:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> Is this overlay public? Even if we can't use it directly a summary of
> what you find unacceptable of the current approach in OE would be useful
> to see.
I don't have a full overlay, but here's an example:
$ cat python-my_2.5.1.bb
require python_${PV}.bb

DEPENDS = "python-native readline zlib gdbm openssl sqlite3 tcl"

EXTRA_OECONF = "--with-threads --with-pymalloc --with-cyclic-gc \
                --with-signal-module --with-wctype-functions \
                --enable-shared"

PROVIDES += "python"

The difference to the original python .bb is the removing of
 DEPEND: tk
  This would build a whole X11 system, and I definitely don't want that.

 EXTRA_OECONF: --without-cxx
  I want the C++, so I configure it with it.

The interesting part cannot be seen here: the package is lying.
python_2.5.1.bb is including python-2.5-manifest.inc, and that
declares to provide "python-tkinter" which is simply wrong.
But to remove that would either mean to provide a full own
edited copy of the manifest, or to remove the wrong declarations
again, which requires syntax I don't know.

 Detlef

-- 
Detlef Vollmann   vollmann engineering gmbh
Linux and C++ for Embedded Systems    http://www.vollmann.ch/


