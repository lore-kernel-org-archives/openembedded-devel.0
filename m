Return-Path: <kuo-lang.tseng@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 25AA07545B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 15:38:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Aug 2018 08:38:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,295,1531810800"; d="scan'208";a="69476788"
Received: from ktseng-hp-compaq-elite-8300-sff.sc.intel.com (HELO
	[10.3.202.171]) ([10.3.202.171])
	by orsmga006.jf.intel.com with ESMTP; 27 Aug 2018 08:38:37 -0700
Message-ID: <1535358939.21109.8.camel@ktseng-HP-Compaq-Elite-8300-SFF>
From: Kuo-Lang Tseng <kuo-lang.tseng@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Aug 2018 01:35:39 -0700
In-Reply-To: <CAMKF1sqboZpbh3iXhPfvHfZZtNqiUu0UHhq4OhjDuo9wVLCbvA@mail.gmail.com>
References: <1535024421-10058-1-git-send-email-kuo-lang.tseng@intel.com>
	<CAMKF1soraLLWVhx+tk3fB8dv1gB7yarS8vqJMum8Vkg7C+XiHQ@mail.gmail.com>
	<CAMKF1sqboZpbh3iXhPfvHfZZtNqiUu0UHhq4OhjDuo9wVLCbvA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] turbostat: upgrade to 18.07.27
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
X-List-Received-Date: Mon, 27 Aug 2018 15:38:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Thanks for passing the build information. New to OpenEmbedded project
and is there a tree that I can clone to duplicate the build issue?

On Fri, 2018-08-24 at 08:57 -0700, Khem Raj wrote:
> another failure seen in License checksum mismatch
> 
> http://errors.yoctoproject.org/Errors/Details/187128/
> On Fri, Aug 24, 2018 at 1:12 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > it does not seem to build see
> > http://errors.yoctoproject.org/Errors/Details/187118/
> > On Thu, Aug 23, 2018 at 11:44 AM Kuo-Lang Tseng
> > <kuo-lang.tseng@intel.com> wrote:
> > >
> > > Update the license hash value also since SPDX header has been
> > > inserted to kernel COPYING file since v4.17.
> > >
> > > Signed-off-by: Kuo-Lang Tseng <kuo-lang.tseng@intel.com>
> > >
> > > v2: add meta-oe prefix to subject line
> > > ---
> > >  .../turbostat/{turbostat_3.4.bb => turbostat_18.07.27.bb}               | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >  rename meta-oe/recipes-kernel/turbostat/{turbostat_3.4.bb => turbostat_18.07.27.bb} (96%)
> > >
> > > diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/recipes-kernel/turbostat/turbostat_18.07.27.bb
> > > similarity index 96%
> > > rename from meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
> > > rename to meta-oe/recipes-kernel/turbostat/turbostat_18.07.27.bb
> > > index 3559417..5e64efa 100644
> > > --- a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
> > > +++ b/meta-oe/recipes-kernel/turbostat/turbostat_18.07.27.bb
> > > @@ -12,7 +12,7 @@ processor frequency and idle power saving state residency on supported \
> > >  processors."
> > >
> > >  LICENSE = "GPLv2"
> > > -LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> > > +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> > >
> > >  COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
> > >  COMPATIBLE_HOST_libc-musl = "null"
> > > --
> > > 1.9.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel



