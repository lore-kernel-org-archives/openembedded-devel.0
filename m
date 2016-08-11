Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id 833E975E80
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 03:50:03 +0000 (UTC)
Received: from vz-proxy-m002.mx.aol.com ([64.236.83.3])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OBQ00GSJ7Z0VR50@vms173021.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	10 Aug 2016 22:49:48 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=yQ9kT6OsLgv7WE5tBE7I5g==:117
	a=kj9zAlcOel0A:10 a=7z1cN_iqozsA:10	a=b9OBY3GBdUDBhyYB91QA:9
	a=CjuIK1q_8ugA:10 a=QYFN1HzuppkA:10
Received: by 100.15.86.14 with SMTP id 7af8ce6c; Thu, 11 Aug 2016 03:49:48 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D7B7C1620F0; Wed,
	10 Aug 2016 23:49:47 -0400 (EDT)
Date: Wed, 10 Aug 2016 23:49:47 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20160811034947.GW8521@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: [meta-qt5] Latest Qt5 5.6.1+ update breaks qtwayland?
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
X-List-Received-Date: Thu, 11 Aug 2016 03:50:03 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Has anyone seen this:

git/src/client/qwaylandintegration_p.h:91:29: error: 'QPlatformAccessibility* QtWaylandClient::QWaylandIntegration::accessibility() const' marked 'override', but does not override
|      QPlatformAccessibility *accessibility() const Q_DECL_OVERRIDE;

-- 
Denys

