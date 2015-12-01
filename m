Return-Path: <reinette.chatre@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CE34160761
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 17:57:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 01 Dec 2015 09:57:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,369,1444719600"; d="scan'208";a="862354295"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
	by orsmga002.jf.intel.com with ESMTP; 01 Dec 2015 09:57:36 -0800
Received: from orsmsx111.amr.corp.intel.com ([169.254.12.27]) by
	ORSMSX102.amr.corp.intel.com ([10.22.225.129]) with mapi id
	14.03.0248.002; Tue, 1 Dec 2015 09:57:34 -0800
From: "Chatre, Reinette" <reinette.chatre@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH 2/6] talloc: rename to libtalloc
	and	cleanup dependency mess
Thread-Index: AQHRIwLT4ZSJIQ4IsEmlhI1jqEQ0Xp62fLWw
Date: Tue, 1 Dec 2015 17:57:33 +0000
Message-ID: <0D818C7A2259ED42912C1E04120FDE2671273BD2@ORSMSX111.amr.corp.intel.com>
References: <D2648347-D3B8-420B-8527-0FEBE36BFD0C@gmail.com>
In-Reply-To: <D2648347-D3B8-420B-8527-0FEBE36BFD0C@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH 2/6] talloc: rename to libtalloc and	cleanup dependency mess
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
X-List-Received-Date: Tue, 01 Dec 2015 17:57:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

On 2015-11-19, Jens Rehsack wrote:
>=20
> To avoid errors when building dev-images (talloc-dev is missing), and to =
avoid
> insane empty packages for that, rename talloc -> libtalloc as libtevent s=
hows.
>=20
> With that, remove dependencies to attr/xattr - unless explicitely
> enabled via PACKAGECONFIG.
>=20
> Signed-off-by: Jens Rehsack <sno@netbsd.org>

I am trying to build dev images using jethro and this patch fixes the follo=
wing failure I encounter during rootfs creation:

* satisfy_dependencies_for: Cannot satisfy the following dependencies for l=
ibldb-dev:

 *      talloc (=3D 2.1.1-r0) *=20

 * opkg_install_cmd: Cannot install package libldb-dev.

Could you please apply this patch to jethro branch also?

Thank you very much

Reinette

