Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.995.1629567351734280173
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Aug 2021 10:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cn0KeOE0;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id m24-20020a17090a7f98b0290178b1a81700so9342394pjl.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Aug 2021 10:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=S1tdfnHRRNK6iG21PtcBeIZPaCcnpEZY08CihcwAspM=;
        b=cn0KeOE0LpRKNYrnpDTc+nq3P/puk4DMdh+pGwsY0GRMs/ZUQM+FwbAn2la200j425
         AEL2T56Kg/c4/9dqCDMfe8ZkvF29itS0XnWaF6RqbwKk1ZiW017knGUX9taP3JduvR80
         AxmStP2Ox+LyXWsyfRPJsjTB1TPKy3guJ7gtTJbLyQVOUq92A9LHXz5VgDsAHSIqmWe3
         FU73yBpT76j6U1p0HVupB+rCbGFhN16qxcJrVbVtirp0i8NE6CfTnjw43PLsTRiaFTnk
         pW/0ciAP3L0ZlfI7ZXMQwYGNAEDe2Q9Nrt4dRcO9lnpYTcNnkILC3ENa0CWYunMpmGYt
         TL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S1tdfnHRRNK6iG21PtcBeIZPaCcnpEZY08CihcwAspM=;
        b=jpCq6XcynxcmVXZSxDHq00AUPeWBXpS9FTsVqzMRe69DW/OelOm+O3TNdLggwfXQRO
         JfEvh6mVjV5TKfu6b22XfrZZGnj3+oo4vzLEzjCm5h2PaPXibKXIpVOAqeUhqPwkIE+t
         x/UFESO4tRuErpYb6+fIb14f8CAUcVlVKJs9XHTWCftP9h3dQ/UUahc9uDJwHlNFSNG3
         qzwJNDIgdD4Vg6TaEoWohTsBmpaFPadSdOyAf6ZuUIX/lnrsvqeUaZUUKQnbMBgJmomv
         JfwjxHce6+4POVPEj7AzdGtcotmEC1L3zAOOCO4REQrfsjfduT5cPcK1IpSQS6aa57OR
         HbYw==
X-Gm-Message-State: AOAM533vSDo2qhFX99xbWxmO5DKfAdku+YuUMI2saenul/pXzxefpSHt
	UcEFNv3cV9S6mZqUNk2MD7Iw6at/S+8=
X-Google-Smtp-Source: ABdhPJxRNt29SQKY5+ER2DhIbYNW+ByiJT6CElePEkBPDW0nscxfrAKR7GKKWW13o0ovW/R1nC8xFQ==
X-Received: by 2002:a17:90b:154:: with SMTP id em20mr10957585pjb.92.1629567351206;
        Sat, 21 Aug 2021 10:35:51 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:43c0:2d24:85b:da13])
        by smtp.gmail.com with ESMTPSA id n18sm10993315pfu.3.2021.08.21.10.35.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 10:35:50 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 7/7] ufw: Fix interpreter for installed ufw and test ufw
Date: Sat, 21 Aug 2021 10:35:41 -0700
Message-Id: <a64eec177151a7076a2fd6937e4abdb8e2264a59.1629567241.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629567241.git.akuster808@gmail.com>
References: <cover.1629567241.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jate Sujjavanich <jatedev@gmail.com>

Revert patch to setup-only-make-one-reference-to-env.patch and make
patch for python3 interpreter fix apply to runs of setup.py during
self test as well as installs.

Reported-by: Kenta Nakamura <Nakamura.Kenta@bp.MitsubishiElectric.co.jp>
Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
---
 ...to-detect-openembedded-python-interpreter.patch |  8 ++++----
 .../ufw/setup-only-make-one-reference-to-env.patch | 14 ++------------
 2 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/meta-networking/recipes-connectivity/ufw/ufw/Add-code-to-detect-openembedded-python-interpreter.patch b/meta-networking/recipes-connectivity/ufw/ufw/Add-code-to-detect-openembedded-python-interpreter.patch
index 85d51ca21f..e1fcf0ca56 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw/Add-code-to-detect-openembedded-python-interpreter.patch
+++ b/meta-networking/recipes-connectivity/ufw/ufw/Add-code-to-detect-openembedded-python-interpreter.patch
@@ -1,7 +1,7 @@
 Add code to detect openembedded python interpreter
 
-OE does not use /usr/bin/env as part of the interpreter, so it does not
-update ufw with the interpreter name.
+OE does not use /usr/bin/env as part of the interpreter, Instead, it's a
+full path in sys.executable.
 
 Upstream-Status: Inappropriate (Embedded)
 Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
@@ -17,9 +17,9 @@ index 75c1105..3f9a5e0 100644
                               "-i.jjm",
                               "1s%^#.*python.*%#! " + sys.executable + "%g",
                               'staging/ufw'])
-+        elif '-native/python' in sys.executable and \
++        elif '/python' in sys.executable and \
 +            os.path.basename(sys.executable) in ['python', 'python3']:
-+            print("Detected oe native python " + os.path.basename(sys.executable))
++            print("Detected full path " + sys.executable + ". substituting " + os.path.basename(sys.executable))
 +            subprocess.call(["sed",
 +                             "-i.jjm",
 +                            "1s%python$%"
diff --git a/meta-networking/recipes-connectivity/ufw/ufw/setup-only-make-one-reference-to-env.patch b/meta-networking/recipes-connectivity/ufw/ufw/setup-only-make-one-reference-to-env.patch
index f487a6fd6c..ff704b5a46 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw/setup-only-make-one-reference-to-env.patch
+++ b/meta-networking/recipes-connectivity/ufw/ufw/setup-only-make-one-reference-to-env.patch
@@ -14,10 +14,6 @@ detected or specified on the build line.
 Upstream-Status: Inappropriate [ embedded specific ]
 
 Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
-
-Added conditional to handle sys.executable without env on python3
-
-Signed-off-by Jate Sujjavanich <jatedev@gmail.com>
 ---
  setup.py | 34 ++++++++++++++++++++++++++++------
  1 file changed, 28 insertions(+), 6 deletions(-)
@@ -47,7 +43,7 @@ index b13d11c..73acdef 100644
          # Now byte-compile everything
          super(Install, self).run()
  
-@@ -107,12 +112,29 @@ class Install(_install, object):
+@@ -107,12 +112,23 @@ class Install(_install, object):
          for f in [ script, manpage, manpage_f ]:
              self.mkpath(os.path.dirname(f))
  
@@ -66,13 +62,7 @@ index b13d11c..73acdef 100644
 -                         'staging/ufw'])
 +        print("Updating staging/ufw to use (%s)" % (sys.executable))
 +
-+        if not re.search("(/usr/bin/env)", sys.executable):
-+            print("Did not find 'env' in sys.executable (%s)" % (sys.executable))
-+            subprocess.call(["sed",
-+                             "-i",
-+                             "1s%^#.*python.*%#! /usr/bin/env " + sys.executable + "%g",
-+                             'staging/ufw'])
-+        elif re.search("(/usr/bin/env)", sys.executable):
++        if re.search("(/usr/bin/env)", sys.executable):
 +            print("found 'env' in sys.executable (%s)" % (sys.executable))
 +            subprocess.call(["sed",
 +                             "-i.jjm",
-- 
2.25.1

