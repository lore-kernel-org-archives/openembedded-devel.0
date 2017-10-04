Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0007877E95
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Oct 2017 20:20:53 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Oct 2017 13:20:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,478,1500966000"; d="scan'208";a="135214682"
Received: from mhrasooi-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.135.159])
	by orsmga004.jf.intel.com with ESMTP; 04 Oct 2017 13:20:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Oct 2017 09:20:22 +1300
Message-Id: <cover.1507147924.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [meta-networking][PATCH 0/1] mdns: move from meta-intel-iot-middleware
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
X-List-Received-Date: Wed, 04 Oct 2017 20:20:54 -0000

This should be the last of the recipes from meta-intel-iot-middleware (I
hadn't intended to revive this one but a request came in on the mailing
list so it seems it may still be useful to some people).


The following changes since commit 5c9a4a08844c215ebd6f2146f50de753b8e7ecef:

  network-manager-applet: Disable gobject-introspection on musl (2017-10-04 14:54:41 +0000)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/mdns
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=paule/mdns

Paul Eggleton (1):
  mdns: move from meta-intel-iot-middleware

 .../recipes-protocols/mdns/files/build.patch       | 167 +++++++++++++++++++++
 .../recipes-protocols/mdns/files/mdns.service      |  15 ++
 .../recipes-protocols/mdns/mdns_765.50.9.bb        |  89 +++++++++++
 3 files changed, 271 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/mdns/files/build.patch
 create mode 100644 meta-networking/recipes-protocols/mdns/files/mdns.service
 create mode 100644 meta-networking/recipes-protocols/mdns/mdns_765.50.9.bb

-- 
2.9.5


