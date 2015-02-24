Return-Path: <henry.bruce@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E9C5C724E4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2015 06:37:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 23 Feb 2015 22:33:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,637,1418112000"; 
	d="scan'208,217";a="670631284"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
	by fmsmga001.fm.intel.com with ESMTP; 23 Feb 2015 22:37:22 -0800
Received: from orsmsx155.amr.corp.intel.com (10.22.240.21) by
	ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Mon, 23 Feb 2015 22:37:22 -0800
Received: from orsmsx104.amr.corp.intel.com ([169.254.3.113]) by
	ORSMSX155.amr.corp.intel.com ([169.254.7.16]) with mapi id
	14.03.0195.001; Mon, 23 Feb 2015 22:37:22 -0800
From: "Bruce, Henry" <henry.bruce@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: iecedtea7-native will not build. Possible fix attached
Thread-Index: AdBP+fLsafhPhiqMR7u7y2+QNY7Acw==
Date: Tue, 24 Feb 2015 06:37:21 +0000
Message-ID: <F81DC1078564A34BB4DA30CAE03814D1276975E1@ORSMSX104.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: iecedtea7-native will not build. Possible fix attached
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
X-List-Received-Date: Tue, 24 Feb 2015 06:37:23 -0000
X-Groupsio-MsgNum: 54467
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_F81DC1078564A34BB4DA30CAE03814D1276975E1ORSMSX104amrcor_"

--_004_F81DC1078564A34BB4DA30CAE03814D1276975E1ORSMSX104amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello openjdk community,

iecedtea7-native from git://git.yoctoproject.org/meta-java doesn't build du=
e to well documented Turkish currency expiration problem. This has been fix=
ed for icedtea6 so I borrowed the patch (not sure if this is appropriate) a=
nd put into a the attached bbappend that fixes the problem. I went with a b=
bappend as I wasn't sure of the process for patching a recipe. Resulting JV=
M seems to work for my application.

Out of interest, why has v6 been fixed and v7 left broken? Is openjdk7 deem=
ed unstable or otherwise not worth the effort to maintain? I'd like to keep=
 with the v7 features, but if this is not recommend, I'll back off to v6.

Regards,

Henry Bruce




--_004_F81DC1078564A34BB4DA30CAE03814D1276975E1ORSMSX104amrcor_
Content-Type: application/octet-stream;
	name="icedtea7-native_2.1.3.bbappend"
Content-Description: icedtea7-native_2.1.3.bbappend
Content-Disposition: attachment; filename="icedtea7-native_2.1.3.bbappend";
	size=453; creation-date="Tue, 24 Feb 2015 06:34:50 GMT";
	modification-date="Thu, 19 Feb 2015 18:59:35 GMT"
Content-Transfer-Encoding: base64

RklMRVNFWFRSQVBBVEhTX3ByZXBlbmQgOj0gIiR7VEhJU0RJUn0vZmlsZXM6IgoKIyBEb24ndCBh
dXRvbWF0aWNhbGx5IGFwcGx5IHBhdGNoIGFzIGl0IG11c3QgYmUgZG9uZSBhZnRlciBkb19jb25m
aWd1cmUKU1JDX1VSSSArPSAgImZpbGU6Ly9pY2VkdGVhLW9wZW5qZGstcmVtb3ZlLWN1cnJlbmN5
LWRhdGEtZ2VuZXJhdGlvbi1leHBpLnBhdGNoO2FwcGx5PW5vIgoKZG9fY29uZmlndXJlX2FwcGVu
ZCAoKSB7CiAgIGNkIG9wZW5qZGsKICAgcGF0Y2ggLXAxIDwgJHtXT1JLRElSfS9pY2VkdGVhLW9w
ZW5qZGstcmVtb3ZlLWN1cnJlbmN5LWRhdGEtZ2VuZXJhdGlvbi1leHBpLnBhdGNoCiAgIGNkIC4u
L29wZW5qZGstYm9vdAogICBwYXRjaCAtcDEgPCAke1dPUktESVJ9L2ljZWR0ZWEtb3Blbmpkay1y
ZW1vdmUtY3VycmVuY3ktZGF0YS1nZW5lcmF0aW9uLWV4cGkucGF0Y2gKICAgY2QgLi4KfQoK

--_004_F81DC1078564A34BB4DA30CAE03814D1276975E1ORSMSX104amrcor_--
