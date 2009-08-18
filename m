Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <brandhetlampje@gmail.com>) id 1MdPNm-0001CE-OQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 16:09:50 +0200
Received: by ewy21 with SMTP id 21so3680551ewy.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 06:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=bNY0POSzF/sqsniv0Mr4TVoBvmS53AJlFSeFFI8B2+M=;
	b=KqAQnim2vMr4S5fF+mDLpDGkLyEHRQEKkKXVU1uJ/a+KeJpUqggZWpQal4a29sb1EP
	5zdHZYabUnTbjmmRNpNl1rxzfc80+ru1dkqnc9210jrrwbmLJ0kiQIkMljkJrYsKjV/o
	uJiDTXE01m5uBgoVfRV7PMTkmHHbxtUoJ0St4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=OsavG+dfVIIjSSMaaCcXgLYl8Buo875NfRcPYbqg/vRo3FNgGTUejyqHIOJs7wMDcX
	1cdzSEP20+i/scEzrQFnK3kDR8r6nW9L73aRztg9knimXzE2j4BfKUJd+p/n78umcvH3
	tCmv2IN+28WN/JwhuXcwfBbtK3eY+NQHKIRWI=
MIME-Version: 1.0
Received: by 10.216.11.137 with SMTP id 9mr1281683wex.180.1250603564427; Tue, 
	18 Aug 2009 06:52:44 -0700 (PDT)
Date: Tue, 18 Aug 2009 15:52:44 +0200
Message-ID: <6978a1740908180652y36467f0evcfc467153cf9ac64@mail.gmail.com>
From: s hakkesteegt <brandhetlampje@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Create dir with 700 permissions from recipe
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
X-List-Received-Date: Tue, 18 Aug 2009 14:09:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

For a recipe I want to use locally to enable public key authentication on my
images, I'm trying to create the .ssh dir with 700 permissions. But this
doesn't seem to work. It ends up in the rootfs and in the ipk with 775
permissions, although in the work dir it has the correct 700 permissions.
This is the recipe I created:


SRC_URI=" \
                    file://authorized_keys \
       "

FILES_${PN}=" /home/root/.ssh \
                       /home/root/.ssh/authorized_keys \
           "

do_install(){
       install -m 0700 -d ${D}/home/root/.ssh
       install -m 0600 ${WORKDIR}/authorized_keys
${D}/home/root/.ssh/authorized_keys
}


On irc was suggested to use postinst script. So I tried to add the next at
the end of the recipe.:


pkg_postinst_${PN}-chmodsshdir () {
        chmod 700 /home/root/.ssh
}


1. Do I understand it correct that this postinst script will run on the
target machine (after first boot)? Or is that wrong?

2. This doesn't seem to work either. Am I doing something wrong and is there
a better / right way to add my public key my created images.


Thanks in advance for a reaction,

Siebren

