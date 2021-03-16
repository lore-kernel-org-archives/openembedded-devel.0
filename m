Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by mx.groups.io with SMTP id smtpd.web11.681.1615908924841469826
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Mar 2021 08:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=L4URCqLW;
 spf=pass (domain: wdc.com, ip: 68.232.141.245, mailfrom: prvs=7026ea0ff=alistair.francis@wdc.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1615908924; x=1647444924;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HBlYWM6MPqEXgJG+KqAbsgbOzwnfoZD5/3x1XPkcPIk=;
  b=L4URCqLWHKPmIl5LAT1GcIbHdHVckk5Et3AFqX11NlAm6RrVYrGIw2WM
   HFCGsVJilZTVJdHQjR+Q4qnr1MnZAjh8JA8fv70o+otc9gH5ZGRj0B3fN
   +I8lO3zMbmyHf7jlvd6RgKMI/ZlGYJiZYODjPCunxYP91tnnGfZ50mHfi
   rpQwcRYoU7UIF58ul/dijWfeD4BJn/U1ahbYwE//8UxbMr0cYONMwY72/
   zr4OM7wZ6cGuuWHCAEcdo8Sibgs/gUQ12FEuvmjKvf+TrhxkHShs2u6bc
   YiyQrJpkJJkk4XHXvtje743isZ6NLEh60JPc6zO/kxDt8c5HB7+XbHFvu
   Q==;
IronPort-SDR: bgEEvrhWilsj8pNSj07Ws6hr0pTcvftypwwR8B0AFa6nlB9TSdjz30nsJCUPDECCvPPGqSwoEY
 4WfRpYBJQ+WuQs//RueH7g8nmxe2WtmLdcOD2sciDEWGfePGEPuW4Aakk8lwYVQ06u1rByXMZA
 UpmMtPEiSMkCFZM2AsXSCUDFzfk9aUFnpZk2VvDL6ZFOlVooRgpzBGE5CP0EtJVNk7bq8M/IGn
 WlUmtZdp/TRLuu7b/OgEuAWEIr/N2wBb4yvF0VzS3RbFk1fRUALEA0wlbOtLXNn4rh9M+mIPvy
 l7A=
X-IronPort-AV: E=Sophos;i="5.81,251,1610380800"; 
   d="scan'208";a="272992911"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 16 Mar 2021 23:35:23 +0800
IronPort-SDR: mgZ5ff0mRx+Bw6O/SPANrPpffpQHveNpmtmTDxHP5gAr53S9XBy7aV36tOv4I8N1ZKj3Yl458b
 HhTRscmCA8yUIL/6gIQ8jRLO8qLcaUD7yU4G8GLLrHJg368O77tmFQ/CtCidwVuRYqNbpyI188
 obuEj60veyBtvQkwI05xyicbalV2PEJY8QRZYiOwaGWSCZvkkkFIptC/deU0yyq61lXX6MRcTG
 tDXoJP24dlBpn9pQK4wlKrY1c9DQrtSxRST5fl9ktMcCsJqTcxDay9SYoaUvIQs1rBDzBYzgfg
 Rpp9k+l4KYzJahk+nIY4G5wa
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2021 08:17:44 -0700
IronPort-SDR: XYcdr3bzfbXPg+1zLPFnu7iMtlahXuYm8reBMAtm47hC9A3Yl2BjyCekgdgOxd+MEcs53FfBGI
 xPRV7dPXtXEvOEM99SWIrrHJ6dcTycb7voGUIkAp5nO/ZYTfa7ta6HI/OFdGHNBisar60WzHxH
 N8llvGq6sY9xOHPOVTaggr+mp/eNmRQ4QcoiNSgJjezYFFWVmopNMdtRb2MvpXVF5gfFfscNfR
 oRonKb3NZDWEdQKtfVRAreztP3LX3wI/nwpgwBOEJXhG9C7seVh9ZwIuUyJOOBRk1X/efDEpSg
 PYs=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO risc6-mainframe.int.fusionio.com) ([10.196.157.248])
  by uls-op-cesaip01.wdc.com with ESMTP; 16 Mar 2021 08:35:24 -0700
From: "Alistair Francis" <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] openocd: Enable configuration jtag_vpi
Date: Tue, 16 Mar 2021 08:35:21 -0700
Message-Id: <20210316153521.1697408-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the configure time jtag_vpi feature. This
feature (http://www.openocd.org/doc/html/Debug-Adapter-Hardware.html)
allows OpenOCD to connect to JTAG VPI server interface, which is used in
system verilog simulation models.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 05e06a25d..c4349fbc3 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -24,7 +24,7 @@ inherit pkgconfig autotools-brokensep gettext
 
 BBCLASSEXTEND += "native nativesdk"
 
-EXTRA_OECONF = "--enable-ftdi --disable-doxygen-html --disable-werror"
+EXTRA_OECONF = "--enable-ftdi --enable-jtag_vpi --disable-doxygen-html --disable-werror"
 
 do_configure() {
     ./bootstrap nosubmodule
-- 
2.30.1

