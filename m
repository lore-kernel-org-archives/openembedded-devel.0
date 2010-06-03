Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <developer@alexandfliss.com>) id 1OKBA6-0003ro-Hk
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 16:13:18 +0200
Received: by gwb15 with SMTP id 15so80977gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jun 2010 07:08:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.5.145 with SMTP id 17mr9931193icw.31.1275574110042; Thu, 03 
	Jun 2010 07:08:30 -0700 (PDT)
Sender: developer@alexandfliss.com
Received: by 10.231.206.200 with HTTP; Thu, 3 Jun 2010 07:08:29 -0700 (PDT)
Date: Thu, 3 Jun 2010 15:08:29 +0100
X-Google-Sender-Auth: 6MRRT0N9oxm1OgOqmYMct5W2Dtc
Message-ID: <AANLkTinfALcc7SfhQ04fED06C2EE_WJUCWTmlDB98zYM@mail.gmail.com>
From: Alex Bennee <kernel-hacker@bennee.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: developer@alexandfliss.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Programtically setting TMPDIR in bitbake.conf
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
X-List-Received-Date: Thu, 03 Jun 2010 14:14:09 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I'd like tweak the OpenEmbedded TMPDIR variable so it can optionally
build into a sub-directory of ${TOPDIR} based on the current git
status of the OE tree. The usage I envisage would be something like:

bitbake my-image
=>
builds to /path/to/build/current/[deploy/staging/etc...]

RELEASE=1 bitbake my-image
=>
builds to /path/to/build/build-12345ab/[deploy/staging/etc...]

Which would be based on the GIT commit ID. I'd probably want to
support the "dirty" semantics similar to the kernels versioning to
indicate the tree had uncommitted changes.

I know bitbake.conf can use arbitrary python to fill in the variables
but I'm unclear where these fragments can be put. A lot of python
snippets seem to refer to things like bb.data.getVar() which I assume
is part of bitbake itself. Is it possible to define some python in the
OE tree I can call from bitbake.conf? Is this functionality that has
to be added to bitbake itself?

I assume the change has to be made to bitbake.conf as other variables
are derived from TMPDIR at that point?

Basically I want to avoid writing an overly complex python one-liner
directly in bitbake.conf, that would seem to perl-ish ;-)

Cheers,

-- 
Alex, homepage: http://www.bennee.com/~alex/
http://www.half-llama.co.uk


