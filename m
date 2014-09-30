Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B63F56B8F6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 02:07:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8U277Oo005607
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Sep 2014 19:07:07 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.18]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0174.001;
	Mon, 29 Sep 2014 19:07:07 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH] openldap: update version to 2.4.39
Thread-Index: AQHP3EXRcugjvvwsSkmUAdPFz8Xc55wY7MwQ
Date: Tue, 30 Sep 2014 02:07:06 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABD50F355@ALA-MBB.corp.ad.wrs.com>
References: <1411985350-20322-1-git-send-email-jackie.huang@windriver.com>
	<20140930003037.GW25706@jama>
In-Reply-To: <20140930003037.GW25706@jama>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.134]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] openldap: update version to 2.4.39
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
X-List-Received-Date: Tue, 30 Sep 2014 02:07:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Tuesday, September 30, 2014 8:31 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] openldap: update version to 2.4.39
>=20
> On Mon, Sep 29, 2014 at 06:09:10AM -0400, jackie.huang@windriver.com wrot=
e:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > Changed:
> >  * Move slapd from ${libexecdir} to ${sbin}:
> >    Installing slapd under ${sbin} is more FHS and LSB compliance
> >  * Manage init script by inheriting update-rc.d, than postinst
> >  * Add status for initscript
> >  * Rename the patch named with commit id to
> >    gnutls-Avoid-use-of-deprecated-function.patch
> >  * Add a patch for CVE-2013-4449
> >  * Add a patch to use /dev/urandom for entropy
> >  * Allow tls obtains random bits from /dev/urandom:
> >    The URANDOM_DEVICE is undefined for cross-compiling, define it as
> >    /dev/urandom to allow tls obtains random bits from /dev/urandom.
> >  * Add PACKAGECONFIG for mdb, ndb, relay and sock
> >  * Remove unsupported config for ldbm
> >  * Add license file
>=20
> Can you please resolve:
> WARNING: QA Issue: openldap: Files/directories were installed but not shi=
pped
>   /run [installed-vs-shipped]

Could you show me how to reproduce this? I don't see this warning (I set in=
stalled-vs-shipped
in ERROR_QA in fact, so it should be an error), and I checked that there is=
 no /run directory
generated for openldap.

Thanks,
Jackie

