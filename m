Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.3516.1618693591720227940
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Fu/aeCyN;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id j7so12128263pgi.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=9j2Y0ZIE3azko9LLhP0i63oG7VtaXBlSg3+bjdz6AIM=;
        b=Fu/aeCyN+iqpyIKsJFd+xPdVLSbikk++IvTgcgGZD6MHiwjhEEo5aybpH/ByYVa2/2
         hSyAUAvISfEDoeWl8NNwod9M2gdMOqlhQt/Rnk0tMoGOEeLA0qL+8ULtEcMhVU9HqZuO
         T/KilTTsz5mmcqlEnCRsjmmrWuUbhQ0SoqSQCKAXJBIMFGAE+c7jhsiaQGmuVU48LWIQ
         rYnZ0AMkHLBiH5sThapnDb0ifI/NHtpowJCFRiTkXJDQvAWerRMWgdAUhGQ8/wh4fqDW
         b/GiAjqCF8gA53a6ViLm9lzWbvtfpoA3X12izBuP7mj16+FMmvWoWQIsfA4wZi8qV7T4
         CRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=9j2Y0ZIE3azko9LLhP0i63oG7VtaXBlSg3+bjdz6AIM=;
        b=V0cipINbPruI8RyXd3rnQSHd5a1RjyFy/bbHFNO6riST1jeoRX+bb8rs75ofQ5g29x
         h5JheZY/GNK7DP70sKluW3Trts6XGqZTRyFmDizSeA1ZzN7NohthpT2qAELbc0BomR94
         MUjFYSbJxKCQ0rNy7Hm3nNwUawLYpfm5ztQyvXsrQN2TgcH1E2XKPmPRJpitVzgEZOK8
         gqZ5rf2S8xmNA0vLktileyZ0vjdG5UnaSysxILUL0/uQkIX9n3BdWcEZSSQ2a8ZZ1hmG
         N6yYZZ59kWmTQGwDrJ2ivpieL59oySvEJCHtwtx3n/bIEqngmW3AZcDAM/rVgP3Qb/d5
         1U8Q==
X-Gm-Message-State: AOAM530bXmezDlxaoXlM+sxlv0s5jmStzmvLpObCKM88cSBYahBeE4yi
	gLZW8WCWg/tNE+DI7ciTkMBfhbKPRZrhEA==
X-Google-Smtp-Source: ABdhPJzmc/eKu0Z4XZkz9mkPhceYIPHz6VwpVFTZPpgqz3RjCvd09zfad+A1a2cVq6zwd5BFeDu29g==
X-Received: by 2002:aa7:946b:0:b029:24c:57ea:99bf with SMTP id t11-20020aa7946b0000b029024c57ea99bfmr13421570pfq.63.1618693591071;
        Sat, 17 Apr 2021 14:06:31 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:30 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 30/50] python3-pandas: Upgrade 1.2.3 -> 1.2.4
Date: Sat, 17 Apr 2021 14:05:39 -0700
Message-Id: <dc60b1e71592fc305135c6b81cf1bbfc0e6bd756.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.2.4:

- Fixed regression in DataFrame.sum() when min_count greater than
  the DataFrame shape was passed resulted in a ValueError
- Fixed regression in DataFrame.to_json() raising AttributeError
  when run on PyPy
- Fixed regression in (in)equality comparison of pd.NaT with a
  non-datetimelike numpy array returning a scalar instead of an
  array
- Fixed regression in DataFrame.where() not returning a copy in
  the case of an all True condition
- Fixed regression in DataFrame.replace() raising IndexError when
  regex was a multi-key dictionary
- Fixed regression in repr of floats in an object column not
  respecting float_format when printed in the console or outputted
  through DataFrame.to_string(), DataFrame.to_html(), and
  DataFrame.to_latex()
- Fixed regression in NumPy ufuncs such as np.add not passing
  through all arguments for DataFrame

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 443e435ce4575dbf7fe3f37594942690b8df3730)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/{python3-pandas_1.2.3.bb => python3-pandas_1.2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.2.3.bb => python3-pandas_1.2.4.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.2.3.bb b/meta-python/recipes-devtools/python/python3-pandas_1.2.4.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pandas_1.2.3.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.2.4.bb
index 8c36c21bb96..54fa910a981 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.2.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774"
 
-SRC_URI[sha256sum] = "df6f10b85aef7a5bb25259ad651ad1cc1d6bb09000595cab47e718cbac250b1d"
+SRC_URI[sha256sum] = "649ecab692fade3cbfcf967ff936496b0cfba0af00a55dfaacd82bdda5cb2279"
 
 inherit pypi setuptools3
 
-- 
2.17.1

