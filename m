Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5764.1793689470976101390
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2026 23:04:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=U2xdFmk/;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1427; q=dns/txt;
  s=iport01; t=1793689470; x=1794899070;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pyIxYn3oQ6IdpY1Y7lNDa1ZctFpL5WOzvymWv95OsTA=;
  b=U2xdFmk/jL11A3cSQO6oEehWVGNHy6/NzFZMKuqeVbao/oXPMG/47QFT
   0lanXCjka9uYOwfmbE2272wU+tMbv5LxXreemON6OQpmIfztdhpKNJf2g
   7L5R7sSbJI8MgwcJe0Gq3krwxSkxK1UecS6zBHpsXPJ92wP10A11Ap+ci
   u8bNcSwGm9C21wVS9L+ACvoXVguhpzmZGrGJtbL84b15Y2i19IXV+Ixav
   3q8KIVZjU760A1O6phg2vlgyjpqjS8wEU+HDr7I9Y9idyj3BfcZE55g9i
   qlizxdaMuidRB6bmLri2kCmFgpsolvKaq/uR/W8hTtJ0jtuoxBkCkgfAu
   w==;
X-CSE-ConnectionGUID: 3jW5qQTcS7qqaaeAyITiWQ==
X-CSE-MsgGUID: 4KxWT4vgTJ6+jKtR9c9GvA==
X-IPAS-Result: =?us-ascii?q?A0BdAwCJhulq/5L/Ja1aH4I6g0xgQ0kEk1YBgnCeIoF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFjh4CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBU2ARgBLTBcRIMCAYJ0AxG7HYIsgQGDKQGBVNs/FQWBM4VAi?=
 =?us-ascii?q?CN2hH0nGxuBcoR+gmEEgUxfhXkEgg0VehKCZoIZiXaIHUiBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgR6BEoEHXYErKF0BIYEIgXYCglGCA?=
 =?us-ascii?q?AIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZgsaBWEIAg0MdDkQM?=
 =?us-ascii?q?B4kLwUcJkAQGA1IESw3FRkEPm4Hkg2DDoEPKgEFgg4ZDgGlZ6ERCiiDd4wjl?=
 =?us-ascii?q?ToaM6pwmQiOCpYBUIRpgWg8gVlwFYJuAQEyCQpAGQ+XN8lIJjICAToCBwIHD?=
 =?us-ascii?q?gMLkWotgU8BAQ?=
IronPort-Data: A9a23:ntdC6Kv5O3LsjaJn8MN8eIfCIufnVAdfMUV32f8akzHdYApBsoF/q
 tZmKWqOP/bcM2egedB2YIiz9EMBupKGmNY1SQNu+C42FSlEgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvb8ks11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwoeRIXHh3y
 fcjdykUZxmOrvOX/LOEc7w57igjBJGD0II3oHpsy3TdSP0hW52GG/SM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtJYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9J4DRGZQKxR7Dz
 o7A1zjaEi4maMKQ9RjbsXCPmtWelnLURqtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YQLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:l0gZzK0+Eta3y6aBbMZI+gqjBJ4kLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKhTbaknDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:3/isyWP2Ok/S8e5DAytYqVctJsseLWTExX7dCl6ZNWdWcejA
X-Talos-MUID: 9a23:0zQi5AUbc5wCr7Xq/GPPlA5eaNln34bwS0Iuja9XsJirKwUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,192,1787011200"; 
   d="scan'208";a="543497303"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 03 Nov 2026 07:04:30 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id F0C6B18000236;
	Tue,  3 Nov 2026 07:04:29 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 9A6DACC1611; Mon,  2 Nov 2026 23:04:29 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-webserver][wrynose][PATCH 0/3] nginx: Security Fix
Date: Mon,  2 Nov 2026 23:04:26 -0800
Message-Id: <20261103070429.1299769-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 07:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131758
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This series addresses CVE-2026-95101, CVE-2026-97629, and CVE-2026-15176 in the Wrynose nginx 1.28.3 and 1.29.7 recipes. 
The patches backport upstream fixes for HTTP/3 request-body injection, shared SSL session ticket key synchronization, 
and unsafe alias-based path mapping after URI rewrites.

The series is based on the eleven Nginx patches already submitted to meta-openembedded and still under review:
https://patchwork.yoctoproject.org/project/oe/cover/20261016032056.409095-1-hthakar%40cisco.com/

Those eleven patches are prerequisites; they are not included or resent in this three-patch series.

Validation: BitBake do_patch and do_compile and image build completed successfully.

Hetvi Thakar (3):
  nginx: fix CVE-2026-95101
  nginx: fix CVE-2026-97629
  nginx: fix CVE-2026-15176

 .../nginx/files/CVE-2026-15176.patch          | 55 +++++++++++++++
 .../nginx/files/CVE-2026-95101.patch          | 69 +++++++++++++++++++
 .../nginx/files/CVE-2026-97629.patch          | 46 +++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |  3 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |  3 +
 5 files changed, 176 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-15176.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-95101.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-97629.patch

-- 
2.35.6

