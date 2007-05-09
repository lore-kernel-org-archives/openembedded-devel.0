Received: from [64.233.162.232] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1HlidH-0004bH-V4
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 May 2007 11:38:52 +0200
Received: by nz-out-0506.google.com with SMTP id m22so118698nzf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2007 02:38:18 -0700 (PDT)
Received: by 10.64.181.12 with SMTP id d12mr611733qbf.1178703498630;
	Wed, 09 May 2007 02:38:18 -0700 (PDT)
Received: from cube ( [77.122.190.213])
	by mx.google.com with ESMTP id m2sm7787549nzf.2007.05.09.02.38.17;
	Wed, 09 May 2007 02:38:18 -0700 (PDT)
Date: Wed, 9 May 2007 12:38:21 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <02827798.20070509123821@gmail.com>
To: Junqian Gordon Xu <xjqian@gmail.com>
In-Reply-To: <464130FC.7030008@gmail.com>
References: <464130FC.7030008@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: QA for intentionally unpackaged files
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
X-List-Received-Date: Wed, 09 May 2007 09:38:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Junqian,

Wednesday, May 9, 2007, 5:25:00 AM, you wrote:

> Now there is no way to distinguish if the following is intensional by 
> the package maintainer or an oversight without taking a closer look at
> the contents

        So, maybe "closer look" is indeed a solution here?

> NOTE: the following files were installed but not shipped in any package:
> NOTE:   /usr/lib/libpython2.4.so
> NOTE:   /usr/lib/.debug/libpython2.4.so.1.0
> NOTE:   /usr/share/man/man1/python.1
> NOTE:   /usr/bin/python2.4
> NOTE:   /usr/bin/smtpd.py
> NOTE:   /usr/bin/.debug/python

> Maybe we should have something in insane.bb to take care of the 
> intentionally unpackaged crusts. So we can do something like the 
> following in a bb file to intensionally leave out some garbage unpackaged:

> UNSHIPPED = "${libdir}/libpython2.4.so ${bindir}/smtpd.py"  #reason why
> not package/ship it

        Who exactly will go over all recipes and add such lines?

> so during do_package or package_QA, it would show as

> NOTE: the following files were installed but not shipped in any package:
> NOTE:   /usr/lib/libpython2.4.so   UNSHIPPED #reason why not 
> packaged/ship it

        No, thanks, it likely shouldn't dump them at all then.

> NOTE:   /usr/lib/.debug/libpython2.4.so.1.0
> NOTE:   /usr/share/man/man1/python.1
> NOTE:   /usr/bin/python2.4
> NOTE:   /usr/bin/smtpd.py  UNSHIPPED #reason why not packaged/ship it
> NOTE:   /usr/bin/.debug/python

> Is SUNK a better word than UNSHIPPED?

        No.

> Gordon


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



