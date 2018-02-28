Return-Path: <jsbronder@cold-front.org>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id DA6EB78754
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 15:30:44 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 2391921BAD;
	Wed, 28 Feb 2018 10:30:45 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute7.internal (MEProxy); Wed, 28 Feb 2018 10:30:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=vAgrExxjd+Foqkpuq3ss2+hAa1TCC7C5O1BzKpPNwCk=; b=QMTan
	SGODXfETx04Qlt6g0EaVfeUtNrgj906xa3PYDNFui8w9vCllZ6rzRNZhSA7j2+oX
	bYEDjzRsRMDbRrzx/An2oozKK4cugT2sULsVcNhRXkjft7mL/mLf64LsjWx0/xLl
	1niN7XUGh7IPtd+Gyc1X/RU3p7EW82nxEJw3ts=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=vAgrExxjd+Foqkpuq3ss2+hAa1TCC
	7C5O1BzKpPNwCk=; b=UHS95zDzU45Zj8gQDI9sinrJV9siRkExbLNvWFgz1yenH
	Wxlyn0q/66uXaWwyRFxge2pKf1zjyN+0mYUyi2zcyCltAhBeeoZkaLGGueIjOAWx
	jwr1XOcBpBBcEI3hkajSO08Xi7UfXRtKJtC3EgzJkIGDE6jLCh1Qyd64LAvdAbfs
	yAtUy6TPE34j9A+aBoo5990gf/7RnyOsTvUY38ypUJ8rOq8cgEIOFNtIZDmwYH9W
	RRoBvQlMZq07k8F6xmE05MKkdldjXSCKeK4lN8F0aFun8+kLCwz9x1qeavb0ztHd
	ZxPJcz9nRV1bObBAih1J5Q254WzjvfBivsQVF2KEw==
X-ME-Sender: <xms:JcuWWmWm73kgIjAk2OzYDRqXa6PVAKzNx7L_fzH03_2whd4S0rczaw>
Received: from localhost (cold-front.org [173.230.129.52])
	by mail.messagingengine.com (Postfix) with ESMTPA id 622EC7E5F1;
	Wed, 28 Feb 2018 10:30:45 -0500 (EST)
Date: Wed, 28 Feb 2018 10:30:45 -0500
From: Justin Bronder <jsbronder@cold-front.org>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20180228153045.GG23655@lasswell>
Mail-Followup-To: Justin Bronder <jsbronder@cold-front.org>,
	akuster808 <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20180226201605.29261-1-jsbronder@cold-front.org>
	<20180226201605.29261-2-jsbronder@cold-front.org>
	<83e67416-d1a0-f53a-2067-e82fa2b319ce@gmail.com>
MIME-Version: 1.0
In-Reply-To: <83e67416-d1a0-f53a-2067-e82fa2b319ce@gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: zeromq: 4.2.3 update
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
X-List-Received-Date: Wed, 28 Feb 2018 15:30:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 27/02/18 21:52 -0800, akuster808 wrote:
> 
> 
> On 02/26/2018 12:16 PM, Justin Bronder wrote:
> > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> can you provide high-lights of what is in the update?

Just getting to 4.2 brings in quite a bit [1] with 4.2.3 providing a lot of bug
fixes.  The claim from upstream, validated by my own limited use, is that 4.2 is
backwards compatible all the way to 2.2.0 [2].

1. https://github.com/zeromq/libzmq/releases/tag/v4.2.0
2. http://zeromq.org/intro:get-the-software

> 
> - armin
> > ---
> >  .../zeromq/{zeromq_4.1.6.bb => zeromq_4.2.3.bb}                     | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >  rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.1.6.bb => zeromq_4.2.3.bb} (78%)
> >
> > diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.6.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb
> > similarity index 78%
> > rename from meta-oe/recipes-connectivity/zeromq/zeromq_4.1.6.bb
> > rename to meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb
> > index e126f3239..71d7e7cbf 100644
> > --- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.6.bb
> > +++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb
> > @@ -6,11 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=d5311495d952062e0e4fbba39cbf3de1"
> >  PACKAGECONFIG ??= "libsodium"
> >  PACKAGECONFIG[libsodium] = "--with-libsodium, --without-libsodium, libsodium"
> >  
> > -SRC_URI = "http://github.com/zeromq/zeromq4-1/releases/download/v${PV}/zeromq-${PV}.tar.gz \
> > +SRC_URI = "http://github.com/zeromq/libzmq/releases/download/v${PV}/zeromq-${PV}.tar.gz \
> >      file://run-ptest \
> >  "
> > -SRC_URI[md5sum] = "c89db4dbc0b90c34c9f4983cbff6d321"
> > -SRC_URI[sha256sum] = "02ebf60a43011e770799336365bcbce2eb85569e9b5f52aa0d8cc04672438a0a"
> > +SRC_URI[md5sum] = "c4e18bd0584ccd34213f152c11f54d6c"
> > +SRC_URI[sha256sum] = "8f1e2b2aade4dbfde98d82366d61baef2f62e812530160d2e6d0a5bb24e40bc0"
> >  
> >  S = "${WORKDIR}/zeromq-${PV}"
> >  
> 

-- 
Justin Bronder

