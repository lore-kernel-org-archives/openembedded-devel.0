Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.20074.1597561984630379723
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Aug 2020 00:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hYG3g+jD;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 2so6244490pjx.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2020 00:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BsvbivaMotEs2k3oWnxs96LonYtqTBvmhpNDpWwsDtY=;
        b=hYG3g+jDi19GHmThnyTYLoF+/LUjeQOsQ4yPxfxknQb0JVdCOPRTKRp5PUuyTcJxNV
         Fn2ELZrAexUwEmVS9KlrJrJ40xKlP9j5EIqLRrQiA685Ug7KKrDTi0WOGtabscUwdR9S
         D4PZjS50xCAJ3FMKKxFhwRx59Jc6d6Q4JkCY15FaU2boWoaF3l+B4I9bILxJr+vUUwIt
         e2y9uM+EIW3kn1x+V6te/Tq80VZKA3Mqr3aAzCoKRB3jmRIhg8HHBFDk17uQmGAdIMcV
         jKVwMJzJqc0wIsOH+XgtL/VBgOl2WBSi0XJeTwn1RAKplzV4psZpRdmfYsxai4yr0iyR
         NXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BsvbivaMotEs2k3oWnxs96LonYtqTBvmhpNDpWwsDtY=;
        b=IMFeEdxi/ok67bUe6LJ+YhTbg9pVF8ROLvCqciLIst2nZSb8fZkGZhQugbogTfOOAx
         Js2OHKMYkoBs2h0hkadKTswzzn1mP5EekapntCWtUI6OmCXOgEIdTSm6mrJ6bjcTh5Ha
         kVxhTNP0IbClA60k3G4IXhIWSUr8j1uOSXmesCkfcDoDU5E06nlTOTGkpMZAwi7Q3y2q
         D13qzSrNwbpFFKMr6NPkpmWC6R+pIPR4kCn7LTDwx2FaSzM8UAtDxsIuya9UqaARO/tm
         zy4HSWDZMYcCBPNjMJ4ThNuIPS2J37XGOa9qDLiMJD7dg32FQanvEWvPD3VBDA29Q2r5
         ncYA==
X-Gm-Message-State: AOAM533ussXlrYlnBrrO9ndzrjwdiInAfTqAbGo/DQ1nvnhxsCxbLDTG
	lKSQhj/WeCucYCoNqmcd9/atUKNPF+1zGQ==
X-Google-Smtp-Source: ABdhPJw+6jzMk9X67JEKyJlB9xn5YkpLHlsAJeUvSoRD7eLwNR61EHWsdnc8yGugFd7PbjRu5+KUSQ==
X-Received: by 2002:a17:902:bf01:: with SMTP id bi1mr7344713plb.118.1597561983908;
        Sun, 16 Aug 2020 00:13:03 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id q7sm12054386pfu.133.2020.08.16.00.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 00:13:03 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shlomi Vaknin <shlomi.39sd@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-pybind11-json: Add recipe
Date: Sun, 16 Aug 2020 00:13:00 -0700
Message-Id: <20200816071300.1407768-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200816071300.1407768-1-raj.khem@gmail.com>
References: <20200816071300.1407768-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shlomi Vaknin <shlomi.39sd@gmail.com>

Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pybind11-json_0.2.6.bb            | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pybind11-json_0.2.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.6.bb b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.6.bb
new file mode 100644
index 0000000000..c56c70ad37
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.6.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Using nlohmann::json with pybind11"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0e25ff0ec476d06d366439e1120cce98"
+
+SRCREV = "d1d00888bc0eb7c50dde6cff1a5eb4586e620b65"
+SRC_URI = "git://github.com/pybind/pybind11_json"
+
+DEPENDS += "nlohmann-json python3-pybind11"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
-- 
2.28.0

