Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id C07C275669
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 10:36:09 +0000 (UTC)
Received: by wgv5 with SMTP id 5so32477567wgv.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 03:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:content-transfer-encoding:user-agent;
	bh=M7o9TAOHIon97hEwGi9FHgS3dNMUC7/6SSPvZU1OkV0=;
	b=g7XaGCTm7QyvjadZl5ZsbDNrXiokuWxbKjLIFT9CxgQb18dSXl0rsULmSrLnh1LvWC
	Sdn8S2LieV57tOwWKkPTmbbVNZVPQ8yu6NSKDrWhOgEfRehgN69sRrfIGcWJlif7KXVt
	tTwAqgHtkwWq8FOVYQBFPNP24Jh0/AjHle71PnyJQIvdNt30wiyEBDJztPf/mKOmPaR+
	K0LLLWB9aDwezWh6HokvJBXFSBYpXPr3V35pzw8yy5sTx6OBLV0Cw1wB9xoDZWECF8Q3
	HONaRgV4JYyXt/1/ciFvC7Shab22saydFJsiyurwSjIF51P2gN3NxDcn292vKPRcJgFu
	+G2A==
X-Received: by 10.180.90.209 with SMTP id by17mr59582136wib.2.1432809370012;
	Thu, 28 May 2015 03:36:10 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id g14sm2665946wjs.47.2015.05.28.03.36.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 May 2015 03:36:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 28 May 2015 12:36:31 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150528103631.GF2383@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-qt5] Dropping tarball recipes from meta-qt5
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
X-List-Received-Date: Thu, 28 May 2015 10:36:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I'm still working on finishing 5.5-beta1 recipes for qt5, I'm getting
tired of maintaining 2 sets of patches and 2 versions of recipes in the
same layer branch.

1) Would people mind dropping 5.4 support in master branch (who wants to
use 5.4 can continue to use "fido" branch of meta-qt5, there are patches
for 5.4.2 git recipes as well).

2) Would people mind having only git recipes? It will be easier to
update them. Only disadvantages I can think of are the need to clone
=66rom git and not being aligned with exact release for long time (git
recipes usually track newer revisions in e.g. 5.4 branch than 5.4.0 or
5.4.1 tarbal recipes.

If we all use the same version from the same recipes then we can test it
better and it will be much easier to maintain.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

