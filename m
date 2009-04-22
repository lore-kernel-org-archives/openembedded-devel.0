Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LwZ5N-0005Lt-Sy
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 11:49:45 +0200
Received: by bwz19 with SMTP id 19so2869601bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Apr 2009 02:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=CkfEAvSrySVzpehBU+/UPG7Ymt7lJzrZOZw5QcuZYjM=;
	b=nEe8xD7cGCWj/pgta6senGxSLrwXHNDyytzVATDAzgvRC/p9OghPlpPO172wbGQSxx
	mge3QtCchooMZWrPMvTPpLCn5niNsI28ciIJ1H59nj4M5efeJa7GFIaNmYBPo7xs+Doy
	Q7Xxinu6XCwBSBEKumcZYefxJXnw6Gf1SZzNo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=S5ot53NUeLMVScgltxTGOERxM1mofY4exjtbuanAjxD8tWNME7/oLnUoZ4QS4NPq70
	eGZd7WM/knbNkuYcynnsYMRdrJYxo0bVTB1RAkTpRcOQ2hYmygBy5SODBVrCr/MQaOrS
	IT87abeY5VCIT7tnpdQStvHeFw6N5t92/l0EE=
MIME-Version: 1.0
Received: by 10.223.114.208 with SMTP id f16mr2436791faq.91.1240393513279; 
	Wed, 22 Apr 2009 02:45:13 -0700 (PDT)
In-Reply-To: <200904221249.07359.khimov@altell.ru>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF763@hiob.intern.dresearch.de>
	<d1b08f940904200836k6374f731h83342aea89c1f14@mail.gmail.com>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF76B@hiob.intern.dresearch.de>
	<200904221249.07359.khimov@altell.ru>
Date: Wed, 22 Apr 2009 11:45:13 +0200
Message-ID: <d1b08f940904220245od7e8c6cw82b65da83fa1faf8@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: initramfs howto?
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
X-List-Received-Date: Wed, 22 Apr 2009 09:49:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>The mentioned initramfs-kexecboot-image looks to me like a target to build an initramfs. But this does
>not contain any modules. So it does not involve one of the main questions.

Including /conf/machine/include/kexecboot.inc in the machine.conf we
obtain the result of having one extra kernel built in the same image.

EXTRA_IMAGEDEPENDS += "linux-kexecboot"

You can create your own recipe linux-kexecboot like and populate the
cpio.gz as you like. The a.m. image must be as small as possible, thus
kblic, no shell and no modules, just a custom binary as /init.

BTW it is even possible to concatenate the modules (at the end) of the
cpio, after creating it.

Regards

Andrea


