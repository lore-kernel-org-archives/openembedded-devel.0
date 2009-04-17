Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mturquette@gmail.com>) id 1LuvKU-0002cZ-Ts
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Apr 2009 23:10:38 +0200
Received: by wa-out-1112.google.com with SMTP id n7so517122wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2009 14:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=PMMPSExlfKFNupA13i1mPDdVFvDZqR1ix40khEHo7wo=;
	b=CgmflY6m8s+9M/H7Rk9FyV9MC26UJA/eOkCH2J33s5THeWnSn0yv35lKbdDdVnJtk4
	Ax7XSAsqnwNRO5TcijfIQk9smpsWNkdMkT9DWHv8PEwav3nq9rWFXI1b7/iezBQMqn/1
	Okk2LE9Qby5P9kPvWmVCwKugpFgYnZIrz+pLE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=VNE2G8/TJNQwMTNgAolZ2bYxOE/60lWxuV7sHc4/x5DRdNKHFXnz+CeA4gOp5lrsWw
	g9dBJ2JXRQJUG1IW90As2wir8Uts0M+wcvNo+GssbLg1B3JesiVk2dZKu1mWto3EexZQ
	r733Wa35PYXbJRHthTGtvldcaz4JnQj11yA4I=
MIME-Version: 1.0
Received: by 10.114.160.17 with SMTP id i17mr1652397wae.125.1240002392777; 
	Fri, 17 Apr 2009 14:06:32 -0700 (PDT)
Date: Fri, 17 Apr 2009 16:06:32 -0500
Message-ID: <59e7e6f90904171406x49c44219pffd6f79e87ff90d1@mail.gmail.com>
From: Mike Turquette <mturquette@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: compiling for a coprocessor with a different architecture
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
X-List-Received-Date: Fri, 17 Apr 2009 21:11:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

I work at TI and have some internal recipes we use to build DSP stuff
in OE for OMAP.  The existing recipes are gross and fetch the DSP
toolchain from a local server, then any other recipe that needs to be
compiled with that for the DSP simply calls the compiler from native
staging in a hardcoded fashion.

What is the right way to compile a subset of recipes for a different
architecture than your main Linux stuff within OE?  Is there a
mechanism for this already?  I'd like something that wasn't specific
to TI or my recipes, and can be used for any number of coprocessors
that have a different architecture from the main CPU.

Thanks,
Mike


