Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Jozwk-0002J0-DE
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Apr 2008 13:49:02 +0200
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id CF9536280B1;
	Thu, 24 Apr 2008 13:48:52 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Apr 2008 13:52:20 +0200
Message-Id: <1209037940.21700.107.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.0 
Subject: brokenness of native builds by cross-compile site scripts
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 24 Apr 2008 11:49:02 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hallo.

I have just searching for reason, why a lot of native build started to
fail with strange errors.

I started with debugging of glib-2.0-native:
/bin/sh: line 6: 20886 Segmentation fault      ./glib-genmarshal --nostdinc --prefix=g_cclosure_marshal ./gmarshal.list --header >> xgen-gmh

Looking info config.log:
configure:1952: loading site script /OE/org.openembedded.dev/site/endian-little
...
configure:1952: loading site script /OE/org.openembedded.dev/site/arm-common
...
configure:1952: loading site script /OE/org.openembedded.dev/site/arm-linux

It loads totally confusing site values valid for arm instead of correct
x86_64-linux, and leads to miscompilation and crash.

If I empty upper mentioned site files, compilation succeeds.

As it seems to be deeper in the build engine, I was not yet able to find
and fix the problem.

If somebody could help with fixing of it, I would be glad.
-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



