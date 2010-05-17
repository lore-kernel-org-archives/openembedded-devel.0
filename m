Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ODsmZ-0004EF-4d for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 07:22:29 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ODsih-0002hN-SV for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 07:18:27 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 07:18:27 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 07:18:27 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 17 May 2010 07:18:19 +0200
Message-ID: <hsqjir$ked$1@dough.gmane.org>
References: <AANLkTiksiXOV_Pjyc64dgslTY9MOFGuji7D6zn7zo7Rp@mail.gmail.com>
	<AANLkTimXRuwQKPqkdtdhA3j6VPtn5hHMYR55kZodiKPD@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100428 Shredder/3.0.5pre
In-Reply-To: <AANLkTimXRuwQKPqkdtdhA3j6VPtn5hHMYR55kZodiKPD@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: ncurses-sdk problem
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
X-List-Received-Date: Mon, 17 May 2010 05:22:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-05-10 02:07, João Henrique Freitas wrote:
> Hi,
> 
> Anybody can tell some hint?

It's picking up stuff from your /usr/local/via-troprico dir, find out
why it's doing that.

regards,

Koen

> 
> 
> Thanks
> 
> ---------
> | cd ../obj_lo; /bin/sh ../x86_64-linux-libtool --mode=compile gcc
> -DHAVE_CONFIG_H -I../ncurses -I. -I. -I../include
> -isystem/home/joaohf/oe/build_teste_ncurse/tmp/sysroots/x86_64-linux/usr/include
> -D_GNU_SOURCE -DNDEBUG -I/usr/local/via-tropico/arm/include
> -isystem/home/joaohf/oe/build_teste_ncurse/tmp/sysroots/x86_64-linux/usr/include
> -O2 -g -c ../ncurses/./tty/hardscroll.c
> | x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I../ncurses -I.
> -I. -I../include
> -isystem/home/joaohf/oe/build_teste_ncurse/tmp/sysroots/x86_64-linux/usr/include
> -D_GNU_SOURCE -DNDEBUG -I/usr/local/via-tropico/arm/include
> -isystem/home/joaohf/oe/build_teste_ncurse/tmp/sysroots/x86_64-linux/usr/include
> -O2 -g -c ../ncurses/./tty/hardscroll.c  -fPIC -DPIC -o
> .libs/hardscroll.o
> | cc1: error: /usr/local/via-tropico/arm/include: Permission denied
> | make[1]: *** [../obj_lo/hardscroll.o] Error 1
> | make[1]: Leaving directory
> `/home/joaohf/oe/build_teste_ncurse/tmp/work/x86_64-armv5te-sdk-oe-linux-gnueabi/ncurses-sdk-5.4-r19/ncurses-5.4/ncurses'
> ---------------
> 
> ---------------
> 
> | make[1]: Leaving directory
> `/home/joaohf/oe/build_teste_ncurse/tmp/work/x86_64-armv5te-sdk-oe-linux-gnueabi/ncurses-sdk-5.4-r19/ncurses-5.4/include'
> | cd ncurses && make DESTDIR="" all
> | make[1]: Entering directory
> `/home/joaohf/oe/build_teste_ncurse/tmp/work/x86_64-armv5te-sdk-oe-linux-gnueabi/ncurses-sdk-5.4-r19/ncurses-5.4/ncurses'
> | sh ./base/MKlib_gen.sh "gcc -E -DHAVE_CONFIG_H -I../ncurses -I. -I.
> -I../include -isystem/home/joaohf/oe/build_teste_ncurse/tmp/sysroots/x86_64-linux/usr/include
> -D_GNU_SOURCE -DNDEBUG -I/usr/local/via-tropico/arm/include" "gawk"
> generated <../include/curses.h | \
> | 		fgrep undef >../include/nomacros.h
> | make[1]: *** [../include/nomacros.h] Error 1
> | make[1]: Leaving directory
> `/home/joaohf/oe/build_teste_ncurse/tmp/work/x86_64-armv5te-sdk-oe-linux-gnueabi/ncurses-sdk-5.4-r19/ncurses-5.4/ncurses'
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
> NOTE: Task failed:
> /home/joaohf/oe/build_teste_ncurse/tmp/work/x86_64-armv5te-sdk-oe-linux-gnueabi/ncurses-sdk-5.4-r19/temp/log.do_compile.2539
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /home/joaohf/oe/openembedded/recipes/ncurses/ncurses-sdk_5.4.bb
> do_compile failed
> ERROR: Task 976 (/home/jo
> 
> ---------------
> 
> 2010/5/16 João Henrique Freitas <joaohf@gmail.com>:
>> Hi,
>>
>> Anybody have a trouble with ncurses-sdk when using meta-toolchain?
>>
>> I can't figure what happens. Maybe ncurses-sdk recipe need a update?
>>
>> Thanks.
>>
>> --
>> -----------------------------------------------------------
>> João Henrique Freitas - joaohf_at_gmail.com
>> Campinas-SP-Brasil
>> BSD051283
>> LPI 1
>> http://www.joaohfreitas.eti.br
>>
> 
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL8NGbMkyGM64RGpERAge2AJ0bDR0RWOOGGNPdHvasGCntYDD6kQCfYAgn
dMu9hm0Ko1P2UawursG4kgk=
=ZS0T
-----END PGP SIGNATURE-----



