Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1QkGNB-0001LV-QQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jul 2011 16:06:38 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 145A09AA1BA; Fri, 22 Jul 2011 08:02:29 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 62FFE9AA1B9;
	Fri, 22 Jul 2011 08:02:27 -0600 (MDT)
Message-ID: <4E2982F3.1030802@mlbassoc.com>
Date: Fri, 22 Jul 2011 08:02:27 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc15 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E298200.1040302@nedap.com>
In-Reply-To: <4E298200.1040302@nedap.com>
Subject: Re: strange error
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
X-List-Received-Date: Fri, 22 Jul 2011 14:06:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/22/2011 07:58 AM, Jaap de Jong wrote:
> funny error when the OE_BASE dirname contains "-OS"
> It looks like it all occurrences in the gcc line with "-OS" are replaced by "-O1S" leading to a wrong path...

This is just one manifestation that seems to happen any time the build directory name contains "-".
My practice is to just avoid naming my OE build trees with "-" in them.

> | make[1]: Entering directory `/home/jdj/OE-OS/build/tmp-angstrom_2008_1/work/i686-linux/libgcrypt-native-1.4.1-r0/libgcrypt-1.4.1'
> | Making all in mpi
> | make[2]: Entering directory `/home/jdj/OE-OS/build/tmp-angstrom_2008_1/work/i686-linux/libgcrypt-native-1.4.1-r0/libgcrypt-1.4.1/mpi'
> | make[2]: Nothing to be done for `all'.
> | make[2]: Leaving directory `/home/jdj/OE-OS/build/tmp-angstrom_2008_1/work/i686-linux/libgcrypt-native-1.4.1-r0/libgcrypt-1.4.1/mpi'
> | Making all in cipher
> | make[2]: Entering directory `/home/jdj/OE-OS/build/tmp-angstrom_2008_1/work/i686-linux/libgcrypt-native-1.4.1-r0/libgcrypt-1.4.1/cipher'
> | `echo /bin/sh ../i686-linux-libtool --tag=CC --mode=compile gcc -DHAVE_CONFIG_H -I. -I.. -I../src -I../src
> -isystem/home/jdj/OE-OS/build/tmp-angstrom_2008_1/sysroots/i686-linux/usr/include -I/home/jdj/OE-OS/build/tmp-angstrom_2008_1/sysroots/i686-linux/usr/include
> -isystem/home/jdj/OE-OS/build/tmp-angstrom_2008_1/sysroots/i686-linux/usr/include -O2 -g -fvisibility=hidden -Wall -Wpointer-arith -c ./tiger.c | sed -e 's/-O[2-9s]*/-O1/g' `
> | i686-linux-libtool: compile: gcc -DHAVE_CONFIG_H -I. -I.. -I../src -I../src -isystem/home/jdj/OE-O1S/build/tmp-angstrom_2008_1/sysroots/i686-linux/usr/include
> -I/home/jdj/OE-O1S/build/tmp-angstrom_2008_1/sysroots/i686-linux/usr/include -isystem/home/jdj/OE-O1S/build/tmp-angstrom_2008_1/sysroots/i686-linux/usr/include -O1 -g
> -fvisibility=hidden -Wall -Wpointer-arith -c ./tiger.c -fPIC -DPIC -o .libs/tiger.o
> | In file included from ../src/visibility.h:245:0,
> | from ../src/g10lib.h:39,
> | from ./tiger.c:26:
> | ../src/gcrypt.h:29:23: fatal error: gpg-error.h: No such file or directory
> | compilation terminated.
> | make[2]: *** [tiger.lo] Error 1
> | make[2]: Leaving directory `/home/jdj/OE-OS/build/tmp-angstrom_2008_1/work/i686-linux/libgcrypt-native-1.4.1-r0/libgcrypt-1.4.1/cipher'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory `/home/jdj/OE-OS/build/tmp-angstrom_2008_1/work/i686-linux/libgcrypt-native-1.4.1-r0/libgcrypt-1.4.1'
> | make: *** [all] Error 2
> | + die 'oe_runmake failed'
> | + oefatal 'oe_runmake failed'
> | + echo FATAL: 'oe_runmake failed'
> | FATAL: oe_runmake failed
> | + exit 1
> NOTE: package libgcrypt-native-1.4.1-r0: task do_compile: Failed
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


