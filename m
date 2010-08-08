Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aspnair@gmail.com>) id 1Oi3XF-0006j7-RV
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Aug 2010 12:55:23 +0200
Received: by iwn38 with SMTP id 38so2750632iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Aug 2010 03:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=jXPvXR3X0EN85Ue/GHjkw8W4x689PK33RtaHNN7kS6I=;
	b=gcwi0DcAQqtupsnhfXS0mJDe44tDqxyeft8fgsBgL8HFw5VTfXGTHU1+lvZLTkMqAi
	+rbHONI6wDzjbjy5Cf/JAgv/WLsoWYCqhHMTqDwLmOCpMxtcSsbIpk3lFcILYzyQERGu
	FNo8l9TB3HvHXYc4OhEqzeqSd9YGfR/PZuUYg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=qRqUv2RE1MBjcwpR4y7zehBEUf/hvfR5xmUJKrYIVk++AvELihrnWpMnL8lgMdyw3/
	fL79PIP/VAQ1+AQvNGgSq/Nksx8pIX+9Sbom7bbnhNAcba2WT0vD8qsb3YTxj4NFNqZ9
	CrREKLekvPaIlrtrcZfagGfcyc+9StL/W+YmI=
MIME-Version: 1.0
Received: by 10.231.172.83 with SMTP id k19mr17090428ibz.114.1281264908109; 
	Sun, 08 Aug 2010 03:55:08 -0700 (PDT)
Received: by 10.231.145.69 with HTTP; Sun, 8 Aug 2010 03:55:08 -0700 (PDT)
Date: Sun, 8 Aug 2010 16:25:08 +0530
Message-ID: <AANLkTikW-PHOKKuz1fOiocuU8gGiwFRk3CmTfYtU_gZf@mail.gmail.com>
From: Anand Sivaram <aspnair@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: aspnair@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: application not getting loaded
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
X-List-Received-Date: Sun, 08 Aug 2010 10:55:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear All,

I wrote a custom gstreamer application on ARM (dm6446) angstrom.
Whenever I try to run the application, I am getting the following error,
that looks
as if the shell is treating the application as a shell script.

/usr/bin/app: line 1: syntax error: word unexpected (expecting ")")

I made sure that the application is having 755 permission and readelf/file
etc. from
a linux pc shows this as an ELF 32 bit ARM executable.

These are the dynamic library dependencies during compilation.
pkg-config --libs gtk+-2.0 gstreamer-0.10 gstreamer-interfaces-0.10

Is it due to some shared library loading problem?  In that case is there
any arm "ldd" available on openembedded target or on build host to
verify what is missing?

Any help would be really appreciated.

Thanks and Regards

Anand

