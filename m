Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.197024.1598280618783390969
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 07:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39680 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kADnd-0006gX-GY; Mon, 24 Aug 2020 17:50:18 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-pandas: Upgrade 1.1.0 -> 1.1.1
Date: Mon, 24 Aug 2020 17:50:03 +0300
Message-Id: <20200824145004.12568-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824145004.12568-1-leon.anavi@konsulko.com>
References: <20200824145004.12568-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 1.1.1:

- Fixed regression in CategoricalIndex.format() where, when
  stringified scalars had different lengths, the shorter string
  would be right-filled with spaces, so it had the same length
  as the longest string
- Fixed regression in Series.truncate() when trying to truncate
  a single-element series
- Fixed regression where DataFrame.to_numpy() would raise a
  RuntimeError for mixed dtypes when converting to str
- Fixed regression where read_csv() would raise a ValueError when
  pandas.options.mode.use_inf_as_na was set to True
- Fixed regression where pandas.testing.assert_series_equal()
  would raise an error when non-numeric dtypes were passed with
  check_exact=True
- Fixed regression in .groupby(..).rolling(..) where column
  selection was ignored
- Fixed regression where DataFrame.interpolate() would raise a
  TypeError when the DataFrame was empty
- Fixed regression in DataFrame.shift() with axis=1 and
  heterogeneous dtypes
- Fixed regression in DataFrame.diff() with read-only data
- Fixed regression in .groupby(..).rolling(..) where a segfault
  would occur with center=True and an odd number of values
- Fixed regression in DataFrame.apply() where functions that
  altered the input in-place only operated on a single row
- Fixed regression in DataFrame.reset_index() would raise a
  ValueError on empty DataFrame with a MultiIndex with a
  datetime64 dtype level
- Fixed regression where pandas.merge_asof() would raise a
  UnboundLocalError when left_index, right_index and tolerance
  were set
- Fixed regression in .groupby(..).rolling(..) where a custom
  BaseIndexer would be ignored
- Fixed regression in DataFrame.replace() and Series.replace()
  where compiled regular expressions would be ignored during
  replacement
- Bug in Styler whereby cell_ids argument had no effect due to
  other recent changes
- Bug in pandas.testing.assert_series_equal() and
  pandas.testing.assert_frame_equal() where extension dtypes
  were not ignored when check_dtypes was set to False
- Bug in to_timedelta() fails when arg is a Series with Int64
  dtype containing null values
- Bug in .groupby(..).rolling(..) where passing closed with
  column selection would raise a ValueError
- Bug in DataFrame constructor failing to raise ValueError in
  some cases when data and index have mismatched lengths

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pandas_1.1.0.bb => python3-pandas_1.1.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.1.0.bb => python3-pandas_1.1.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pandas_1.1.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.1.1.bb
index 7d65287cb..63ae69e3d 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.1.1.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774"
 
-SRC_URI[md5sum] = "512da48424b85bf198002bdbdf38af5a"
-SRC_URI[sha256sum] = "b39508562ad0bb3f384b0db24da7d68a2608b9ddc85b1d931ccaaa92d5e45273"
+SRC_URI[md5sum] = "bb796b56c276ecea1a6a227010e9c56a"
+SRC_URI[sha256sum] = "53328284a7bb046e2e885fd1b8c078bd896d7fc4575b915d4936f54984a2ba67"
 
 inherit pypi setuptools3
 
-- 
2.17.1

