Received: from [64.233.166.176] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <xjqian@gmail.com>) id 1Hlbu4-0006Z7-MV
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 May 2007 04:27:44 +0200
Received: by py-out-1112.google.com with SMTP id n39so33193pyh
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 May 2007 19:27:13 -0700 (PDT)
Received: by 10.65.84.5 with SMTP id m5mr61357qbl.1178677633307;
	Tue, 08 May 2007 19:27:13 -0700 (PDT)
Received: from ?192.168.10.106? ( [71.85.151.212])
	by mx.google.com with ESMTP id c12sm36900859nzc.2007.05.08.19.27.11;
	Tue, 08 May 2007 19:27:12 -0700 (PDT)
Message-ID: <464130FC.7030008@gmail.com>
Date: Tue, 08 May 2007 21:25:00 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Icedove 1.5.0.10 (X11/20070329)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: QA for intentionally unpackaged files
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
X-List-Received-Date: Wed, 09 May 2007 02:27:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Now there is no way to distinguish if the following is intensional by 
the package maintainer or an oversight without taking a closer look at 
the contents

NOTE: the following files were installed but not shipped in any package:
NOTE:   /usr/lib/libpython2.4.so
NOTE:   /usr/lib/.debug/libpython2.4.so.1.0
NOTE:   /usr/share/man/man1/python.1
NOTE:   /usr/bin/python2.4
NOTE:   /usr/bin/smtpd.py
NOTE:   /usr/bin/.debug/python

Maybe we should have something in insane.bb to take care of the 
intentionally unpackaged crusts. So we can do something like the 
following in a bb file to intensionally leave out some garbage unpackaged:

UNSHIPPED = "${libdir}/libpython2.4.so ${bindir}/smtpd.py"  #reason why 
not package/ship it

so during do_package or package_QA, it would show as

NOTE: the following files were installed but not shipped in any package:
NOTE:   /usr/lib/libpython2.4.so   UNSHIPPED #reason why not 
packaged/ship it
NOTE:   /usr/lib/.debug/libpython2.4.so.1.0
NOTE:   /usr/share/man/man1/python.1
NOTE:   /usr/bin/python2.4
NOTE:   /usr/bin/smtpd.py  UNSHIPPED #reason why not packaged/ship it
NOTE:   /usr/bin/.debug/python

Is SUNK a better word than UNSHIPPED?

Gordon


