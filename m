Received: from [209.85.132.246] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JWU5i-00083W-1t
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Mar 2008 11:09:50 +0100
Received: by an-out-0708.google.com with SMTP id b33so139055ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Mar 2008 02:08:23 -0800 (PST)
Received: by 10.100.127.18 with SMTP id z18mr2247215anc.39.1204625299505;
	Tue, 04 Mar 2008 02:08:19 -0800 (PST)
Received: by 10.100.190.7 with HTTP; Tue, 4 Mar 2008 02:08:19 -0800 (PST)
Message-ID: <c384c5ea0803040208g54d59ffenf53b467fef4745da@mail.gmail.com>
Date: Tue, 4 Mar 2008 11:08:19 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0803040119u47de4827ib0b173cd09a39297@mail.gmail.com>
MIME-Version: 1.0
References: <c384c5ea0803021104s4470cb31o45e1295b7564e876@mail.gmail.com>
	<fqevf6$8tq$1@ger.gmane.org>
	<c384c5ea0803040119u47de4827ib0b173cd09a39297@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.132.246
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: content addressable fetching of packages, through MD5SUM or SHA1SUM?
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
X-List-Received-Date: Tue, 04 Mar 2008 10:09:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

As a quick proof-of-concept for the package crawler that builds a
table of URI's:

#!/bin/bash

# Requires links, sed, grep and Google :-)
# Given a file name as argument, Google's for alternative links
# @todo Add MD5SUM,SHA1SUM to check against, reject false URI's etc

FILE=$1

LIST=`links -dump
'http://www.google.com/search?q=intitle%3A%22index+of%22+'$FILE | grep
-e 'Cached' | sed 's@[ \t]*\(.*\)/[ ^t]\(.*\)@\1/@' | grep -v Cached`

for URI in $LIST
do
  echo -n $URI$FILE -
  wget --timeout=2 -t1 -O- $URI$FILE 2>/dev/null | md5sum
done


