Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 02A6771E06
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 12:23:45 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20170215122344409_0684
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 12:23:44 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [216.191.234.70] (port=32467 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cdycU-0007Fl-8W for openembedded-devel@lists.openembedded.org;
	Wed, 15 Feb 2017 07:23:38 -0500
Date: Wed, 15 Feb 2017 07:23:36 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <358e792e-f48d-5880-1842-aecb4b54275d@embed.me.uk>
Message-ID: <alpine.LFD.2.20.1702141000250.29338@uk63952.mitel.com>
References: <alpine.LFD.2.20.1702131159380.3464@uk63952.mitel.com>
	<358e792e-f48d-5880-1842-aecb4b54275d@embed.me.uk>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: Re: building netdata: "No package 'zlib' found"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Feb 2017 12:23:46 -0000
Content-Type: text/plain; charset=US-ASCII


  i was going to start a new thread for this, then remembered this
post i was going to respond to:

On Tue, 14 Feb 2017, Jack Mitchell wrote:

> On 13/02/17 17:01, Robert P. J. Day wrote:
> >
> >   i'm building a totally stock core-image-minimal for qemuppc with
> > latest poky checkout, and when i try to add the existing "netdata"
> > recipe to the mix, i get:
> >
> > | configure: error: Package requirements (zlib) were not met:
> > |
> > | No package 'zlib' found
> > |
> > | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> > | installed software in a non-standard prefix.
> > |
> > | Alternatively, you may set the environment variables ZLIB_CFLAGS
> > | and ZLIB_LIBS to avoid the need to call pkg-config.
> > | See the pkg-config man page for more details.
> >
> >   apart from fixing this, how could this recipe ever have built
> > before? i realize the current recipe for netdata is almost a year
> > old, but should it still not build?
>
> Recipe specific sysroots. Zlib is so common that it was probably
> already available in the shared sysroot to be compiled against, now
> there is no access to the shared sysroot it can't be found and
> fails. So this was always a dependency bug but one that was probably
> never triggered.

  a couple questions. a couple days ago, all i did was add the line:

  DEPENDS = "zlib"

to the netdata_git.bb recipe file, and that trivially solved the
problem. i just updated my poky checkout, built again, and the build
failed since, as i notice from monday, a bunch of recipes (including
netdata) have been blacklisted because of (unsurprisingly) failure to
build:

  $ git show b7f480c

so what should one do here?

  for that recipe, i can submit a patch which adds the DEPENDS line
and removes the blacklisting. or is there a more wide-sweeping plan to
fix recipes that are now missing build-time dependencies based on
recipe-specific sysroots?

  also, if there's no objection, i can submit a patch that adds a
recipe for the far more recent netdata-1.5.0.

  thoughts?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



