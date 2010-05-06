Received: from mail-iw0-f171.google.com ([209.85.223.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lamiaposta71@gmail.com>) id 1O9uLy-0001AF-Sf
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 08:14:35 +0200
Received: by iwn1 with SMTP id 1so6705352iwn.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 May 2010 23:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=KS+SY+Zg8i+RrgBjvIsP7G2+/xGYnS1WdfB041mDyPg=;
	b=oDSw4QxsOwsP2PGPLodnTmGchw11pilBd18vURCqiY0seen+I+HWuR8YLiIahIx/nH
	hZR6g2ldQGysPXMG5/dwU1fxmPkb0jGoQgnEog+bvee2h5iXBI1fkU3F++ne9bo8Ag7l
	uqG6v0RdAWJBOTHmJumaYL/QHEHbcFQe0/GsQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=lbCJJluelTkGvQe4l0z8JqtbfJKHcCS8S5DO42sNjvOSHla92I4lO5NYrN2mT1pHFp
	1yh7lj0xJE5kwDA1gNsvUDa7KgaCpx0A+NlsgNmlg9MMlADzBznkdf1aAuqmTtDdqgGf
	QuBRDiGx6W3oKnkw+gVs+Ke//eCAW17zS1vKk=
MIME-Version: 1.0
Received: by 10.231.176.7 with SMTP id bc7mr1410768ibb.2.1273126242458; Wed, 
	05 May 2010 23:10:42 -0700 (PDT)
Received: by 10.231.161.194 with HTTP; Wed, 5 May 2010 23:10:42 -0700 (PDT)
In-Reply-To: <20100427025702.GC10320@denix.org>
References: <q2vade1bdc1004260340j4881a020t22a79b4e1279ade3@mail.gmail.com>
	<20100426174411.GA22763@denix.org>
	<x2rade1bdc1004261848k1f9cfc01yc64057689a22fbb1@mail.gmail.com>
	<20100427025702.GC10320@denix.org>
Date: Thu, 6 May 2010 08:10:42 +0200
Message-ID: <t2gade1bdc1005052310je365713at72a3997b449e46a1@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: arago-devel@gforge.ti.com
X-SA-Exim-Connect-IP: 209.85.223.171
X-SA-Exim-Mail-From: lamiaposta71@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [arago-devel] dm365 and OE
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
X-List-Received-Date: Thu, 06 May 2010 06:14:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/4/27 Denys Dmytriyenko <denis@denix.org>

>
> arago-next was merged back to the master branch recently, but it shouldn't
> matter, as DVSDK was buildable before the merge. If you are referring to
> the
> fact that some components are not fetchable and need to be downloaded
> manually, it's still the case for a few of them, as explained in the
> README.
> AFAIK, codecs for some platforms were not public at the time, I believe
> dm365
> being one of them. I'll ping some people internally and see if/when this
> will
> be fixed.
>

The ping is going on?

I have unzipped the dvsdk and tried to associate it to arago/OE recipes, but
what is the corrispondence?

Doing an 'ls -1' in my dvsdk dir I obtain:
bin
bios_5_41_00_06
biosutils_1_02_02
codec_engine_2_25_01_06
dm365_codecs_01_00_06
dm365mm_01_00_03
dmai_2_10_00_06
docs
dsplink_linux_1_64
DVSDK_3_10_00_12_release_notes.html
dvsdk_demos_3_10_00_10
dvtb_4_20_02
edma3_lld_01_11_00_03
examples
framework_components_2_25_01_05
linux_dvsdk_3_10_beta_manifest.pdf
linuxutils_2_25_01_06
Makefile
mapdmaq
mapdmaq-hd
Rules.make
uninstall
xdais_6_25_01_08
xdctools_3_16_01_27

I guess that each directory has to become a tgz in this dir and from
localhost I need to reach it (using a link from /var/www to this dir):

But:

arago/recipes/ti/ti-codecs-dm365_3.10.00.02.bb
uses

PV = "03_10_00_02"
BASE_SRC_URI = "http://install.source.dir.local"
SRC_URI = "${BASE_SRC_URI}/dm365_codecs_${PV}.tar.gz;name=dm365codecs \
           file://mapdmaq"

but in my dvsdk I have
dm365_codecs_01_00_06
and so ${PV} seems wrong.

 ${PV} is similar, but not equal, to dvsdk version, 3_10_00_02 versus
3_10_00_12.

----------------
ti-dmai points to svn, instead in dvsdk I have dmai_2_10_00_06 .
-----------------

I could rebuild from dvsdk 3_10_00_12 sources using arago or not, but,
first, I'd like some check if it is the good starting point.

Thanks,
Raffaele

