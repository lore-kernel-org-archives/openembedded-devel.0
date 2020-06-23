Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.3660.1592905917875400118
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2020 02:51:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35806 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jnfau-0006Iq-7j; Tue, 23 Jun 2020 12:51:56 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/11] python3-pint: Upgrade 0.12 -> 0.13
Date: Tue, 23 Jun 2020 12:51:35 +0300
Message-Id: <20200623095136.24854-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200623095136.24854-1-leon.anavi@konsulko.com>
References: <20200623095136.24854-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.13:

- Reinstated support for pickle protocol 0 and 1, which is
  required by pytables
- Fixed bug with multiplication of Quantity by dict
- Bare zeros and NaNs (not wrapped by Quantity) are now gracefully
  accepted by all numpy operations; e.g. np.stack
  ([Quantity([1, 2], "m"), [0, np.nan]) is now valid, whereas
  np.stack([Quantity([1, 2], "m"), [3, 4]) will continue raising
  DimensionalityError.
- NaN is now treated the same as zero in addition, subtraction,
  equality, and disequality
- Fixed issue where quantities with a very large magnitude would
  throw an IndexError when using to_compact()
- Fixed crash when a Unit with prefix is declared for the first
  time while a Context containing unit redefinitions is active
- New implementation of 'Lx' String Format Type Option
  The old implementation treated 'Lx' as 'S' as produced by
  'uncertainties' package, but that is not fully compatible with
  SIunitx. The new code protects SIunitx by fixing what
  unceratinties produces.
- Added link to budding `pint-xarray` interface library to the
  docs, next to the link to pint-pandas.
- Removed outdated `_dir` attribute of `UnitsRegistry`, and added
  `__iter__` method so that now `list(ureg)` returns a list of
  all units in registry.
- Replace pkg_resources.version to importlib.metadata.version.
- Fix typo in docs for wraps example with optional arguments.
- Add momentum as a dimension
- Fixed a bug where unit exponents were only partially
  superscripted in HTML format
- Multiple contexts containing the same redefinition can now be
  stacked
- Fixed crash when some specific combinations of contexts were
  enabled
- Added support for checking prefixed units using `in` keyword
- Updated many examples in the documentation to reflect Pint's
  current behavior

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pint_0.12.bb => python3-pint_0.13.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.12.bb => python3-pint_0.13.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.12.bb b/meta-python/recipes-devtools/python/python3-pint_0.13.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pint_0.12.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.13.bb
index 626af0554..9a081baba 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.12.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.13.bb
@@ -10,8 +10,8 @@ PYPI_PACKAGE := "Pint"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[md5sum] = "0af699bc0ccdff56228b4a81216b4f7d"
-SRC_URI[sha256sum] = "dc899061f9dc478e0aac3b0d872ca33d120efd32c382984818adab3522b6c793"
+SRC_URI[md5sum] = "6e60d42736f8175a57119aecc383fe4b"
+SRC_URI[sha256sum] = "13fa35ffa3ddf53161b4304917085687950e0de461bcdd4d65cdee11a43d7fb2"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.17.1

