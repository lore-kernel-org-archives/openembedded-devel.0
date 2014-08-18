Return-Path: <gary.robertson@linaro.org>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 092F5617B8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Aug 2014 20:40:21 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so4301980wib.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Aug 2014 13:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc
	:content-type;
	bh=wlQsWJhVjHF7kZFRzhD/AJlF2QM2mJT77REh3SBCCEE=;
	b=ZgEHlPcAY0Y+hCJVh7/1It7t14yj25b4lpLFZ8Pv81CqHrQQB3SY+EtITJ5Ky157ai
	+o7WEKYOY+C7zxr7cd0pCrYGK4vCp/UAtXypkWGevkNxMEa5Uno07ev3YWWfEWluZptA
	0B7zInnVbhdji9Yvo9hQQDGVdeC8n1fwA4sCD26S3MZ0mVNIFSvWBvK/GUMMN00uu9BB
	RlpJalslIU8E6XFq/oPYp5MG3QCXWCErcgYcq76k45sp3FIK+Ofmv+JVPVWZtLgTmwhh
	Oadg98Q5/QXeo+UEKUHxnEcW0N8+IbfV7HEWtvhXXp2XYsale3qa2j8eT1LeAdjJGjhb
	UT7Q==
X-Gm-Message-State: ALoCoQnz0Jy9KttHQcX4/vlQxJMAozv5mC97znzZrfrUBQmMUIoKz/dxgJ/QPIko7FmCA3p6EQbb
MIME-Version: 1.0
X-Received: by 10.180.96.196 with SMTP id du4mr1572525wib.44.1408394422306;
	Mon, 18 Aug 2014 13:40:22 -0700 (PDT)
Received: by 10.216.120.72 with HTTP; Mon, 18 Aug 2014 13:40:22 -0700 (PDT)
Date: Mon, 18 Aug 2014 15:40:22 -0500
Message-ID: <CAF7YWny422XPrCf=A-5k4KiitLM6x6PjKpPArcjjvffMZvg6=w@mail.gmail.com>
From: Gary Robertson <gary.robertson@linaro.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Autoconf problems in filesystem image build using linux-dummy virtual/kernel
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Aug 2014 20:40:29 -0000
Content-Type: text/plain; charset=UTF-8

Hello, all.

We are experiencing a problem with our root filesystem builds.  For
logistical reasons we are building an OE root filesystem image with no
kernel included.  We build this 'generic rootfs' once for a given
architecture and then later select a separately-built kernel for that
architecture and merge it into the rootfs image using our own local tools.
This allows us to maintain several kernel trees separately from the rootfs
tree and still have a common set of supported features in our final
deployed filesystem images.

The 'generic rootfs' image is built using the 'linux-dummy' recipe as a
place-holder for the missing virtual/kernel... however we are encountering
problems in building the LTP package for inclusion in this 'generic rootfs'
image.  LTP relies heavily on autoconf to determine what features can be
used and/or tested in the runtime target environment, and when it attempts
to configure against the 'linux-dummy' virtual kernel it finds a number of
features 'missing' which are in fact supported in our externally-built
kernels.

I believe the cleanest solution might be to supply a set of kernel headers
reflecting the subset of supported features common to all of our available
external kernels, and then to allow autoconf to configure all userland
packages against those headers.  Ideally these headers could be fetched
from the appropriate git repository and  made available for autoconf to
configure against, but would not be included into the final deployed rootfs
image.

Unfortunately I am a relatively new and inexperienced OE / bitbake user and
am unsure whether this is even possible or how to go about setting it up -
so I am asking the experts here for some advice and / or pointers on the
issue.

If what I am seeking is impossible - how close could I come to that goal...
that is, can we build the image with just the headers from our custom
common kernel?  And if it is possible to allow autoconf to configure
against custom kernel headers without moving those headers into the final
deployed filesystem image, how would I go about that?

Any insight would be appreciated.

Gary Robertson

