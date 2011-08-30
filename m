Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1QyJk8-0003pT-0K
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 10:32:24 +0200
Received: by gxk3 with SMTP id 3so815894gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2011 01:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=yzxrBSmWGrTqX7F72SFGKyS5mY9OhiezxisFxUECd9M=;
	b=mph0dTvEwSmsWi7SzSobOC+pX4TDxHtrvFWsXbrjx9JO/4vgdWEkZlJacSFxZEIs7L
	MphMD7/Ja7ujqfexJssTf+oP1XVXz8REH6kjyOzbopZScjbgtzszk0r8IAl5b+krA2D/
	gGegNlsLhXkaJ8w9U4c0EcYp36br0s7tNfM8Y=
MIME-Version: 1.0
Received: by 10.42.145.131 with SMTP id f3mr5779807icv.504.1314692850480; Tue,
	30 Aug 2011 01:27:30 -0700 (PDT)
Received: by 10.42.166.132 with HTTP; Tue, 30 Aug 2011 01:27:30 -0700 (PDT)
Date: Tue, 30 Aug 2011 10:27:30 +0200
Message-ID: <CAJJ=G6_X2B5wJG822Sqhqwzz9cAmjsG_YNXmYZ6XzkapnUzE3Q@mail.gmail.com>
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Changing kernel for Angstrom @ beagleboard.
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
X-List-Received-Date: Tue, 30 Aug 2011 08:32:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

I run Angstrom 2010.8 with a 2.6.39 kernel. To get better power
management I want to use the 2.6.39 pm-branch from sakoman.

I've created a recipe called linux-sakoman-pm_2.6.39.bb and tried
setting some preferred providers.

PREFERRED_PROVIDER_virtual/kernel_beagleboard = "linux-sakoman-pm"
PREFERRED_PROVIDER_virtual/kernel = "linux-sakoman-pm"

I also set DEFAULT_PREFERENCE = "-1" in linux-omap_2.6.39.bb.

This made it compile linux-sakoman-pm_2.6.39.bb when I bitbake my
rootfs, but packaged in /boot in my rootfs is still the old kernel.

What's missing?

- Tasslehoff


