Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O4vfg-0008Tq-3v for openembedded-devel@lists.openembedded.org;
	Thu, 22 Apr 2010 14:38:22 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O4vcE-0001YZ-GF for openembedded-devel@lists.openembedded.org;
	Thu, 22 Apr 2010 14:34:46 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Apr 2010 14:34:46 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Apr 2010 14:34:46 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 22 Apr 2010 14:34:38 +0200
Message-ID: <hqpfou$igp$1@dough.gmane.org>
References: <20100422134322.f79d1365.ospite@studenti.unina.it>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100412 Shredder/3.0.5pre
In-Reply-To: <20100422134322.f79d1365.ospite@studenti.unina.it>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: About having a static /dev
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
X-List-Received-Date: Thu, 22 Apr 2010 12:38:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 22-04-10 13:43, Antonio Ospite wrote:
> For my machine (a780) I'd like to have a static /dev whatever image I
> build, I tried setting:
> IMAGE_DEV_MANAGER = ""
> IMAGE_DEVICE_TABLES = "files/device_table-minimal.txt \
>                        files/device_table-ezx.txt"
> 
> But this is still not enough:
>  1. the 'devices' script from initscripts keeps rewriting /dev at each
>     boot, and with a layout different than one would expect by having
>     IMAGE_DEVICE_TABLES set, see also
>     http://bugs.openembedded.org/show_bug.cgi?id=3593

The right answer would be to have image.bbclass create /etc/device_table
from the IMAGE_DEVICE_TABLES vars during do_rootfs.

And of course mark /etc/device_table as CONFFILES in the initscripts
recipe to keep the changes on package upgrades.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL0EJeMkyGM64RGpERAmH7AJ9bEXPhkuaX0Rvo9n8nUE4ds5niNQCfXnVx
cWUbHwV6xcBe5hSoQpGkMIA=
=vw6J
-----END PGP SIGNATURE-----



