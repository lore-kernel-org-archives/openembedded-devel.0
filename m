Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 297C360EB8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2014 15:34:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Jan 2014 07:34:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,638,1384329600"; d="scan'208";a="463209991"
Received: from unknown (HELO helios.localnet) ([10.252.122.146])
	by fmsmga002.fm.intel.com with ESMTP; 10 Jan 2014 07:33:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	Hongxu Jia <hongxu.jia@windriver.com>
Date: Fri, 10 Jan 2014 15:33:48 +0000
Message-ID: <3003595.h8EvBOAzOB@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-35-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <20140110152242.GS3709@jama>
References: <20130913135936.GD11500@jama> <525E2D36.6050705@windriver.com>
	<20140110152242.GS3709@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: meta-perl, meta-filesystems maintenance
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
X-List-Received-Date: Fri, 10 Jan 2014 15:34:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 10 January 2014 16:22:42 Martin Jansa wrote:
> On Wed, Oct 16, 2013 at 02:07:50PM +0800, Hongxu Jia wrote:
> > On 10/15/2013 07:29 PM, Martin Jansa wrote:
> > > On Tue, Oct 15, 2013 at 09:24:11AM +0800, Hongxu Jia wrote:
> > >> On 10/14/2013 08:22 PM, Martin Jansa wrote:
> > >>> On Thu, Oct 10, 2013 at 10:53:53AM +0800, Hongxu Jia wrote:
> > >>>> Hi Martin,
> > >>>> 
> > >>>> Sorry to be so lazy to reply, I just come back from holiday.
> > >>>> 
> > >>>> For the patches about the meta-perl and meta-filesystems layers:
> > >>>> 
> > >>>> If not OK, I will figure it out;
> > >>>> If it looks OK without my ACK, you don't always wait for it.
> > >>>> 
> > >>>> I don't have write access and am asking Khem to add it for me.
> > >>>> 
> > >>>> Sorry again for the belated reply.
> > >>> 
> > >>> Can you please send me patchwork IDs of commits ready for merge in
> > >>> http://patches.openembedded.org/bundle/jama/meta-filesystems/?archive=
> > >>> both
> > >>> http://patches.openembedded.org/bundle/jama/meta-perl/?archive=both
> > >>> ? perl patches are quite a mess, so I would like to get some sort of
> > >>> consolidated pull request or patchwork IDs.
> > >> 
> > >> The url is valid?
> > >> 
> > >>    502 Bad Gateway
> > > 
> > > It's valid but new patchwork is broken..
> > > http://lists.openembedded.org/pipermail/openembedded-devel/2013-Septembe
> > > r/092259.html
> > > 
> > > You can search for them from main page
> > > 
> > > meta-filesystems:
> > > 	[meta-filesystems,v1] yaffs2: Adds git version recipe (initial
> > > 	recipe)	2013-08-21	Pengyu Ma		New> 
> > It's fine to me
> > 
> > > 	[meta-filesystems,v1] yaffs2: Adds git version recipe (initial
> > > 	recipe)	2013-08-21	Pengyu Ma		New> 
> > Duplicated with above.
> > 
> > > 	[meta-oe] ntfs-3g-ntfsprogs does not rdepend on util-linux-mount
> > > 	2013-09-12	mike.looijmans@topic.nl		New> 
> > It's fine to me
> > 
> > > meta-perl:
> > > 	Added recipes for Test::More and its dependency Test::Harness
> > > 	Signed-off-by: Emil Petersen <erp@movis.dk>	2013-08-19	Emil
> > > 	Petersen		New> 
> > It's fine to me
> > 
> > > 	Added recipes for Test::More and its dependency Test::Harness
> > > 	Signed-off-by: Emil Petersen <erp@movis.dk>	2013-08-19	Emil
> > > 	Petersen		New> 
> > It's fine to me
> > 
> > > 	perl-module-test-more: deleted, perl-module-test-simple: add
> > > 	Test::Simple contains Test::More and a number of other packages. As
> > > 	such, Test::More has been removed and Test::Simple added with
> > > 	RPROVIDES and PROVIDES set.	2013-08-19	Emil Petersen		New> 
> > It's fine to me
> > 
> > > 	perl-module-common-sense: added, perl-module-json-xs:
> > > 	added	2013-08-19	Emil Petersen		New> 
> > It missed DEPENS in perl-module-json-xs.
> > 
> > > 	perl-module-test-simple: renamed	2013-08-19	Emil Petersen		New
> > 
> > It's fine to me
> > 
> > > 	perl-module-scalar-list-utils: rename, perl-module-test-harness:
> > > 	rename	2013-08-19	Emil Petersen		New> 
> > It's fine to me
> > 
> > > 	libtest-harness-perl: added	2013-09-03	Emil Petersen		New
> > 
> > It's fine to me
> > 
> > > 	libcarp-perl: added	2013-09-03	Emil Petersen		New
> > 
> > It's fine to me
> > 
> > > 	libtest-perl_1.26: added	2013-09-03	Emil Petersen		New
> > 
> > s/libfile-spec-perl/perl-module-libfile-spec/
> > 
> > > 	[meta-perl] libtest-harness-perl_3.28: added	2013-09-03	Emil
> > > 	Petersen		New
> > 
> > It's fine to me
> > 
> > > 	[meta-perl] libtest-simple-perl_0.98.bb: added	2013-09-03	Emil
> > > 	Petersen		New> 
> > It's fine to me
> > 
> > > 	[meta-perl] libwww-perl_5.834: added	2013-09-03	Emil Petersen		New
> > 
> > No recipe provides 'libhttp-*', 'liblwp-mediatypes-perl',
> > 'libnet-http-perl', 'liburi-perl', 'liburi-escape-perl',
> > 'libwww-robotrules-perl'
> > 
> > 
> > s/libio-select-perl/perl-module-io-select/
> > s/libio-socket-perl/perl-module-io-socket/
> > s/libmime-base64-perl/perl-module-mime-base64/
> > s/libnet-ftp-perl/perl-module-net-ftp/
> > 
> > > 	[meta-perl] libdigest-md5-perl_2.53: added	2013-09-03	Emil
> > > 	Petersen		New
> > 
> > s/libdigest-base-perl/perl-module-digest-base/
> > 
> > > 	[meta-perl] libencode-perl_2.52: added	2013-09-03	Emil Petersen		
New
> > 
> > It's fine to me
> > 
> > > 	[meta-perl] libencode-locale-perl_1.03: added	2013-09-03	Emil
> > > 	Petersen		New
> > 
> > It's fine to me
> > 
> > > 	[meta-perl] libfile-listing-perl_6.04: added	2013-09-03	Emil
> > > 	Petersen		New
> > 
> > No recipe provides libhttp-date-perl.
> > 
> > > 	[meta-perl] libhtml-parser-perl_3.71.bb: added	2013-09-03	Emil
> > > 	Petersen		New> 
> > Which recipe provoides libhtml-tagset-perl?
> > 
> > s/libxsloader-perl/perl-module-xsloader/
> > 
> > > 	[meta-perl] libdevice-modem-perl_1.56: added	2013-09-05	Emil
> > > 	Petersen		New
> > 
> > It's fine to me
> > 
> > > 	[meta-perl] libdevice-serialport-perl_1.04: added	2013-09-05	Emil
> > > 	Petersen		New> 
> > It's fine to me
> > 
> > > 	[meta-perl] libdevice-gsm-pelr_1.60: added	2013-09-05	Emil
> > > 	Petersen		New
> > 
> > It's fine to me
> > 
> > > 	[meta-perl] libdevice-gsm-perl: modified	2013-09-05	Emil Petersen		
New
> > 
> > It's fine to me
> > 
> > >> Thanks,
> > >> Hongxu
> > >> 
> > >>> Thanks
> > >>> 
> > >>>> On 09/26/2013 06:57 PM, Paul Eggleton wrote:
> > >>>>> On Thursday 19 September 2013 14:55:15 Martin Jansa wrote:
> > >>>>>> On Fri, Sep 13, 2013 at 03:59:36PM +0200, Martin Jansa wrote:
> > >>>>>>> Hi,
> > >>>>>>> 
> > >>>>>>> there were some patches for meta-perl, meta-filesystems
> > >>>>>>> do you want me to merge patches which looks OK without your ACK or
> > >>>>>>> should I always wait for it (you're listed in meta-perl as
> > >>>>>>> Maintainer
> > >>>>>>> and in meta-filesystems for couple of recipes + you created it)?
> > >>>>>>> 
> > >>>>>>> If you don't have write access I'm OK with pushing them for you
> > >>>>>>> once
> > >>>>>>> they are acked on ML - or even better if you send me list of
> > >>>>>>> patchwork
> > >>>>>>> IDs to merge or some consolidated pull request.
> > >>>>>>> 
> > >>>>>>> You can see what's in queue:
> > >>>>>>> http://patches.openembedded.org/bundle/jama/meta-filesystems/?arch
> > >>>>>>> ive=both
> > >>>>>>> http://patches.openembedded.org/bundle/jama/meta-perl/?archive=bot
> > >>>>>>> h
> > >>>>>>> 
> > >>>>>>> If you don't have maintainer permission for patchwork, please ask
> > >>>>>>> Khem
> > >>>>>>> to add it for you.
> > >>>>>> 
> > >>>>>> ping
> > >>>>> 
> > >>>>> Hongxu, if you haven't already replied to Martin could you please do
> > >>>>> so?
> > >>>>> 
> > >>>>> Thanks,
> > >>>>> Paul
> 
> Those patches still aren't merged and now they are marked as Rejected on
> patchwork, can you please resolve them?

I marked them as rejected because they *aren't* ready for merging nor were 
most of them submitted properly, and I already discussed that with Emil (the 
submitter) on IRC around the time they were submitted. The most recent 
versions are amongst a set that can be found here:

https://github.com/EmilRP/public_bb_recipes/

We're still waiting for Emil to (a) merge my pull request on that repo and (b) 
re-send what currently works from there in an appropriate form. Another 
alternative would be for someone else to do the merge of the pull request on 
their own branch, test build them and then re-send what works if Emil doesn't 
have time to do that (and he hasn't so far).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

