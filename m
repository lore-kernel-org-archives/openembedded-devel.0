Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1N8v51-0000fF-Ta
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 13:16:47 +0100
Received: (qmail 19699 invoked by uid 1003); 13 Nov 2009 12:15:21 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 13 Nov 2009 12:15:20 -0000
Message-ID: <4AFD4DD6.70509@balister.org>
Date: Fri, 13 Nov 2009 07:15:18 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.00.0911130443520.1157@localhost>
In-Reply-To: <alpine.LFD.2.00.0911130443520.1157@localhost>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: build breakage: python-native-2.6.1
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
X-List-Received-Date: Fri, 13 Nov 2009 12:16:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/2009 04:45 AM, Robert P. J. Day wrote:
>
>    building beagleboard-demo-image:
>
> NOTE: make -j4 BUILD_SYS= HOST_SYS= LIBC= STAGING_LIBDIR=/home/rpjday/oe/angstrom-dev/staging/x86_64-linux/usr/lib STAGING_INCDIR=/home/rpjday/oe/angstrom-dev/staging/x86_64-linux/usr/include
> *** WARNING: renaming "dbm" since importing it failed: build/lib.linux-x86_64-2.6/dbm.so: undefined symbol: dbm_firstkey
> /bin/sh: line 1:   515 Segmentation fault      LD_LIBRARY_PATH=/home/rpjday/oe/angstrom-dev/work/x86_64-linux/python-native-2.6.1-ml8.2/Python-2.6.1: CC='ccache gcc -pthread' LDSHARED='ccache gcc -pthread -shared' OPT='-DNDEBUG -g  -O3 -Wall -Wstrict-prototypes' ./python -E ./setup.py -q build
> make: *** [sharedmods] Error 139
> FATAL: oe_runmake failed
>
>    that's it, that's the entire log file.  and it's entirely
> reproducible.

Well, your and my setups are the same :) Graeme is the the other F11 
user and it is working for him :(

Philip

>
> rday
> --
>
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario, CANADA
>
>              Linux Consulting, Training and Kernel Pedantry.
>
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


