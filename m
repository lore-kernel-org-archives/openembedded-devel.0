Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RWw9e-00063C-C3
	for Openembedded-devel@lists.openembedded.org;
	Sat, 03 Dec 2011 21:25:50 +0100
Received: by lagj5 with SMTP id j5so1703366lag.6
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 03 Dec 2011 12:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=nU0zf49lQi0KzYev6xJH9q5okPeRGH5X8LF5iVbMskk=;
	b=Y50GYBA0UOIkUYDFE76ognsQGomSnGdzDS1ReHHXJOK3sQYoacpI0Xc3YwPHq4fQns
	VQKKZ28njmWaBD68AUHYaU3G3Hmh5cQz01IOWE9ZnG02awSPHW3ehEoayvjn5uQ6twzP
	O0tDi3t4z/zmhYB3kTA6s2EjGnN6/vUwZXxz4=
Received: by 10.152.144.73 with SMTP id sk9mr2155755lab.34.1322943543280; Sat,
	03 Dec 2011 12:19:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Sat, 3 Dec 2011 12:18:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Dec 2011 12:18:32 -0800
Message-ID: <CAMKF1srGAsF2OSgL4qPMCDFxUTusFy-Mk=swJ3bvgLZ8ZQVP0w@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Failure expanding variable PRINC[:=], expression was ${@int(PRINC) + 1} which triggered exception NameError: name 'PRINC' is not defined
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
X-List-Received-Date: Sat, 03 Dec 2011 20:25:50 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I am seeing  this


Pseudo is not present but is required, building this first before the main build
NOTE: angstrom DOES NOT support libiconv because the eglibc provided
iconv library is used          | ETA:  00:00:22
NOTE: angstrom DOES NOT support libiconv because the eglibc provided
iconv library is used          | ETA:  00:00:22
ERROR: Failure expanding variable PRINC[:=], expression was
${@int(PRINC) + 1} which triggered exception NameError: name 'PRINC'
is not defined
ERROR: Command execution failed: Exited with 1

when parsing angstrom-2010.x distro after deleting the builddir and
doing clean slate build

I see lot of those expressions are coming from
meta-shr and other layers in meta-smartphone

Does someone else encountered it ?

Thanks
-Khem


