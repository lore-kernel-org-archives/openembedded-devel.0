Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id ED1D87321C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2016 01:24:05 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y7so6495983pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2016 18:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rjAR+XReh4E/S/FSY3lU6Cy24IQhG1OPRPOLvzO+QBk=;
	b=RIPEDEph7Hul3a4hfqr71aU8Onc/hH1rjLArsj+gUZTM0u8q/wP4v3YbFiMyRkPR1S
	J7RC5QqS7p6pbzrnl4QRo9PXR8MtWmtunM0V67BZv2OJ8mg6QBZkHSv7j150PHo8e9GW
	pYJMIcgcsAElAAaEGCc9M+NkeKUzeIsYRAfAefnTlOvInwxM+O1iNxNJEGTvoSMe5GuS
	cHsWANfvhJxTIzC06ReQ4O4RV1/37EJxT0Dh0MA5bnqFu714Vz0hC1SBIq4hYCBH3Zzc
	tFJzo5KrspsRvQHtdCXSNMmbYj9OAxf6+afj/YKoGhlfM/3rKSqeHh29qX6/Xi6+id8n
	7fLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rjAR+XReh4E/S/FSY3lU6Cy24IQhG1OPRPOLvzO+QBk=;
	b=jJgk3IXOL0uCW/FRyZCgunFtURc0AuCQgS3RlJsektugg2fx7AGtUiWtGObjO8HkPt
	vLbzD+cgAPUKmhmm+H9CRvUZxq2yPLDFEOu9K2r5N51BvSGVMLrINfmXHScOuzP7AXbF
	7u60aiwaAH4DaX6q5HXhGqgVGm+9pmzX7/I+2SugC+epytN1DYWoJKhUwcyZ1KEZSASu
	5+d0W2oWNq+sqHuBEwRnaVgXQk3aY7NAvSBThMEGUGdg4qaOGMH0hg2mVJ9h+9kgnnno
	jlJPhCYJu2sNmxU59uOEY7AkjTfJH6DBQ5z5bc/IfKeXHeLUqpt/VxxcVbuXiuRUj0R1
	v2iA==
X-Gm-Message-State: AOPr4FXf/m4bIsm5FIBdTWXF0SqXSonAEv2y3Mb8udzSOCqm6ADlzXUrUXCVz4tEy8emEQ==
X-Received: by 10.98.67.150 with SMTP id l22mr15411086pfi.85.1463621046811;
	Wed, 18 May 2016 18:24:06 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	o80sm15036373pfa.37.2016.05.18.18.24.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 May 2016 18:24:06 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 May 2016 18:24:00 -0700
Message-Id: <1463621040-23141-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] ntp: avoid floating dependency on mdns (aka mDNSResponder)
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
X-List-Received-Date: Thu, 19 May 2016 01:24:11 -0000

An mdns package is provided by meta-intel-iot-middleware.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
index ff4ba64..d242f93 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
@@ -56,6 +56,7 @@ PACKAGECONFIG[cap] = "--enable-linuxcaps,--disable-linuxcaps,libcap"
 PACKAGECONFIG[readline] = "--with-lineeditlibs,--without-lineeditlibs,readline"
 PACKAGECONFIG[refclocks] = "--enable-all-clocks,--disable-all-clocks,pps-tools"
 PACKAGECONFIG[debug] = "--enable-debugging,--disable-debugging"
+PACKAGECONFIG[mdns] = "ac_cv_header_dns_sd_h=yes,ac_cv_header_dns_sd_h=no,mdns"
 
 do_install_append() {
     install -d ${D}${sysconfdir}/init.d
-- 
1.9.1


