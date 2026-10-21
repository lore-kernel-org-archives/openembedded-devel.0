Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8901.1792580526343596347
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=TMgy74f+;
 spf=pass (domain: konsulko.com, ip: 209.85.221.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e00eee27dso421710f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580524; x=1793185324; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qNNEB8+wVSpsoZsE7xPplPbuPtJacIjy0MTvQ0UIE0Q=;
        b=TMgy74f+im/Hr7gcDxvFYji3Wx8RHSorL2faFFwMBAEZeoBMhmePsu6QCy9Dv/Qv34
         0CQifeVZv6LZYtZk+Dz2RR0Pq7Xo1GwqsatD1tkrviLpq0Cale09ArjHagoNJTgwhtW+
         d6ieLJEGndOWI+55qQHG78AUiwE0Evo19LIuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580524; x=1793185324;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qNNEB8+wVSpsoZsE7xPplPbuPtJacIjy0MTvQ0UIE0Q=;
        b=Rld82042O43clCRWXkiyOJd842s0hSMvplW3FtHynegDw+hqrv47YOzl5jMNuDzq+7
         Qs/98cx3fd7jVnXyJYmqaqDCXs5u0M3EpPLQ/aQH9X/5G58v6QyFQyNXUh7FBjgwIEIZ
         H52Oi5oA3Zt6t+z5ar+/96uW3ymaGXTZKli+1gQvUJue/qxP905JYNNPh1zPU4QfR1Rf
         IJnVp/gLdFOsPvyR6rewmhA9I+8V2JxDnfHXY77UjH0jdzcmCDx6650tVnvzubfIqYB8
         CC8ClV+K0H6jgU0GX4u0s9tcSWSdXOuEotXSx6CXGjEUXCcjA8zPta4TCVzrxXs///uW
         5OJA==
X-Gm-Message-State: AFq9FYIQDpw9tUWjE3SpuWE5kY74abxJsy4URcQdhf7GXRPBdIVH75lH
	BInqLL3RdATv9b1Hek3eBXp9D4TfyMgJxzEi1Ljpcx8jmS2/R8yN/N+lknyU/ziMPILmyinw6vP
	B1mRQ
X-Gm-Gg: AYBFou0CL99fjvAh3aY3fZlGMcNvsh+K7z2mXKAy9kBAIt7peAF3EB9sWhMEFhlfA1D
	75CroNSNx1exNws6gMcKugu83eaNi8Y3bbJxet1i9gexyxAsuofUxzq6fgYVhqFp2Db5mGp9qQk
	hQYMjmSWYnwgtJZxqIVVzB8Le4PADMHNVUI//94rsxN6GEsTggEkKHXb8gZqCPG7qL1cccN6qZk
	0jCELrDq+gR6fiMo3X1xFjQUMJwY2YUEu3MYfTJSZuEvkcBuj8Hqkq2/vaLj84allSwodVhJVk6
	BcOJ/4aBViVHAtLR7Vqn8NVy2fJFqs7E2p7zPb8uH8T8OLUlotAlvhI0EVuzDOzk7mSvDK3Rgq1
	YP6a72Loj8pRXaF8pfVij6LhmKDQIS6izOdnn6CZ0UvkkZrQ492J35IEfWw5pwYqHu+VPFdu0v0
	nw7wffsbwXcbYMe/bs6rz9Dhnhq1n8z50aTshooE/irripob0O+vIOwh44hP8X5GL/scI59/O5J
	ub8pFA9TL3Aj2FZXASfhi1G5QTEMCHGzDoRDdwLcRBlmMIF/J4kDJY7CVv7vKFCN93DjXKa9dkF
	HmyizEDvQBVyu+j9UwIirmRUbik/hKliiKlwkcoEwNPHK6lsKuxoR8PUk/y95WWJs1LOSOEIC/P
	19jgy
X-Received: by 2002:a05:6000:2d06:b0:48d:ff0d:cfa5 with SMTP id ffacd0b85a97d-48e264e1407mr2319331f8f.47.1792580523441;
        Wed, 21 Oct 2026 04:02:03 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:02:02 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 35/36] python3-pint: Upgrade 0.25.3 -> 0.26.2
Date: Wed, 21 Oct 2026 14:00:59 +0300
Message-ID: <20261021110103.1943456-35-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131294
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.26.2:

Major changes

