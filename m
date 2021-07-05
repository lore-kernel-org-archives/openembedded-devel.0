Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.7962.1625473414007641570
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jul 2021 01:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Og9hdHEj;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625473411; i=@fujitsu.com;
	bh=xSyOckUfIEuogjgQtmAQ79vucuVVg/tSa2xbQxnqawQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Og9hdHEjS+s1meLAEuxXpoZB1i/oJM3rsu39WQJgwoRUvNdi3xMeJTSvOC6ltBoBB
	 dj9s2RJylxn8uPW6xOgrXUw7K3buRSks8rCre0jSsoRCQvjSqxxp5YaSxwigJo4AOc
	 tvcv6CQsveZzx81O8Z+6PW5jx8M3x/01rhZsi6I3GQbVy6NvmwwzhW427T9ts/TyAK
	 HmyAawhxbV+Kb3nJxvs3uhHfVN0lubE/UbPljZ5ByjV5XxAaNNFQIV0bLcDah++Bd2
	 Ij8aWIDd4j8CyhUhM2L7E/p368Yx6YHFNK5aJ9b161jDZFyefDLYaQbfWz8i8VELh9
	 YgWJD6VqepwzQ==
Received: from [100.113.4.179] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 73/FC-03281-381C2E06; Mon, 05 Jul 2021 08:23:31 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI0W0++Cj
  B4OFyTouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPKq5fMBa2cFQ1TVjE1MC7j6GLk4hASmMUk
  cfv+dCYI5zijxO+7z1i6GDk52AR0JDpedIPZIgL6Ektn72EGsYUFHCXmP/vDCGKzCKhITJxzE
  aiGg4NXwENi0bcckLCEgILElIfvwcp5BQQlTs58AjaGWUBC4uCLF8wQNYoS23eeYYGwKyRmzN
  jGNoGRZxaSlllIWhYwMq1itEwqykzPKMlNzMzRNTQw0DU0NNY10zW0MNNLrNJN0kst1U1OzSs
  pSgTK6iWWF+sVV+Ym56To5aWWbGIEBlJKIduuHYyfX3/QO8QoycGkJMq7SfNRghBfUn5KZUZi
  cUZ8UWlOavEhRhkODiUJ3u59QDnBotT01Iq0zBxgUMOkJTh4lER4J+wHSvMWFyTmFmemQ6ROM
  SpKifO6gyQEQBIZpXlwbbBIusQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmNftANAUnsy8Er
  jpr4AWMwEtvnnuIcjikkSElFQDU5686uuAPKPP8k1KH89v2N1RULHe7OjdqS1+Nx8UasyzsxV
  y27Dy7CYZuRndOh5mVgGTV7g/qzmteuG0vMzu2kYD93fnVMQeu1k2TFaLMJcUFVLunLxC9tB8
  H1OLTSuS7+zdG/aFu+XctMUT1bSX8HtuvKO999W6OaWuazdx8lm07sh8OD1EbJtwrJLhi2lH7
  Pu2eE/3WerO1LVha5PmH/YHBV+X2h47OHeqoUSOzZPmwIX+7yznaId9XOe870PfhrmJCqUxiy
  uSHJdG3ZvvfMNkccNHJkVvlpsHvZ1kXHl2uhj+v7938qcDi5r7MvLL2z4/rvTf8VjOK/Pdn53
  yWhcPnDl7/tOMGUaHb7x7+FCJpTgj0VCLuag4EQBoFVwfHwMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-238.messagelabs.com!1625473410!230115!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32522 invoked from network); 5 Jul 2021 08:23:31 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-7.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Jul 2021 08:23:31 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1658NPdK009158
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 5 Jul 2021 09:23:30 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 5 Jul 2021 09:23:23 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-gnome] [PATCH] babl: upgrade 0.1.86 -> 0.1.88
Date: Mon, 5 Jul 2021 16:23:16 +0800
Message-ID: <1625473396-120211-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Consistency fixes to format names, in particular for palettized formats.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 meta-gnome/recipes-gimp/babl/{babl_0.1.86.bb => babl_0.1.88.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.86.bb => babl_0.1.88.bb} (87%)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.86.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.88.bb
similarity index 87%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.86.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.88.bb
index d264bf8c51..e35044c414 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.86.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.88.bb
@@ -15,6 +15,6 @@ CFLAGS_append_toolchain-clang_mipsarch = " -ffp-exception-behavior=ignore "
 CFLAGS_append_toolchain-clang_riscv64 = " -ffp-exception-behavior=ignore "
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
-SRC_URI[sha256sum] = "0b3f595159ad1b216cd729c0504c3a5f6cf780c641f4dc63fc164f3c0382c8f0"
+SRC_URI[sha256sum] = "4f0d7f4aaa0bb2e725f349adf7b351a957d9fb26d555d9895a7af816b4167039"
 
 BBCLASSEXTEND = "native"
-- 
2.25.1

