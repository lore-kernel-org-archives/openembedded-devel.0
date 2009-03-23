Received: from [12.173.51.132] (helo=emailgateway.hillcrestlabs.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Phil.Black@hillcrestlabs.com>) id 1LlqmP-0003Ui-5C
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Mar 2009 21:29:53 +0100
X-AuditID: 0a1e000a-b7b75ae0000056bf-ea-49c7f0e95030
From: Philip Black <phil.black@hillcrestlabs.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Mar 2009 16:28:25 -0400
Message-Id: <1237840105.6879.115.camel@pblack-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-Brightmail-Tracker: AAAAAA==
Subject: Package Dependency question.
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
X-List-Received-Date: Mon, 23 Mar 2009 20:29:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Is there a way to get packages to rebuild when the kernel version
changes?  For example, if I modify the kernel config, and change the PR
value, I would like any external modules to get rebuilt.  My problem is
that if I don't rebuild them, when I try to insert the modules built
against previous revisions of the kernel, I get errors due to the kernel
version magic.

I've tried setting the do_setscene function to depend on various targets
of the kernel (configure, install, populate_staging) but none of them
seem to work.

Any help would be appreciated.

Phil


