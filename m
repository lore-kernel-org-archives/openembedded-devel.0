Received: from [209.85.218.224] (helo=mail-bw0-f224.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <piero.pezzin@gmail.com>) id 1MQdzo-0003V8-3C
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jul 2009 11:08:20 +0200
Received: by bwz24 with SMTP id 24so2726721bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2009 01:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=khWfvZdrDfHrDIstbCxv6wSBBe9VT5gHX6SrCKS8qxM=;
	b=o33gASSpcJKv8S5Ff+1oLtibTP5/cgO6yqGPCuUTOl42mUfIoXfIRn294/lce1ZMxv
	wN5FRyAKfxVUsiWcwf7rkd00noKG18nOqE0PrLfj2zM1qCj0R07h1lIHG0sn3IrF5fUH
	ay/yfAkXHLS94wFF5WTSdHfKBUj4UlUnY6IWs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=RXW9abS88gnWXC2FO/T+YGWZV1p2BYczY51ZGvSORQpTE1BQxfpveTpp447C0U4JnL
	IUH3bADpihInNNX8CidxNhisZTvebh657u50w97oZlP0XMemBPMiANs3FTdD3t55+sTq
	AmU2S49c+R57qYEt3fsSy5cK/PzsYbBr3S0OI=
MIME-Version: 1.0
Received: by 10.204.118.138 with SMTP id v10mr6166127bkq.40.1247561701651; 
	Tue, 14 Jul 2009 01:55:01 -0700 (PDT)
Date: Tue, 14 Jul 2009 10:55:01 +0200
Message-ID: <49bdfd00907140155j339465f9q620c9546688c75a2@mail.gmail.com>
From: Piero Pezzin <piero.pezzin@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Mount root file system via NFS with usb-eth adapter
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
X-List-Received-Date: Tue, 14 Jul 2009 09:08:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,

with the Beagleboard, I tried mounting the root file system via NFS using a
usb-ethernet adapter. But there is a little problem because the ethernet
interface is configured before the usb-ethernet is discovered and the mount
fails.

So I edited the net/ipv4/ipconfig.c file modifying the #define CONF_PRE_OPEN
increasing it from 500 to 2500.

Once rebuilt the kernel, everything work perfectly.

I think this is just a workaround, I'll let you find the proper solution.

Regards,

Piero

