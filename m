Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.2359.1625965713550157734
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jul 2021 18:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dQyYW9oF;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id x16so6226750plg.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jul 2021 18:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k0eDNANrK4+Q0D2Tfi9vvTRjBjrTcRf9PkHlBFQI3uo=;
        b=dQyYW9oFtIIe2dfnQu5B7bnFO5oYCKhwiG7xfuRgrLIaKw6EGvZgq0p1komM5LVbWk
         JMBWO7wVfGGIcOeW+9myRI4akVeQIqdwD4i0yvE8JxQTd7a3hg8jqSl3hcTaLfdL/lNO
         4jIT4U3z2d9T/qtFzYnsL7/IGyY6cxFtD1q05PHAGroot2hFRpFSVbmvAXP+gJUYd4z+
         JelnyCDJwCJ96YJdAVfAvoz6K+q5Tl5V4B/nPG3UFcIaGOkJIpkB4l1mtWK2j6WrzRJM
         V4cswSqmVQdeSjkruea9kRZH6XycXgQd77cDktjWObTygLZfOvVjkdJGZ3EcBz305lqv
         ziMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k0eDNANrK4+Q0D2Tfi9vvTRjBjrTcRf9PkHlBFQI3uo=;
        b=iWft508q6otPdQViLRxsi/J1xevPfQ9PK38hR62312B1FBGjQrZ0GYVxJZcuywpia5
         9LWX+9AmrEMgxMp0Y/O3LYDOI6aK5s/5Qkiypxm7AE8iIBYw/NXML1zn9Fo1Ewtr7EN0
         IOvd4ycEfEoFy6wo9oldyaLHiyd+uUbILUvKhVMP5ym9zD10AqxMo3pmb6aU7N4xqCn6
         sKtb27MhvarLyen8Hf0WlM0NtKl9LA6Eke9PWFI4NLP1PELheix30SUv5alzsOZG5Ln8
         ieMu5jen7iy/wj6c3UdC7OLJeSYb5X1qhVNMcYt30A600qezMTQqPYbhQw6Io16JXgBg
         EU2w==
X-Gm-Message-State: AOAM531ysDEZRLnT64wLnHOy1yv5kfVdicpqzuVkazMYQGKDeiKUFxPS
	WOPeoyZiLyXpsrlIBKhGm7lBphPpYbe0QQ==
X-Google-Smtp-Source: ABdhPJwJwDTjlpuRSfYm8N9p1dGQ3RQDEQhGjXNQDIrik+hqOJsAyLMCXhjHcZ61NEExXGW9d41CRQ==
X-Received: by 2002:a17:903:89:b029:12a:ee95:42df with SMTP id o9-20020a1709030089b029012aee9542dfmr4642078pld.77.1625965712897;
        Sat, 10 Jul 2021 18:08:32 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::7ed6])
        by smtp.gmail.com with ESMTPSA id z3sm12199024pgl.77.2021.07.10.18.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 18:08:32 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [meta-perl][PATCH 4/8] libio-socket-ssl-perl: upgrade 2.068 -> 2.071
Date: Sun, 11 Jul 2021 01:08:00 +0000
Message-Id: <3dc8b32e889bc51e4275fb51cfde2a2d7691f80f.1625965484.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1625965484.git.timothy.t.orling@intel.com>
References: <cover.1625965484.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

2.071 2021/05/23
- fix t/nonblock.t race on some systems. Fixes issue #102, maybe #98 too.
2.070 2021/02/26
- changed bugtracker in Makefile.PL to github, away from obsolete rt.cpan.org
2.069 2021/01/22
- IO::Socket::Utils CERT_asHash and CERT_create now support subject and issuer
  with multiple same parts (like multiple OU). In this case an array ref instead
  of a scalar is used as hash value.

References:
https://github.com/noxxi/p5-io-socket-ssl/issues/102
https://github.com/noxxi/p5-io-socket-ssl/issues/98
https://github.com/noxxi/p5-io-socket-ssl/issues/95

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...socket-ssl-perl_2.068.bb => libio-socket-ssl-perl_2.071.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.068.bb => libio-socket-ssl-perl_2.071.bb} (91%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.068.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.071.bb
similarity index 91%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.068.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.071.bb
index fc9786beca..4a98ac3744 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.068.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.071.bb
@@ -22,8 +22,7 @@ RDEPENDS_${PN} += "\
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "4230c829c8875889848093b2b46a7284"
-SRC_URI[sha256sum] = "4420fc0056f1827b4dd1245eacca0da56e2182b4ef6fc078f107dc43c3fb8ff9"
+SRC_URI[sha256sum] = "40da40948ecc9c787ed39c95715872679eebfd54243721174993a2003e32ab0a"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.30.2

