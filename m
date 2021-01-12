Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.web10.10161.1610464295031896219
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 07:11:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=mqFCj+IN;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=908; q=dns/txt; s=iport;
  t=1610464295; x=1611673895;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sDazRpGXswDVy0AFk/dV23d8iqWkmVNmPXUMgIxwFQw=;
  b=mqFCj+INiqyDOI7IYKtUTTVSDwA9/P9Y5/C2QosxTRFA8sSj6pJt7/Az
   rAMqIqNdZ6IZsdjvHLwRUrihCCEYTUWjHyYylFWPrQvZrMKKKVONEM+7+
   +NPUh8FVARB+PQb9mlE86tlpEqbJcdWgeqK+n+Mpb/+yANpTJZJqURzPb
   A=;
X-IronPort-AV: E=Sophos;i="5.79,341,1602547200"; 
   d="scan'208";a="624123631"
Received: from rcdn-core-7.cisco.com ([173.37.93.143])
  by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 12 Jan 2021 15:11:33 +0000
Received: from sjc-ads-8148.cisco.com (sjc-ads-8148.cisco.com [171.68.208.186])
	by rcdn-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id 10CFBXRa011539
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 12 Jan 2021 15:11:33 GMT
Received: by sjc-ads-8148.cisco.com (Postfix, from userid 500841)
	id 21686CC1251; Tue, 12 Jan 2021 07:11:33 -0800 (PST)
From: "Oleksiy Obitotskyy" <oobitots@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksiy Obitotskyy <oobitots@cisco.com>
Subject: [meta-oe][PATCH] libsmi: set awk as target path
Date: Tue, 12 Jan 2021 07:11:30 -0800
Message-Id: <20210112151130.14174-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.68.208.186, sjc-ads-8148.cisco.com
X-Outbound-Node: rcdn-core-7.cisco.com
Content-Transfer-Encoding: 8bit

smistrip contains absolute path and prevent to
create reproducible builds. smistrip should use
target awk not host one, so override path.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
---
 meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
index 98cc63eb3..212b1e797 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -16,7 +16,7 @@ RDEPENDS_${PN} += "wget"
 
 inherit autotools
 
-EXTRA_OECONF = "ac_cv_path_SH=${base_bindir}/sh ac_cv_path_WGET=${bindir}/wget"
+EXTRA_OECONF = "ac_cv_path_SH=${base_bindir}/sh ac_cv_path_WGET=${bindir}/wget ac_cv_path_AWK=${bindir}/awk"
 
 do_install_append () {
     install -d ${D}${sysconfdir}
-- 
2.26.2.Cisco

