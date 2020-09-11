Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web11.5096.1599819695607728988
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2020 03:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=Rhx77Jmd;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=516bca272=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1599819695; x=1631355695;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mJHK8PTyzibggXQv/Cb1ZuSkjBG12kKs0f0fcPzKVro=;
  b=Rhx77JmdN6jlkzr7l4MrvtHzRgm7OsgGaWPLLElkB5xjpH2qVJowNh/W
   VN0peFdVervEnU6HurESAusYIIaHF6VanMHF3oWL7Ap8BEXo6X0UCt6WB
   sApHIIubC+k9pKs+/ScMGHO2gM82RyvfWPd43uHno9//iSjchPfxL0pXF
   +8U8Tgm8s2n65VHCK7odSAeyTiFb8QfRqtKP/AE0k+MUWLDi2dsHM5GNv
   qYnfgPI2NieQaUtJoNgAn6nHGEqMVZYdlo7k8Y5O1OeO3YmduE/PoFpnH
   lJR9hqWowS8Kk/mr7pdUlwd3l73Mlsx9nzgo99vXiadlyiDuyDarkOXve
   A==;
IronPort-SDR: F+NSJBvvV12SHHzBDnqmxCjBI2L8ZGojOuq2XIf8jNPSgRzWWFG9DZAvp4y+UIE7pkxqjjs4p4
 Qiv7ujJ782hA/ndJnwASFlr5Pv68STriQuELieO23fK45P5bMDJZyssF+QwCcn0oZnLIVB9HOq
 UiQZ6aN8QIuwpl/ELdz10Km7gLzm0uIT+A1GWEOnvaFYguhyof7XXcuF8B4SDx3TWH0bpwboml
 CiSybCJu40ymZzfFNi+eHyWUNr+z7jOLyOli0OXvoXgicHyP6uqV7juSKlDLSzCLtgBVxmd9X4
 9wc=
X-IronPort-AV: E=Sophos;i="5.76,414,1592863200"; 
   d="scan'208";a="26744771"
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Richard Leitner <richard.leitner@skidata.com>
Subject: [meta-java][PATCH 2/3] openjre-8: add ALTERNATIVE for "keytool"
Date: Fri, 11 Sep 2020 12:21:15 +0200
Message-ID: <20200911102116.597001-2-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200911102116.597001-1-richard.leitner@skidata.com>
References: <20200911102116.597001-1-richard.leitner@skidata.com>
MIME-Version: 1.0
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

As we have ALTERNATIVEs for java and javac we should also provide one
for the keytool.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/openjdk/openjre-8_265.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/recipes-core/openjdk/openjre-8_265.bb b/recipes-core/openjdk/openjre-8_265.bb
index ce6392a..55ca1ec 100644
--- a/recipes-core/openjdk/openjre-8_265.bb
+++ b/recipes-core/openjdk/openjre-8_265.bb
@@ -38,7 +38,11 @@ RPROVIDES_${PN} = "java2-runtime"
 
 inherit update-alternatives
 
-ALTERNATIVE_${PN} = "java"
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN} = "java keytool"
 ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
 ALTERNATIVE_TARGET[java] = "${JRE_HOME}/bin/java"
-ALTERNATIVE_PRIORITY[java] = "100"
+
+ALTERNATIVE_LINK_NAME[keytool] = "${bindir}/keytool"
+ALTERNATIVE_TARGET[keytool] = "${JRE_HOME}/bin/keytool"
-- 
2.26.2

