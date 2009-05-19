Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1M6OWZ-0003Dv-At
	for openembedded-devel@openembedded.org; Tue, 19 May 2009 14:34:27 +0200
Received: from 123-192-147-94.dynamic.kbronet.com.tw ([123.192.147.94]
	helo=tamarin.localnet) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>)
	id 1M6OPR-0004wh-5i; Tue, 19 May 2009 14:27:05 +0200
From: Holger Freyther <zecke@selfish.org>
To: bitbake-dev@lists.berlios.de,
 openembedded-devel@openembedded.org
Date: Tue, 19 May 2009 14:26:58 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.28-11-generic; KDE/4.2.2; i686; ; )
MIME-Version: 1.0
Message-Id: <200905191426.59382.zecke@selfish.org>
Subject: Bitbake parser work
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
X-List-Received-Date: Tue, 19 May 2009 12:34:28 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey,

some brief notes about the horror of the current bitbake parser. I don't know 
what state of the art parsers do, I don't have a book on compiler design but I 
would be surprised if they work like bitbake.

What is so horrible about our parser?

	- It is line based, using python file.readline
	- Each line gets matched against several regexps
	- Then some state to only match a subset of regexps
	- It is parsing the same files all over again(*)
	- Every regexp that got matched is directly converted to
	  calls into bb.data.setVar*.

What have I done this time:
	1.) In the function that match a line of input, move all bb.data.set*
	     to methods
	2.) move these methods to ast.py
	3.) convert the methods to create nodes for our abstract syntax list
	4.) immediately evaluate these nodes...
	5.) kill the data parameter from feeder (line based matching) and
            evaluate all nodes after they have been parsed
	6.) on top of these I'm able to implement a cache to not reparse
	    files I have seen...

What are known problems:
       classes/package.bbclass messes with internals of the parser
       and needs to be changed.

	I still search for a good cache class in python, currently all .bbclass and 
       .inc are cached.

Where can it be found:
	http://page.mi.fu-berlin.de/~freyther/bitbake/parser

What other tricks can we play:
	- We should ply to get the lexing time down... 
	- Or cache the parsed statement list..

obviously please review the patches, fix OE, get it merged :)

z.



(*) Every file doing inherit autotools, pkgconfig will lead to parsing these two 
classes again


