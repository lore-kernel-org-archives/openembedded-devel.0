Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.6989.1616724465925534293
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 19:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YUBeiN+K;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1616724464; i=@fujitsu.com;
	bh=U0YvGILv8438zy/wZLbHf/Ptp3TpxqvHfPa2uYiKZtk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=YUBeiN+KLn2Hh8PLb5Bh5MAcK6YFcmz6Vp8cTi5HLHzGFT5PmQFc/D9ROqVTMtml7
	 n++b33tc/AN/CJH9unuJc57+4A3QlIbyANRI5Nr2FU/NmbVBFtHbx2Hg1kp/Cd+GXe
	 u+YQMIhYVVxpE88X39cd1nShjFbDUb6rXpzjWKDfw1nuOsMmQpBHjQqFZcJ1ojJHJd
	 UsiGHrIZvAKOg81pSlTnAVBVq/yJy2/cKR5HaPM/n++4ZpnbiLr0/lnk1mEeNV5UOF
	 yXFVmBQuvLzjh4k9ISx2Cvh0Np8EXaVtW6dTXqOs3+Dlr7DVtU9UHhc3mFrQ6e736h
	 O3JD4RHiK0oiQ==
Received: from [100.113.0.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id D7/10-07430-0F14D506; Fri, 26 Mar 2021 02:07:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MxVfe9Y2y
  Cwfej2hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0br2tdMBfM5K2ZePsDYwLiGo4uRi0NIYAuT
  xO+tK5ghnBOMEn/ObWLsYuTkYBPQkeh40c0CYosI6Essnb2HGcQWFrCUuPJ1AVgNi4CqxKpZB
  9lBbF4Bd4kHe66A2RICChJTHr5nhogLSpyc+QRsDrOAhMTBFy+YIWoUJbbvPAMU5wCyqySOzF
  SbwMgzC0nHLCQdCxiZVjFaJhVlpmeU5CZm5ugaGhjoGhoa6wJJYwO9xCrdRL3UUt3k1LySokS
  grF5iebFecWVuck6KXl5qySZGYCClFDI07WB89+qD3iFGSQ4mJVHeQydiEoT4kvJTKjMSizPi
  i0pzUosPMcpwcChJ8E51iE0QEixKTU+tSMvMAQY1TFqCg0dJhPeHLVCat7ggMbc4Mx0idYpRl
  2PVgemrmIVY8vLzUqXEeRlAZgiAFGWU5sGNgEXYJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjE
  rCvFzAeBXiycwrgdv0CugIJqAjNv6IBDmiJBEhJdXAJPJofXzkJwfmiDWtv5af9d/4Sp/jZPK
  WXcmqt2fo29We09Z3/6p7OFJlgsgKJuGe6ighzSUi8Seds09/WL8irW3WjYviUVyCYptn7s84
  olAdEnpA5fyayzvzt2z8sL5lyWzPBpFuax/l4Fn2eX/+ixc8mGRfKXB0xY9DHZIvXy1Y8fsb5
  5TUSTwmvFOPz+0ui+rh2nNUIVdq77tLu5JPfOG/q7LnMt+3GTZfuHxm9sgdNnJ5159QVHl1e4
  nK4hmXohYnPVNNej3F8GO+5sdN06N3R0p9L9paI3xzgafKEuFPK42c6uXPpQpz3y2yb69Z0q7
  ppfj44DwV/meP0rsuzpi7xuhkeOCcA3pf83na2ZRYijMSDbWYi4oTAWjA44ArAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-228.messagelabs.com!1616724463!96421!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24030 invoked from network); 26 Mar 2021 02:07:43 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-6.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Mar 2021 02:07:43 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12Q27h8S014345
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Mar 2021 02:07:43 GMT
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 26 Mar 2021 02:07:41 +0000
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] nss: upgrade 3.62 -> 3.63
Date: Fri, 26 Mar 2021 10:07:35 +0800
Message-ID: <1616724455-25606-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 meta-oe/recipes-support/nss/{nss_3.62.bb => nss_3.63.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.62.bb => nss_3.63.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.62.bb b/meta-oe/recipes-support/nss/nss_3.63.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.62.bb
rename to meta-oe/recipes-support/nss/nss_3.63.bb
index 439a6ae66..ab2c43d01 100644
--- a/meta-oe/recipes-support/nss/nss_3.62.bb
+++ b/meta-oe/recipes-support/nss/nss_3.63.bb
@@ -32,7 +32,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "86d6df7cece25b8d4efa53e4c19af903c484eb79871163f37b5232bb406a5478"
+SRC_URI[sha256sum] = "182d2fef629102ae9423aabf2c192242b565cf5098e82c5a26cf70c5e4ea2221"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.25.1

