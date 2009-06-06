Received: from [209.85.220.220] (helo=mail-fx0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mateusz.kijowski@gmail.com>) id 1MD3Gb-0003fB-04
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Jun 2009 23:17:29 +0200
Received: by fxm20 with SMTP id 20so2244471fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Jun 2009 14:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=dLwFWoylAWsUS81Q5uNVacZwrfXDohkZPYRHT5EvJKw=;
	b=PXDw+KT2bpfM1IJ3fXmOgXUmxGcs4m5/EMTmq0VI4bKtRn9G/sxsRBywwvWwosUcyR
	MHVLo0j6enLx2Q+pfgwD8Pz9AMvaY+ymeakTgpBA9W6F7CYiFHgW3z0/1UVKgcDEEgst
	J4yNlax9x/bpS7kY6f3qoOFkhE1xzs8eAvO7I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Ad+/iGht2lv0R6aU+QlaugCOyGHUXMGwpX8OtLCv+WEQySzVCQKd82CSP8zpH8FY1F
	Pe/XodtodqTPcdsyzykzR4H++4qVcbJU8Pz2Ud71CU+GAVdqtKxDW1L0ecaox8tw5UIm
	01DZDUrOud2c3Ypc7ClsTfcVRmH97nrSK0Etc=
MIME-Version: 1.0
Received: by 10.223.116.72 with SMTP id l8mr2890709faq.33.1244322489137; Sat, 
	06 Jun 2009 14:08:09 -0700 (PDT)
Date: Sat, 6 Jun 2009 23:08:09 +0200
Message-ID: <921557650906061408x129a09c6j53d0e0a971a5eac8@mail.gmail.com>
From: Mateusz Kijowski <mateusz.kijowski@gmail.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] netvista 8363/N2200 machine support
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
X-List-Received-Date: Sat, 06 Jun 2009 21:17:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,


This patch adds support for the IBM Netvista 8363/N2200 internet
appliance. Its a PC-like thin client based on NSC/Cyrix Geode GX1
chip with a CF slot and SDRAM additional memory socket. Firmware
is somewhat broken - it expects a file named kernel.2x00 with peculiar
ELF header values (object count has to be set to 1) on a ext2 filesystem
on /dev/sda1.

This is my first patch for OpenEmbedded, but I've been lurking this
list for quite a while. I suppose I could merge linux-netvista8363 recipe
to linux recipe but I am not sure if it's a better apporach when the latest
bootable kernel version is not recent (2.6.24.7). Please be gentle :-)

--
Mateusz


