Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1ON5On-0001uw-Ei
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jun 2010 16:40:11 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 2E04416602E6; Fri, 11 Jun 2010 08:35:34 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 8139B16602C3;
	Fri, 11 Jun 2010 08:35:33 -0600 (MDT)
Message-ID: <4C1249B5.3070304@mlbassoc.com>
Date: Fri, 11 Jun 2010 08:35:33 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100330 Fedora/3.0.4-1.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BAY127-W6E3019E386511CE8FD58FD8D90@phx.gbl>
In-Reply-To: <BAY127-W6E3019E386511CE8FD58FD8D90@phx.gbl>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Error of Rootfs
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
X-List-Received-Date: Fri, 11 Jun 2010 14:40:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2010 08:19 AM, saleh usman wrote:
>
>
>
>
> OpenEmbedded is giving an error of not building root files system due to missing dependency of gpp_node but the ipk package of gpp node is available in /deploy/glibc/ipk/armv5te. I've attached the log file of rootfs from  /work/dm6446-evm-angstrom-linux-gnueabi/console-image-1.0-r0/temp and packages.stamps  and stamps files from /deploy/glibc/ipk/armv5te to show ipkg packages available.

There is no 'ossie-gpp-node' package in your set (which is why the build fails):

$ grep Package /tmp/Packages | grep ossie
Package: ossie-cf-dbg
Package: ossie-cf-dev
Package: ossie-cf-static
Package: ossie-cf
Package: ossie-channeldemo-dbg
Package: ossie-channeldemo-dev
Package: ossie-channeldemo
Package: ossie-demo-dbg
Package: ossie-demo-dev
Package: ossie-demo
Package: ossie-gpp-device-dbg
Package: ossie-gpp-device-dev
Package: ossie-gpp-device
Package: ossie-gpp-node-dbg
Package: ossie-gpp-node-dev
Package: ossie-rxdemo-dbg
Package: ossie-rxdemo-dev
Package: ossie-rxdemo
Package: ossie-txdemo-dbg
Package: ossie-txdemo-dev
Package: ossie-txdemo

$ grep ossie /tmp/Packages.stamps
1276186612 ossie-gpp-device-dev_0.0.0+svnr375-r3.5_armv5te.ipk
1276186841 ossie-cf_0.0.0+svnr380-r2.5_armv5te.ipk
1276186840 ossie-cf-dbg_0.0.0+svnr380-r2.5_armv5te.ipk
1276186611 ossie-gpp-device_0.0.0+svnr375-r3.5_armv5te.ipk
1276187166 ossie-demo-dbg_0.0.0+svnr5515-r1.5_armv5te.ipk
1276186837 ossie-channeldemo_0.0.0+svnr6161-r1.5_armv5te.ipk
1276186832 ossie-txdemo_0.0.0+svnr6160-r1.5_armv5te.ipk
1276186841 ossie-cf-dev_0.0.0+svnr380-r2.5_armv5te.ipk
1276186611 ossie-gpp-device-dbg_0.0.0+svnr375-r3.5_armv5te.ipk
1276186845 ossie-cf-static_0.0.0+svnr380-r2.5_armv5te.ipk
1276186829 ossie-gpp-node-dev_0.0.0+svnr375-r1.5_armv5te.ipk
1276186834 ossie-rxdemo_0.0.0+svnr6162-r1.5_armv5te.ipk
1276186832 ossie-txdemo-dev_0.0.0+svnr6160-r1.5_armv5te.ipk
1276186831 ossie-txdemo-dbg_0.0.0+svnr6160-r1.5_armv5te.ipk
1276186837 ossie-channeldemo-dev_0.0.0+svnr6161-r1.5_armv5te.ipk
1276187167 ossie-demo-dev_0.0.0+svnr5515-r1.5_armv5te.ipk
1276186836 ossie-channeldemo-dbg_0.0.0+svnr6161-r1.5_armv5te.ipk
1276187166 ossie-demo_0.0.0+svnr5515-r1.5_armv5te.ipk
1276186834 ossie-rxdemo-dev_0.0.0+svnr6162-r1.5_armv5te.ipk
1276186834 ossie-rxdemo-dbg_0.0.0+svnr6162-r1.5_armv5te.ipk
1276186829 ossie-gpp-node-dbg_0.0.0+svnr375-r1.5_armv5te.ipk

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