- check(), +/-, comparisons and to_reduced_units() now use the
  active context, e.g. adding kN and kg in a context relating force
  and mass (#1951, #1748, #1002, #1067)
- <number> / <offset or logarithmic unit> (e.g. 1 / ureg.degC) now
  raises OffsetUnitCalculusError; Unit * bool and Quantity * str
  now raise TypeError
- Add a deprecation warning to ApplicationRegistry.__getitem__()
  matching direct registry item access
- Improve and test / and * between Quantity and Unit, supporting
  more edge cases; improve their type annotations as well
- Preserve the registry's Quantity type in wraps annotations for a
  single return unit, allowing array results to be indexed
- Improve type annotations for Unit: / and ** keep the unit type,
  and __copy__/__deepcopy__ keep the registry subclass

Units and parsing

- Update definition of US survey units to reflect the 2022 revision
  by NIST/NGS
- Fix fathom to equal two international yards; the old value is now
  survey_fathom
- Fix the angular mil so one turn is 6400 mil
- Parse $ as a unit symbol like £, and raise DefinitionSyntaxError
  for unknown operators such as & instead of ignoring them
- Raise DefinitionSyntaxError instead of an internal TypeError for
  addition or subtraction in unit expressions, e.g. kilo-watt
- Reject invalid unit aliases at definition time while preserving
  Unicode and degree aliases

Formatting changes

- Add TypstFormatter and ZeroFormatter to allow formatting to plain
  Typst and zero package
- Format temperature units as valid LaTeX (~L) and siunitx (Lx),
  e.g. \degreeCelsius
- str() and format() of a Unit now use the registry's fmt_locale,
  like Quantities
- Keep the row layout of multi-dimensional arrays in
  Quantity._repr_html_, as repr does
- Fix babel not localizing unit names containing underscores, e.g.
  kilowatt_hour
- Fix formatting a unit with only negative exponents, e.g. 1 /
  second, raising IndexError when a locale is set
- Restore the previous numeric locale when localized formatting
  raises an exception

NumPy

- Support the numpy.vecdot, numpy.matvec and numpy.vecmat ufuncs
  and numpy.linalg.vecdot on Quantities
- Support numpy.repeat on Quantities
- numpy.sum/numpy.nansum now raise DimensionalityError for a bare
  non-zero initial on a dimensioned Quantity, like numpy.max
- Fix numpy.sum/numpy.nansum not converting a Quantity initial
  value, unlike numpy.max/numpy.min
- Fix numpy.nanmax/numpy.nanmin raising ValueError on a Quantity
  initial value, unlike numpy.max/numpy.min
- Fix numpy.clip not converting the units of the numpy 2.1 min/max
  keywords
- Fix recursion in numpy.average with dimensionless Quantity
  weights and returned=False
- Fix assigning offset-unit quantities (e.g. degC into a kelvin
  array) via __setitem__
- Fix numpy.linspace(..., retstep=True) on Quantities failing to
  return separate samples and step; offset temperature steps use
  delta units
- Fix numpy.block raising TypeError for nested lists of Quantities,
  e.g. numpy.block([[a, b], [c, d]])
- Fix numpy.percentile, numpy.nanpercentile, numpy.quantile, and
  numpy.nanquantile raising RecursionError when q is a Quantity
- Fix numpy.tensordot, numpy.cross and the other multiplicative
  functions rejecting positional arguments after the two arrays,
  e.g. numpy.tensordot(a, b, 1)
- Fix numpy.mod, numpy.remainder, numpy.fmod and numpy.floor_divide
  ignoring the units of the divisor when both operands have the
  same dimensionality, e.g. np.mod(7 m, 200 cm) returned 7 m
- Fix numpy.unwrap raising TypeError on the period keyword; a
  Quantity period or discont is converted to the units of the input
- Fix numpy.diff and numpy.ediff1d not converting the units of
  Quantity prepend/append and to_end/to_begin values
- Fix numpy.ptp returning an absolute temperature instead of a
  delta for offset units

Bugfixes

- Fix converting logarithmic units defined with a compound
  reference, e.g. volt / ampere, which dropped all but one
  reference unit
- Fix compound logarithmic units, e.g. Quantity(-161, "dBm/Hz"),
  becoming an undefined delta_ unit that could not be converted
- Fix logarithmic unit conversion and hashing with Decimal
  magnitudes and non_int_type=Decimal, with or without NumPy
- Fix UnitRegistry.wraps() converting only the first variadic
  positional argument and failing on empty *args; preserve
  keyword-only arguments and defaults
- Fix UnitRegistry.check() validating the wrong arguments of
  functions with *args, **kwargs or keyword-only parameters, and
  failing to call functions with positional-only defaults
- Fix 1 * unit skipping auto_reduce_dimensions and
  autoconvert_to_preferred, so it disagreed with every other
  magnitude
- Fix to_preferred raising a spurious DimensionalityError for some
  preferred units
- Fix RecursionError in find_connected_nodes for long chains of
  contexts
- Fix in-place **= changing a Quantity's units when the magnitude
  update fails, e.g. a fractional power of an integer array
- Fix Quantity.dimensionality being stale after an in-place
  operation changes the units
- Fix Quantity.to_compact() raising OffsetUnitCalculusError for
  offset units like degree_Celsius with magnitude below 1

Documentation

- Document is_compatible_with in the tutorial
- Document defining units with a custom Converter
- Document that Unit equality compares definitions, not values,
  e.g. kph != km/hour (#1433, #1876)
- Document how to compare angles that differ by a full turn, e.g.
  -140 degree and 220 degree, using the modulo operator

Development and packaging

- Remove the babel <= 2.8 upper bound from the babel extra
- Fix CI never comparing the matplotlib test figures with the
  baseline images: --mpl was lost with the Travis config in 2021
- Fix CI installing the numpy matrix pin outside the pixi env on
  Windows/macOS, so those legs ran the no-numpy test suite

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pint_0.25.3.bb => python3-pint_0.26.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.25.3.bb => python3-pint_0.26.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.25.3.bb b/meta-python/recipes-devtools/python/python3-pint_0.26.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pint_0.25.3.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.26.2.bb
index c04fc48f87..f370da6a57 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.26.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bccf824202692270a1e0829a62e3f47b"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-SRC_URI[sha256sum] = "f8f5df6cf65314d74da1ade1bf96f8e3e4d0c41b51577ac53c49e7d44ca5acee"
+SRC_URI[sha256sum] = "391e5d2fc01fdb121c113b8eb47386688575542c1f5144c465ff318bf5133573"
 
 DEPENDS += "python3-hatch-vcs-native"
 
-- 
2.47.3

