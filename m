Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1TOBKc-0006nW-95
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Oct 2012 19:53:45 +0200
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 080B92232546;
	Tue, 16 Oct 2012 19:40:15 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id EAF00223202E;
	Tue, 16 Oct 2012 19:40:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (f052233193.adsl.alicedsl.de
	[78.52.233.193]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Tue, 16 Oct 2012 19:40:13 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id C3C2A3C66B; Tue, 16 Oct 2012 19:40:10 +0200 (CEST)
Date: Tue, 16 Oct 2012 19:40:10 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121016174010.GA16773@mail.familie-heinold.de>
References: <507D98C1.6000105@mentor.com>
MIME-Version: 1.0
In-Reply-To: <507D98C1.6000105@mentor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: openembedded-devel@lists.linuxtogo.org
Subject: Re: libxml2 using host's zlib?
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
X-List-Received-Date: Tue, 16 Oct 2012 17:54:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 16, 2012 at 10:26:25AM -0700, Hollis Blanchard wrote:
> I was trying to build php using meta-webserver, and got stuck with
> this error during configuration of php-native:
> 
>    configure:49076: gcc -o conftest -I/usr/include
>    -isystem/mnt/mel/build/tmp/sysroots/i686-linux/usr/include -O2 -pipe
>    -g0 -fvisibility=hidden
>    -isystem/mnt/mel/build/tmp/sysroots/i686-linux/usr/include
>    -L/usr/lib -L/mnt/mel/build/tmp/sysroots/i686-linux/usr/lib
^^^^^^^^^^^^^^^
this includes the host libs

>    -L/mnt/mel/build/tmp/sysroots/i686-linux/lib
>    -Wl,-rpath-link,/mnt/mel/build/tmp/sysroots/i686-linux/usr/lib
>    -Wl,-rpath-link,/mnt/mel/build/tmp/sysroots/i686-linux/lib
>    -Wl,-rpath,/mnt/mel/build/tmp/sysroots/i686-linux/usr/lib
>    -Wl,-rpath,/mnt/mel/build/tmp/sysroots/i686-linux/lib -Wl,-O1
>    -Wl,--hash-style=both
>    -Wl,-rpath,/mnt/mel/build/tmp/sysroots/i686-linux/usr/lib
>    -L/mnt/mel/build/tmp/sysroots/i686-linux/usr/lib
>    -Wl,-rpath,/mnt/mel/build/tmp/sysroots/i686-linux/usr/lib/../lib
>    -L/mnt/mel/build/tmp/sysroots/i686-linux/usr/lib/../lib conftest.c
>    -lz -lcrypt -lrt -lm -lnsl -lxml2 -lcrypt -lxml2 -lz -lm -lxml2 -lz
>    -lm >&5
>    /mnt/mel/build/tmp/sysroots/i686-linux/usr/lib/libxml2.so: undefined
>    reference to `gzopen64@ZLIB_1.2.3.3'

Bye Henning


