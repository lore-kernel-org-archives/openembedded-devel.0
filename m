Received: from [209.85.218.15] (helo=mail-bw0-f15.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LNox9-0007H3-Kl
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jan 2009 14:41:39 +0100
Received: by bwz8 with SMTP id 8so4150891bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2009 05:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=1CrJ44R65h4txYNbsiJjUUVEUooKG4ZjCy1RyaBoDAk=;
	b=uUx8x/kHJp21xigkiR1zqzVn1n4a0iAgsl3j6cvtzc4XFNBiGwju1o9zgf5DL0rAAW
	zeaB8wtIPjLeMSIgVZ35Ugz2CLjvJqxDkz42esTlaGW3WiVXDomD8QsJg28Mbcty8O5y
	lg0B9T3xD0qdDNHcrtmLp2vM+wUX7OJ8xf5Ik=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Ymo2ntFdXy3CJVF3bJkp1iuQq2CaBF1ZqOIQSX2TJTeeBBjJfJy93qEHxsdclzdlsk
	XoFo29Wj8WrU+ZDh2ap6qCxjzC8MdmBaSxMS3QSWBgw9vV/kytkHccU/Hv+Kh7yhX9as
	zgSNpMaMpeGl7Dwd/oIxkVOkm/SijrMNQqG5o=
MIME-Version: 1.0
Received: by 10.181.209.5 with SMTP id l5mr594086bkq.86.1232112892772; Fri, 16 
	Jan 2009 05:34:52 -0800 (PST)
In-Reply-To: <1232109249.4988.2686.camel@hammer.suse.cz>
References: <d1b08f940901150928h56ede408u2d070606fbe6b7bc@mail.gmail.com>
	<1232109249.4988.2686.camel@hammer.suse.cz>
Date: Fri, 16 Jan 2009 14:34:52 +0100
Message-ID: <d1b08f940901160534n2d204a36r43494e1a6ed855c5@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: ARM bootloaders (Zaurus) and CMDLINE
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
X-List-Received-Date: Fri, 16 Jan 2009 13:41:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> other significant differences, and finally create flashing utility,
> which would create correct checksums (now NAND diag checks fail).
I insisted for nandlogical committed in OE when I read your post in OESF ;-)

For reference I'll post the disassembled bootloader as found in this post:

http://www.oesf.org/forum/index.php?showtopic=3361&hl=only+root

This was back in 2004...preparatory work for the extended updater
capable to resize nand (sources in survive / fsro_resize.c).

So, writing a new partition schema is possible...the problem is read
it with 2.6.2x kernels!

Regards

Andrea


