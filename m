Received: from smtp204.alice.it ([82.57.200.100])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1RWQKb-0003Ts-58
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 11:27:01 +0100
Received: from trisquel.localnet (80.116.58.40) by smtp204.alice.it
	(8.6.023.02) (authenticated as editempo@alice.it)
	id 4ECA5ECD0059765D; Fri, 2 Dec 2011 11:20:18 +0100
From: "Denis 'GNUtoo' Carikli" <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 2 Dec 2011 11:20:17 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-12-generic; KDE/4.6.5; x86_64; ; )
References: <4ED8307F.2060306@googlemail.com>
In-Reply-To: <4ED8307F.2060306@googlemail.com>
MIME-Version: 1.0
Message-Id: <201112021120.17762.GNUtoo@no-log.org>
Subject: Re: fso-console-image problems
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
X-List-Received-Date: Fri, 02 Dec 2011 10:27:01 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

What are you using?
SHR-core or openembedded classic?

If you are using shr-core you need to fix that file:
openembedded-core/meta/conf/machine/include/arm/arch-armv6.inc
to include support for armv6-novfp and add a tune file for the CPU of the 
htcdream and then require that cpu tune file in the htcdream machine recipe.

Denis.


