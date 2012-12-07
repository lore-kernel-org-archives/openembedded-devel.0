Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Th23t-0005CE-SH
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Dec 2012 18:50:10 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 6FAF8F811F6; Fri,  7 Dec 2012 10:35:44 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 851C9F811F2;
	Fri,  7 Dec 2012 10:35:43 -0700 (MST)
Message-ID: <50C228F8.6060805@mlbassoc.com>
Date: Fri, 07 Dec 2012 10:35:52 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: modphp
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
X-List-Received-Date: Fri, 07 Dec 2012 17:50:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I just tried to build modphp_5.3.19.bb for my ARM target.

It seems that the make is using the wrong tools (or libraries),
as it fails with this error:
   | /usr/lib/libbz2.so: could not read symbols: File in wrong format
   | collect2: error: ld returned 1 exit status
   | make: *** [libphp5.la] Error 1

Any ideas how to make this work?  Has it ever been built/tested
for a cross target?  I can see that the cross paths for libz and libbz2
are being passed to the configure step, but they don't seem to be reflected
in the actual link step when making the modphp.so library.

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


