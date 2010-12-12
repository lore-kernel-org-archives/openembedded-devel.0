Received: from mail-iw0-f169.google.com ([209.85.214.169])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PRnRY-0007OY-KJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Dec 2010 16:02:34 +0100
Received: by iwn40 with SMTP id 40so1865283iwn.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Dec 2010 07:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=81INetZm62KxbieNUK+Lhp6mV9qyKkXxEPiFtHg9/6w=;
	b=e5Ed3e54sVVI5V8gGcYFbiauELBc8y2ZAHzCwpJjjjXz7LsilonQoReQ7LfopVzZZW
	nPYS12nKBA3r+eYwMCxVWc22WGM4xw9hJ5ThslDK5MlJ26xHoboCY2kQgbZaslMc15p7
	h4jezk4clbgA8nns081hMXvEl/TqAyWNZH1Zc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=u4KJOYcFmcGYLLB5NnuH3oE/97wGTg7tHxmnc9yd+GzFY/R+UxkNYW3YSKN00OFgmD
	FwMdPNcgOqA51ZFlFEQH/aqY4aoWd1x7rif8tPlQgEPnVQcHlwZRnVFSEET152DLBFtN
	UZt+jCKWb90ZbiYG8Jy+BPOOHl1UkOYTEGN/Y=
MIME-Version: 1.0
Received: by 10.231.31.1 with SMTP id w1mr1160418ibc.7.1292166054976; Sun, 12
	Dec 2010 07:00:54 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Sun, 12 Dec 2010 07:00:54 -0800 (PST)
In-Reply-To: <AANLkTimDrTj0Z=1H0FL2zDh8WetgziWx7s8o5+4WeTMJ@mail.gmail.com>
References: <AANLkTimDrTj0Z=1H0FL2zDh8WetgziWx7s8o5+4WeTMJ@mail.gmail.com>
Date: Sun, 12 Dec 2010 16:00:54 +0100
Message-ID: <AANLkTinqt737DQdDALBwUEGbTXyXL+NEuB2f2e65pfDH@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.169
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: mediatomb configure: linker issue: nonrepresentable section on output (hidden symbol `__gnu_thumb1_case_uqi')
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
X-List-Received-Date: Sun, 12 Dec 2010 15:02:34 -0000
X-Groupsio-MsgNum: 27099
Content-Type: multipart/mixed; boundary=0022152d6d8db29da3049737da4a

--0022152d6d8db29da3049737da4a
Content-Type: text/plain; charset=ISO-8859-1

An update to this issue.

Khem added a patch for js which fixed it for him.
However with a clean build I still have the error.
Attached is the test program and the cmd to compile it as well as the
output log from the compilation.
I run the cmd under devshell (bitbake -c devshell mediatomb)

If the attachement does not make it, the file can also be found at
http://filebin.ca/znwztf/jstst.tar.gz

I'm kinda out of ideas. The only thing I can think of is that somehow
host libs get dragged in which do not have the symbol, but I do not
really see that happening either

Frans.

--0022152d6d8db29da3049737da4a
Content-Type: application/x-gzip; name="jstst.tar.gz"
Content-Disposition: attachment; filename="jstst.tar.gz"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ghm269se0

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
77/9Fw9BplgAUAAA

--0022152d6d8db29da3049737da4a--
