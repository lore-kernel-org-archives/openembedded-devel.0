Received: from [209.85.160.53] (helo=mail-pw0-f53.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1N8bXX-00036L-Of
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 16:24:54 +0100
Received: by pwj11 with SMTP id 11so1385319pwj.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 07:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=kppQ+0bKYFIWi3yIq75PQx4InppxfUe6j4YInZRPURM=;
	b=R6FWyEfoA53vfI07UFnDP9HFjy4hZnJcmTL0vPNj7UzOQKOU0fJRR4jrnwViThigFu
	AoFNfbKoMtrYTLtkrEjD6GtIC2pNw67AfuJe+qJwaGTP9X5tBn1czuYCEeIIc2l9O+jU
	Kumw1pKr4YrGvqsCeyF9ilgRPjrjWNym3ug+w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=xDW9udQ9Sd5Pvla7n9z2gkjPegPxhkzaE54lPHrfiqPEKyw2TCO7t5bFMVPm75e71y
	jIFheT8Y8WnT+JMKr2uUWoP9mMsK8Rr1cjdzfEwzwloex1UYag5IXguamRQhL7DeLkTY
	57i15Dnzlyo7QZG4AujAIQ94I0PKXiYk4x0dk=
MIME-Version: 1.0
Received: by 10.140.136.21 with SMTP id j21mr168665rvd.271.1258038066368; Thu, 
	12 Nov 2009 07:01:06 -0800 (PST)
In-Reply-To: <200911121520.18394.pieterg@gmx.com>
References: <200911121520.18394.pieterg@gmx.com>
Date: Thu, 12 Nov 2009 16:01:06 +0100
Message-ID: <d1b08f940911120701r41cef8fam218846ae8dfaf8be@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: initramfs dependency loop
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
X-List-Received-Date: Thu, 12 Nov 2009 15:24:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

>I'm using an initramfs image, based on klibc.
Same here.
I fear you need a second recipe for the initramfs-enabled kernel.

See                    /conf/machine/include/initramfs-kexecboot.inc
and the triplet    /recipes/kexecboot , initramfs-kexecboot-image ,
linux-kexecboot

Regards

Andrea


