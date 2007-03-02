Received: from [62.169.194.2] (helo=fesscrpp1.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <skoroneos@digital-opsis.com>) id 1HN32M-0007ct-LU
	for openembedded-devel@openembedded.org; Fri, 02 Mar 2007 09:22:48 +0100
Received: from dias (62.169.211.226) by fesscrpp1.tellas.gr (7.3.117)
	id 45DB18DD00147E9E for openembedded-devel@openembedded.org;
	Fri, 2 Mar 2007 10:21:56 +0200
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Fri, 2 Mar 2007 10:22:44 +0200
Message-ID: <HOECLKEKOHLAMMGDLLBHIEJEKEAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3028
Importance: Normal
In-Reply-To: <45E77A73.5020800@protium.com>
Subject: Re: [oe-commits] org.oe.dev rootfs_ipk: as per OE, policy:	remove feed management tools
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
X-List-Received-Date: Fri, 02 Mar 2007 08:22:50 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Just my 2 euro cents

I am not sure how many of you are building multimachine distro's but the old
system was not a very good solution.
We are building a distro for a number of machines x86 arch (i486, i585,
i686), a number of powerpc targets  and recently mipsel and puttinng
everything in a giant ipk pool is not the best of solutions.

As far as i can understand its a case where  single machine distro's made
use of this OE feature while multimachine distros had to look for other ways
(i.e post processing).
With the recent changes it seems that single machine distro's also need to
do some post-processing in order to get going and people are upset about
that

From what i read so far there seems to be 2 solutions
Either allow for the old behaviur of OE through some 'switch' and let the
distro mainter decide what do to or document the new way of handling feeds.
In my case i would prefer the second option, as both single and multimachine
distro's could use the same mechanism to update their feeds

Stelios






