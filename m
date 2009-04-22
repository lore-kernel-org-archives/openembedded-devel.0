Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LwZ7x-0005PZ-DT
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 11:52:25 +0200
Received: by bwz19 with SMTP id 19so2870845bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Apr 2009 02:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Iv1Gmi4Suwm9VwLlI9gmxnE/KBezuUX/cjf4g+qo/+k=;
	b=Y7S9XaBfMpzQI7Q6j9HYwT8a/5ppnRucQQgmfohJzF3S0oK1wmFnGq1UVSHEB5T/mj
	7FdnDdB1HhjAP9vV28mkMz5BZbPcef2RzsSHF0LgSAkOygBQsuBSsar/dsLK6iTWMNRA
	sTwhPMAK7f5UTt6KWjUsbU/BXDh/eu1s7rh5w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=qqN2XYxPcDoWv1xtnWJMhksBscAKrOgsWOtFEVFxMrkaoWGqRjBmVswjidawn+IS/m
	1F9sNqhFnT60IDa7R1dydFNCLkZ4pISwqIZQSQwJwdwumJM+e+Shri9Ex6QZbUEpSLhO
	JtYsp3SY/YoBnN9oNEJp1iaFQmWDIaTtOs3rs=
MIME-Version: 1.0
Received: by 10.223.122.15 with SMTP id j15mr2456800far.10.1240393672891; Wed, 
	22 Apr 2009 02:47:52 -0700 (PDT)
In-Reply-To: <200904221313.34069.khimov@altell.ru>
References: <1238399997-6016-1-git-send-email-khimov@altell.ru>
	<200904221313.34069.khimov@altell.ru>
Date: Wed, 22 Apr 2009 11:47:52 +0200
Message-ID: <d1b08f940904220247vcd1bfb6vb4476a9ca4a0ffb7@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: reorder do_rootfs
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
X-List-Received-Date: Wed, 22 Apr 2009 09:52:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I use initramfs-kexecboot image and could test the patch.

BTW, I spot out again the u-boot-mkimage bits here in kernel.bbclass.
These are already in linux.inc.
Where is the right place?

Regards

Andrea


