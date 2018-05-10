Return-Path: <cshored@thecshore.com>
Received: from mail.thecshore.com (mail.thecshore.com [144.217.14.6])
	by mail.openembedded.org (Postfix) with ESMTP id 16F5474FDC
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 18:18:41 +0000 (UTC)
Received: from [10.137.0.15] (107-179-160-78.cpe.teksavvy.com [107.179.160.78])
	by mail.thecshore.com (Postfix) with ESMTPSA id 2EAE22667;
	Thu, 10 May 2018 14:18:41 -0400 (EDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.thecshore.com 2EAE22667
Authentication-Results: mail.thecshore.com;
	dmarc=none (p=none dis=none) header.from=thecshore.com
Authentication-Results: mail.thecshore.com;
	spf=fail smtp.mailfrom=cshored@thecshore.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.thecshore.com 2EAE22667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thecshore.com;
	s=default; t=1525976322;
	bh=RAp8r3ouskki48fbDf8BEearZ0E7FGuYb+5JjHpRRDE=;
	h=To:From:Subject:Date:From;
	b=gnkqbxjXFKlUVuf6s2slC3gG7NdoedCe3rhPdRWCP7S0AsN8jHE20/jC5bq8f6qbg
	Zd/9IFEN/idxHyu2qI4cNc0MDXNXwKGezLpfNZXhmFOzd0X4gzaXC0rzITeLXKS6U2
	uBV8aseJPhRLjxtuVV8+rJh3BxRQpunV4uD5Kcfc=
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.99.4 at mail.thecshore.com
To: xvisor-devel@googlegroups.com,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
From: "Daniel F. Dickinson" <cshored@thecshore.com>
Message-ID: <8caa25e5-93c9-b2ff-76ed-ffb1dbdb0e34@thecshore.com>
Date: Thu, 10 May 2018 14:18:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
Subject: [meta-xvisor] [Status] Generation of x86-64 XVisor-only (no guests) hd images is working
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2018 18:18:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

Hi all,

FYI, I now have meta-xvisor successfully going from scratch to a fully 
built OE cross compiling toolchain and an ext4 disk image with syslinux 
which uses the mboot.c32 to use multiboot to boot the XVisor hypervisor.

I'll write up the docs for things so far sometime soon (I hope).

The next step after that (not sure when though) is to make sure the eSDK 
is able to build XVisor images, since most folks won't be interested in 
developing meta-xvisor, but XVisor itself.  Using the eSDK it ought to 
be possible to rebuild Xvisor and create new images quite quickly 
compared to building the toolchain from scratch.  (It takes about an 
hour on an 8 core i7 running Qubes (Xen), in a VM), and document that to 
make Xvisor development easier on a wider range of distros.

After that I'll work on figuring out multiconfig to see if we can build 
multiple guest images at the same time as Xvisor (and/or using the eSDK 
to add them later).

My question is regarding QEMU and direct multiboot boot of XVisor - I 
couldn't seem to get that working.  Do you know if it's possible, and if 
not, where is the issue (qemu/xvisor/both)?

Regards,

Daniel

