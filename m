Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1Lbt1X-0005Cb-IY
	for openembedded-devel@openembedded.org; Tue, 24 Feb 2009 09:52:19 +0100
Received: (qmail 19213 invoked by uid 813007); 24 Feb 2009 08:49:18 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 24 Feb 2009 08:49:18 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Feb 2009 09:49:04 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc2; KDE/4.2.0; x86_64; ; )
References: <200902131728.08634.openembedded@haerwu.biz>
	<20090224064639.GE2172@smtp.west.cox.net>
In-Reply-To: <20090224064639.GE2172@smtp.west.cox.net>
MIME-Version: 1.0
Message-Id: <200902240949.10862.openembedded@haerwu.biz>
Subject: Re: checksums situation
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
X-List-Received-Date: Tue, 24 Feb 2009 08:52:19 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 24 of February 2009 07:46:39 Tom Rini wrote:

> And, is anyone doing more then 'cat tmp/checksums.ini >>
> openembedded/conf/checksums.ini && python the-sorter' ?  And by more
> I mean check for an upstream .md5 or similar, to make sure this is
> really right?

commit 67aa127f4b4cb2e4083a02adfddd7d82534751a3
Author: Marcin Juszkiewicz <hrw@openembedded.org>
Date:   Thu Nov 13 18:07:47 2008 +0100

    checksums.ini: add 1212 entries from test fetch build

    This is result of simple shell script and few hours of fetching:
    for recipe in $OEROOT/packages/*/*.bb
    do
      bitbake -b $recipe -cfetch
    done

This was done with not so empty DL_DIR but most of entries were fresh 
fetched. If someone has machine with good network connection (I no 
longer have access to machine where I was running that test) then feel 
free to call that loop with empty DL_DIR.

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




