Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8894.1792580520835623549
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=i/kL9tqy;
 spf=pass (domain: konsulko.com, ip: 209.85.208.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso735189a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580519; x=1793185319; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VnA8YTR7nAy4xJ0WMrNWqXeqVqeQvMMAjI9KTc+YHwI=;
        b=i/kL9tqyDksgUgJoN8ZHOJFXmd9h+SbTdNoSOlt7WRQWFXzWj33jO62qP6n8V0Q/hD
         O+aX6aoYWk7av9XMoJDS75+6PyJeFKxaIEz5D6DKYf6LHxK0FzxZsagEHlaVaXQyH5Xd
         tuGS4ProMOmHAraqrqVzm1Mh//J8dJEhTHbVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580519; x=1793185319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VnA8YTR7nAy4xJ0WMrNWqXeqVqeQvMMAjI9KTc+YHwI=;
        b=lJIe0bUao9TsohyqzfmCLeVZKwFjvUHITtYCIeyUlb8BG3MIJe3BD2TZMyv4QPNgR4
         0EH4XqSI6NrQRVq6gaA9EkwPttTzyH2q5bSHIyWJqwAl+yy8R+NVR1XEi+c48VTarJgO
         hGGOW2plvF7L7aBt/9SNqWxdceQoNdAVFYtJDDCeJMWU/z9TJfr0udOKjSdpGGV7WGXB
         SpQYQUlyzpMR7Tnwya1sr48RzQ6jo6VfSv/tYS/wHd61ICuHEbSRewNdjAmPZRbsatS3
         2UJ74Ao/8F1eE81wIbNRg6u99YgA13UOY/2G4wX9+pyypNHzyNybxlVoNKZoXdE9qPpp
         gYpw==
X-Gm-Message-State: AFq9FYIfavUpDrN98HJS6MH7AYFtAzcLM/C1EpxhnJB4liwBr3KAMkRU
	w3XODQajEPeR24lsMjNZj8SLDZlR9v0THx/cCsEA39uPnc085tPskb0CHUXfz29RyaRILNQ8M7z
	Ks+kl
X-Gm-Gg: AYBFou3idCsaIOkonxcAlzcwLJhpZ4P+zg9z5u8e/mPm2vYJ+B/i1J0Mx+7KKOXEdlf
	rOPqxIvJhaGMn1N9+/OhFVnxdZkEzIUl8WTnIVMZ1VITHqBH1yiM1hsTCdbbOKGYvPbBgS6uD+A
	pLOk83vgLMNdnP5Yq38hIKP2YOTGxuXDJR7Fwm/o3nwrKD+iVfqCbXXL24fdYQI3CveCTTgYBwL
	yXab4PQFOdXNhg7p8c08Zzbt55nT+H78TAHktNFRqOXPIY/98TjAcIof3bnOeMV0oywcofenLTk
	9XGjHsRStE8qjrekvbwSHLcBQ+tzn9q8ESWvc7gbwXH6I1zMGluD/f7s2alErpV+DaB+jjVHzBP
	D1/f4UTo2A0hZw4J6NY+OOHcciBXe7ICgrs3p9+dQbz3puyxAoIpUg/i1UP3a52W2WSIM3r/8Bf
	QDyybxwjaf/e6enh5JflBUY4JL6jvUrpk2Nmnej/f5WnIlN/F1UP/DpqZywa5oObLGopBll1vP7
	E7ox776Fmte9XuTdxg7T62CeLwbs2Zs5zQ82J0iZb6ESND8miOuru3CUUdlKmxvI3c1TuAhw1Mw
	znNttMC7aFhhq+gdNs9Q2y7D6YTEaUQ0w+jFiW9s7SU9A5AQLLalHUwea/MY4muKH8QMXBldLMB
	/7WWo
X-Received: by 2002:a05:6402:550e:b0:6b1:c7d9:b622 with SMTP id 4fb4d7f45d1cf-6b408ec4c27mr1030639a12.26.1792580519006;
        Wed, 21 Oct 2026 04:01:59 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:58 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 31/36] python3-oauthlib: Upgrade 3.3.1 -> 4.0.0
Date: Wed, 21 Oct 2026 14:00:55 +0300
Message-ID: <20261021110103.1943456-31-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:02:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131290
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.0.0:

The release 4.0.0 defines the foundation that enables AI contributions
and will improve the maintenance of oauthlib by using AI agents, skills,
code for both contributors and maintainers. It includes devcontainer,
skills and cleanup of instructions.

Important: this release contains 2 breaking changes:
- Removed JSONP support from token revocation endpoint
- Client authentication validation reorganized across grants:
  the grant_type parameter is now validated before client
  authentication.

- Replace pyenv with uv in documentation and tooling
- Improve github action to publish package
- Add pre-commit to run linters, formatters, etc. on code changes
- Fix client authentication for DeviceCodeGrant when getting a
  token
- Add project URLs to this project's PyPI page
- Fix a typo in ServiceApplicationClient docstring.
- Correct grammar in function help
- Add Python 3.14 to the testing
- Initial python/uv/tox devcontainer
- Fix ruff checks about unused variables
- Drop EOL Python 3.8 from CI
- Set Open Collective username to 'oauthlib'
- pre-commit autoupdate 2026_02_21
- Remove a trailing whitespace fo fix failing pre-commit
- Fix typos discovered by typos
- Add resource to Request._params
- Release 3.4.0: Add OAuthLib Maintainer agent
- Remove JSONP support from token revocation
- Improve PKCE code comparison
- Release 4.0.0: bump and update changelog

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-oauthlib_3.3.1.bb => python3-oauthlib_4.0.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-oauthlib_3.3.1.bb => python3-oauthlib_4.0.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb b/meta-python/recipes-devtools/python/python3-oauthlib_4.0.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-oauthlib_4.0.0.bb
index bdc1f0e7b4..8c6252595b 100644
--- a/meta-python/recipes-devtools/python/python3-oauthlib_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-oauthlib_4.0.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/idan/oauthlib"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2699a9fb0d71d5eafd75d8d7c302f7df"
 
-SRC_URI[sha256sum] = "0f0f8aa759826a193cf66c12ea1af1637f87b9b4622d46e866952bb022e538c9"
+SRC_URI[sha256sum] = "efb274799819440f95b4ab3b818869f1ce9ae26c5beacba0201d1a1b76b54f86"
 
 CVE_PRODUCT = "oauthlib"
 
-- 
2.47.3

