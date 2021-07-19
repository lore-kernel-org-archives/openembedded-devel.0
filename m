Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web12.29394.1626707734460615132
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jul 2021 08:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PdJHnSLi;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id o201so16757747pfd.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jul 2021 08:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=5jVjZM+k87Z/u1e8Pbp9bqVQtknw41Ni9I3jpZ+APhE=;
        b=PdJHnSLiAk6m4fuIKrOw2FulFYRhCjEd8FGj4HH0vRrk+fX4X81J91zM0qwqdHX7tZ
         XW8XXnEbE+HrKY8p+zgOEm04Z/StZW2Un+wHb384IJsd21PFhjDJP/D7l/FA9camvRDQ
         8Cst/7Amlo5Q5H7f8n3inxtvjgcslDzLsE0g7jAzhHMGgzNkdm01jLYaf/4vFtg81La7
         OBTX5m0rZbzgB/4NglN9DTpDOyJkTzcgln46Y11MwDWTD3/8/7QXp2Z5/k3bWjfep9DW
         KjOiFszS0MEO/YPbSkEt+a+yKkpjICQc0DkX4wgA7RZfKF4FQ0hulnLh8DTb3IOQBxpX
         w9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=5jVjZM+k87Z/u1e8Pbp9bqVQtknw41Ni9I3jpZ+APhE=;
        b=ktZOjVMJJbgJoPhkbtSRpTVjFNhvuGGFEGAWFJDCmcVdJ8tVlDIW9UeePiNtaFKyW0
         NhyqyeQeFeDeKafNQEUWHJOWYgyMyj1ZW4UIrh0uoWm+OnEf5WuoVV0HEKWo7rMLRL/0
         tOZM/f9UyRTuVgGlOlF6DCPrtQ9V7fgp3aif4prrCEgR7WsMx57Pw2cHV4BqJDhb9g5T
         Vyg9XAKNCHoYGGkSBP+frXPt42ACCQsuP39qAusVeo/+mNx2QnLaVKg3JJ5FwFbpiY8w
         6wH6bcyUP7Y88PtDYApFr+W1gMV7W5oIXneYCHipSU7OyS018WFkTLmC7/B22+6BY4mj
         +pIw==
X-Gm-Message-State: AOAM530nClMJ72t0S9rmNR1hTVz/TTz28gNceT5lZSxu6VXStHnZPKa/
	SlvfmzTIIUsZ7DOPBpz9e7M=
X-Google-Smtp-Source: ABdhPJwOnHpnHX3dX0RNg8gx2/5wl/d+Y5xHy4dKhMTyLaEepBff1vnzW2O2Yuc9MOYwjBHd7CogOw==
X-Received: by 2002:a63:1913:: with SMTP id z19mr22595607pgl.315.1626707734023;
        Mon, 19 Jul 2021 08:15:34 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:3b2f:89be:7392:671a? ([2601:202:4180:a5c0:3b2f:89be:7392:671a])
        by smtp.gmail.com with ESMTPSA id t10sm22403601pgv.52.2021.07.19.08.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jul 2021 08:15:33 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: Hardknott merge request -July 19th
Message-ID: <a13e28fe-3433-7031-3dd0-35e1b95e9b7b@gmail.com>
Date: Mon, 19 Jul 2021 08:15:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit c51e79dd854460c6f6949a187970d05362152e84:

  python3-django: upgrade 2.2.23 -> 2.2.24 (2021-06-27 07:50:20 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded hardknott-next

for you to fetch changes up to 6a7ba8f7f210e04183fb64ab181520d817a34a11:

  sysbench: fix memory test (2021-07-14 21:27:01 -0700)

----------------------------------------------------------------
Adrian Zaharia (1):
      ntp: fix ntpdate to wait for subprocesses

Akifumi Chikazawa (1):
      openvpn: add CVE-2020-7224 and CVE-2020-27569 to allowlist

Changqing Li (1):
      nginx: fix CVE-2021-23017

Li Wang (1):
      apache2: fix CVE-2020-13950 CVE-2020-35452 CVE-2021-26690
CVE-2021-26691 CVE-2021-30641

Masaki Ambai (1):
      nss: add CVE-2006-5201 to allowlist

Sam Van Den Berge (1):
      libiio: fix installing libiio when python3 bindings are enabled

massimo toscanelli (1):
      sysbench: fix memory test

 meta-networking/recipes-support/ntp/ntp/ntpdate                 |  5 +++
 meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb        |  3 ++
 ...1-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch | 40
+++++++++++++++++
 meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb           |  4 +-
 ...1-python-Do-not-verify-whether-libiio-is-installed-whe.patch | 37
++++++++++++++++
 meta-oe/recipes-support/libiio/libiio_git.bb                    |  4 +-
 meta-oe/recipes-support/nss/nss_3.64.bb                         |  3 ++
 .../recipes-httpd/apache2/apache2/CVE-2020-13950.patch          | 45
++++++++++++++++++++
 .../recipes-httpd/apache2/apache2/CVE-2020-35452.patch          | 49
+++++++++++++++++++++
 .../recipes-httpd/apache2/apache2/CVE-2021-26690.patch          | 39
+++++++++++++++++
 .../recipes-httpd/apache2/apache2/CVE-2021-26691.patch          | 35
+++++++++++++++
 .../recipes-httpd/apache2/apache2/CVE-2021-30641.patch          | 66
+++++++++++++++++++++++++++++
 meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb          |  5 +++
 meta-webserver/recipes-httpd/nginx/files/CVE-2021-23017.patch   | 46
++++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc                    |  1 +
 15 files changed, 380 insertions(+), 2 deletions(-)
 create mode 100644
meta-oe/recipes-benchmark/sysbench/sysbench/0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch
 create mode 100644
meta-oe/recipes-support/libiio/files/0001-python-Do-not-verify-whether-libiio-is-installed-whe.patch
 create mode 100644
meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-13950.patch
 create mode 100644
meta-webserver/recipes-httpd/apache2/apache2/CVE-2020-35452.patch
 create mode 100644
meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26690.patch
 create mode 100644
meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-26691.patch
 create mode 100644
meta-webserver/recipes-httpd/apache2/apache2/CVE-2021-30641.patch
 create mode 100644
meta-webserver/recipes-httpd/nginx/files/CVE-2021-23017.patch

