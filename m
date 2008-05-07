Received: from [66.249.92.173] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthijs.van.de.water@gmail.com>) id 1JtlQg-0002wt-5R
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 May 2008 17:19:38 +0200
Received: by ug-out-1314.google.com with SMTP id c2so252538ugf.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2008 08:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=+rLJB/u9lQ6zIlQHDXce2Ii7y21FM/2OiLNeThEG++I=;
	b=IlXMYBiHG9ReeGvsaBtiK7jQJA4oWujT6AMrfEcveSmwgDLkGbx0A4msH8g+w6uA77k7Ay5S+HicrWBY9n2tGKXDG8vj9Y6oKm1tnPLtKXTRnTFn7rAQajUmw0263vdkh4q0xnRYFV5n6laLoYkycV7meRwbCV6H23nF67wjdvQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=opSTOgqFUIi7wkIGQkNYcse/slnxd1kHeQKFvhvhZ7tOINeY9RT+uz8HssWJ5A94FX/Ehn40LKDHM+h0RYiVTOPB5hNH9BfB/UmzbpUDve9ysBB0N5hOMLHFjeMu749rRoN0y9hD8RmrYX4CX0PDfw9DsN6sf09fj0fmCpqQ0es=
Received: by 10.78.81.20 with SMTP id e20mr613500hub.64.1210173544206;
	Wed, 07 May 2008 08:19:04 -0700 (PDT)
Received: by 10.78.161.14 with HTTP; Wed, 7 May 2008 08:19:04 -0700 (PDT)
Message-ID: <35a670560805070819i7aebd26ct7e5b81c3ff39a9fd@mail.gmail.com>
Date: Wed, 7 May 2008 17:19:04 +0200
From: "Matthijs van de Water" <matthijs.van.de.water@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080423123254.GC28337@sirena.org.uk>
MIME-Version: 1.0
References: <35a670560804100650w7de4cec0gae583d5ae73b8fad@mail.gmail.com>
	<35a670560804101007m1d787b4ai97927bb42fcbfe5d@mail.gmail.com>
	<4800DC3B.9080007@gmx.net>
	<35a670560804140932s53231dcj1adfa6bc21e0353e@mail.gmail.com>
	<35a670560804150810k603d1986t4e02eefa7f411728@mail.gmail.com>
	<480596E2.7030906@gmx.net>
	<35a670560804210337x73d63394t3e6b4feb0ee5118e@mail.gmail.com>
	<480EE63D.8070208@gmx.net>
	<35a670560804230444j7706a535u818d812d72f77649@mail.gmail.com>
	<20080423123254.GC28337@sirena.org.uk>
Subject: Re: Building ubuntu/gcc-4_2-branch to get GCJ for arm EABI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Wed, 07 May 2008 15:19:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I'm not having any luck with GCC 4.3 and I expect to hit more GCC 4.3
problems in OE.
Since the 4.2.3 toolchain seems to build a nicely working root
filesystem without trouble, I'm still very much in favor of using the
Ubuntu-patched GCC 4.2.3.

Matthias Klose (gcc maintainer for Debian/Ubuntu) says that the 4.2.3
Ubuntu version should produce runnable binaries (e.g. testsuite runs
without error), so there must be something wrong in my particular
build.

Is anyone (Robert?) willing to run a build and test a hello world so
we can see if the error is consistent or specific for my build
environment/target hardware?
I've put my current bb-files on http://www.matthijs.net/gcc/ including
patches dir (in tar.gz).

Thanks,
Matthijs


