Received: from [209.85.128.187] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JRe0b-00085j-4L
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2008 02:44:30 +0100
Received: by fk-out-0910.google.com with SMTP id 18so2925956fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2008 17:43:37 -0800 (PST)
Received: by 10.82.186.5 with SMTP id j5mr13867337buf.12.1203471814364;
	Tue, 19 Feb 2008 17:43:34 -0800 (PST)
Received: from widy.localdomain ( [88.231.76.37])
	by mx.google.com with ESMTPS id z37sm15313789ikz.1.2008.02.19.17.43.32
	(version=SSLv3 cipher=OTHER); Tue, 19 Feb 2008 17:43:32 -0800 (PST)
Date: Wed, 20 Feb 2008 03:44:07 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20080220034407.649326ee@widy.localdomain>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.128.187
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Issue: ldconfig postinst and uclibc
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
X-List-Received-Date: Wed, 20 Feb 2008 01:44:31 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

It appears that ldconfig is not available / optional for uclibc. And
yet currently package.bbclass adds calling it unconditionally to lib
packages' postinst, which causes error messages during install.

Two solutions:

1. Add corresponding logic to package.bbclass. But it appears to be
hacky to encode such facts there.

2. Use "[ -x /sbin/ldconfig ] && /sbin/ldconfig" in postinst. Note:
currently ldconfig is called without a path.


Thoughts?

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


