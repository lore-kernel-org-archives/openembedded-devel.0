Return-Path: <stephanoc@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id F314D6FFE8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jan 2016 07:29:01 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id ho8so145409687pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2016 23:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MXXDsOuz27LWv2BXWAkQtyclLlI3bfy33FOADbJ4KVY=;
	b=sqBXaUwxiqBRxy+xZYbwbC57e06Tkw8U6QFl8EjT3ifDugNrmr356G6mHvrIPPCfLf
	hVOskFvKiWKIJ/h7BbhrzwupkIxvW2aPpvSkk/tbv6pInuMX+MoiaEANVHHBdJk+Kp6l
	vPsEu+mW+BBayzQKplRF01ZgOqk/Svhc9wIQ0C/lrkRcmeWgoMgzyhxV4iZHxipKWiXI
	BHx+wpic8VGtpZeKtCT8Jf6x+L279E3YAzEbMIb/Y0cy5SWpDuWhhxhMMTm1t7W4NWiY
	KaRfuciOSOdDxZixz2xh419vrAS4xAvFurzjlHaahol5+OZvfYxUHWw2Mt7FpQCbSeRF
	fM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MXXDsOuz27LWv2BXWAkQtyclLlI3bfy33FOADbJ4KVY=;
	b=IfcK8qMDa3Lth4amHZRyZMtNLvl+TJE2U33UC3rBGuBpiNg1oae3NKLKACzrTDnbaU
	WYWjkTL0lGUz20+/FWTdTUAHBFYPo67QdD2en8I3s72uWeqL8s4h/k5/p/nc4B7jFrgV
	JzD9aYuwAYeABChjF4duczJSoID3BCnLdciTc/XaM1WxJzX8XjaHFVJGcfuEHw9wJRUg
	IL63FHvobx+m/tCzsjG/+xH+BIl/db03SGH3vRGvW89mNIboI2/bK8Ztd1i4tKHNj/I1
	XWqL9qmAC1QSPaF0cT4vYBQ52b7AhHvwTADCRgkQfyE2Ov4NpNOHGDh5NTay/Z9gnUrW
	fbZA==
X-Gm-Message-State: ALoCoQmrsnqveWrg6nUDNU7o6pkVq4sprt7FxxIh9oGO1UaSarnLbnifnK/TB0AfbUjyTcnUzhxUUE4eInOIxN6oMtff+JceDw==
X-Received: by 10.66.163.196 with SMTP id yk4mr20899825pab.115.1452929342329; 
	Fri, 15 Jan 2016 23:29:02 -0800 (PST)
Received: from ip-172-31-11-191.us-west-2.compute.internal
	(ec2-52-11-37-43.us-west-2.compute.amazonaws.com. [52.11.37.43])
	by smtp.gmail.com with ESMTPSA id
	tp3sm19824071pac.16.2016.01.15.23.29.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Jan 2016 23:29:01 -0800 (PST)
From: Stephano Cetola <stephanoc@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jan 2016 23:28:23 -0800
Message-Id: <1452929303-24595-1-git-send-email-stephanoc@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH_V2] fix missing packageconfig for samba with sysvinit
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
X-List-Received-Date: Sat, 16 Jan 2016 07:29:03 -0000

Building samba with sysvinit currently throws a QA warning about
"invalid PACKAGECONFIG: sysv". This fixes that issue.

Signed-off-by: Stephano Cetola <stephanoc@gmail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.1.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
index a51d31f..c1d53c8 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
@@ -62,6 +62,7 @@ PACKAGECONFIG[aio] = "--with-aio-support,---without-aio-support,libaio"
 PACKAGECONFIG[fam] = "--with-fam,--without-fam,gamin"
 PACKAGECONFIG[pam] = "--with-pam --with-pam_smbpass --with-pammodulesdir=${base_libdir}/security,--without-pam --without-pam_smbpass,libpam"
 PACKAGECONFIG[lsb] = ",,lsb"
+PACKAGECONFIG[sysv] = ",,sysvinit"
 PACKAGECONFIG[cups] = "--enable-cups,--disable-cups,cups"
 PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
 PACKAGECONFIG[sasl] = ",,cyrus-sasl"
-- 
1.9.1


