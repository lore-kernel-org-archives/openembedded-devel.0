Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.5524.1608703265560829400
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Dec 2020 22:01:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q1z18e4E;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id m5so2606985pjv.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Dec 2020 22:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3bYais0Zm0bETVIyQNZ7iLMFqoVMiR10dthqLVD750A=;
        b=q1z18e4EzQCkH9WWxUiYt7wS+IID21WFbZD0wscjFhUedtF3T1PAOBIn6EV4d3dW6L
         BEU2YX3RmkjFQEjbyvLRpv8bs/YK8CcWgl2Ni6vz8CC9RUZp2ta4Mi7a2dxWAu/vuEYQ
         9PuvHq8XDSgumCl3WDof3FZws9ZWUbq0Rd6/lhN2Jk9RcWItUJpvbm6IGWPP3wQb535M
         Ipj4JojyPESrEzjexSUiodSn6dwlZJPqVk4vyURqmb51uteaOMREx1J3Q59vbv7SLnE+
         CP+cfNfnYC4Cp/BCQSgtZy97wVsihQJCo4zrlq/fZITv8ZhkW3+7WqsM9254e0l4PHcI
         wOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3bYais0Zm0bETVIyQNZ7iLMFqoVMiR10dthqLVD750A=;
        b=qlsbv8vwjTF87bCYsAo76oH86a2cdyrN4bmmu4s1O1rOLY7WnngEw9Vs6eiPhjR/xX
         N2vXU3mbwPG8pW+v240FmY4/SwnCer9V00s+1I70FqHRm0HEPBIa6V969XH4wv5zeQ4r
         4bUHMHbVcoZzvgBfQGxmy5QHYAcny9AUbHH2Sg5ByPrNPdWj/cMu+DCGfFIpl6N4AzNv
         8D215P0PTuK9tN1mCg5iF16U7h/7+Y5uCvmf4IivhJBpvUS7NUZFhwFIe/vTAUbH3888
         DTK/MMdMc7qJ5eUhSrF4jep5AyyeDICAv4TQERv/ekPbLPmVn4hUz521RciVY3XyJ4wI
         KdPw==
X-Gm-Message-State: AOAM533V0dRSBovjkIT5GnfgndGVL+IqXXMqdG7iiq6Pw3GU2pqH7di4
	p38q9rSqwm/UIPTM7K75NncOBfjUCvEqtA==
X-Google-Smtp-Source: ABdhPJzeg7E463qHv5gCp+n7U+0wDBMN+HRUa/XzuAmeh5DqX/w8gMrfeRxsOUXazdujF/tMy68D2A==
X-Received: by 2002:a17:90b:11d7:: with SMTP id gv23mr25241789pjb.2.1608703264723;
        Tue, 22 Dec 2020 22:01:04 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a8e7])
        by smtp.gmail.com with ESMTPSA id k11sm23325675pgt.83.2020.12.22.22.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 22:01:04 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/3] cyrus-sasl: Disable ntlm plugin by default
Date: Tue, 22 Dec 2020 22:01:00 -0800
Message-Id: <20201223060102.3211143-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntlm requires md4 algorith defines which is now disabled in openssl
recipe by default also see [1]

[1] https://github.com/cyrusimap/cyrus-sasl/issues/632

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
index d55dc4ab7e..33de8ca7e2 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
@@ -29,7 +29,7 @@ EXTRA_OECONF += "--with-dblib=berkeley \
                  --with-plugindir='${libdir}/sasl2' \
                  andrew_cv_runpath_switch=none"
 
-PACKAGECONFIG ??= "ntlm \
+PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'ldap pam', d)} \
 "
 PACKAGECONFIG[gssapi] = "--enable-gssapi=yes,--enable-gssapi=no,krb5,"
-- 
2.29.2

