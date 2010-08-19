Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gremlin@gremlin.it>) id 1Om5sO-0007T2-3T
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 16:13:53 +0200
Received: from deunan.loc (79.0.211.177) by smtp205.alice.it (8.5.124.08)
	id 4C1A264503A16F64 for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 16:08:03 +0200
Message-ID: <4C6D3AF8.8020905@gremlin.it>
Date: Thu, 19 Aug 2010 16:08:56 +0200
From: Alessandro GARDICH <gremlin@gremlin.it>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.7) Gecko/20100720 Fedora/3.1.1-1.fc13 Thunderbird/3.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.1.2
X-SA-Exim-Connect-IP: 82.57.200.101
X-SA-Exim-Mail-From: gremlin@gremlin.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: libc.a sanity check
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
X-List-Received-Date: Thu, 19 Aug 2010 14:13:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

 Hi all

Recently i got into a know "bug" of OE.
Trying to build a static native executable do_compile fail with
"/usr/bin/ld: cannot find -lc" .

For me was module-init-tools-cross and my target was atngw100 with
uclibc so I spend quite long time trying to figure out what was wrong
recipe (I though was uclibc), before have the hint to check if my native
(HOST) static (g)libc was installed ...

probably the same bug will arise on other recipes with static native
target executable, someone know which ones ?

I'm trying to find how to write a sanity check for that issue, i check
classes/sanity.bbclass but didn't find check similar to what i need. Any
clue on how to do ?

Try to compile a "hello.c" statically is a good way to check ?

thanks!


-- 
 /------------------------------------------------\
|     Alessandro Gardich : gremlin#gremlin!it      |
 >------------------------------------------------<
|  I never saw a wild thing sorry for itself.      |
|  A small bird will drop frozen dead from a bough |
|  without ever having felt sorry for itself.      |
 \------------------------------------------------/




