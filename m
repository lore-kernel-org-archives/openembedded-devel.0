Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4271470178
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 12:22:58 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id x75so12866185itb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 04:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=qZdAKtvwUV+SWz09ryzVNEd9lJh+V6lcVwm3vTE8aJ0=;
	b=oGb1dVKnBDD725Dxpe6/HsO/tkA21OYGBKLhgHZY1YFEFkY2lKKXSTY28I/2KtVugu
	i4UDHcN9t/fY3AVuFxMyT5dZLOrwjdmfD4+fg/9akJ0i2ApnLzH16mVmtQgboQIvpu32
	oUuWDFOeZX/q4NTvVrBZ9bt9sugVqcJGFLfvJ1FljYbXLTdDNi2Af0bcxbxPKPdpmgxz
	Nyfta6ZBA5Brdb5hlCnkKtnxqeVaIeMLdZRRec+1Dz6RdWsOgXVVD2zM1loTBykTlPjQ
	jTUg+8cmhLjDHRXdnLijZQvvD8Q/k+yoxKWZrzXGG+TZXFnfYJdOyL+uB/uet82UJ9Wd
	HrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=qZdAKtvwUV+SWz09ryzVNEd9lJh+V6lcVwm3vTE8aJ0=;
	b=fCDjzTWpq+bZsbkqi3TpqFL4yVnB7EBg0inEevK+ObITOSqGNQ+UAkouB4VZBiLrOR
	DWNQbOC7Ix4YT7KKleuAXDmpf5mEKlnjbyX5KYmv5PtE87mDLNgcoBxsQgnIjvJwls7t
	ubtR4giFe05dmJbp9akQWfwOabffNP07rFmNsRrZHEKqfaAhE71eio23HoUMzITFgCBv
	4xVoxWFUnR5BBp58kHO6g8LWNXb6aaIbNVURUFBXa9EG5v/xAlX7F5TY/Tt55/lrRtVp
	plgmRiu0YHMezP6k1hlNJ2zzJoJ/BpYuR/ce9nhtmfxXRMtPvHNZg3MjlRCRUyq4HbKr
	cKJw==
X-Gm-Message-State: AMke39lWtOeRSMEhBgjD3uE4ocsFxe1+U3lpUTwT/wLGSZkjO6kMknm1uK8tS7aPZB1nynKW
X-Received: by 10.36.34.79 with SMTP id o76mr1701945ito.116.1487334178914;
	Fri, 17 Feb 2017 04:22:58 -0800 (PST)
Received: from pohly-mobl1 (p5DE8FD56.dip0.t-ipconnect.de. [93.232.253.86])
	by smtp.gmail.com with ESMTPSA id
	f127sm471135ite.26.2017.02.17.04.22.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Feb 2017 04:22:57 -0800 (PST)
Message-ID: <1487334175.13854.518.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Feb 2017 13:22:55 +0100
In-Reply-To: <CAJ86T=XTw9wjbXf1GGq=i6gxKuSLFhcvHGvKpD9mhFg2bnRubw@mail.gmail.com>
References: <b0a782f34afd1a1157936114a7288ef963521bd2.1487240872.git-series.patrick.ohly@intel.com>
	<CAJ86T=XTw9wjbXf1GGq=i6gxKuSLFhcvHGvKpD9mhFg2bnRubw@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH] multipath-tools: fix ARM build failure
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
X-List-Received-Date: Fri, 17 Feb 2017 12:23:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-02-16 at 02:42 -0800, Andre McCurdy wrote:
> On Thu, Feb 16, 2017 at 2:29 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> > Updating to 0.6.4 introduced a build failure on ARM when thumb was
> > enabled because of the embedded valgrind.h macro calls. The easiest
> > solution and thus the one used here is to disable thumb for this
> > particular recipe.
> >
> > The more elaborate solution would be to patch the macro calls out of
> > the code when compiling for ARM with thumb.
> >
> > Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> > ---
> >  meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb |  9 +++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
> > index 6706bec..a3b33b6 100644
> > --- a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
> > +++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
> > @@ -27,6 +27,13 @@ PV = "0.6.4+git${@'${SRCPV}'.split('+')[-1]}"
> >
> >  TARGET_CC_ARCH += "${LDFLAGS}"
> >
> > +# multipath-tools includes a copy of the valgrind.h header
> > +# file and uses the macros to suppress some false positives. However,
> > +# that only works on ARM when thumb is disabled. Otherwise one gets:
> > +#   Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#3'
> > +#   ../Makefile.inc:66: recipe for target 'debug.o' failed
> > +ARM_INSTRUCTION_SET = "arm"
> 
> Since the problem is presumably Thumb1 specific, you should only force
> the ARM instruction set for ARM cores which don't support Thumb2, ie
> use:
> 
> ARM_INSTRUCTION_SET_armv4 = "arm"
> ARM_INSTRUCTION_SET_armv5 = "arm"

I'm no ARM expert, so I'm not certain which ARM cores are affected, but
I'll follow your suggestion and send a V2 of the patch.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




