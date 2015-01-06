Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7465F7289F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2015 16:33:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 06 Jan 2015 08:30:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,708,1413270000"; d="scan'208";a="657597105"
Received: from dmoore26-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.3.68])
	by fmsmga002.fm.intel.com with ESMTP; 06 Jan 2015 08:33:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 06 Jan 2015 16:33:09 +0000
Message-ID: <2587275.C6Dzbu6Uko@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.7-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <20150106162610.GA12498@jama>
References: <1420559960-8518-1-git-send-email-akuster808@gmail.com>
	<1420559960-8518-2-git-send-email-akuster808@gmail.com>
	<20150106162610.GA12498@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/2] proftpd: fix rdepends issue
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
X-List-Received-Date: Tue, 06 Jan 2015 16:33:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 06 January 2015 17:26:10 Martin Jansa wrote:
> On Tue, Jan 06, 2015 at 07:59:19AM -0800, Armin Kuster wrote:
> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > ---
> > 
> >  meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
> > b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb index
> > cba39e8..7d285a0 100644
> > --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
> > +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
> > @@ -99,4 +99,4 @@ USERADD_PARAM_${PN} = "--system -g ${FTPGROUP}
> > --home-dir /var/lib/${FTPUSER} --> 
> >  FILES_${PN} += "/home/${FTPUSER}"
> > 
> > -RDEPENDS_${PN} += "perl"
> > +RDEPENDS_${PN} += "perl initscripts-functions"
> 
> It's not that simple.
> 
> The initscripts-functions is added to RDEPENDS conditionally based on
> "sysvinit" in DISTRO_FEATURES and INHIBIT_UPDATERCD_BBCLASS.
> 
> Adding it explicitly here will pull it to image even for people who
> care only about systemd services (and don't want any iniscripts to
> pollute their startup sequence).
> 
> See meta/classes/update-rc.d.bbclass
> 
> I know we already have one recipe like this:
> meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb:RDEPENDS_${PN} +=
> "initscripts-functions"
> 
> but honestly silencing this warning like this does more harm then
> the warning. I think it should be fixed in bbclass, because all
> recipes which inherit it, suffer from this. Maybe by adding another
> VIRTUAL_RUNTIME which can be set to empty when sysv isn't enabled.

What about just adding initscripts to DEPENDS in update-rc.d.bbclass ? At 
least then the package would get built.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

