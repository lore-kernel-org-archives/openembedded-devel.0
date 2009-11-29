Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NEqS3-0003Lf-DJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Nov 2009 21:33:02 +0100
Received: by pwj11 with SMTP id 11so1790822pwj.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Nov 2009 12:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=n+UV4WoA2ZPsZeUg7yF9W46VlPme27rRJ9xmX2kL68Y=;
	b=w2dpQO24BLSFw3lQ+bOrNQyqgBcitlpghQAlUwQW4vknN+HPU8bV2Dn+gNnEYeAEjF
	ih3yY9eUF22J0S7wPij7WDNmEcubUJZrq1ddsOhUuNWwKTtEIxELWo3fLCeM0pdOjhlB
	FCptc1C2wpH/1yNBwibLSCTBw2za0VqZnC/L0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=j5nYUiFYbG+/PLy8O9CdRGouTd9kaXQ31F9ce2Ma5NZ6Ai4j9KrISnR5+mb+RFG4Tb
	qV0yf0q1Gtjn/OHnZn6YPkSb0Ck0BLpKjB+Hf/p7X+1qQMMxYuxWdrFnQk7I/Ezu6mhs
	KagiDrGJRsaIwpsFaRs9dk7IaOYMRrSfBd7jY=
MIME-Version: 1.0
Received: by 10.140.163.4 with SMTP id l4mr195554rve.35.1259526684349; Sun, 29 
	Nov 2009 12:31:24 -0800 (PST)
In-Reply-To: <1259505030.24812.8.camel@gregoire-laptop>
References: <mailman.3.1259492402.612.openembedded-devel@lists.openembedded.org>
	<1259505030.24812.8.camel@gregoire-laptop>
Date: Sun, 29 Nov 2009 21:31:24 +0100
Message-ID: <d1b08f940911291231k148967bcne311b8b5f40af90f@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Initramfs and kernel
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
X-List-Received-Date: Sun, 29 Nov 2009 20:33:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

> I obviously don't do it right. How is initramfs supposed to work in OE?

One way is the one we used for :
kexecboot -> initramfs-kexecboot-image -> linux-kexecboot

See how images of initramfs-enabled kernel is pulled in
conf/machine/include/initramfs-kexecboot.inc
Basically we ended up with two recipes for kernel.


Regards

Andrea


