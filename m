Received: from [209.85.217.220] (helo=mail-gx0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N1yxs-0007AS-Aw
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Oct 2009 10:00:43 +0100
Received: by gxk20 with SMTP id 20so13630688gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Oct 2009 01:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=MhuBh74J3R5a5WOB4x/MuxsGL+V1+DS6T5ofTk5e9NE=;
	b=u/gDiD1gmiyDIlgGG9Q7ekTFoG/yA+EcyZlHva3937f5mmS8uyJdcBS0e95rJF4ja3
	M1K9IpwDluVPDa11fBJiuBx+Od1mWbZF+/Uv+nIcfhvw806c3HvjElnpkNS+QsEN/vAL
	xD/vgw4h/MTm2paRj/R6xZcLdnFyYaM0deG8U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=i4WrJ9d56wdXdyOnrPEjlRA5kkM91raOpbrZorubK7K3WePqLxC6PWUY3wRzWurd+o
	qVm03mSCywNbK3ED+uPKxZy4cAabSBLj9bSZe8b/eX7QnRNlhI3eCXpToYToDbuHkYlf
	/Z7WC9ihO07shZKfhJ88cftUvsfpTzpqj8UY4=
MIME-Version: 1.0
Received: by 10.100.246.14 with SMTP id t14mr1463789anh.176.1256461175907; 
	Sun, 25 Oct 2009 01:59:35 -0700 (PDT)
Date: Sun, 25 Oct 2009 09:59:35 +0100
Message-ID: <ac9c93b10910250159k36219facpa0c13777d91d068@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.220
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: kirkwood, one or multiple machines
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
X-List-Received-Date: Sun, 25 Oct 2009 09:00:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

Recently I added support for the openrd client board to OE by making a
new machine.
I guessed this was wat was desired since there was a
linux-kirkwood_2.6.31.bb file mentioning sheevaplug and openrd base as
machines.
Also there is a kirkwood.inc file

However after digging a little bit deeper I am not too sure if this is
really desirable.
All three boards are of course based upon the Marvell Kirkwood CPU.
But the kernel as is is fully interchangeable. It uses arcNumber to
identify the board. Which variants are supported can be set (see
arch/arm/mach-kirkwood/Kconfig)
However it is perfectly ok to select multiple variants. This results
in a kernel which supports all these variants.

As a test I successfully ran an openrd client kernel on a sheevaplug.

Then why do we have multiple machines?
the only things I can think of is:
- smaller kernel (but more variants does not drag in that much)
- machine specific patches (but for now these do not exist yet, and a
clearer way then would be to use the machine specific config macros)
- tuned defconfigs (which is the only thing that there is now)

Disadvantage of more machines is that this will grow and grow.
Guess within a short while we'll see a machine definition for QNAP
TS219 probably followed by all kind of plug variants like pogoplug,
toninoplug etc etc.

Btw: wrt the defconfigs: In my opinion the defconfig should be such
that it is usable by all. Board specific things (like e.g. the video
on openrd client) should be build as modules so those who need them
can load them, and those who don't can ignore them.

What is the community thought on this? Did I miss something?

Frans


