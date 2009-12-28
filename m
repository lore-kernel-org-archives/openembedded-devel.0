Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NPNxr-0005jV-E0
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Dec 2009 23:21:26 +0100
Received: by fxm4 with SMTP id 4so9191585fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2009 14:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=j4PaBPdqUuHhP6gWY3/DNgD//1cgix3Yx8K1oU4M2gk=;
	b=S9mV9UWLJZJNiodJx3XxG4niwBfuBNpCU1Homm5aWM8QlEGY0HZ9zEwZPFL31ZOI4Q
	QUIOyr4Q9T3wzD8Ekm66peQxu9D7xfCT5jFvG0s2v5NfFoHw8ge3RcLuJ6dw1DPFxQ+W
	s7uo5t/ooBH7QFZo4iEZ0z5u1susPfmxNxsxI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=OV+7kxJmFPR0NK6sBVkbUMc1t4RJjQW+XRRAiwdVXoSTT/J7t/rSPFyCR47PuaC3rw
	angqwFlFKUWrKWdvOmCaIJeMDHa+QC/VIkFYC1S1bXbbk8WGU1Fxe+U6NKBOr45NEP5B
	cEd6HMa7p+P9FH+9L9B4eLsaEPyY9ysg/9hcw=
MIME-Version: 1.0
Received: by 10.239.154.204 with SMTP id f12mr916121hbc.153.1262038766382; 
	Mon, 28 Dec 2009 14:19:26 -0800 (PST)
Date: Mon, 28 Dec 2009 23:19:26 +0100
Message-ID: <c384c5ea0912281419h3c14c675r8ec6d044c234a381@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: helloworld image
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
X-List-Received-Date: Mon, 28 Dec 2009 22:21:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello (world),


when compiling my favorite minimal image ("helloworld-image") under
both the minimal-distro and angstrom
shows 4 MB of cruft being dragged in.

What happened?

I would like to start with nothing and then configure the system for
what I need.

Should I start another more-minimal distro or can we change the
minimal distro to be truely minimalistic?


# Hello world image
# Contains *only* a statically linked hello world init program

IMAGE_INSTALL = "helloworld"
IMAGE_LINGUAS = ""

inherit image


Regards,
-- 
Leon


