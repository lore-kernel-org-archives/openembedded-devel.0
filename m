Received: from [74.125.92.147] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jhautbois@gmail.com>) id 1MMg3B-0000zR-29
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Jul 2009 12:31:25 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1091800qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jul 2009 03:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=sHgnfwDK38zCFP2tiL8l8pMYaCd0oCOvQ5H+gxZ80gs=;
	b=aZMwlfnzbOo6Hputtwuq+UzrSO/hauzqXTVhA+CeE54EJsc2jft8q0102iR7+IntSo
	Gv3nKtvZCR6reWSTSF2oMThka6GcNFA030D/ix2dlrIJOBUfqqreDC1uTeGOuNa2rnmc
	Ab4cQ5P06chAF2X3YdLRjFpFjjanWw9m66R0Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=SEQm/J3c0c27X/Uuviy/KfiUWInVeh8JYrtXOSPJIoPtolAnpU8JipI9dNSgv1rTvM
	ik8IPKLPdlyItX7vfctedIoxBs7Y3V7o2mFMfiM6DccyDk56LH/MOMtm26cfgel46Rhn
	Y63jut7RuR0ivmq7kafUml6Vsl9BEigTmBDGg=
MIME-Version: 1.0
Received: by 10.224.11.20 with SMTP id r20mr1496221qar.192.1246616358279; Fri, 
	03 Jul 2009 03:19:18 -0700 (PDT)
Date: Fri, 3 Jul 2009 12:19:18 +0200
Message-ID: <8cad0aa0907030319m60d8da2awa7a5f1685db0ee9a@mail.gmail.com>
From: Jean-Michel Hautbois <jhautbois@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [GLibc]Version 2.8 and timerfd_* syscalls
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
X-List-Received-Date: Fri, 03 Jul 2009 10:31:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi there,

I am currently using openembedded and a DISTRO angstrom.
I wish to use the timerfd_create() syscall and this is only usable
with a GLibC >= 2.8, AFAIK.

When I modify my local.conf file, specifying:
PREFERRED_VERSION_glibc                 ?= "2.8"
PREFERRED_VERSION_glibc-initial         ?= "2.8"

I have these messages:

NOTE: preferred version 2.8 of glibc not available (for item virtual/libc)
NOTE: preferred version 2.8 of glibc not available (for item libsegfault)
NOTE: preferred version 2.8 of glibc not available (for item glibc)
NOTE: preferred version 2.8 of glibc not available (for item
virtual/i586-angstrom-linux-libc-for-gcc)
NOTE: preferred version 2.8 of glibc-initial not available (for item
virtual/i586-angstrom-linux-libc-initial)

And it is downloading and generating a GLibC 2.7.
And this GLib doesn't offer me what I am lloking for... :-).

How can I upgrade for using a 2.8 ?
Is there any way to be able to use these timerfd_* syscalls ?

Thanks in advance !

--
Best Regards.
JM


