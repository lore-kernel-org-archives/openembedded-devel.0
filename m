Received: from [64.233.182.185] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1Gb26d-00015d-4y
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Oct 2006 23:40:43 +0200
Received: by nf-out-0910.google.com with SMTP id l23so1565006nfc
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2006 14:33:32 -0700 (PDT)
Received: by 10.49.75.2 with SMTP id c2mr8836849nfl;
	Fri, 20 Oct 2006 14:33:31 -0700 (PDT)
Received: from CUBE ( [85.202.124.214])
	by mx.google.com with ESMTP id n23sm2623995nfc.2006.10.20.14.33.31;
	Fri, 20 Oct 2006 14:33:31 -0700 (PDT)
Date: Sat, 21 Oct 2006 00:33:31 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <595433076.20061021003331@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [RFC] Preferring tar.bz2 over tar.gz if there's a choice
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Oct 2006 21:40:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello openembedded-devel,

  Nowadays, with multimegabyte software downloads, many projects
provide both tar.bz2 and tar.gz archives for downloads. I'd like to
make a proposal that we prefer tar.bz2 over .gz for obvious reason of
saving bandwidth and disk space for lots of people using OE. In
particular, I'd like to propose that it's ok to change .gz to .bz2 if
such case is spotted.

  We should be reasonably safe with this, as gzip can be considered
pretty well a legacy archiver for big downloads now. The projects
which started use bzip2 hardly give it up. And of course, many
projects alreday use bzip2 solely, so it's not like adding a new
dependency for OE.

  Specifically, I have such patches for gdb_6.4 and libxml2_2.6.26 now
in my tree.

  (One would ask - why do I care up to the level of patchuing existing
recipes? I'm exactly one of bandwidth-challenged, so try to use cheap
local mirrors, and the mirrors of course usually have .bz2. I checked
taht upstream actually provides .bz2, of course.)


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



