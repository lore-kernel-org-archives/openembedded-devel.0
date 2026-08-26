Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E8A3C61DC6
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:27:05 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6021.1787722018714000830
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NYKk2v0h;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=23414; q=dns/txt;
  s=iport01; t=1787722020; x=1788931620;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7h5HXG5jvqZBwJAQReP/edXqJaZ2HrXoKhsdKaU0J/A=;
  b=NYKk2v0hF1NCQR6nRqKnKg8w4aKmgjC6xpR2jMfx2225qcr6Jmm/3W3X
   VUq43UjNvS+BHs8N4Rt2iV8uoGBh0sxcfaxxkcazOxiUCzmRydpufzFK+
   iPmKUDsvdzQM79jMExUDsMV4iuvGVBWT/jrqss4FUe1srDjECDpJwcxy4
   rj/fBSlnI5G1jeKq+4QXgAw2G532qRPDf2+FRPx+tCLxDYHYx7Rx+h7HT
   Er5F/DKKC3ouvHZxevVI2OhQ6RAdNO9kIPB7VTxa40sBUXsJDyYJZHfww
   soCu4D45YYqEhSaMGPKTx78figvetN45s2fAfwOTvZWpz9K9JsZU9otu+
   w==;
X-CSE-ConnectionGUID: rkPiVYxJTceGb+H5D6G0+w==
X-CSE-MsgGUID: a/WiY5aATmugumjIZgq68A==
X-IPAS-Result: =?us-ascii?q?A0BMAABDeI5q/4sQJK1aGQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RIBAQEBAQEBAQEBAQGBfAQBAQEBAQsBglZ0XkNJA4xviViBFopRhWaLOYEYF?=
 =?us-ascii?q?IFqDwEBAQ9EDQQBAYQ/Ro1uAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NhloBAgEdGAEYASAKAywDAQIZNgsjIYMCAYI6AzcDEQa+U?=
 =?us-ascii?q?IIsgQGDKAE/AkNQ2EsNglgBCxQBgTgBhT6Cf4UjXRgBRIQ4FxAbG4FygRWCK?=
 =?us-ascii?q?Up2gQWBGkIBAQGBRWqFdQSCInoSgVpuKIhEiC5IgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspYAESF4EJggcCglqCB?=
 =?us-ascii?q?QIBSUMOB0c+CxgNSBEsNxQZBD5uB45rH4FYagYBARUnGwkaCQgCAQofAQEXR?=
 =?us-ascii?q?jQPDxQUPhccAgQDFw8DkkMdETGPZYIhgTWeHE1xCiiDdowijz6FfBozgVaCL?=
 =?us-ascii?q?oFXkkCSUQuYfY4KhAmDU41aBS0YUIRpgWg8gUcLB3AVO4JnCRY0GQ+OKgMLC?=
 =?us-ascii?q?4NggX+DFFHGVScyAgkDLwEBBwIHDgMLgWiQAAIkAgdEgQsBAQ?=
IronPort-Data: A9a23:/Rn7t6j+X/oWKrHXxXQnLP/iX161MREKZh0ujC45NGQN5FlHY01je
 htvXziGbK2MNmTzc9Ejbomxp0tVu8LRm4NrGQE+/iFgE3ljpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMu/jd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUC+d52P1Be1
 8ATJR8HLTDeq7yZmPGkH7wEasQLdKEHPasWvnVmiDWcBvE8TNWbGePB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQUaz/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKFI43bHpoIxxbwS
 mTu9iPGAyBHPfWjzCeK73eup93AhH2rcddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFmQHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289lte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:ZECBaqAFwy1dbvnlHema55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGgb1/qA/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njdLz7lq+P3lpxBQozlvhBQcT0=
