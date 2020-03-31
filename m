Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web12.12117.1585669760301238224
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2020 08:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EUO61suv;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id l14so3384458pgb.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2020 08:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aL9K4Qk83X6vnxN0dEoyxJpwx4wjtWo4VZBnyjWK1+c=;
        b=EUO61suv1qz53q0+PL4faHWFBFms9rwfhtDLlU7/6aFzJJHILTvE3BcxYKTF8EIJW3
         KlJCNp8GQ5mMqpeG54A+E7H4LeOIyjBdQE/z/fNjX/L497LneXJ2ljv+z+kgP9Dr+Il7
         E6gdOtFTwbcp6liDxSbbkYoyyl50cauB93KESNer7UIQp8iqIdzqVGw9lU/hWDthw4Gq
         30U3+xiVcPXrYwcQRSVBbPO5GbChp760sgFV8aMKXBLEnrYOyeLA8bqP928HSNVGfwCp
         efkVAU0QwRf5+zxUTT3cuTePLD49b6ez+xvziDJ9b/N++bhp8xECzrJa+lNH0S+wM7SB
         JWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aL9K4Qk83X6vnxN0dEoyxJpwx4wjtWo4VZBnyjWK1+c=;
        b=Fl6I0HKwdM8fh07sRZleUmWpCL7cBVNWQmikErq13JN7gZd82EXr4Qp3S3aXekLeRe
         CtDcBlSQBI9/Vp5Ifxz3Y8hSjP8u9d+Kp4seij0svqOWa+0chAfGpjRfND9SxKRzm9eH
         /3LXde8bQoTp3oOul/l/A4R5eHUzip5/bm+dLdiFTs75Q2Y+rCzLMgRiUYIUFWXWpYIs
         WBy9m7UpGRDihVYt+xYMa8AUVIfkQswc+woCuR98t2UX4CEBGsjJlko4vo5x20hljmMX
         9mreCXA1Dn7iR5V8LL3Z9PYMTWA8J6NuvMnb9rLNvfNrItTlfd5bd035eYp+nW4jmeLg
         GHqg==
X-Gm-Message-State: ANhLgQ2YXay9ZUE8uTGJKyZQpsPCRRXp+sM8z7JILWITmsjfcJayvgkx
	kImoPO1OO8mqpZzM/+6QCQkLijAGrb4=
X-Google-Smtp-Source: ADFU+vvFLqu32Zrja34jxIlZqYZEYGIL6Liob28jDvNgJVEW9oIKeUrsUV7CNYNthv/r/bPFdJ0VoQ==
X-Received: by 2002:a63:1862:: with SMTP id 34mr18757290pgy.191.1585669759299;
        Tue, 31 Mar 2020 08:49:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::49c5])
        by smtp.gmail.com with ESMTPSA id x189sm12738135pfb.1.2020.03.31.08.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 08:49:18 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH] openzone: Package icons
Date: Tue, 31 Mar 2020 08:49:30 -0700
Message-Id: <20200331154930.3169371-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
ERROR: QA Issue: openzone: Files/directories were installed but not shipped in any package:
  /usr
  /usr/share
  /usr/share/icons
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
openzone: 3 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
index df0ed50c7b..5ff4856865 100644
--- a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
+++ b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
@@ -27,5 +27,7 @@ python populate_packages_prepend () {
     do_split_packages(d, icondir, '^(.*)', '%s', 'Open Zone cursors %s', allow_dirs=True)
 }
 
+FILES_${PN} += "${datadir}/icons"
+
 PACKAGES_DYNAMIC += "^openzone-.*"
 ALLOW_EMPTY_${PN} = "1"
-- 
2.26.0

