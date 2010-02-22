Received: from web110216.mail.gq1.yahoo.com ([67.195.8.192])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <kaijun61@yahoo.com>) id 1NjaIq-0001XA-2v
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 16:34:35 +0100
Received: (qmail 35632 invoked by uid 60001); 22 Feb 2010 15:25:07 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1266852307; bh=wFs4m14KjX/Lu9EQU8V8SwWHhGd4noAjc1zvMwUIUUs=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=T9fWfPE6W1nulX8Txb99PBzt0kzfV+Ar4Ch6n30/UtrD36iIi1ICr/gkD5w2PKxBZjiQncdlJIzEuVHAyP4Sm78jsUoaA1q6ooXKBZEiRCB7DwFZQoVju5Qzo3jYYJZ3sZBQUBS6wZ/93W9oJ8c+nJNJ4P9dgXkjHS551GztuPQ=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=n4nul7QnTc5m4A2cNmOFO83AIMj08CT4LrQzZlAJE0zggw3Kox+TwGwwqp6T3/cfiwkDGVzNPEIcg0KeC2jrExiTSu5L9rd5NlSPYsi/S8PvN6yKmujADm3tLkJmAlW2z139DSXmGOP8KTQXdTCD6uA1Hb9Vg2HRWWTooSxsS/o=;
Message-ID: <72281.30342.qm@web110216.mail.gq1.yahoo.com>
X-YMail-OSG: GvVorfwVM1m1iC81lqzLUjETJz631rrZTRdNgG1ZogxvdebxO7S2aL1F5JHuFK.I7pRY9su8tWiez4Jih_cX2KpDCT5CwQGDo5tyALtlsdb8zMCt0mplcCBEUoBmRquF3B3fMbv07gc.ta1X8jOY8VxMCI9FU3MRpo7AF9DcAlRqnZJhed0T2Ejl.0dqXNv6i00_L5GCJaRIfHTjJ0iY3cNHH4H4JEoJBEpPEL2VzjGVtr_.zJ3agdy5F3T.EzgxjY4HNXV8ZuV_tKvxxyyyirP2UQuFjDi3bpGbT1w1qqQ84c7ePGBeaX8WiE1vMv4I1SYfHzkP.AaNItIA5YQqB7M5sRCUFa6zOeLZ87M8hirbd8Kkto_770cOrpe_b5VlOA8FZ.5YRHqlTCwIcorvtQ--
Received: from [82.22.159.80] by web110216.mail.gq1.yahoo.com via HTTP;
	Mon, 22 Feb 2010 07:25:06 PST
X-Mailer: YahooMailRC/300.3 YahooMailWebService/0.8.100.260964
Date: Mon, 22 Feb 2010 07:25:06 -0800 (PST)
From: Kaijun Tang <kaijun61@yahoo.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 67.195.8.192
X-SA-Exim-Mail-From: kaijun61@yahoo.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: bitbake failed in base-image and other images
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
X-List-Received-Date: Mon, 22 Feb 2010 15:34:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi, I always failed to bitbake images like

/home/tang/Project/OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi
/bin/as:unrecognized option '-Qy'
| make[2]: *** [dummy-checksum.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| echo
'/home/tang/Project/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/
gcc-cross-initial-4.3.3-r11.1/gcc-4.3.3/gcc/config/linux.h'
>> tmp-gi.list
.
.
.
| /bin/sh /home/tang/Project/OE/build/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-cross-initial-4.3.3-r11.1/gcc-4.3.3/gcc/../move-if-change tmp-gi.lis=
t gtyp-input.list
| echo timestamp > s-gtyp-input
| make[2]: Leaving directory `/home/tang/Project/OE/build/tmp/work/armv7a-=
angstrom-linux-gnueabi/gcc-cross-initial-4.3.3-r11.1/gcc-4.3.3/build.x86_64=
-linux.arm-angstrom-linux-gnueabi/gcc'
| make[1]: *** [all-gcc] Error 2
| make[1]: Leaving directory `/home/tang/Project/OE/build/tmp/work/armv7a-=
angstrom-linux-gnueabi/gcc-cross-initial-4.3.3-r11.1/gcc-4.3.3/build.x86_64=
-linux.arm-angstrom-linux-gnueabi'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed: /home/tang/Project/OE/build/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-cross-initial-4.3.3-r11.1/temp/log.do_compile.3482
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/tang/Project/OE/openembedded/recipes/gcc/gcc-cross-i=
nitial_4.3.3.bb do_compile failed
ERROR: Task 1945 (/home/tang/Project/OE/openembedded/recipes/gcc/gcc-cross=
-initial_4.3.3.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 171 tasks of which 0 didn't need to be reru=
n and 1 failed.
ERROR: '/home/tang/Project/OE/openembedded/recipes/gcc/gcc-cross-initial_4=
.3.3.bb' failed


 bitbake and openembeded were just installed. Any idea?

Kind Regards


Kaijun Tang




From gcho-openembedded-devel@m.gmane.org Mon Feb 22 17:01:54 2010
Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NjajH-0000Yz-2t for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 17:01:54 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Njage-0007CF-OG for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 16:59:08 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2010 16:59:08 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2010 16:59:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 22 Feb 2010 16:58:55 +0100
Lines: 21
Message-ID: <hlu9k0$8b8$1@dough.gmane.org>
References: <40d782961002220313y7f90001fmb35315559a7de999@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset
