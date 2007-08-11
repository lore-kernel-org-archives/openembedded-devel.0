Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IJqDT-0002bN-Lf
	for openembedded-devel@openembedded.org; Sat, 11 Aug 2007 14:37:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7BCYLU8002946
	for <openembedded-devel@openembedded.org>;
	Sat, 11 Aug 2007 13:34:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02879-02 for <openembedded-devel@openembedded.org>;
	Sat, 11 Aug 2007 13:34:17 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7BCYEJo002940
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sat, 11 Aug 2007 13:34:14 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Sat, 11 Aug 2007 13:34:13 +0100
Message-Id: <1186835653.5859.27.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: RFC: SRC_URI_OVERIDES_PACKAGE_ARCH
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
X-List-Received-Date: Sat, 11 Aug 2007 12:37:18 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

In trying to make SRCREV work efficiently I recently accidentally
changed the behaviour of SRC_URI_OVERIDES_PACKAGE_ARCH.

The old behaviour is that if SRC_URI_OVERIDES_PACKAGE_ARCH is unset (the
default) or set to anything other than 0 the auto PACKAGE_ARCH mechanism
is enabled.

This code goes through SRC_URI translating each URL into a local path
(where the fetched file would be located). It then checks if this local
path matches any standard MACHINE specific path. Examples are things
like:

PN/files/MACHINE/some_conf_file
PN-PV/MACHINE/some_conf_file
PN/MACHINE/some_conf_file

If its a machine specific path, the .bb file is marked as MACHINE
specific with PACKAGE_ARCH=MACHINE_ARCH.

I'd assumed this was opt in and changed the default case, thereby
breaking some recipes.

The problem is that translating SRC_URI to localpaths is computationally
expensive. In the SRCREV case, it involves hitting the network which is
very slow. If we use the localpath calls at all, we hit the database
which will slow down parsing.

We have several options:
 * restore the old behaviour, accept the parsing slowdown
 * limit the parsing to file:// urls only since they're the only ones 
   this applies to anyway. We avoid the network hits, we still hit the 
   database so see some slowdown
 * make it opt in, recipes which might use this feature have to set 
   SRC_URI_OVERIDES_PACKAGE_ARCH=1.
 
The whole OE <-> bitbake fetcher interaction and the associated caching
done in the fetcher needs some serious thought yet again. Ideally it
needs a total rewrite but I'm not sure I can do it whilst maintaining
backwards compatibility :-(.

For reference, I've been trying to postpone the parsing of SRC_URI until
the latest possible moment (fetch/unpack tasks) to try and avoid the
overhead.

I'll keep thinking but I'm open to opinions of the above options. How
much do we value this automatic handling over parsing speed?

Cheers,

Richard




