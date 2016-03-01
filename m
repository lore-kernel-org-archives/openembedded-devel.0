Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E389E73CBD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2016 09:04:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 01 Mar 2016 01:04:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,522,1449561600"; d="scan'208";a="926918296"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by fmsmga002.fm.intel.com with ESMTP; 01 Mar 2016 01:04:12 -0800
Date: Tue, 1 Mar 2016 06:14:01 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160301041400.GA26580@mbabyjoh-mobl.fi.intel.com>
References: <DUB130-W394761EF53CEE03D5EB23ADABB0@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <DUB130-W394761EF53CEE03D5EB23ADABB0@phx.gbl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] gpsd: Fix build when static libs disabled
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
X-List-Received-Date: Tue, 01 Mar 2016 09:04:26 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Chris,

On Tue, Mar 01, 2016 at 08:12:30AM +0000, Chris Trobridge wrote:
> 
> 
> [oe] [PATCH] gpsd: Fix build when static libs disabled
> 
> Chris Trobridge  07:58 
> To: openembedded-core@lists.openembedded.org
> 
> http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/106230.html
> 
> > Fix this build error:
> > SCons Error: no such option: --disable-static
> > Signed-off-by: Maxin B. John <maxin.john at intel.com>
> > ---
> >  meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb | 1 +
> >  1 file changed, 1 insertion(+)
> > diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> > index ff268b3..a300595 100644
> > --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> > +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> > @@ -47,6 +47,7 @@ EXTRA_OESCONS = " \
> >      systemd='${SYSTEMD_OESCONS}' \
> >      ${EXTRA_OECONF} \
> >  "
> > +DISABLE_STATIC = ""
> >  & this cannot be used, because then chrpath is not found and only static lib is built
> >  & target=${HOST_SYS}
> >  
> > -- 
> > 2.4.0
> 
> While this fixes the build, is it just fixing the symptom?
> 
> I have a patch that copies the fix in:
> 
> http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/106251.html
> 
> That is: use EXTRA_CONF_PACKAGECONFIG instead of EXTRA_OECONF, as mentioned the above diff.
> 
> This prevents the option being pulled in in the first place, which ought to be a more general solution.
>

Once that EXTRA_CONF_PACKAGECONFIG related patch merged in oe-core, please drop my fix
and go ahead with this patch.

> Regards,
> Chris

Best Regards,
Maxin

