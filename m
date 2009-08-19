Received: from [209.85.218.221] (helo=mail-bw0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stuart68@gmail.com>) id 1MdcXB-0003ok-Bi
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 06:12:25 +0200
Received: by bwz21 with SMTP id 21so3159771bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 20:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=IF4PACkZfjAWN7G9gXGjKM1DBKAztC3JXEuWIPa3MXQ=;
	b=e20IAmWpXbkS+JZBI9Tdunj8iM9zzk4zSyqEo8zdC+ESZQKC4abyMcEaG+4gFZgUnE
	FO7HaCyN7sKiv32XtW5L5ivgOvyQSk1ALIkVmstxRRGawGk5Q2gYlHvwRqjinm60rb0z
	7FGeLy61i/7n1Gs3s36/3j2wpBoowtKE6+RGY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Y8OSag19DRVoSSGn/nKB75Y6PkGsTKMiSqJlYmF6RBgIiTnNGpyZLmBU86BZl0Djpd
	YCvGjjm+xYE+/Z2KoCWpOW/KQt41VtBVaEjoCS/cho7WZMFtPSP3yOgcU8yylXTvR3Cy
	ICDQz70EcN7pNxIi4iOCKijMkqWZQiE3LwwPQ=
MIME-Version: 1.0
Received: by 10.103.86.31 with SMTP id o31mr2227648mul.58.1250654114970; Tue, 
	18 Aug 2009 20:55:14 -0700 (PDT)
Date: Wed, 19 Aug 2009 04:55:14 +0100
Message-ID: <91283b620908182055l505fbbabt4dd5369f51cf260@mail.gmail.com>
From: Stuart Gray <stuart68@gmail.com>
To: "General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>, 
	openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Problem passing environment variables
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
X-List-Received-Date: Wed, 19 Aug 2009 04:12:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I am trying to build with support for Qt4 Embedded. This was working, but
then I tried to add our most recent Qt4 project files and updated code, but
the build failed.

The issue is that the project files use environment variables which when
using the Qt4 development environment works fine, but when this is compiled
under the OE environment I cannot find a way to pass the variables into the
qmake2 build.

I have tried to add them on the line calling qmake2, but this has not
worked.

I have also tried to add then into my environment setup changing my .bashrc
to add the variables. I have also added these to the BB_ENV_EXTRAWHITE, but
the variables are still not found.

Running bitbake with the -D option I can see that these variables are found
and exported, but still the build fails as it cannot find the environment
variables.

I am building for overo with a 2.6.29 kernel. I am convinced that there is
something not being cleaned when I run bitbake ???.bb -c clean.

Is there a better way to pass environment variables into the qmake build. I
had been using autotools, but now we are trying to override using
do_compile.

I will post an update to this after deleting the tmp directory and
rebuilding.

