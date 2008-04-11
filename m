Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1JkF8X-0007O2-Fh
	for openembedded-devel@openembedded.org; Fri, 11 Apr 2008 11:01:33 +0200
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 5F0096280BB;
	Fri, 11 Apr 2008 11:01:32 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <47F96AD4.8010502@gmail.com>
References: <47F96AD4.8010502@gmail.com>
Date: Fri, 11 Apr 2008 11:04:14 +0200
Message-Id: <1207904654.25732.112.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.0 
Subject: Re: Error building ... ARG_MAX
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Apr 2008 09:01:34 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

Khem Raj wrote:

> +| gtester.c: In function 'launch_test_binary':
> +| gtester.c:276: error: 'ARG_MAX' undeclared (first use in this functi=
on)
> +| gtester.c:276: error: (Each undeclared identifier is reported only o=
nce
> +| gtester.c:276: error: for each function it appears in.)
> +| gtester.c:276: warning: unused variable 'argv'
> +| make[4]: *** [gtester.o] Error 1


This is a mail which appeared today on the opensuse-packaging list:

From: Cristian Rodr=EDguez <...>
Subject: [opensuse-packaging] FYI:  glibc 2.8 may break some of your pack=
ages
Date: Fri, 11 Apr 2008 01:03:51 -0400 (07:03 CEST)

HI all :


Factory currenlty has glibc 2.8 which may break some of your packages,=20
Im going to describe just one possible breakage, and hope someone else=20
can contribute information about other breakages.


glibc 2.8 no longer defines ARG_MAX constant in linux, so you may see:


foobar.c:N: error: 'ARG_MAX' undeclared (first use in this function)

To fix this problem you can use something like this

#include <unistd.h> /* only if not already there !! */

#if defined(_SC_ARG_MAX)
# if defined(ARG_MAX)
#    undef ARG_MAX
# endif
# define ARG_MAX sysconf (_SC_ARG_MAX)
#endif

HTH.

Cristian.



--=20
"Freedom of religion also means freedom **from** religion" - Anonymous

Cristian Rodr=EDguez R.
Platform/OpenSUSE - Core Services
SUSE LINUX Products GmbH
Research & Development
http://www.opensuse.org/

-------

And from reply from Stephan Kulow:

> foobar.c:N: error: 'ARG_MAX' undeclared (first use in this function)
>
> To fix this problem you can use something like this
>
Note, that the code should have done that before too, as the glibc info=20
pages say:

   Each of the following limit parameters has a macro that is defined in
`limits.h' only if the system has a fixed, uniform limit for the
parameter in question.  If the system allows different file systems or
files to have different limits, then the macro is undefined; use
`sysconf' to find out the limit that applies at a particular time on a
particular machine. =20

Greetings, Stephan

--=20
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



