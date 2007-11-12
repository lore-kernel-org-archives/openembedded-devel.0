Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <Tobias.Pflug@gmx.net>) id 1Ircvz-0004vW-Gl
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Nov 2007 18:18:51 +0100
Received: (qmail 27009 invoked by uid 0); 12 Nov 2007 17:17:29 -0000
Received: from 80.154.6.155 by www089.gmx.net with HTTP;
	Mon, 12 Nov 2007 18:17:29 +0100 (CET)
Date: Mon, 12 Nov 2007 18:17:29 +0100
From: "Tobias Pflug" <Tobias.Pflug@gmx.net>
Message-ID: <20071112171729.267800@gmx.net>
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Authenticated: #283898
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX19XoIlQXE1XvCXHVcY/rYdrP+t6K9zHjrID6ee5OX
	7kuaA3GyKe11UuydrAwxO4XF+T+rQhQbJBOA== 
X-GMX-UID: nbgPcPURbGInSIMiaWRnZRNvcmZ1ZlzD
Subject: calling cross toolchain binaries
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
X-List-Received-Date: Mon, 12 Nov 2007 17:18:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

hi,

I am having some troubles calling ${TARGET_OS}-strip
inside IMAGE_PREPROCESS_COMMAND. In case you might wonder
why I would want to do something like that anyway..
I had to do some patching at various places to keep
packages from stripping when I don't want them to
and now I just want to have full control over
some binaries in my image config.. Anyway..

Just calling ${TARGET_OS} does not do the trick so I
thought I would just have to prepend STAGING_BINDIR_CROSS -
which is set to:

/home/pflug/oedev/pxa270_nor/tmp/staging/x86_64-linux/bin/arm-angstrom-linux-uclibcgnueabi

But that directory does not exist. There is 
a (....)/bin/arm-angstrom-linux-uclibcgnueabi-libtool, but
not the above `arm-angstrom-linux` subdir.

I suppose I am missing something quite obvious but well I just 
don't see it right now.

thanks for any help.

regards,
Tobi


