Received: from [74.125.92.144] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <simaskonfa@gmail.com>) id 1M22WK-0004se-UC
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 May 2009 14:16:13 +0200
Received: by qw-out-1920.google.com with SMTP id 9so498269qwj.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 May 2009 05:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YG8UUJqENuvzZmQHtRMcs3pAzMQwMQ5F+1c0y4sddAE=;
	b=WRLR6WsNPW9XI9Oajf+cA4o/FJf/mGuj7eM4YheB/ku/IaHEM0HT5eR0Bj5/EA7KT8
	rU3X5odEWYL6uHy6cJpvka4yJ3xrs6zEYNun4Q+S8osJDCIqKXbpCdJAiBzTZryJl2PD
	di7D73/CdEbnexEl0SjlrbM3NhR/5D0A6otBc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=EhMYQ8lnF6KhiNLX1EszZfzFZywdx5zXejJGNptPcH7t8DoVZJaIqAEgYbE/eAtzJp
	GFIwzGasWhJdCrjjB4+BGT2dy3m2lCyrIIAkJEjO6bp/susCoLdbI6bhy9DSCNJLIu/r
	mpv/LDIvaeMmPEEwRbwvWn4eBiEFojHDuAXCo=
MIME-Version: 1.0
Received: by 10.229.86.196 with SMTP id t4mr2438803qcl.39.1241698206761; Thu, 
	07 May 2009 05:10:06 -0700 (PDT)
In-Reply-To: <2e69630d0905060801w29e0719fqc4f3904e784fa7b8@mail.gmail.com>
References: <2e69630d0905060801w29e0719fqc4f3904e784fa7b8@mail.gmail.com>
Date: Thu, 7 May 2009 14:10:06 +0200
Message-ID: <2e69630d0905070510x3c161a2atbbb7b9a0edf7578e@mail.gmail.com>
From: sledge <simaskonfa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: problem with opie for qemuarm
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
X-List-Received-Date: Thu, 07 May 2009 12:16:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello all,

I have bitbaked opie-image for qemuarm. Resized the resulted
opie-image.rootfs.ext2 partition, launched qemu with these parameters:
http://linuxtogo.org/gowiki/Angstrom/qemu-system-arm

I have also tried extracting modules*.tgz into that ext2 rootfs. Same result:

It has configured and launched the init.d processes, stopping any
output after the bluetooth. Apparently opie did not start, nor any
other rc processes; hence no graphical interface nor command-line
login prompt

Where should I start with? I tried to mv etc/init.d/bluetooth
etc/init.d, but it still starts (thought it was a blocker). I suppose
it is because the modules are being loaded.



Thanks!

--
sledge


