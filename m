Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id C944E60589
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 17:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 735CD20992
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 17:23:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id jYM5fA5w2Apd
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 17:23:30 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5AC862001A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 17:23:30 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id 9F979162175; Tue, 18 Oct 2016 13:23:29 -0400 (EDT)
Date: Tue, 18 Oct 2016 13:23:29 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161018172329.GJ2494@denix.org>
References: <20160811034947.GW8521@denix.org>
MIME-Version: 1.0
In-Reply-To: <20160811034947.GW8521@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-qt5] Latest Qt5 5.6.1+ update breaks qtwayland?
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
X-List-Received-Date: Tue, 18 Oct 2016 17:23:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 10, 2016 at 11:49:47PM -0400, Denys Dmytriyenko wrote:
> Has anyone seen this:
> 
> git/src/client/qwaylandintegration_p.h:91:29: error: 'QPlatformAccessibility* QtWaylandClient::QWaylandIntegration::accessibility() const' marked 'override', but does not override
> |      QPlatformAccessibility *accessibility() const Q_DECL_OVERRIDE;
> 

Ping on this one. Anyone else is seeing this? Is it C++11 specific? I'm using 
gcc-5.3 from Linaro...

-- 
Denys

