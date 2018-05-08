Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay101a.appriver.com [207.97.230.14])
	by mail.openembedded.org (Postfix) with ESMTP id 226F374DCB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 May 2018 09:36:39 +0000 (UTC)
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 05/08/2018 5:36:39 AM
X-Note: SecureTide Build: 1/19/2018 4:03:46 PM UTC (2.6.29.0)
X-Note: Filtered by 10.238.11.161
X-Note-AR-Scan: None - PIPE
Received: by relay.appriver.com (CommuniGate Pro PIPE 6.2.1)
	with PIPE id 376221738; Tue, 08 May 2018 05:36:39 -0400
Received: from [213.210.30.29] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.2.1)
	with ESMTPS id 376221716; Tue, 08 May 2018 05:36:34 -0400
Received: from chuckie.brightsign ([fd44:d8b8:cab5:cb01::19] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1fFz2x-0004dR-GJ; Tue, 08 May 2018 10:36:35 +0100
Received: from mac by chuckie with local (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1fFz2x-0001Mg-FO; Tue, 08 May 2018 10:36:35 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 May 2018 10:36:31 +0100
Message-Id: <20180508093631.5196-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ2G_4cMxoAQm2AWgRnkeP5VXRURH9c82qaBpA0bop59A@mail.gmail.com>
References: <CAJTo0LZ2G_4cMxoAQm2AWgRnkeP5VXRURH9c82qaBpA0bop59A@mail.gmail.com>
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 05/08/2018 5:36:34 AM
X-Note: SecureTide Build: 1/19/2018 4:03:46 PM UTC (2.6.29.0)
X-Note: Filtered by 10.238.11.161
X-Policy: brightsign.biz
X-Primary: brightsign.biz@brightsign.biz
X-Virus-Scan: V-
X-Note: ICH-CT/SI:0-0/SG:1 1/1/0001 12:00:00 AM
X-Note-SnifferID: 0
X-Note: TCH-CT/SI:0-50/SG:2 5/8/2018 5:35:43 AM
X-GBUdb-Analysis: 0, 213.210.30.29, Ugly c=0.486243 p=-1 Source Normal
X-Signature-Violations: 0-0-0-5093-c
X-Note-419: 15.6242 ms. Fail:0 Chk:1360 of 1360 total
X-Note: VSCH-CT/SI: 0-1360/SG:1 5/8/2018 5:35:43 AM
X-Note: Spam Tests Failed: 
X-Country-Path: ->->United Kingdom->United States
X-Note-Sending-IP: 213.210.30.29
X-Note-Reverse-DNS: elite.brightsigndigital.co.uk
X-Note-Return-Path: mcrowe@brightsign.biz
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G337 G338 G339 G340 G344 G345 G477 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: VALID
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>,
	Mike Crowe <mac@mcrowe.com>
Subject: [meta-java][PATCHv3] jdepend: Retrieve source from Git rather than tarball
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
X-List-Received-Date: Tue, 08 May 2018 09:36:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When Bitbake downloads jdepend-2.9.1.zip itself and I download
https://github.com/clarkware/jdepend/blob/master/dist/jdepend-2.9.1.zip ,
the calculated hashes don't match the ones included in the recipe.

The hashes were last changed in commit
dd5c43fca8289b8795a9214aee616775e1493109 on 1st March, but GitHub claims
that the file being downloaded was published on 20th January, so I can't
explain why they are wrong. Ross Burton has provided a plausible reason in
http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html
where he also advocates switching to using Git repositories rather than
GitHub-generated tarballs.

It seems that we can't really rely on these tarballs to remain unchanged,
so let's download the Git hash that corresponds to v2.9.1 instead. This
should always remain valid.

Cc: André Draszik <andre.draszik@jci.com>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@intel.com>
Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 recipes-core/jdepend/jdepend_2.9.1.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/recipes-core/jdepend/jdepend_2.9.1.bb b/recipes-core/jdepend/jdepend_2.9.1.bb
index 5f09a8b..dfbf493 100644
--- a/recipes-core/jdepend/jdepend_2.9.1.bb
+++ b/recipes-core/jdepend/jdepend_2.9.1.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f5777d32a7709d558c2877d4a6616230"
 
 HOMEPAGE = "https://github.com/clarkware/jdepend"
 
-SRC_URI = "https://github.com/clarkware/jdepend/archive/${PV}.zip;downloadfilename=${BP}.zip"
+SRC_URI = "git://github.com/clarkware/jdepend"
+SRCREV = "57980590313a5dbde236a3eb2c8958e9e53e6a10"
+S = "${WORKDIR}/git"
 
 inherit java-library
 
@@ -18,7 +20,4 @@ do_compile() {
   fastjar cf ${JARFILENAME} -C build .
 }
 
-SRC_URI[md5sum] = "9b91efe1d770e023893f89f4dde8434e"
-SRC_URI[sha256sum] = "536b5082d64e4f4dddd514ce30178f36c7a31b34d969275f278f72e522e7f7c9"
-
 BBCLASSEXTEND = "native"
-- 
2.11.0



