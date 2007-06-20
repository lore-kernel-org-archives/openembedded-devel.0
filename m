Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <slapinid@gmail.com>) id 1I0xGa-00068K-5r
	for openembedded-devel@openembedded.org; Wed, 20 Jun 2007 12:18:24 +0200
Received: by wa-out-1112.google.com with SMTP id v27so51523wah
	for <openembedded-devel@openembedded.org>;
	Wed, 20 Jun 2007 03:14:41 -0700 (PDT)
Received: by 10.114.197.1 with SMTP id u1mr146614waf.1182334481144;
	Wed, 20 Jun 2007 03:14:41 -0700 (PDT)
Received: by 10.114.210.2 with HTTP; Wed, 20 Jun 2007 03:14:41 -0700 (PDT)
Message-ID: <48239d390706200314y300766en9956ec5e56789ce5@mail.gmail.com>
Date: Wed, 20 Jun 2007 14:14:41 +0400
From: "Sergey Lapin" <slapinid@gmail.com>
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
Subject: [RFC] locales
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
X-List-Received-Date: Wed, 20 Jun 2007 10:18:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi, all!

Note: I could be fundamentally wrong here, so, please feel free to
point me to right direction in this case.

As it was discussed on #oe, locale infrastructure lacks implementation
on oe.dev, and, in particular, in Angstrom.

With a bit of research I done on this subject made me to come up with
a few ideas, which I'd like to know your opinion about.

Present status:
*-locale* packages are generated, but not put on image. These packages
contain message translations.
* Only glibc locale which is put on image (if any) is en_GB.

Infrastructure problem:
* We need a way to set up automatic locale package installation during
image build
according to some subset of languages/locales.
* We need a way to install "language" in simple user-friendly way. I
mean here not only locale packages, but also various
language-dependent files (docs, keymap settings, various configuration
files, etc.).

Various random problems encountered:
* GPE locale.alias for gpe-dm needs cleanup (get rid of non-UTF8 locales?)
* libx11 locale.alias needs cleanup (setup for UTF8-only system).

So, if we go utf8-only, we need to do a great cleanup/testing job here
to settle things up.

As for infrastructure, I see several questionable methods of solving this:

1. each package RRECOMMENDS its locale packages for locales mentioned
in local.conf variable, and additional ones, which are related.

2. image RRECOMMENDS locale packages blindly for all normal packages
for languages which are in a var mentioned in 1.

3. all -locale packages generated during builds are written to some
special lists, for each language. Then meta-packages are generated
from these lists.

...

So, any ideas?


