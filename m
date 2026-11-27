Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8069.1795739696781281298
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NqRs+nTg;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-385d8a00598so10996884eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739696; x=1796344496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoVxG1Joq4OQ4JXLOaRODIlAtPDNnh6r5eDGui+/p8o=;
        b=NqRs+nTg+RVTs7OAFTvMC3nqwtCIlo4ScloFPGmoZfJ36aBgi+/+mqU9CmXgF6eU3E
         S0bzUOEaHWz/NPvekkjjwicpFvRr5af/rcDT01WUmescJ0nd2hvTAV+7MByJfKA8+kmh
         hkpMS+i1z1/Xr9MLedxJy8+DscCnXTGEgg/516ih+5M8m7/trQjbZ5BjL5k0V2iY7plj
         P34m6hYTfEr5c+HGNNsOO50mtPcDtB31bqboiW+YwSKJodcwirw1P+8/Zugdg08Rcazn
         ZlrBtvhGcjXEGWpir+MEvmg3SNRhO3EHvWZp2rnPfxfVdc8gWmXq7ULsd4ZIgmzD5bB3
         Jv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739696; x=1796344496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IoVxG1Joq4OQ4JXLOaRODIlAtPDNnh6r5eDGui+/p8o=;
        b=RdbDmg4rKo/+/478u0OQYwJfOEqGqU4VAvjixUOoJm+nS5KFfIrExRLK4dLEMEU3G0
         Kom1Pb6+yltUYV+g4YpA84Xw/3PeHe3JjECmCwdzhv3ws8oU0RVfkZtgb9cbGDVCJ6Us
         2/Jjd59cPoYpm+NaZTaSVMB+P2sb7z2+P0LN0SNPJg4KsX4h2d5SpXm29ohrPCbZZKqy
         c0YFhrFBnniYhw5SQj07OLYFaWVSTiNUxSB+pb+SVz4gIU4VSQA4iYeHTRIydj5Atec6
         yGIZ+ZTkSQkF1ADMzNc1aCwS1X7JaTKwzIXbAdswtrjJ0VrYlaKr92z5ENpjKNR0Afhz
         N2Bw==
X-Gm-Message-State: APuU4Z+vQ2c5LWjF7zlDg65fvAcxhzd7/3mpU/kmH3NHIU850HFjLQWU
	q/5cdp5vlBJNj6/BdGnNeUXscEZKhiXbSaDVdCOsyuEglePoUrUwJR6uV9Zgj9x5
X-Gm-Gg: AZFdTZcTpvSoYDFVqO5xiZ3vrefW7PnezLC4RrWDRs6+ntj6w6/u7hEAIIqSN5gnLBP
	tqjjSplFYn/kybSsJvWaVfnNupUMjZUVN76AeZ82toa5t9Cn5nlemi5qGMQ7dSnP3lt+VOXuUad
	eZQqaJvGxt+xMCJL/HVP552zGsXMP+ezt40aAVwSUQARurInNEXd8uZNOormQh2snMDAFgQIOXR
	T3m2w+ZPS3Lv6STXcwl14W5T751DoYCZ5+vaX8ZrAKNMGU6bbOlneQ+xqMHMTQD6ANLNxzB8jnD
	HApble7eyewoHjjGqw3yUV6ooTcX8QIJPwU9eyeQGhl4iq84wtTjmnH+Z14aQPIVnz+pCafvQuN
	7n2z5dvrhB4AT8gq9fUYj/Knf6vz9GWHN7KTsLRBIWgPIhjAu40eBpAJlTtG2E9IVanhnQ2ZQNe
	CeRqkW88wnu5RN9Tdpec0sukl7PG6I0ReEZ4Y/Zya5i+7AATFX/1gx5kSlLHNIR+Jf03FP5rsc9
	iPbDojzOfdivq3CdMmonXJhZzy8XuOOdsCDl2YjzZCWjOmhR7iJ1lLG15Vx8mdlIM4mU9vSCWZ+
	zjl7VFGwoQ3TRWH0KR13nhbj0yqjsAiQ9w8PG2xw2XXOrfugkJhP2SCHjsfS+xabd7hoUN5Q3nu
	56vjHiXZ7HQ6+HjKs5nDZ8t2bWi21xlU7a50f5H7Pj3eMoL5JD/gXLsMS2QIONSLXsToK2tNH0n
	9q/2Sbt9q1t3Zh27lY0f12vJJ6L6yErYmRs5xrYIKK4BYbZN9bab3o0OWWO4TvOej2fuBL8C13i
	MBqHfrAH9nUOQsfw3jn7WNF3auPkI1ga0mtwCI5Q+xFAH2w7E4qBLEkXwfhG6ieGvzEaitLEoJu
	CcMYpFH6ziC4znPo8dUM8aDw3g==
X-Received: by 2002:a05:7300:c01b:10b0:386:c3c2:a37b with SMTP id 5a478bee46e88-386c3c2a444mr10577457eec.4.1795739696114;
        Thu, 26 Nov 2026 16:34:56 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 25/69] glibmm: Restrict upstream check to the 2.66 series
Date: Thu, 26 Nov 2026 16:33:41 -0800
Message-ID: <20261127003425.2166632-26-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133125
Content-Type: text/plain; charset="utf-8"

The directory scan reported 2.90.0 from the glibmm-2.68 API series,
which is packaged separately as glibmm-2.68. Check only the release
directory of the current series.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-core/glib-2.0/glibmm_2.66.10.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.10.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.10.bb
index a9be4e6c55..3d8d1e90eb 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.10.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.10.bb
@@ -14,6 +14,9 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI[archive.sha256sum] = "2b61780203aed98e701d3ea57c8f353e7c8ada9706a79be782f6c5153dd035c0"
 
+# 2.68+ (glibmm-2.68 API) is packaged as glibmm-2.68
+UPSTREAM_CHECK_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/"
+
 FILES:${PN} = "${libdir}/lib*.so.*"
 FILES:${PN}-dev += "${datadir}/glibmm-* ${libdir}/glibmm-2.4/include/ ${libdir}/glibmm-2.4/proc/ ${libdir}/giomm-2.4/include/"
 
