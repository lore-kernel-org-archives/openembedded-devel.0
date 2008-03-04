Received: from [64.233.184.234] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JWURk-0004cz-KQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Mar 2008 11:32:39 +0100
Received: by wr-out-0506.google.com with SMTP id 57so1282191wri.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Mar 2008 02:31:15 -0800 (PST)
Received: by 10.100.152.19 with SMTP id z19mr2296270and.68.1204626674898;
	Tue, 04 Mar 2008 02:31:14 -0800 (PST)
Received: by 10.100.190.7 with HTTP; Tue, 4 Mar 2008 02:31:14 -0800 (PST)
Message-ID: <c384c5ea0803040231s735efcb5yfe8aecf71bd94f5a@mail.gmail.com>
Date: Tue, 4 Mar 2008 11:31:14 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0803040208g54d59ffenf53b467fef4745da@mail.gmail.com>
MIME-Version: 1.0
References: <c384c5ea0803021104s4470cb31o45e1295b7564e876@mail.gmail.com>
	<fqevf6$8tq$1@ger.gmane.org>
	<c384c5ea0803040119u47de4827ib0b173cd09a39297@mail.gmail.com>
	<c384c5ea0803040208g54d59ffenf53b467fef4745da@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.233.184.234
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
X-List-Received-Date: Tue, 04 Mar 2008 10:32:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

In trying to improve our package fetching robustness, a package
crawler. (I still wonder if no such thing already exists...)

A new version is inlined below, usage is as follows:

Use mode #1, generate URI checksums given a package file name:

leon@precise:/tmp$ ./crawl.sh popt-1.7.tar.gz
[GENERATED] 5988e7aeb0ae4dac8d83561265984cc9
66f3c77b87a160951b180447f4a6dce68ad2f71b
www.netsw.org/system/libs/options/popt-1.7.tar.gz
[GENERATED] 5988e7aeb0ae4dac8d83561265984cc9
66f3c77b87a160951b180447f4a6dce68ad2f71b
su-se.lunar-linux.org/lunar/mirrors/popt-1.7.tar.gz
[GENERATED] 5988e7aeb0ae4dac8d83561265984cc9
66f3c77b87a160951b180447f4a6dce68ad2f71b
www.aoloser.com/dist/popt-1.7.tar.gz
[GENERATED] 5988e7aeb0ae4dac8d83561265984cc9
66f3c77b87a160951b180447f4a6dce68ad2f71b
www.netmax.org/Download/SOURCE/packages/extras/SOURCE/popt-1.7.tar.gz
[GENERATED] 5988e7aeb0ae4dac8d83561265984cc9
66f3c77b87a160951b180447f4a6dce68ad2f71b
be.lunar-linux.org/lunar/mirrors/popt-1.7.tar.gz
[GENERATED] 5988e7aeb0ae4dac8d83561265984cc9
66f3c77b87a160951b180447f4a6dce68ad2f71b
mirrors.isc.org/pub/MidnightBSD/distfiles/popt-1.7.tar.gz
[GENERATED] 5988e7aeb0ae4dac8d83561265984cc9
66f3c77b87a160951b180447f4a6dce68ad2f71b
www.ibiblio.org/pub/packages/solaris/freeware/SOURCES/popt-1.7.tar.gz

Use mode #2, find URI's that have a matching MD5SUM and SHA1SUM:

leon@precise:/tmp$ ./crawl.sh popt-1.7.tar.gz
5988e7aeb0ae4dac8d83561265984cc9
66f3c77b87a160951b180447f4a6dce68ad2f71b
[VALIDATED] 5988e7aeb0ae4dac8d83561265984cc9
66f3c77b87a160951b180447f4a6dce68ad2f71b
www.netsw.org/system/libs/options/popt-1.7.tar.gz
[VALIDATED] 5988e7aeb0ae4dac8d83561265984cc9
66f3c77b87a160951b180447f4a6dce68ad2f71b
su-se.lunar-linux.org/lunar/mirrors/popt-1.7.tar.gz
[VALIDATED] 5988e7aeb0ae4dac8d83561265984cc9
66f3c77b87a160951b180447f4a6dce68ad2f71b
www.aoloser.com/dist/popt-1.7.tar.gz
[VALIDATED] 5988e7aeb0ae4dac8d83561265984cc9
66f3c77b87a160951b180447f4a6dce68ad2f71b
www.netmax.org/Download/SOURCE/packages/extras/SOURCE/popt-1.7.tar.gz
[VALIDATED] 5988e7aeb0ae4dac8d83561265984cc9
66f3c77b87a160951b180447f4a6dce68ad2f71b
be.lunar-linux.org/lunar/mirrors/popt-1.7.tar.gz
[VALIDATED] 5988e7aeb0ae4dac8d83561265984cc9
66f3c77b87a160951b180447f4a6dce68ad2f71b
mirrors.isc.org/pub/MidnightBSD/distfiles/popt-1.7.tar.gz
[VALIDATED] 5988e7aeb0ae4dac8d83561265984cc9
66f3c77b87a160951b180447f4a6dce68ad2f71b
www.ibiblio.org/pub/packages/solaris/freeware/SOURCES/popt-1.7.tar.gz
leon@precise:/tmp$


#!/bin/bash

# Requires links, sed, grep, md5sum, sha1sum
# $1 package file name
# $2 md5sum to check against
# $3 sha1sum to check against

if [ x$1y == xy ]; then
  echo "Provide a filename, for example: popt-1.7.tar.gz"
  exit
fi

FILE=`basename $1`

LIST=`links -dump
'http://www.google.com/search?q=intitle%3A%22index+of%22+'$FILE | grep
-e 'Cached' | sed 's@[ \t]*\(.*\)/[ ^t]\(.*\)@\1/@' | grep -v Cached`

cd /tmp

for URI in $LIST
do
  rm -rf /tmp/$FILE
  wget --timeout=2 -t1 -O$FILE $URI$FILE 2>/dev/null
  if [ $? == 0 ]; then
    FILE_MD=`md5sum $FILE | sed 's@\([0-9,a-f]*\)\(.*\)@\1@'`
    FILE_SHA=`sha1sum $FILE | sed 's@\([0-9,a-f]*\)\(.*\)@\1@'`
    if [ x$2y != xy -a x$3y != xy ]; then
      if [ $2 == $FILE_MD -a $3 == $FILE_SHA ]; then
        echo "[VALIDATED]" $FILE_MD $FILE_SHA $URI$FILE
      fi
    else
      echo "[GENERATED]" $FILE_MD $FILE_SHA $URI$FILE
    fi
  fi
done


