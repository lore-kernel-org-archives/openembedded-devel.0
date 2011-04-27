Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msundius@sundius.com>) id 1QF9hy-0006B7-92
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Apr 2011 20:43:30 +0200
Received: by qwh5 with SMTP id 5so981269qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2011 11:40:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.77.13 with SMTP id e13mr141426qck.125.1303929658673; Wed,
	27 Apr 2011 11:40:58 -0700 (PDT)
Received: by 10.229.65.138 with HTTP; Wed, 27 Apr 2011 11:40:58 -0700 (PDT)
Date: Wed, 27 Apr 2011 11:40:58 -0700
Message-ID: <BANLkTi=FVHHE0+HjkhbRKy-z173cJGghog@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org, poky@yoctoproject.org, 
	josh@linux.intel.com, jessica.zhang@intel.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: building images
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
X-List-Received-Date: Wed, 27 Apr 2011 18:43:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm wondering if when bitbake builds an image, that is to say if all the
necessary package recipes have already been completely built, if just when
creating the image, does bitbake make use of the staging/sysroot directory
at all? or does it only install packages and run some scripts for pre and
post processing of the image?....

could we get away with simply simply providing the packages or a package
feed for this step?

as I write this, I guess we'd be missing the native tools in the
sysroot/i686-linux/* directory. lets just say we have told bitbake that it
should use the native tools from the build host for *everything*.

I'm asking this because I want a way for our customers to use an SDK (that
we provide from OE) to build an app, and then create an image that is
equivalent to one that would have been created from within the OE
environment (will all the package recipes).

My problem is that some of our customers will not adopt OE for developing
applications. (I think they should, but we just can't guarantee that they
will, nor do I think we should force them).

If we provide:

1) an SDK that includes:
- all of our interfaces,
- all of our utilities and branding info
- the tool chain,
- some or all the other native utilities (or maybe just take chances that
the build host is not Fedora Core 3!)
2) the packages or a link to a package feed with all of our packages
necessary for the release

what would the minimal config and class info we'd need to create an image
with bitbake?

would this be useful or would it be just as much work to get my customers to
build their app with an OE recipe?

anyone have any thoughts on as much?

Does anyone else have the problem that they need to create an image from the
result of an SDK? What do you do to solve the problem?

