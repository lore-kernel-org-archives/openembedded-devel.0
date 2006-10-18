Received: from [64.233.162.203] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <nicolasfr@gmail.com>) id 1Ga7IP-0003a4-Fc
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Oct 2006 11:01:05 +0200
Received: by nz-out-0102.google.com with SMTP id q3so72092nzb
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Oct 2006 01:54:09 -0700 (PDT)
Received: by 10.64.156.1 with SMTP id d1mr14008148qbe;
	Wed, 18 Oct 2006 01:54:08 -0700 (PDT)
Received: by 10.65.197.7 with HTTP; Wed, 18 Oct 2006 01:54:08 -0700 (PDT)
Message-ID: <b9481e140610180154r5a3c5c0do543863a9b0b4c059@mail.gmail.com>
Date: Wed, 18 Oct 2006 10:54:08 +0200
From: "Nicolas FR" <nicolasfr@gmail.com>
To: "Using the OpenEmbedded metadata to build Linux Distributions"
	<openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: Bitbake: say who you are cooking
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Oct 2006 09:01:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

A suggestion for Bitbake:

When we start to bitbake a recipe, let's say "bitbake foo", bitbakes
starts compiling dependencies without telling which version of foo he
will finally compile.

I find this frustating, because quite often (wrong preferred provider,
...) I end up bitbaking the wrong version of a recipe, and bb won't
tell you this before having successfully compiled all the
dependencies.

It would be nice to have bitbake print which version he will bitbake
before actually compiling the dependencies.

Eg:
# bitbake foo
Note: parsing foo_2.0.1.bb
...

What do you think?


