Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.6897.1588079378359972436
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2020 06:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=IX9d8DnY;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.182, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qk1-f182.google.com with SMTP id q7so9516313qkf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2020 06:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mhYm3zptB/nZfwg8VhBaVeelonTrVbKkr81mB0RtcVk=;
        b=IX9d8DnYsoewU0mWtOi2lsG5mcBqi3O6e3DGnM1F6c1LT7EJle0Z0TvgsyM7lUD6nA
         EEhE56as8duER+7kWub/gLrlZfLfSxidOkk9y0xrxRPJRNbMlnMWLzF6L1UNSb5TD0Pu
         JYGjBNK5vCpyFjoGKz3DmCdyvbVsP/r7U6WDpEzhchNgeV+HmXAJoD1+wy8eYJCJI11G
         tO4DiRbWf4+kpKN3HqJT+rD172gXuIdK26+61oNwI2wfmjGpSf6ARt/3ijlaLFy2XYxS
         FWAZqzX892D5aH0QGWPdr1A6FQnZyvdMfNzvksAy6nUJ9xkd2ZWOeKgrSbNmEYLhpgIR
         c5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mhYm3zptB/nZfwg8VhBaVeelonTrVbKkr81mB0RtcVk=;
        b=J8Li/dA4rFHAK+aTTl+2Wgo5lDOOQ6NswZgKJcceiOQij0dKLVc7/sMqlD4ciWSIJW
         8yw1DlhGQksJWl0fTiLbGsT6Slc8aWl7BuiE4Sk0AfqGg1hFX+uvh2gM6ik2SzQTFsIB
         TDaOzAa5SpVMHLt8A5p//IVVYHLzkisuURnWA1eypEBpXCuwxWRWXDGBCMF5WFEBrKBK
         wgXiHD4LxbxNQ8HvxsDcNSGY84CgTuJo8OMME5mwnoC7i7xQ35TBJqYYMHc7FIStsSgw
         ZzmOzJJuXwCiNl3O8ltkWZPJSJYwfPkgRaM8bnwlpwOhRCUbquT821epK6dzKs2Z5cs2
         S0bg==
X-Gm-Message-State: AGi0Pua2IuyNVuvtaxf+Boh+5cwIG6H0q3DcdNr9u0zrTZfdKnH54skd
	dcC+xgK9/raruAXXCHq6+Vg6CQWK1J8=
X-Google-Smtp-Source: APiQypLXXOGoF6Yig9GidW7Q626zg6W7mLxFtYVhLo/1FkcOJMc85lGTkeDwsn54kacVys6Nm8ldVA==
X-Received: by 2002:a37:90b:: with SMTP id 11mr28919209qkj.205.1588079377347;
        Tue, 28 Apr 2020 06:09:37 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from localhost.localdomain ([2804:7f4:c193:1cf5:44ed:61e4:a25c:b4f0])
        by smtp.gmail.com with ESMTPSA id a13sm13203103qkg.129.2020.04.28.06.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 06:09:37 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [meta-python][PATCH 6/8] python3-spidev: Upgrade 3.2 -> 3.4
Date: Tue, 28 Apr 2020 10:09:12 -0300
Message-Id: <20200428130914.17398-6-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428130914.17398-1-domarys.correa@ossystems.com.br>
References: <20200428130914.17398-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../python/python3-spidev_3.4.bb                 | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-spidev_3.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-spidev_3.4.bb b/meta-python/recipes-devtools/python/python3-spidev_3.4.bb
new file mode 100644
index 000000000..334d658d6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-spidev_3.4.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Python bindings for Linux SPI access through spidev"
+DESCRIPTION = "This project contains a python module for interfacing with SPI\
+devices from user space via the spidev linux kernel driver.\
+This is a modified version of the code originally found\
+[here](http://elk.informatik.fh-augsburg.de/da/da-49/trees/pyap7k/lang/py-spi)\
+All code is GPLv2 licensed unless explicitly stated otherwise."
+HOMEPAGE = "http://github.com/doceme/py-spidev"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+SRCNAME = "spidev"
+
+SRC_URI[md5sum] = "bbab6352449f1d572cc9eefeafc58bd1"
+SRC_URI[sha256sum] = "4314e52f573d95233c907f307558893313a8a606e197e77bb711526b0e179e80"
+
+inherit pypi setuptools3
-- 
2.17.1

