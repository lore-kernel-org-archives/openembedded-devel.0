Received: from [62.27.45.185] (helo=argo.arachnion.zzZZzz.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1HmZyU-0007rQ-AN
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 May 2007 20:36:19 +0200
Received: from pd9539b78.dip0.t-ipconnect.de ([217.83.155.120])
	by argo.arachnion.zzZZzz.net with esmtpa (Exim 4.42)
	id 1HmZpD-0007KU-4n for openembedded-devel@lists.openembedded.org;
	Fri, 11 May 2007 20:26:43 +0200
Message-ID: <4644B4D1.5010803@klever.net>
Date: Fri, 11 May 2007 20:24:17 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 1.5.0.10 (X11/20070321)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4644ABCB.6080202@openhardware.net>
	<4644B0D2.8020409@dominion.kabel.utwente.nl>
In-Reply-To: <4644B0D2.8020409@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.3.0
Subject: Re: do_rootfs fails
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
X-List-Received-Date: Fri, 11 May 2007 18:36:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> All: Are we still going to wait 1.5 months with requiring 1.8.x? I've seen enough proof
> that 1.6.x is broken with current .dev, with no effort to fix it. "Giving people time to
> prepare the upgrade" has now turned into "Stabbing user in the eye" :(

There's also an option of asking Tom to bitbake -DDD and send it to
zecke, because I couldn't find time to try BB 1.6 for him again. And let
him apply the patch that fixes this problem:

Index: lib/bb/parse/parse_py/BBHandler.py
===================================================================
--- lib/bb/parse/parse_py/BBHandler.py  (revision 817)
+++ lib/bb/parse/parse_py/BBHandler.py  (working copy)
@@ -66,7 +66,9 @@
         if not file in __inherit_cache.split():
             debug(2, "BB %s:%d: inheriting %s" % (fn, lineno, file))
             __inherit_cache += " %s" % file
+            data.setVar('__inherit_cache', __inherit_cache, d)
             include(fn, file, d)
+            __inherit_cache = data.getVar('__inherit_cache', d) or ""
     data.setVar('__inherit_cache', __inherit_cache, d)

Love,
H


