Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QWusY-00019i-Vl
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 20:31:51 +0200
Received: by fxm19 with SMTP id 19so692003fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2011 11:28:24 -0700 (PDT)
Received: by 10.223.33.80 with SMTP id g16mr32145fad.125.1308162504295;
	Wed, 15 Jun 2011 11:28:24 -0700 (PDT)
Received: from mobil-400-586.intern.dresearch.de (recycler-gw.in-dsl.de
	[217.197.85.167])
	by mx.google.com with ESMTPS id o23sm381105faa.9.2011.06.15.11.28.20
	(version=SSLv3 cipher=OTHER); Wed, 15 Jun 2011 11:28:21 -0700 (PDT)
Message-ID: <4DF8F9C3.8000908@dresearch-fe.de>
Date: Wed, 15 Jun 2011 20:28:19 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110414 SUSE/3.1.10 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4DF735B3.1020106@dresearch-fe.de>	<4DF767F9.3070500@dresearch-fe.de>	<4DF77D33.7080407@mentor.com>	<4DF8B96D.7090605@dresearch-fe.de>
	<itae90$9a0$1@dough.gmane.org> <4DF8CAB7.8020403@dresearch-fe.de>
	<6FAE1562-AA38-44BC-B757-01AC8EB65BD9@dominion.thruhere.net>
In-Reply-To: <6FAE1562-AA38-44BC-B757-01AC8EB65BD9@dominion.thruhere.net>
Subject: Re: [2011.03-maintenance] Pull request
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
X-List-Received-Date: Wed, 15 Jun 2011 18:31:51 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15.06.2011 16:06, Koen Kooi wrote:
 > Which commits are in that branch? Could you please post a pull request
 > formatted similar to the other requests?

Please pull some commits from here:

URI: git@git.openembedded.org:openembedded
Branch: sledz/maintenance

Mario Schuknecht (2):
       linux-libc-headers-2.6.24: add additional tcp ioctl (for hipox machine only)
       linux-2.6.24: optimize flash timings (hipox machine only)

Steffen Sledz (6):
       linux-2.6.24: add support for AMIC flashes (e.g. A29L160AT)
       linux-2.6.24: allow building kernel with newer GNU make
       linux-2.6.24: disable 2nd SATA port (hipox machine only)
       linux-2.6.24: enable some more kernel debug options (hipox machine only)
       linux-2.6.24: fix diff pathes in hipox machine specific patch file
       linux-2.6.24: fix a buggy patch file for hipox machine
       linux-2.6.24: add another 4N-GALAXY.DE PID to ftdi_sio driver

Thilo Fromm (3):
       linux-2.6.24: fix 1/2-byte read access to PCI config space (hipox machine only)
       linux-2.6.24: add PCI abort handler (hipox machine only)
       linux-2.6.24: enable some more diagnostic options (hipox machine only)

Most commits are hipox machine specific kernel config modifications or kernel code fixes.

One commit enables building kernel 2.6.24 with newer GNU make.

Another one backports support for AMIC flashes.

All are part of oe master.

Thx,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


