Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.2438.1625965684994050647
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jul 2021 18:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bj6DHlCw;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id a2so14206869pgi.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jul 2021 18:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s6+kaI/83KvKBfnFJoXg3GcSa1qeWRYSxXSDsU5vFfw=;
        b=Bj6DHlCwmHI4N4BqwuMbGLW/ulpn9ZvprsDH5tUL0K+Pp5bjsYfxjad4fG6skP152K
         TNRD3aP4PPvtQGHY445+hpSYRpoZA9III37p+tmE8lbQU33bQSsY3Hv+vtPxPxhMsNAU
         ofib5PFqgo1Lbo8jr68s0YXthmEzpLrHnRvekefD3MkHVRlLT8+rPvgBx3Nt5THLYLCF
         F3WFjR+OiZgCjBRt8LeL8dsK++2dqX8vkG0qJfmxesHshL7ev/eAgTlMsC0AdghDZQf+
         +8z414SAsVghLDiIFv+KOL6tZj/at2UjAGaRGDhBsT/FZU1XZBq6riQTZnDfDEsioDt3
         WPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s6+kaI/83KvKBfnFJoXg3GcSa1qeWRYSxXSDsU5vFfw=;
        b=fBJKU5dH+8pTc5/kcUR1oG4P4C9Iu20qfYfN7V2MTttmeWr2VjXa9hohQfK2BZga5h
         dPPjG6o7KwjhLWVwwYkQm4FyxLSL6ursrZKlbsLAkhAwqA+fUbbMEMJenew+POu1eRzz
         cgaJbDNjzvn7BETu3aO7Yeqovjevce+dL+OoLd1m6Z8FKS70omwC9Bv/+IqgtAv011AQ
         gz9Gpv9HWSrCBi4d4i1dtvsrqFcH5QbYCnhLRzH2CCSShOiUs295raIyeRfqUofQL3u5
         uzCI1gcQSI+p71nD+wBNKUlYypbKx0Q8k2hZTBlwm1Z8r01bRtCxEIC4v7C7ZgJo4D/J
         lftw==
X-Gm-Message-State: AOAM53269r2x/n7Vz+B970ucGV+Kog/AIzKnkDQn4JZNxw4jhSGXe/0G
	7EgAOmIiBuq3seugche0d96DSVaWtqtTGw==
X-Google-Smtp-Source: ABdhPJz8jnZOPZejqr7U0ZlKwcjqZQm1vvwFg7zKaTSg3+edP5/Tdz7WoeHGxo+9unJnr8fdqhujAA==
X-Received: by 2002:a63:d06:: with SMTP id c6mr45415981pgl.121.1625965684249;
        Sat, 10 Jul 2021 18:08:04 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::7ed6])
        by smtp.gmail.com with ESMTPSA id t13sm9584354pjq.14.2021.07.10.18.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 18:08:03 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [meta-perl][PATCH 0/8] Perl recipe upgrades
Date: Sun, 11 Jul 2021 01:07:55 +0000
Message-Id: <cover.1625965484.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

meta-perl recipe upgrades with the help of auto-upgrade-helper.

The following changes since commit 0412a4befcd190cf020dd525aad31eba54b93a32:

  suitesparse: Fix LIC_FILES_CHKSUM (2021-07-08 09:21:41 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib timo/perl-auh-upgrades-20210710
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=timo/perl-auh-upgrades-20210710

Tim Orling (8):
  libcgi-perl: upgrade 4.51 -> 4.53
  libcrypt-openssl-guess-perl: upgrade 0.12 -> 0.13
  libextutils-cppguess-perl: upgrade 0.21 -> 0.23
  libio-socket-ssl-perl: upgrade 2.068 -> 2.071
  libmoo-perl: upgrade 2.004000 -> 2.005004
  libnet-dns-perl: upgrade 1.26 -> 1.31
  libtest-warnings-perl: upgrade 0.028 -> 0.030
  logcheck: upgrade 1.3.20 -> 1.3.23

 .../logcheck/{logcheck_1.3.20.bb => logcheck_1.3.23.bb}        | 3 +--
 .../libcgi/{libcgi-perl_4.51.bb => libcgi-perl_4.53.bb}        | 3 +--
 ...-guess-perl_0.12.bb => libcrypt-openssl-guess-perl_0.13.bb} | 3 +--
 ...cppguess-perl_0.21.bb => libextutils-cppguess-perl_0.23.bb} | 3 +--
 ...socket-ssl-perl_2.068.bb => libio-socket-ssl-perl_2.071.bb} | 3 +--
 .../{libmoo-perl_2.004000.bb => libmoo-perl_2.005004.bb}       | 3 +--
 .../{libnet-dns-perl_1.26.bb => libnet-dns-perl_1.31.bb}       | 3 +--
 ...t-warnings-perl_0.028.bb => libtest-warnings-perl_0.030.bb} | 3 +--
 8 files changed, 8 insertions(+), 16 deletions(-)
 rename meta-perl/recipes-extended/logcheck/{logcheck_1.3.20.bb => logcheck_1.3.23.bb} (95%)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.51.bb => libcgi-perl_4.53.bb} (90%)
 rename meta-perl/recipes-perl/libcrypt/{libcrypt-openssl-guess-perl_0.12.bb => libcrypt-openssl-guess-perl_0.13.bb} (86%)
 rename meta-perl/recipes-perl/libextutils/{libextutils-cppguess-perl_0.21.bb => libextutils-cppguess-perl_0.23.bb} (89%)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.068.bb => libio-socket-ssl-perl_2.071.bb} (91%)
 rename meta-perl/recipes-perl/libmoo/{libmoo-perl_2.004000.bb => libmoo-perl_2.005004.bb} (91%)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.26.bb => libnet-dns-perl_1.31.bb} (92%)
 rename meta-perl/recipes-perl/libtest/{libtest-warnings-perl_0.028.bb => libtest-warnings-perl_0.030.bb} (88%)

-- 
2.30.2

