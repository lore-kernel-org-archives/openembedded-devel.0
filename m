Return-Path: <jbriance@cisco.com>
X-Greylist: delayed 575 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 12 Aug 2015 12:17:06 UTC
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
	by mail.openembedded.org (Postfix) with ESMTP id 00DA2760E8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 12:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1270; q=dns/txt; s=iport;
	t=1439381827; x=1440591427;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=0DpCe4VEbbQqmwt85iUGu9X367hXnVCO0CqPvpmcyIc=;
	b=Kmx9WlyOWGgFGXGHxmk4laU1h1J0ub9t7knjdY89UzrqVg6JkMEB4A+l
	UeIT6Ql3fbT4C5vBoXLcA+2Rz79m88AbFHLfjBRoAb5C/LOmC4d64pkBq
	sWQla8beGRDT20uF0RclpjBE3U1fUDEK92TqKVAAQcTWgfiHg3eNEdLMX E=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A0AkAwBHNstV/5ldJa1dgxtUaQa9XAmBcYV9AoFHOBQBAQEBAQEBfwuEJAEBBDo/EAIBKhQQMiUCBA4FCIgm0CcBAQEBAQEBAQEBAQEBAQEBAQEBAQEXkCsxB4MYgRQFlRMBhQOWQos3JoN9cQEBgUaBBAEBAQ
X-IronPort-AV: E=Sophos;i="5.15,661,1432598400"; d="scan'208";a="177893213"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
	by alln-iport-4.cisco.com with ESMTP; 12 Aug 2015 12:07:31 +0000
Received: from XCH-RCD-011.cisco.com (xch-rcd-011.cisco.com [173.37.102.21])
	by rcdn-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id t7CC7Vvp012375
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 12:07:31 GMT
Received: from xch-rcd-011.cisco.com (173.37.102.21) by XCH-RCD-011.cisco.com
	(173.37.102.21) with Microsoft SMTP Server (TLS) id 15.0.1104.5;
	Wed, 12 Aug 2015 07:07:30 -0500
Received: from xhc-aln-x13.cisco.com (173.36.12.87) by xch-rcd-011.cisco.com
	(173.37.102.21) with Microsoft SMTP Server (TLS) id 15.0.1104.5 via
	Frontend Transport; Wed, 12 Aug 2015 07:07:30 -0500
Received: from xmb-aln-x12.cisco.com ([169.254.7.85]) by xhc-aln-x13.cisco.com
	([173.36.12.87]) with mapi id 14.03.0248.002;
	Wed, 12 Aug 2015 07:07:30 -0500
From: "Julien Brianceau (jbriance)" <jbriance@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-browser][PATCH] chromium, cef: Set BB_NUMBER_THREADS
	jobs for ninja
Thread-Index: AQHQ1PZycvWF1ZzrJkadUspnKyUVJJ4IQ9iA
Date: Wed, 12 Aug 2015 12:07:30 +0000
Message-ID: <5940D1D9F240BA44AEF939055CF1358D05A4EEAE@xmb-aln-x12.cisco.com>
References: <1439380788-8674-1-git-send-email-jbriance@cisco.com>
In-Reply-To: <1439380788-8674-1-git-send-email-jbriance@cisco.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.60.62.116]
MIME-Version: 1.0
Subject: [meta-browser][PATCH] chromium, cef: Set BB_NUMBER_THREADS jobs for ninja
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
X-List-Received-Date: Wed, 12 Aug 2015 12:17:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Do not let ninja choose the number of jobs to run in parallel.

Signed-off-by: Julien Brianceau <jbriance@cisco.com>
---
 recipes-browser/chromium/cef3_280796.bb           | 2 +-
 recipes-browser/chromium/chromium_40.0.2214.91.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-browser/chromium/cef3_280796.bb b/recipes-browser/chro=
mium/cef3_280796.bb
index 9a9efe5..9505a64 100644
--- a/recipes-browser/chromium/cef3_280796.bb
+++ b/recipes-browser/chromium/cef3_280796.bb
@@ -47,5 +47,5 @@ do_qa_configure() {
 }
=20
 do_compile() {
-	ninja -C out/${CHROMIUM_BUILD_TYPE} cefsimple
+	ninja -C out/${CHROMIUM_BUILD_TYPE} -j${BB_NUMBER_THREADS} cefsimple
 }
diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-br=
owser/chromium/chromium_40.0.2214.91.bb
index 74986b5..e795e14 100644
--- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
+++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
@@ -177,7 +177,7 @@ do_configure_append() {
=20
 do_compile() {
         # build with ninja
-        ninja -C ${S}/out/${CHROMIUM_BUILD_TYPE} chrome chrome_sandbox
+        ninja -C ${S}/out/${CHROMIUM_BUILD_TYPE} -j${BB_NUMBER_THREADS} ch=
rome chrome_sandbox
 }
=20
=20
--=20
1.9.5


