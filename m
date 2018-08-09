Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2278A608B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2018 11:18:20 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Aug 2018 04:18:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,214,1531810800"; d="scan'208";a="61108462"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga007.fm.intel.com with ESMTP; 09 Aug 2018 04:18:17 -0700
Date: Thu, 9 Aug 2018 14:19:53 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
Message-ID: <20180809111952.GA13716@mbabyjoh-desk.ger.corp.intel.com>
References: <20170930022455.137406-1-fupan.li@windriver.com>
	<6464289341266dc9d8b146f788f07aac3af57c2a.camel@andred.net>
MIME-Version: 1.0
In-Reply-To: <6464289341266dc9d8b146f788f07aac3af57c2a.camel@andred.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH] openjdk-8-common: Fix the issue of building failed adlc on host with gcc < 6
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
X-List-Received-Date: Thu, 09 Aug 2018 11:18:21 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Andre',

On Thu, Aug 09, 2018 at 12:04:01PM +0100, André Draszik wrote:
> Hi Maxin,
> 
> You reverted this patch, do you remember what the problem was? It looks
> useful, and I believe a solution similar to this one is actually needed...

IIRC, this patch caused build error on one machine with gcc version 5.1.1.

> Cheers,
> Andre'

Best Regards,
Maxin

> On Fri, 2017-09-29 at 19:24 -0700, fupan.li@windriver.com wrote:
> > From: Fupan Li <fupan.li@windriver.com>
> > 
> > The patch recipes-core/openjdk/patches-openjdk-8/openjdk8-fix-adlc-
> > flags.patch
> > had tried to fix this issue, and it tried to filter out the
> > TARGET_FLAGS/TARGET_
> > CXXFLGAS, but for the flags such as "-fno-lifetime-dse" was added to
> > CFLAGS/CXXFLAGS,
> > directly, thus that patch failed to filter it out.
> > 
> > To fix this issue, it's better to add those GCC version specific flags to
> > BUILD_CFLAGS/
> > BUILD_CXXFLAGS and TARGET_CFLAGS/TARGET_CXXFLAGS separatedly, thus that
> > patch can work
> > as expected.
> > 
> > Signed-off-by: Fupan Li <fupan.li@windriver.com>
> > ---
> >  recipes-core/openjdk/openjdk-8-common.inc | 36 ++++++++++++++++++++----
> > -------
> >  1 file changed, 24 insertions(+), 12 deletions(-)
> > 
> > diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-
> > core/openjdk/openjdk-8-common.inc
> > index 83828e1..c609232 100644
> > --- a/recipes-core/openjdk/openjdk-8-common.inc
> > +++ b/recipes-core/openjdk/openjdk-8-common.inc
> > @@ -231,27 +231,39 @@ FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-
> > pointer-checks"
> >  # version is and only add the flags that are appropriate for that GCC
> >  # version.
> >  
> > -def version_specific_cflags(d):
> > +def version_specific_cflags(d, toolchain):
> >      extraflags = None
> >      version = None
> >  
> > -    if bb.data.inherits_class('native', d):
> > -        from subprocess import Popen, PIPE
> > +    from subprocess import Popen, PIPE
> > +    cmd = d.expand('%s -dumpversion' % toolchain ).split()
> > +    cc = Popen(cmd, stdout=PIPE, stderr=PIPE)
> > +    version = cc.communicate()[0].decode('utf-8')[0]
> >  
> > -        cmd = d.expand('${CC} -dumpversion').split()
> > -        cc = Popen(cmd, stdout=PIPE, stderr=PIPE)
> > -        version = cc.communicate()[0].decode('utf-8')[0]
> > +    if version.isdigit():
> > +        extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
> > +        return extraflags
> > +    return ''
> > +
> > +python __anonymous() {
> > +    if bb.data.inherits_class('native', d):
> > +        toolchain = d.getVar('CC', True)
> > +        extraflags = version_specific_cflags(d, toolchain)
> > +        d.appendVar("CFLAGS", ' ' + extraflags) 
> > +        d.appendVar("CXXFLAGS", ' ' + extraflags)
> >      else:
> >          # in the cross case, trust that GCCVERSION is correct. This won't
> >          # work if the native toolchain is Clang, but as of this writing
> > that
> >          # doesn't work anyway.
> >          version = d.getVar('GCCVERSION', expand=True)[0]
> > -
> > -    if version.isdigit():
> >          extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
> > -        return extraflags
> > -    return ''
> > +        d.appendVar("TARGET_CFLAGS", ' ' + extraflags)
> > +        d.appendVar("TARGET_CXXFLAGS", ' ' + extraflags)
> > +
> > +        toolchain = d.getVar('BUILD_CC', True)
> > +        extraflags = version_specific_cflags(d, toolchain)
> > +        d.appendVar("BUILD_CFLAGS", ' ' + extraflags)
> > +        d.appendVar("BUILD_CXXFLAGS", ' ' + extraflags)
> > +}
> >  
> > -CFLAGS_append = " ${@version_specific_cflags(d)}"
> > -CXXFLAGS_append = " ${@version_specific_cflags(d)}"
> >  CXX_append = " -std=gnu++98"
> > -- 
> > 2.11.0
> > 

