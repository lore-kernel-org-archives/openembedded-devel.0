Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NvyJK-00077I-ML for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 21:38:15 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NvyGF-000573-FL for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 21:35:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Mar 2010 21:35:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Mar 2010 21:35:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 28 Mar 2010 21:34:44 +0200
Message-ID: <hoob0k$p3d$2@dough.gmane.org>
References: <1269797756.8018.85.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100318 Shredder/3.0.5pre
In-Reply-To: <1269797756.8018.85.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: ti-cmem-module: Loading kernel modules for gstreamer-ti... FATAL: Error inserting cmemk (/lib/modules/2.6.32/kernel/drivers/dsp/cmemk.ko): Bad address
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
X-List-Received-Date: Sun, 28 Mar 2010 19:38:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 28-03-10 19:35, Paul Menzel wrote:
> Dear OE folks,
> 
> 
> doing `opkg update && opkg upgrade` on a BeagleBoard demo image [1] gave
> me the following error message today.
> 
>         […]
>         Configuring ti-cmem-module.
>         Configuring gstreamer-ti.
>          System startup links for /etc/init.d/gstti-init already exist.
>         Unloading kernel module ...ERROR: Module cmemk does not exist in /proc/modules
>            done
>         Loading kernel modules for gstreamer-ti... FATAL: Error inserting cmemk (/lib/modules/2.6.32/kernel/drivers/dsp/cmemk.ko): Bad address
>           done
>         […]

That's not really OE related :) But I bet it's caused by not setting the
mem= stuff according to
http://www.angstrom-distribution.org/demo/beagleboard/README.txt

If you have set the mem= stuff correctly, please follow up on the beagle
list.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLr69UMkyGM64RGpERAqFSAJ98+UmgOxnmDeOaF/t30zCys5oH2ACgjNB1
+GqLcFWG+NVqsgtJ3ua+VeU=
=Zv77
-----END PGP SIGNATURE-----



