Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LOTSU-0005uF-D6
	for openembedded-devel@openembedded.org; Sun, 18 Jan 2009 09:56:42 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LOTLn-0000Di-TG
	for openembedded-devel@openembedded.org; Sun, 18 Jan 2009 08:49:47 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 18 Jan 2009 08:49:47 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 18 Jan 2009 08:49:47 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 18 Jan 2009 09:49:33 +0100
Message-ID: <gkuqet$ncn$1@ger.gmane.org>
References: <cover.1232244759.git.andrea.adami@gmail.com>	<b313e1d6307a63ce53bbeaffbf01d842ef6f9e27.1232244759.git.andrea.adami@gmail.com>	<98c252f0e21dc1d58f37dafe492d09b998dad5e5.1232244759.git.andrea.adami@gmail.com>	<cd9f2d057b582d2fb54e80ccc71e72ee1116bdc8.1232244759.git.andrea.adami@gmail.com>	<a75400f3e012a40bf684d0c4537e3310019c8c59.1232244759.git.andrea.adami@gmail.com>	<2c1715b769f3227f74aa46bae8c27587e5387d3e.1232244759.git.andrea.adami@gmail.com>	<45a1b453435a1f916e5540bd0845762636b0ac1f.1232244759.git.andrea.adami@gmail.com>
	<8c1396b3add963b97e1f9f144c1bdd966ebbce02.1232244759.git.andrea.adami@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090109 Shredder/3.0b2pre
In-Reply-To: <8c1396b3add963b97e1f9f144c1bdd966ebbce02.1232244759.git.andrea.adami@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 07/14] kexecboot: use custom device table with mmc and event0
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
X-List-Received-Date: Sun, 18 Jan 2009 08:56:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18-01-09 03:24, Andrea Adami wrote:

> --- a/files/device_table-minimal.txt
> +++ b/files/device_table-minimal.txt
> @@ -29,10 +29,3 @@
>   /dev/random	c	644	0	0	1	8	-	-	-
>   /dev/urandom	c	644	0	0	1	9	-	-	-
>   /dev/ptmx	c	644	0	0	5	2	-	-	-
> -
> -# mmc numbers are assigned dynamicly so if you have other dynamic assigned block devices it may be wrong
> -/dev/mmcblk0	b	660	0	6	179	0	-	-	-
> -/dev/mmcblk0p1	b	660	0	6	179	1	-	-	-
> -/dev/mmcblk0p2	b	660	0	6	179	2	-	-	-
> -/dev/mmcblk0p3	b	660	0	6	179	3	-	-	-
> -/dev/event0 	c	660	0	0	13	64	-	-	-

NACK



