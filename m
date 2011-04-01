Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cdhmanning@gmail.com>) id 1Q5UH7-0007lr-A7
	for Openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 04:39:49 +0200
Received: by fxm19 with SMTP id 19so2646421fxm.6
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 19:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=i56A1vZpDwGI8b2TWkW7caVX4WSgZ3c5QwPEkeGeVj8=;
	b=ZoJMRC6hrlqhHgcy6TNWOnTA7A0GavIa69CmlxtUqiOpm1qIfCujQhUalC6ABUXPaF
	g8jiFgS2PO+S9g+Ay7MrQjGmlvwWrP3vzzfbX0/vNAqL5VpEfws3BXvmLwk7je3uPPa0
	Nsw3o2P/4dQlaBC8xvnGJFd6lauf2Cs77LSHw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=jUQslhgKMxMY2w/HW4xuLW5XR9HwwiYh2nxxJkBzFdZ9zuvPIBmjly475JO8dQH+GK
	maybMIzwdyPygSoRgQw6X8BZdu3lNb68TaTwv3sOTa0GzyokljVQgWcNpqRLf3oJRGJb
	su0zcJejJTIzdvH8h1rXwZRQzDeaccR7gsZpY=
MIME-Version: 1.0
Received: by 10.223.2.8 with SMTP id 8mr781595fah.82.1301625468696; Thu, 31
	Mar 2011 19:37:48 -0700 (PDT)
Received: by 10.223.96.129 with HTTP; Thu, 31 Mar 2011 19:37:48 -0700 (PDT)
Date: Fri, 1 Apr 2011 15:37:48 +1300
Message-ID: <AANLkTikZZcRSnzJqEFgwoiYp+1KuF9ukZ4YJ+ZNJzZBx@mail.gmail.com>
From: Charles Manning <cdhmanning@gmail.com>
To: Openembedded-devel@lists.openembedded.org
Subject: How to exclude a package from a rootfs?
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
X-List-Received-Date: Fri, 01 Apr 2011 02:39:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm building a customised rootfs somewhat similar to omap3-console-image.

Various dependencies cause the inclusion of /boot/uImage* which is not
required in the rootfs, so I want to exclude it.

I tried using BAD_RECOMMENDATIONS = "kernel-image-" but that did not work.
The log shows that it identified the right package suring the
BAD_RECOMMENDATIONS processing in rootfs-ipk.bbclass but the file is
still in the output rootfs.


Any other hints?

Thanks

-- Charles


