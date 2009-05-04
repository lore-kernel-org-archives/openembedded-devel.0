Received: from [85.199.173.110] (helo=mx51.mymxserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hs4233@mail.mn-solutions.de>) id 1M0vNo-0005oA-Ot
	for openembedded-devel@openembedded.org; Mon, 04 May 2009 12:26:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by localhost.mx51.mymxserver.com (Postfix) with ESMTP id DB35E4B006;
	Mon,  4 May 2009 12:21:02 +0200 (CEST)
X-Virus-Scanned: by Mittwald Mailscanner
Received: from mx51.mymxserver.com ([127.0.0.1])
	by localhost (mx51.mymxserver.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id on3Aw97SWSXs; Mon,  4 May 2009 12:21:02 +0200 (CEST)
Received: from lin01.mn-solutions.de (pD95FA076.dip0.t-ipconnect.de
	[217.95.160.118])
	by mx51.mymxserver.com (Postfix) with ESMTP id 2C1F24B01B;
	Mon,  4 May 2009 12:21:02 +0200 (CEST)
Received: by lin01.mn-solutions.de (Postfix, from userid 116)
	id 296FE1E004B; Mon,  4 May 2009 09:52:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb3 (2006-10-05) on 
	lin01.mn-logistik.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb3
Received: from mnz66.mn-solutions.de (mnz66.mn-solutions.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id 749321E0037;
	Mon,  4 May 2009 09:52:09 +0200 (CEST)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 4 May 2009 09:52:08 +0200
User-Agent: KMail/1.9.7
References: <49FAE94F.2090101@doredevelopment.dk>
In-Reply-To: <49FAE94F.2090101@doredevelopment.dk>
MIME-Version: 1.0
Message-Id: <200905040952.08258.hs4233@mail.mn-solutions.de>
Cc: openembedded-devel@openembedded.org
Subject: =?UTF-8?B?UmU6IFB1bGwgcmVxdWVzdCBmcm9tIERvcsOpRGV2ZWxvcG1lbnQgLSBOZXc6IE1pY3JvIGRpc3Ryby9pbWFnZQ==?=
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
X-List-Received-Date: Mon, 04 May 2009 10:26:50 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 01 May 2009 14:21:35 Martin Lund wrote:
> The "Micro" distribution/image is created because we feel that
> there is a need for a truly tiny and clean distro and image
> definition in OE for those users out there that needs a _very_
> tiny Linux rootfs with virtually nothing installed except
> busybox, libc, udev, and a few init scripts. On arm the jffs2
> image size is only 1 MB (uclibc based). No bloat allowed.

Isn't "udev" already bloat?  I have made something similar for a 
custom board, but there I used "mdev" from Busybox.

My whole avr32 image is just about 3 MB, and that includes a 
rather hefty libQtCore.so.4.5.0 with 1.1 MB.


As a side note, I also use busybox' init instead of sysvinit. And 
because my board is so tiny and has a very custom role to 
fulfill, I don't even have /etc/rcX.d, except /etc/rcS.d which I 
renamed to /etc/startup.d to avoid confusion.