X-Talos-CUID: 9a23:nRX+imMF/oe2q+5DQipf9XAlCuIZeXDyxjTwfmPmJj4qV+jA
X-Talos-MUID: 9a23:T+3ZygRNEIB6AeWYRXTlww5jBZphypirFU8QlJcnicada3xZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="819937518"
Received: from alln-l-core-02.cisco.com ([173.36.16.139])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 05:26:57 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-02.cisco.com (Postfix) with ESMTPS id 7ED3818000218;
	Wed, 26 Aug 2026 05:26:57 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 15F21CCA79B; Tue, 25 Aug 2026 22:26:57 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 1/3] python3-django: fix CVE-2026-15307
Date: Tue, 25 Aug 2026 22:26:52 -0700
Message-Id: <20260826052654.723156-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 05:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129479

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/django/django/commit/115ffd0463a765ab1cc93de18e94b5459b8a300e
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-15307

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../CVE-2026-15307.patch                      | 563 ++++++++++++++++++
 .../python/python3-django_5.0.14.bb           |   1 +
 2 files changed, 564 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2026-15307.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2026-15307.patch b/meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2026-15307.patch
new file mode 100644
index 0000000000..ce45e92faf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2026-15307.patch
@@ -0,0 +1,563 @@
+From 1776209a7609053b6afe6cb0f14960c478de5424 Mon Sep 17 00:00:00 2001
+From: Jacob Walls <jacobtylerwalls@gmail.com>
+Date: Thu, 9 Jul 2026 11:07:28 -0400
+Subject: [PATCH] [5.2.x] Fixed CVE-2026-15307 -- Blocked raster strings and
+ dicts in spatial lookups.
+
+Spatial lookups optimistically parse values as rasters before retrying
+as geometries. If a malicious value reached the GDALRaster constructor,
+depending on the raster driver, it might write to disk or fetch from the
+network regardless of the constructor's `write=False` default argument.
+
+Although this works as designed for model field assignment, this is
+potentially unexpected for querying, for example, in the admin's
+changelist view, which allows staff users to execute arbitrary lookups
+on models registered with the admin.
+
+Network rasters didn't even work in lookup contexts before, providing
+further evidence that this use case was unintentional. (The failure
+point was after the fetching, however.)
+
+Now, strings and dicts representing rasters are rejected by spatial
+lookups. To opt in to using them, wrap them in a `GDALRaster` first.
+
+Although it would simplify the implementation to try geometries before
+rasters (instead of stashing a raster exception and raising it later),
+we maintain the current order, which has been stable for a decade.
+
+Thanks Bence Nagy, localhost-detect, and kimchunbok_ for providing
+information useful in evaluating this report. Thanks Simon Charette,
+Natalia Bidart, and Sarah Boyce for reviews.
+
+Backport of f1949c1f9758947ade984c895ff16bef46f56520 from main.
+
+CVE: CVE-2026-15307
+Upstream-Status: Backport [https://github.com/django/django/commit/115ffd0463a765ab1cc93de18e94b5459b8a300e]
+
+Backport Changes:
+- Dropped the file docs/releases/5.2.17.txt as
+  current version for Scarthgap is 5.0.14
+
+(cherry picked from commit 115ffd0463a765ab1cc93de18e94b5459b8a300e)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ django/contrib/gis/db/models/fields.py        | 37 +++++---
+ django/contrib/gis/gdal/raster/source.py      | 46 ++++++++--
+ docs/ref/contrib/gis/db-api.txt               | 12 ++-
+ docs/ref/contrib/gis/gdal.txt                 | 34 +++++++
+ tests/gis_tests/geoadmin/tests.py             | 25 ++++-
+ tests/gis_tests/geoapp/tests.py               | 91 +++++++++++++++++++
+ tests/gis_tests/rasterapp/test_rasterfield.py | 25 ++---
+ tests/gis_tests/test_geoforms.py              | 15 +++
+ 8 files changed, 246 insertions(+), 39 deletions(-)
+
+diff --git a/django/contrib/gis/db/models/fields.py b/django/contrib/gis/db/models/fields.py
+index 889c1cfe84..15d9ae3c57 100644
+--- a/django/contrib/gis/db/models/fields.py
++++ b/django/contrib/gis/db/models/fields.py
+@@ -3,6 +3,9 @@ from collections import defaultdict, namedtuple
+ from django.contrib.gis import forms, gdal
+ from django.contrib.gis.db.models.proxy import SpatialProxy
+ from django.contrib.gis.gdal.error import GDALException
++from django.contrib.gis.gdal.raster.const import VSI_FILESYSTEM_PREFIX
++from django.contrib.gis.gdal.raster.source import DisallowedRasterLookup
++from django.contrib.gis.geometry import json_regex
+ from django.contrib.gis.geos import (
+     GeometryCollection,
+     GEOSException,
+@@ -172,21 +175,19 @@ class BaseSpatialField(Field):
+     def get_raster_prep_value(self, value, is_candidate):
+         """
+         Return a GDALRaster if conversion is successful, otherwise return None.
++
++        Unless the user opts in by wrapping values in a GDALRaster, raise
++        DisallowedRasterLookup for values that fetch or write to disk.
+         """
+         if isinstance(value, gdal.GDALRaster):
+             return value
+-        elif is_candidate:
++        gdal.GDALRaster.check_raster_lookup_value(value)
++        if is_candidate:
+             try:
+                 return gdal.GDALRaster(value)
+             except GDALException:
+                 pass
+-        elif isinstance(value, dict):
+-            try:
+-                return gdal.GDALRaster(value)
+-            except GDALException:
+-                raise ValueError(
+-                    "Couldn't create spatial object from lookup value '%s'." % value
+-                )
++        return None
+ 
+     def get_prep_value(self, value):
+         obj = super().get_prep_value(value)
+@@ -202,22 +203,36 @@ class BaseSpatialField(Field):
+                 obj, "__geo_interface__"
+             )
+             # Try to convert the input to raster.
+-            raster = self.get_raster_prep_value(obj, is_candidate)
+-
++            raster = None
++            blocked_err = None
++            try:
++                raster = self.get_raster_prep_value(obj, is_candidate)
++            except DisallowedRasterLookup as err:
++                if isinstance(obj, dict):
++                    raise err
++                # Don't immediately raise in case this is a valid GEOSGeometry.
++                blocked_err = err
+             if raster:
+                 obj = raster
+             elif is_candidate:
+                 try:
+                     obj = GEOSGeometry(obj)
++                except (TypeError, ValueError) as err:
++                    if isinstance(obj, str) and obj.startswith(VSI_FILESYSTEM_PREFIX):
++                        raise blocked_err
++                    raise err
+                 except (GEOSException, GDALException):
++                    if isinstance(obj, str) and json_regex.match(obj):
++                        raise blocked_err
+                     raise ValueError(
+                         "Couldn't create spatial object from lookup value '%s'." % obj
+                     )
+             else:
+-                raise ValueError(
++                msg = (
+                     "Cannot use object with type %s for a spatial lookup parameter."
+                     % type(obj).__name__
+                 )
++                raise blocked_err or ValueError(msg)
+ 
+         # Assigning the SRID value.
+         obj.srid = self.get_srid(obj)
+diff --git a/django/contrib/gis/gdal/raster/source.py b/django/contrib/gis/gdal/raster/source.py
+index b33eb11c0f..f63e7d0f30 100644
+--- a/django/contrib/gis/gdal/raster/source.py
++++ b/django/contrib/gis/gdal/raster/source.py
+@@ -28,10 +28,19 @@ from django.contrib.gis.gdal.raster.const import (
+ )
+ from django.contrib.gis.gdal.srs import SpatialReference, SRSException
+ from django.contrib.gis.geometry import json_regex
++from django.core.exceptions import SuspiciousOperation
+ from django.utils.encoding import force_bytes, force_str
+ from django.utils.functional import cached_property
+ 
+ 
++class DisallowedRasterLookup(SuspiciousOperation):
++    """
++    Types that force GDALRaster to open in write mode (dict) or values that
++    could be virtual filesystem paths (str) are not allowed in lookup contexts.
++    Instead, wrap values in GDALRaster explicitly.
++    """
++
++
+ class TransformPoint(list):
+     indices = {
+         "origin": (0, 3),
+@@ -78,14 +87,10 @@ class GDALRaster(GDALRasterBase):
+         self._write = 1 if write else 0
+         Driver.ensure_registered()
+ 
+-        # Preprocess json inputs. This converts json strings to dictionaries,
+-        # which are parsed below the same way as direct dictionary inputs.
+-        if isinstance(ds_input, str) and json_regex.match(ds_input):
+-            ds_input = json.loads(ds_input)
++        ds_input = self._preprocess_input(ds_input)
+ 
+         # If input is a valid file path, try setting file as source.
+-        if isinstance(ds_input, (str, Path)):
+-            ds_input = str(ds_input)
++        if isinstance(ds_input, str):
+             if not ds_input.startswith(VSI_FILESYSTEM_PREFIX) and not os.path.exists(
+                 ds_input
+             ):
+@@ -226,6 +231,35 @@ class GDALRaster(GDALRasterBase):
+         """
+         return "<Raster object at %s>" % hex(addressof(self._ptr))
+ 
++    @classmethod
++    def _preprocess_input(cls, ds_input):
++        """
++        Preprocess json and Path inputs. This converts json strings to
++        dictionaries, which are then parsed just like direct dictionary inputs.
++        This also stringifies Path objects.
++        """
++        if isinstance(ds_input, str) and json_regex.match(ds_input):
++            ds_input = json.loads(ds_input)
++        if isinstance(ds_input, Path):
++            ds_input = str(ds_input)
++        return ds_input
++
++    @classmethod
++    def check_raster_lookup_value(cls, ds_input):
++        """
++        Raise DisallowedRasterLookup for values inappropriate in lookups:
++        - No dicts, which GDALRaster(write=False) might still write to.
++        - No strings or Paths, which might fetch over the virtual filesystem.
++        """
++        normalized = cls._preprocess_input(ds_input)
++        if isinstance(normalized, (dict, str)):
++            msg = (
++                f"Cannot use object {normalized!r} for a spatial lookup "
++                "parameter. If this is a raster, wrap it with GDALRaster() "
++                "before using it in a lookup to enable writing or fetching."
++            )
++            raise DisallowedRasterLookup(msg)
++
+     def _flush(self):
+         """
+         Flush all data from memory into the source file if it exists.
+diff --git a/docs/ref/contrib/gis/db-api.txt b/docs/ref/contrib/gis/db-api.txt
+index df1d3847e6..51dece9b63 100644
+--- a/docs/ref/contrib/gis/db-api.txt
++++ b/docs/ref/contrib/gis/db-api.txt
+@@ -146,11 +146,21 @@ GeoDjango are only available on spatial fields.
+ 
+ Filters on 'normal' fields (e.g. :class:`~django.db.models.CharField`)
+ may be chained with those on geographic fields. Geographic lookups accept
+-geometry and raster input on both sides and input types can be mixed freely.
++geometry and raster input on both sides, and input types can be mixed freely in
++most cases. However, unlike assignments to model fields, with lookups,
++types such as ``str``, :class:`pathlib.Path`, and ``dict`` must be wrapped by
++:class:`~django.contrib.gis.gdal.GDALRaster` to signify that the potential for
++file writing or network fetching is acceptable. For the rationale, see
++:ref:`raster security considerations <raster-security>`.
+ 
+ The general structure of geographic lookups is described below. A complete
+ reference can be found in the :ref:`spatial lookup reference<spatial-lookups>`.
+ 
++.. versionchanged:: 5.2.17
++
++    In earlier versions, spatial lookups accepted ``str`` and ``dict`` types
++    for new rasters, allowing file writes and network fetches.
++
+ Geometry Lookups
+ ----------------
+ 
+diff --git a/docs/ref/contrib/gis/gdal.txt b/docs/ref/contrib/gis/gdal.txt
+index 9011aa6e2b..2df807ee74 100644
+--- a/docs/ref/contrib/gis/gdal.txt
++++ b/docs/ref/contrib/gis/gdal.txt
+@@ -2068,6 +2068,40 @@ previously configured for authentication and possibly other settings (see the
+ 
+ .. _`GDAL Virtual Filesystems documentation`: https://gdal.org/user/virtual_file_systems.html
+ 
++.. _raster-security:
++
++Security considerations
++~~~~~~~~~~~~~~~~~~~~~~~
++
++Since :class:`GDALRaster` always opens new rasters in write mode, it is
++essential to prevent instantiating one from untrusted input. Otherwise, an
++attacker might gain the ability to write a file or make a network request.
++
++To mitigate this, :ref:`spatial lookups <spatial-lookups-intro>` prevent
++``str``, :class:`pathlib.Path`, and ``dict`` values from reaching
++:class:`GDALRaster` altogether. To use these types with lookups, wrap them
++explicitly with :class:`GDALRaster`, indicating that the value is trusted.
++Bytes are accepted without being wrapped in :class:`GDALRaster` because they
++are opened through GDAL's memory-based :ref:`virtual filesystem
++<gdal-raster-vsimem>`.
++
++This protection applies only to spatial lookups. Assigning a ``dict`` value to
++a :class:`~django.contrib.gis.db.models.RasterField` will still open a new
++raster, and assigning a ``str`` or ``Path`` will still fetch and open the
++referenced raster.
++
++When validating geometry inputs, the
++:class:`~django.contrib.gis.forms.GeometryField` form field will reject raster
++values. When validating raster inputs, you should write custom validation.
++
++For defense-in-depth strategies for limiting the available raster drivers, see
++`GDAL security considerations <https://gdal.org/user/security.html>`_.
++
++.. versionchanged:: 5.2.17
++
++    In earlier versions, spatial lookups accepted ``str`` and ``dict`` types
++    for new rasters, allowing file writes and network fetches.
++
+ Settings
+ ========
+ 
+diff --git a/tests/gis_tests/geoadmin/tests.py b/tests/gis_tests/geoadmin/tests.py
+index e101050464..2db36b49de 100644
+--- a/tests/gis_tests/geoadmin/tests.py
++++ b/tests/gis_tests/geoadmin/tests.py
+@@ -1,13 +1,26 @@
++from django.contrib.auth.models import Permission, User
++from django.contrib.contenttypes.models import ContentType
+ from django.contrib.gis.geos import Point
+-from django.test import SimpleTestCase, override_settings
++from django.core.exceptions import SuspiciousOperation
++from django.test import RequestFactory, TestCase, override_settings
+ 
+ from .models import City, site, site_gis, site_gis_custom
+ 
+ 
+ @override_settings(ROOT_URLCONF="django.contrib.gis.tests.geoadmin.urls")
+-class GeoAdminTest(SimpleTestCase):
++class GeoAdminTest(TestCase):
+     admin_site = site  # ModelAdmin
+ 
++    @classmethod
++    def setUpTestData(cls):
++        cls.user = User.objects.create_user("test", password="password", is_staff=True)
++        cls.user.user_permissions.add(
++            Permission.objects.get(
++                codename="view_city",
++                content_type=ContentType.objects.get_for_model(City),
++            )
++        )
++
+     def test_widget_empty_string(self):
+         geoadmin = self.admin_site.get_model_admin(City)
+         form = geoadmin.get_changelist_form(None)({"point": ""})
+@@ -54,6 +67,14 @@ class GeoAdminTest(SimpleTestCase):
+         self.assertIs(has_changed(initial, data_almost_same), False)
+         self.assertIs(has_changed(initial, data_changed), True)
+ 
++    def test_raster_lookup_not_allowed(self):
++        geoadmin = self.admin_site.get_model_admin(City)
++        request = RequestFactory().get("/city/", data={"point": "/vsicurl/someurl"})
++        request.user = self.user
++        msg = "Cannot use object '/vsicurl/someurl' for a spatial lookup parameter."
++        with self.assertRaisesMessage(SuspiciousOperation, msg):
++            geoadmin.get_changelist_instance(request)
++
+ 
+ class GISAdminTests(GeoAdminTest):
+     admin_site = site_gis  # GISModelAdmin
+diff --git a/tests/gis_tests/geoapp/tests.py b/tests/gis_tests/geoapp/tests.py
+index 7ee47ee9a8..6be13d4907 100644
+--- a/tests/gis_tests/geoapp/tests.py
++++ b/tests/gis_tests/geoapp/tests.py
+@@ -1,7 +1,10 @@
++import json
+ from io import StringIO
++from pathlib import Path
+ 
+ from django.contrib.gis import gdal
+ from django.contrib.gis.db.models import Extent, MakeLine, Union, functions
++from django.contrib.gis.gdal.raster.source import DisallowedRasterLookup
+ from django.contrib.gis.geos import (
+     GeometryCollection,
+     GEOSGeometry,
+@@ -21,6 +24,7 @@ from django.db.models import F, OuterRef, Subquery
+ from django.test import TestCase, skipUnlessDBFeature
+ from django.test.utils import CaptureQueriesContext
+ 
++from ..data.rasters.textrasters import JSON_RASTER
+ from ..utils import skipUnlessGISLookup
+ from .models import (
+     City,
+@@ -598,6 +602,93 @@ class GeoLookupTest(TestCase):
+         )
+         self.assertEqual(qs.get(), multifields)
+ 
++    def test_lookup_rejects_writing_or_fetching_rasters(self):
++        """
++        GDALRaster enables write mode in the following cases even when the
++        value of the `write` parameter is False (default):
++        - dicts
++        - strings matching a json regex
++        - bytes
++
++        Since this could be unexpected in a lookup context, disallow dicts
++        and strings: instead, explicitly wrap with GDALRaster() to signal that
++        a write or fetch is expected. Bytes only write to the in-memory virtual
++        filesystem, so allow them.
++
++        Disallowing strings also disallows paths to local or network rasters,
++        but those didn't work in the lookup context anyway, since they were
++        never opened for writing, and lookups failed on setting the SRID with:
++
++        GDALException: Raster needs to be opened in write mode to change values
++
++        Still, a network fetch might have occurred before that failure point,
++        so disallow strings altogether.
++        """
++        # Create a vsi-based raster from scratch.
++        vsimem_path = "/vsimem/raster.tif"
++        # Keep a reference to this raster while it is being re-parsed below.
++        # Otherwise, GDALRaster.__del__() will delete the in-memory raster.
++        _rast = gdal.GDALRaster(  # NOQA: F841
++            {
++                "name": vsimem_path,
++                "driver": "tif",
++                "width": 4,
++                "height": 4,
++                "srid": 4326,
++                "bands": [
++                    {
++                        "data": range(16),
++                    }
++                ],
++            }
++        )
++        existing_path = Path(__file__).parent.parent / "data" / "rasters" / "raster.tif"
++        disallowed_cases = [
++            JSON_RASTER,
++            json.loads(JSON_RASTER),
++            "/vsicurl/someurl",
++            "/vsicurl_streaming/someurl",
++            "/vsis3/someurl",
++            vsimem_path,
++            existing_path,
++        ]
++        for obj in disallowed_cases:
++            try:
++                msg_obj = json.loads(obj)
++            except Exception:
++                if isinstance(obj, Path):
++                    msg_obj = str(obj)
++                else:
++                    msg_obj = obj
++            msg = (
++                f"Cannot use object {msg_obj!r} for a spatial lookup parameter. "
++                "If this is a raster, wrap it with GDALRaster() before using "
++                "it in a lookup to enable writing or fetching."
++            )
++            with (
++                self.subTest(obj=obj),
++                self.assertRaisesMessage(DisallowedRasterLookup, msg),
++            ):
++                City.objects.filter(point__contained=obj)
++
++        # Strings having nothing to do with rasters raise a more generic error.
++        for obj in str(existing_path), "invalid":
++            msg = "String input unrecognized as WKT EWKT, and HEXEWKB."
++            with self.subTest(obj=obj), self.assertRaisesMessage(ValueError, msg):
++                City.objects.filter(point__contained=obj)
++
++    def test_lookup_allows_writing_raster_from_bytes(self):
++        raster_path = Path(__file__).parent.parent / "data" / "rasters" / "raster.tif"
++        with open(raster_path, "rb") as raster_file:
++            raster_bytes = raster_file.read()
++        # Just get SQL to avoid gating on connection.supports_raster.
++        City.objects.filter(point__contained=raster_bytes).query
++
++    def test_lookup_allows_geos_geometry_string(self):
++        geojson = json.dumps({"type": "Point", "coordinates": [2, 49]})
++        # Just get SQL to avoid gating on connection.supports_raster.
++        City.objects.filter(point__contained=geojson).query
++
+ 
+ class GeoQuerySetTest(TestCase):
+     # TODO: GeoQuerySet is removed, organize these test better.
+diff --git a/tests/gis_tests/rasterapp/test_rasterfield.py b/tests/gis_tests/rasterapp/test_rasterfield.py
+index 3f2ce770a9..37eec50027 100644
+--- a/tests/gis_tests/rasterapp/test_rasterfield.py
++++ b/tests/gis_tests/rasterapp/test_rasterfield.py
+@@ -207,7 +207,7 @@ class RasterFieldTest(TransactionTestCase):
+                     (stx_pnt, 0, 500),
+                     (stx_pnt, D(km=1000)),
+                     (rast, 500),
+-                    (json.loads(JSON_RASTER), 500),
++                    (GDALRaster(json.loads(JSON_RASTER)), 500),
+                 ]
+             elif name == "relate":
+                 # Set lookup values for the relate lookup.
+@@ -218,7 +218,7 @@ class RasterFieldTest(TransactionTestCase):
+                     (stx_pnt, 0, "T*T***FF*"),
+                     (stx_pnt, "T*T***FF*"),
+                     (rast, "T*T***FF*"),
+-                    (json.loads(JSON_RASTER), "T*T***FF*"),
++                    (GDALRaster(json.loads(JSON_RASTER)), "T*T***FF*"),
+                 ]
+             elif name == "isvalid":
+                 # The isvalid lookup doesn't make sense for rasters.
+@@ -232,7 +232,7 @@ class RasterFieldTest(TransactionTestCase):
+                     (stx_pnt, 0),
+                     stx_pnt,
+                     rast,
+-                    json.loads(JSON_RASTER),
++                    GDALRaster(json.loads(JSON_RASTER)),
+                 ]
+             else:
+                 # Override band lookup for these, as it's not supported.
+@@ -245,7 +245,7 @@ class RasterFieldTest(TransactionTestCase):
+                     stx_pnt,
+                     stx_pnt,
+                     rast,
+-                    json.loads(JSON_RASTER),
++                    GDALRaster(json.loads(JSON_RASTER)),
+                 ]
+ 
+             # Create query filter combinations.
+@@ -287,14 +287,6 @@ class RasterFieldTest(TransactionTestCase):
+         qs = RasterModel.objects.filter(rastprojected__dwithin=(rast, D(km=1)))
+         self.assertEqual(qs.count(), 1)
+ 
+-        qs = RasterModel.objects.filter(
+-            rastprojected__dwithin=(json.loads(JSON_RASTER), D(km=1))
+-        )
+-        self.assertEqual(qs.count(), 1)
+-
+-        qs = RasterModel.objects.filter(rastprojected__dwithin=(JSON_RASTER, D(km=1)))
+-        self.assertEqual(qs.count(), 1)
+-
+         # Filter in an unprojected coordinate system.
+         qs = RasterModel.objects.filter(rast__dwithin=(rast, 40))
+         self.assertEqual(qs.count(), 1)
+@@ -414,13 +406,8 @@ class RasterFieldTest(TransactionTestCase):
+         self.assertEqual(qs.count(), 0)
+ 
+     def test_lookup_value_error(self):
+-        # Test with invalid dict lookup parameter
+-        obj = {}
+-        msg = "Couldn't create spatial object from lookup value '%s'." % obj
+-        with self.assertRaisesMessage(ValueError, msg):
+-            RasterModel.objects.filter(geom__intersects=obj)
+         # Test with invalid string lookup parameter
+-        obj = "00000"
++        obj = "POINT()"
+         msg = "Couldn't create spatial object from lookup value '%s'." % obj
+         with self.assertRaisesMessage(ValueError, msg):
+             RasterModel.objects.filter(geom__intersects=obj)
+@@ -449,7 +436,7 @@ class RasterFieldTest(TransactionTestCase):
+     def test_lhs_with_index_rhs_without_index(self):
+         with CaptureQueriesContext(connection) as queries:
+             RasterModel.objects.filter(
+-                rast__0__contains=json.loads(JSON_RASTER)
++                rast__0__contains=GDALRaster(json.loads(JSON_RASTER))
+             ).exists()
+         # It's easier to check the indexes in the generated SQL than to write
+         # tests that cover all index combinations.
+diff --git a/tests/gis_tests/test_geoforms.py b/tests/gis_tests/test_geoforms.py
+index b8105645bf..b980892790 100644
+--- a/tests/gis_tests/test_geoforms.py
++++ b/tests/gis_tests/test_geoforms.py
+@@ -8,6 +8,8 @@ from django.test import SimpleTestCase, override_settings
+ from django.utils.deprecation import RemovedInDjango51Warning
+ from django.utils.html import escape
+ 
++from .data.rasters.textrasters import JSON_RASTER
++
+ 
+ class GeometryFieldTest(SimpleTestCase):
+     def test_init(self):
+@@ -82,6 +84,19 @@ class GeometryFieldTest(SimpleTestCase):
+         with self.assertRaises(ValidationError):
+             pnt_fld.clean("LINESTRING(0 0, 1 1)")
+ 
++    def test_raster_types(self):
++        fld = forms.GeometryField()
++        for value in (
++            JSON_RASTER,
++            str(JSON_RASTER),
++            "/vsicurl/http://example.com/raster.tif",
++        ):
++            with (
++                self.subTest(value=value),
++                self.assertRaisesMessage(ValidationError, "Invalid geometry value."),
++            ):
++                fld.clean(value)
++
+     def test_to_python(self):
+         """
+         to_python() either returns a correct GEOSGeometry object or
+-- 
+2.44.4
diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.14.bb b/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
index 8a7cd2be16..c54e96fd7a 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://CVE-2025-64460.patch \
             file://CVE-2025-64459-2.patch \
             file://CVE-2025-57833.patch \
             file://CVE-2025-59681.patch \
+            file://CVE-2026-15307.patch \
            "
 SRC_URI[sha256sum] = "29019a5763dbd48da1720d687c3522ef40d1c61be6fb2fad27ed79e9f655bc11"
 
-- 
2.35.6


