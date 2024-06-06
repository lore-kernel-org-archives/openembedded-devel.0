Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C79BC27C54
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 17:18:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20596.1717694296892116482
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 10:18:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD7752F4
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 10:18:40 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1199F3F792
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 10:18:15 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] python3-h5py: upgrade to 3.11.0
Date: Thu,  6 Jun 2024 17:18:14 +0000
Message-Id: <20240606171814.3117902-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 17:18:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110756

Notably, this release builds with Cython 3 and GCC 14.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0001-Fix-Cython-3-compatibility.patch     | 796 ------------------
 ...-h5py_3.10.0.bb =3D> python3-h5py_3.11.0.bb} |   5 +-
 2 files changed, 2 insertions(+), 799 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001=
-Fix-Cython-3-compatibility.patch
 rename meta-python/recipes-devtools/python/{python3-h5py_3.10.0.bb =3D> =
python3-h5py_3.11.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-Fix-Cy=
thon-3-compatibility.patch b/meta-python/recipes-devtools/python/python3-=
h5py/0001-Fix-Cython-3-compatibility.patch
deleted file mode 100644
index aba62ddf14..0000000000
--- a/meta-python/recipes-devtools/python/python3-h5py/0001-Fix-Cython-3-=
compatibility.patch
+++ /dev/null
@@ -1,796 +0,0 @@
-From 1e02dbe5533d679b9ef064078a303607a7d0542a Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 29 Dec 2023 14:33:38 +0100
-Subject: [PATCH] Fix Cython 3 compatibility
-
-Upstream-Status: Backport [https://github.com/h5py/h5py/pull/2345/commit=
s]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- benchmarks/benchmark_slicing.py    | 12 ++++----
- docs/conf.py                       |  2 +-
- docs/high/dataset.rst              |  4 +--
- docs/high/file.rst                 |  6 ++--
- docs/requirements-rtd.txt          |  5 ++--
- docs/vds.rst                       |  2 +-
- docs/whatsnew/3.0.rst              |  2 +-
- docs/whatsnew/3.7.rst              |  4 +--
- h5py/_errors.pxd                   | 10 +++----
- h5py/_errors.pyx                   |  4 +--
- h5py/_hl/base.py                   |  4 +--
- h5py/_hl/dataset.py                |  8 ++---
- h5py/_hl/dims.py                   |  3 +-
- h5py/_hl/files.py                  |  2 +-
- h5py/_locks.pxi                    |  6 ++--
- h5py/_proxy.pyx                    |  4 +--
- h5py/_selector.pyx                 |  2 +-
- h5py/api_compat.h                  | 13 ++++----
- h5py/api_types_hdf5.pxd            | 48 +++++++++++++++---------------
- h5py/h5fd.pyx                      | 38 ++++++++++++++++-------
- h5py/h5p.pyx                       |  4 +--
- h5py/h5t.pyx                       |  2 +-
- h5py/tests/test_attrs_data.py      |  2 +-
- h5py/tests/test_big_endian_file.py |  4 +--
- h5py/tests/test_dataset.py         |  4 +--
- h5py/tests/test_file.py            |  6 ++--
- h5py/tests/test_file_alignment.py  |  4 +--
- h5py/tests/test_group.py           |  4 +--
- h5py/tests/test_selections.py      |  2 +-
- pylintrc                           |  2 +-
- pyproject.toml                     |  2 +-
- setup_configure.py                 |  2 +-
- tox.ini                            |  2 +-
- 33 files changed, 116 insertions(+), 103 deletions(-)
-
-diff --git a/benchmarks/benchmark_slicing.py b/benchmarks/benchmark_slic=
ing.py
-index e9a34dad..b833f012 100644
---- a/benchmarks/benchmark_slicing.py
-+++ b/benchmarks/benchmark_slicing.py
-@@ -7,7 +7,7 @@ import logging
- logger =3D logging.getLogger(__name__)
- import h5py
-=20
--#Needed for mutithreading:
-+#Needed for multithreading:
- from queue import Queue
- from threading import Thread, Event
- import multiprocessing
-@@ -173,8 +173,8 @@ class SlicingBenchmark:
-=20
- if __name__ =3D=3D "__main__":
-     logging.basicConfig(level=3Dlogging.INFO)
--    benckmark =3D SlicingBenchmark()
--    benckmark.setup()
--    benckmark.time_sequential_reads()
--    benckmark.time_threaded_reads()
--    benckmark.teardown()
-+    benchmark =3D SlicingBenchmark()
-+    benchmark.setup()
-+    benchmark.time_sequential_reads()
-+    benchmark.time_threaded_reads()
-+    benchmark.teardown()
-diff --git a/docs/conf.py b/docs/conf.py
-index 93b23939..a0f6c1ac 100644
---- a/docs/conf.py
-+++ b/docs/conf.py
-@@ -109,7 +109,7 @@ pygments_style =3D 'sphinx'
-=20
- # The theme to use for HTML and HTML Help pages.  See the documentation=
 for
- # a list of builtin themes.
--html_theme =3D 'default'
-+html_theme =3D 'sphinx_rtd_theme'
-=20
- # Theme options are theme-specific and customize the look and feel of a=
 theme
- # further.  For a list of options available for each theme, see the
-diff --git a/docs/high/dataset.rst b/docs/high/dataset.rst
-index 0f27284f..cb75fffe 100644
---- a/docs/high/dataset.rst
-+++ b/docs/high/dataset.rst
-@@ -58,7 +58,7 @@ the requested ``dtype``.
- Reading & writing data
- ----------------------
-=20
--HDF5 datasets re-use the NumPy slicing syntax to read and write to the =
file.
-+HDF5 datasets reuse the NumPy slicing syntax to read and write to the f=
ile.
- Slice specifications are translated directly to HDF5 "hyperslab"
- selections, and are a fast and efficient way to access data in the file=
. The
- following slicing arguments are recognized:
-@@ -464,7 +464,7 @@ Reference
-         >>> dset =3D f["MyDS"]
-         >>> f.close()
-         >>> if dset:
--        ...     print("datset accessible")
-+        ...     print("dataset accessible")
-         ... else:
-         ...     print("dataset inaccessible")
-         dataset inaccessible
-diff --git a/docs/high/file.rst b/docs/high/file.rst
-index 484498ce..e757fe1a 100644
---- a/docs/high/file.rst
-+++ b/docs/high/file.rst
-@@ -392,7 +392,7 @@ Data alignment
- When creating datasets within files, it may be advantageous to align th=
e offset
- within the file itself. This can help optimize read and write times if =
the data
- become aligned with the underlying hardware, or may help with paralleli=
sm with
--MPI. Unfortunately, aligning small variables to large blocks can leave =
alot of
-+MPI. Unfortunately, aligning small variables to large blocks can leave =
a lot of
- empty space in a file. To this effect, application developers are left =
with two
- options to tune the alignment of data within their file.  The two varia=
bles
- ``alignment_threshold`` and ``alignment_interval``  in the :class:`File=
`
-@@ -415,7 +415,7 @@ number of regions. Setting a small value can reduce =
the overall file size,
- especially in combination with the ``libver`` option. This controls how=
 the
- overall data and metadata are laid out within the file.
-=20
--For more information, see the offical HDF5 documentation `H5P_SET_META_=
BLOCK_SIZE
-+For more information, see the official HDF5 documentation `H5P_SET_META=
_BLOCK_SIZE
- <https://portal.hdfgroup.org/display/HDF5/H5P_SET_META_BLOCK_SIZE>`_.
-=20
- Reference
-@@ -497,7 +497,7 @@ Reference
-             Only available with HDF5 >=3D 1.12.1 or 1.10.x >=3D 1.10.7.
-     :param alignment_threshold: Together with ``alignment_interval``, t=
his
-             property ensures that any file object greater than or equal
--            in size to the alignement threshold (in bytes) will be
-+            in size to the alignment threshold (in bytes) will be
-             aligned on an address which is a multiple of alignment inte=
rval.
-     :param alignment_interval: This property should be used in conjunct=
ion with
-             ``alignment_threshold``. See the description above. For mor=
e
-diff --git a/docs/requirements-rtd.txt b/docs/requirements-rtd.txt
-index e67a3eee..52096927 100644
---- a/docs/requirements-rtd.txt
-+++ b/docs/requirements-rtd.txt
-@@ -1,3 +1,2 @@
--sphinx=3D=3D4.3.0
--sphinx_rtd_theme=3D=3D1.0.0
--readthedocs-sphinx-search=3D=3D0.1.1
-+sphinx=3D=3D7.2.6
-+sphinx_rtd_theme=3D=3D1.3.0
-diff --git a/docs/vds.rst b/docs/vds.rst
-index a9a7c7f6..bd47ad1c 100644
---- a/docs/vds.rst
-+++ b/docs/vds.rst
-@@ -124,7 +124,7 @@ Reference
-    slice it to indicate which regions should be used in the virtual dat=
aset.
-=20
-    When `creating a virtual dataset <creating_vds_>`_, paths to sources=
 present
--   in the same file are changed to a ".", refering to the current file =
(see
-+   in the same file are changed to a ".", referring to the current file=
 (see
-    `H5Pset_virtual <https://portal.hdfgroup.org/display/HDF5/H5P_SET_VI=
RTUAL>`_).
-    This will keep such sources valid in case the file is renamed.
-=20
-diff --git a/docs/whatsnew/3.0.rst b/docs/whatsnew/3.0.rst
-index db30ad66..ff3c2bef 100644
---- a/docs/whatsnew/3.0.rst
-+++ b/docs/whatsnew/3.0.rst
-@@ -44,7 +44,7 @@ New features
-   See also the deprecation related to the ``external`` argument.
- * Support for setting file space strategy at file creation. Includes op=
tion to
-   persist empty space tracking between sessions. See :class:`.File` for=
 details.
--* More efficient writing when assiging a scalar to a chunked dataset, w=
hen the
-+* More efficient writing when assigning a scalar to a chunked dataset, =
when the
-   number of elements to write is no more than the size of one chunk.
- * Introduced support for the split :ref:`file driver <file_driver>`
-   (:pr:`1468`).
-diff --git a/docs/whatsnew/3.7.rst b/docs/whatsnew/3.7.rst
-index 27790254..2e822d68 100644
---- a/docs/whatsnew/3.7.rst
-+++ b/docs/whatsnew/3.7.rst
-@@ -19,7 +19,7 @@ New features
-   include it. Alternatively, you can :ref:`build h5py from source <sour=
ce_install>`
-   against an HDF5 build with the direct driver enabled.
- * The :class:`.File` constructor contains two new parameters ``alignmen=
t_threshold``,
--  and ``alignment_interval`` controling the data alignment within the H=
DF5
-+  and ``alignment_interval`` controlling the data alignment within the =
HDF5
-   file (:pr:`2040`).
- * :meth:`~.Group.create_dataset` and :meth:`~.Group.require_dataset` no=
w accept
-   parameters ``efile_prefix`` and ``virtual_prefix`` to set a filesyste=
m path
-@@ -40,7 +40,7 @@ Bug fixes
-   attributes with ``track_order=3DTrue``.
- * Fix for building with mpi4py on Python 3.10 (:pr:`2101`).
- * Fixed fancy indexing with a boolean array for a single dimension (:pr=
:`2079`).
--* Avoid returning unitialised memory when reading from a chunked datase=
t with
-+* Avoid returning uninitialised memory when reading from a chunked data=
set with
-   missing chunks and no fill value (:pr:`2076`).
- * Enable setting of fillvalue for datasets with variable length string =
dtype
-   (:pr:`2044`).
-diff --git a/h5py/_errors.pxd b/h5py/_errors.pxd
-index df9c1bbe..3cba6307 100644
---- a/h5py/_errors.pxd
-+++ b/h5py/_errors.pxd
-@@ -23,7 +23,7 @@ cdef extern from "hdf5.h":
-             H5E_ARGS,                   # invalid arguments to routine
-             H5E_RESOURCE,               # resource unavailable
-             H5E_INTERNAL,               # Internal error (too specific =
to document)
--            H5E_FILE,                   # file Accessability
-+            H5E_FILE,                   # file Accessibility
-             H5E_IO,                     # Low-level I/O
-             H5E_FUNC,                   # function Entry/Exit
-             H5E_ATOM,                   # object Atom
-@@ -121,7 +121,7 @@ cdef extern from "hdf5.h":
-             # No error
-             H5E_NONE_MINOR     # No error
-=20
--            # File accessability errors
-+            # File accessibility errors
-             H5E_FILEEXISTS     # File already exists
-             H5E_FILEOPEN       # File already open
-             H5E_CANTCREATE     # Unable to create file
-@@ -207,7 +207,7 @@ cdef extern from "hdf5.h":
-             H5E_ARGS,                   # invalid arguments to routine
-             H5E_RESOURCE,               # resource unavailable
-             H5E_INTERNAL,               # Internal error (too specific =
to document)
--            H5E_FILE,                   # file Accessability
-+            H5E_FILE,                   # file Accessibility
-             H5E_IO,                     # Low-level I/O
-             H5E_FUNC,                   # function Entry/Exit
-             H5E_ID,                     # object ID
-@@ -305,7 +305,7 @@ cdef extern from "hdf5.h":
-             # No error
-             H5E_NONE_MINOR     # No error
-=20
--            # File accessability errors
-+            # File accessibility errors
-             H5E_FILEEXISTS     # File already exists
-             H5E_FILEOPEN       # File already open
-             H5E_CANTCREATE     # Unable to create file
-@@ -425,4 +425,4 @@ ctypedef struct err_cookie:
- cdef err_cookie set_error_handler(err_cookie handler)
-=20
- # Set the default error handler set by silence_errors/unsilence_errors
--cdef void set_default_error_handler() nogil
-+cdef void set_default_error_handler() noexcept nogil
-diff --git a/h5py/_errors.pyx b/h5py/_errors.pyx
-index c3bd184e..2a7524b2 100644
---- a/h5py/_errors.pyx
-+++ b/h5py/_errors.pyx
-@@ -94,7 +94,7 @@ cdef struct err_data_t:
-     H5E_error_t err
-     int n
-=20
--cdef herr_t walk_cb(unsigned int n, const H5E_error_t *desc, void *e) n=
ogil noexcept:
-+cdef herr_t walk_cb(unsigned int n, const H5E_error_t *desc, void *e) n=
oexcept nogil:
-=20
-     cdef err_data_t *ee =3D <err_data_t*>e
-=20
-@@ -168,7 +168,7 @@ cdef err_cookie _error_handler  # Store error handle=
r used by h5py
- _error_handler.func =3D NULL
- _error_handler.data =3D NULL
-=20
--cdef void set_default_error_handler() nogil:
-+cdef void set_default_error_handler() noexcept nogil:
-     """Set h5py's current default error handler"""
-     H5Eset_auto(<hid_t>H5E_DEFAULT, _error_handler.func, _error_handler=
.data)
-=20
-diff --git a/h5py/_hl/base.py b/h5py/_hl/base.py
-index cad37053..9d261c90 100644
---- a/h5py/_hl/base.py
-+++ b/h5py/_hl/base.py
-@@ -20,7 +20,7 @@ import posixpath
- import numpy as np
-=20
- # The high-level interface is serialized; every public API function & m=
ethod
--# is wrapped in a lock.  We re-use the low-level lock because (1) it's =
fast,
-+# is wrapped in a lock.  We reuse the low-level lock because (1) it's f=
ast,
- # and (2) it eliminates the possibility of deadlocks due to out-of-orde=
r
- # lock acquisition.
- from .._objects import phil, with_phil
-@@ -524,7 +524,7 @@ def product(nums):
- # Daniel Greenfeld, BSD license), where it is attributed to bottle (Cop=
yright
- # (c) 2009-2022, Marcel Hellkamp, MIT license).
-=20
--class cached_property(object):
-+class cached_property:
-     def __init__(self, func):
-         self.__doc__ =3D getattr(func, "__doc__")
-         self.func =3D func
-diff --git a/h5py/_hl/dataset.py b/h5py/_hl/dataset.py
-index b69aba48..77b202d2 100644
---- a/h5py/_hl/dataset.py
-+++ b/h5py/_hl/dataset.py
-@@ -334,10 +334,10 @@ class ChunkIterator:
-         self._layout =3D dset.chunks
-         if source_sel is None:
-             # select over entire dataset
--            slices =3D []
--            for dim in range(rank):
--                slices.append(slice(0, self._shape[dim]))
--            self._sel =3D tuple(slices)
-+            self._sel =3D tuple(
-+                slice(0, self._shape[dim])
-+                for dim in range(rank)
-+            )
-         else:
-             if isinstance(source_sel, slice):
-                 self._sel =3D (source_sel,)
-diff --git a/h5py/_hl/dims.py b/h5py/_hl/dims.py
-index d3c9206b..0cf4c9f3 100644
---- a/h5py/_hl/dims.py
-+++ b/h5py/_hl/dims.py
-@@ -53,8 +53,7 @@ class DimensionProxy(base.CommonStateObject):
-=20
-     @with_phil
-     def __iter__(self):
--        for k in self.keys():
--            yield k
-+        yield from self.keys()
-=20
-     @with_phil
-     def __len__(self):
-diff --git a/h5py/_hl/files.py b/h5py/_hl/files.py
-index aa4fb78d..bfcf3098 100644
---- a/h5py/_hl/files.py
-+++ b/h5py/_hl/files.py
-@@ -480,7 +480,7 @@ class File(Group):
-=20
-         alignment_threshold
-             Together with ``alignment_interval``, this property ensures=
 that
--            any file object greater than or equal in size to the aligne=
ment
-+            any file object greater than or equal in size to the alignm=
ent
-             threshold (in bytes) will be aligned on an address which is=
 a
-             multiple of alignment interval.
-=20
-diff --git a/h5py/_locks.pxi b/h5py/_locks.pxi
-index bc8b2dd9..1ec4e2fc 100644
---- a/h5py/_locks.pxi
-+++ b/h5py/_locks.pxi
-@@ -63,7 +63,7 @@ cdef class FastRLock:
-         return self._owner =3D=3D pythread.PyThread_get_thread_ident()
-=20
-=20
--cdef inline bint lock_lock(FastRLock lock, long current_thread, bint bl=
ocking) nogil:
-+cdef inline bint lock_lock(FastRLock lock, long current_thread, bint bl=
ocking) noexcept nogil:
-     # Note that this function *must* hold the GIL when being called.
-     # We just use 'nogil' in the signature to make sure that no Python
-     # code execution slips in that might free the GIL
-@@ -83,7 +83,7 @@ cdef inline bint lock_lock(FastRLock lock, long curren=
t_thread, bint blocking) n
-         lock, current_thread,
-         pythread.WAIT_LOCK if blocking else pythread.NOWAIT_LOCK)
-=20
--cdef bint _acquire_lock(FastRLock lock, long current_thread, int wait) =
nogil:
-+cdef bint _acquire_lock(FastRLock lock, long current_thread, int wait) =
noexcept nogil:
-     # Note that this function *must* hold the GIL when being called.
-     # We just use 'nogil' in the signature to make sure that no Python
-     # code execution slips in that might free the GIL
-@@ -111,7 +111,7 @@ cdef bint _acquire_lock(FastRLock lock, long current=
_thread, int wait) nogil:
-     lock._count =3D 1
-     return 1
-=20
--cdef inline void unlock_lock(FastRLock lock) nogil:
-+cdef inline void unlock_lock(FastRLock lock) noexcept nogil:
-     # Note that this function *must* hold the GIL when being called.
-     # We just use 'nogil' in the signature to make sure that no Python
-     # code execution slips in that might free the GIL
-diff --git a/h5py/_proxy.pyx b/h5py/_proxy.pyx
-index 46b4fe0d..e40504f5 100644
---- a/h5py/_proxy.pyx
-+++ b/h5py/_proxy.pyx
-@@ -241,7 +241,7 @@ ctypedef struct h5py_scatter_t:
-     void* buf
-=20
- cdef herr_t h5py_scatter_cb(void* elem, hid_t type_id, unsigned ndim,
--                const hsize_t *point, void *operator_data) nogil except=
 -1:
-+                const hsize_t *point, void *operator_data) except -1 no=
gil:
-     cdef h5py_scatter_t* info =3D <h5py_scatter_t*>operator_data
-=20
-     memcpy(elem, (<char*>info[0].buf)+((info[0].i)*(info[0].elsize)),
-@@ -252,7 +252,7 @@ cdef herr_t h5py_scatter_cb(void* elem, hid_t type_i=
d, unsigned ndim,
-     return 0
-=20
- cdef herr_t h5py_gather_cb(void* elem, hid_t type_id, unsigned ndim,
--                const hsize_t *point, void *operator_data) nogil except=
 -1:
-+                const hsize_t *point, void *operator_data) except -1 no=
gil:
-     cdef h5py_scatter_t* info =3D <h5py_scatter_t*>operator_data
-=20
-     memcpy((<char*>info[0].buf)+((info[0].i)*(info[0].elsize)), elem,
-diff --git a/h5py/_selector.pyx b/h5py/_selector.pyx
-index 8b858c82..69970176 100644
---- a/h5py/_selector.pyx
-+++ b/h5py/_selector.pyx
-@@ -341,7 +341,7 @@ cdef class Reader:
-=20
-             arr =3D PyArray_ZEROS(arr_rank, arr_shape, self.np_typenum,=
 0)
-             if not self.native_byteorder:
--                arr =3D arr.newbyteorder()
-+                arr =3D arr.view(arr.dtype.newbyteorder())
-         finally:
-             efree(arr_shape)
-=20
-diff --git a/h5py/api_compat.h b/h5py/api_compat.h
-index 52917f4d..a359e827 100644
---- a/h5py/api_compat.h
-+++ b/h5py/api_compat.h
-@@ -24,7 +24,6 @@ typedef void *PyMPI_MPI_Message;
- #include <stddef.h>
- #include "Python.h"
- #include "numpy/arrayobject.h"
--#include "hdf5.h"
-=20
- /* The HOFFSET macro can't be used from Cython. */
-=20
-@@ -35,14 +34,14 @@ typedef void *PyMPI_MPI_Message;
- #define h5py_size_n256 (sizeof(npy_complex256))
- #endif
-=20
--#define h5py_offset_n64_real (HOFFSET(npy_complex64, real))
--#define h5py_offset_n64_imag (HOFFSET(npy_complex64, imag))
--#define h5py_offset_n128_real (HOFFSET(npy_complex128, real))
--#define h5py_offset_n128_imag (HOFFSET(npy_complex128, imag))
-+#define h5py_offset_n64_real (0)
-+#define h5py_offset_n64_imag (sizeof(float))
-+#define h5py_offset_n128_real (0)
-+#define h5py_offset_n128_imag (sizeof(double))
-=20
- #ifdef NPY_COMPLEX256
--#define h5py_offset_n256_real (HOFFSET(npy_complex256, real))
--#define h5py_offset_n256_imag (HOFFSET(npy_complex256, imag))
-+#define h5py_offset_n256_real (0)
-+#define h5py_offset_n256_imag (sizeof(long double))
- #endif
-=20
- #endif
-diff --git a/h5py/api_types_hdf5.pxd b/h5py/api_types_hdf5.pxd
-index a198f105..099e0f58 100644
---- a/h5py/api_types_hdf5.pxd
-+++ b/h5py/api_types_hdf5.pxd
-@@ -257,27 +257,27 @@ cdef extern from "hdf5.h":
-       herr_t  (*sb_encode)(H5FD_t *file, char *name, unsigned char *p)
-       herr_t  (*sb_decode)(H5FD_t *f, const char *name, const unsigned =
char *p)
-       size_t  fapl_size
--      void *  (*fapl_get)(H5FD_t *file)
--      void *  (*fapl_copy)(const void *fapl)
--      herr_t  (*fapl_free)(void *fapl)
-+      void *  (*fapl_get)(H5FD_t *file) except *
-+      void *  (*fapl_copy)(const void *fapl) except *
-+      herr_t  (*fapl_free)(void *fapl) except -1
-       size_t  dxpl_size
-       void *  (*dxpl_copy)(const void *dxpl)
-       herr_t  (*dxpl_free)(void *dxpl)
--      H5FD_t *(*open)(const char *name, unsigned flags, hid_t fapl, had=
dr_t maxaddr)
--      herr_t  (*close)(H5FD_t *file)
-+      H5FD_t *(*open)(const char *name, unsigned flags, hid_t fapl, had=
dr_t maxaddr) except *
-+      herr_t  (*close)(H5FD_t *file) except -1
-       int     (*cmp)(const H5FD_t *f1, const H5FD_t *f2)
-       herr_t  (*query)(const H5FD_t *f1, unsigned long *flags)
-       herr_t  (*get_type_map)(const H5FD_t *file, H5FD_mem_t *type_map)
-       haddr_t (*alloc)(H5FD_t *file, H5FD_mem_t type, hid_t dxpl_id, hs=
ize_t size)
-       herr_t  (*free)(H5FD_t *file, H5FD_mem_t type, hid_t dxpl_id, had=
dr_t addr, hsize_t size)
--      haddr_t (*get_eoa)(const H5FD_t *file, H5FD_mem_t type)
--      herr_t  (*set_eoa)(H5FD_t *file, H5FD_mem_t type, haddr_t addr)
--      haddr_t (*get_eof)(const H5FD_t *file, H5FD_mem_t type)
-+      haddr_t (*get_eoa)(const H5FD_t *file, H5FD_mem_t type) noexcept
-+      herr_t  (*set_eoa)(H5FD_t *file, H5FD_mem_t type, haddr_t addr) n=
oexcept
-+      haddr_t (*get_eof)(const H5FD_t *file, H5FD_mem_t type) except -1
-       herr_t  (*get_handle)(H5FD_t *file, hid_t fapl, void**file_handle=
)
--      herr_t  (*read)(H5FD_t *file, H5FD_mem_t type, hid_t dxpl, haddr_=
t addr, size_t size, void *buffer)
--      herr_t  (*write)(H5FD_t *file, H5FD_mem_t type, hid_t dxpl, haddr=
_t addr, size_t size, const void *buffer)
--      herr_t  (*flush)(H5FD_t *file, hid_t dxpl_id, hbool_t closing)
--      herr_t  (*truncate)(H5FD_t *file, hid_t dxpl_id, hbool_t closing)
-+      herr_t  (*read)(H5FD_t *file, H5FD_mem_t type, hid_t dxpl, haddr_=
t addr, size_t size, void *buffer) except *
-+      herr_t  (*write)(H5FD_t *file, H5FD_mem_t type, hid_t dxpl, haddr=
_t addr, size_t size, const void *buffer) except *
-+      herr_t  (*flush)(H5FD_t *file, hid_t dxpl_id, hbool_t closing) ex=
cept -1
-+      herr_t  (*truncate)(H5FD_t *file, hid_t dxpl_id, hbool_t closing)=
 except -1
-       herr_t  (*lock)(H5FD_t *file, hbool_t rw)
-       herr_t  (*unlock)(H5FD_t *file)
-       H5FD_mem_t fl_map[<int>H5FD_MEM_NTYPES]
-@@ -295,27 +295,27 @@ cdef extern from "hdf5.h":
-       herr_t  (*sb_encode)(H5FD_t *file, char *name, unsigned char *p)
-       herr_t  (*sb_decode)(H5FD_t *f, const char *name, const unsigned =
char *p)
-       size_t  fapl_size
--      void *  (*fapl_get)(H5FD_t *file)
--      void *  (*fapl_copy)(const void *fapl)
--      herr_t  (*fapl_free)(void *fapl)
-+      void *  (*fapl_get)(H5FD_t *file) except *
-+      void *  (*fapl_copy)(const void *fapl) except *
-+      herr_t  (*fapl_free)(void *fapl) except -1
-       size_t  dxpl_size
-       void *  (*dxpl_copy)(const void *dxpl)
-       herr_t  (*dxpl_free)(void *dxpl)
--      H5FD_t *(*open)(const char *name, unsigned flags, hid_t fapl, had=
dr_t maxaddr)
--      herr_t  (*close)(H5FD_t *file)
-+      H5FD_t *(*open)(const char *name, unsigned flags, hid_t fapl, had=
dr_t maxaddr) except *
-+      herr_t  (*close)(H5FD_t *file) except -1
-       int     (*cmp)(const H5FD_t *f1, const H5FD_t *f2)
-       herr_t  (*query)(const H5FD_t *f1, unsigned long *flags)
-       herr_t  (*get_type_map)(const H5FD_t *file, H5FD_mem_t *type_map)
-       haddr_t (*alloc)(H5FD_t *file, H5FD_mem_t type, hid_t dxpl_id, hs=
ize_t size)
-       herr_t  (*free)(H5FD_t *file, H5FD_mem_t type, hid_t dxpl_id, had=
dr_t addr, hsize_t size)
--      haddr_t (*get_eoa)(const H5FD_t *file, H5FD_mem_t type)
--      herr_t  (*set_eoa)(H5FD_t *file, H5FD_mem_t type, haddr_t addr)
--      haddr_t (*get_eof)(const H5FD_t *file, H5FD_mem_t type)
-+      haddr_t (*get_eoa)(const H5FD_t *file, H5FD_mem_t type) noexcept
-+      herr_t  (*set_eoa)(H5FD_t *file, H5FD_mem_t type, haddr_t addr) n=
oexcept
-+      haddr_t (*get_eof)(const H5FD_t *file, H5FD_mem_t type) except -1
-       herr_t  (*get_handle)(H5FD_t *file, hid_t fapl, void**file_handle=
)
--      herr_t  (*read)(H5FD_t *file, H5FD_mem_t type, hid_t dxpl, haddr_=
t addr, size_t size, void *buffer)
--      herr_t  (*write)(H5FD_t *file, H5FD_mem_t type, hid_t dxpl, haddr=
_t addr, size_t size, const void *buffer)
--      herr_t  (*flush)(H5FD_t *file, hid_t dxpl_id, hbool_t closing)
--      herr_t  (*truncate)(H5FD_t *file, hid_t dxpl_id, hbool_t closing)
-+      herr_t  (*read)(H5FD_t *file, H5FD_mem_t type, hid_t dxpl, haddr_=
t addr, size_t size, void *buffer) except *
-+      herr_t  (*write)(H5FD_t *file, H5FD_mem_t type, hid_t dxpl, haddr=
_t addr, size_t size, const void *buffer) except *
-+      herr_t  (*flush)(H5FD_t *file, hid_t dxpl_id, hbool_t closing) ex=
cept -1
-+      herr_t  (*truncate)(H5FD_t *file, hid_t dxpl_id, hbool_t closing)=
 except -1
-       herr_t  (*lock)(H5FD_t *file, hbool_t rw)
-       herr_t  (*unlock)(H5FD_t *file)
-       H5FD_mem_t fl_map[<int>H5FD_MEM_NTYPES]
-diff --git a/h5py/h5fd.pyx b/h5py/h5fd.pyx
-index e9746057..d39cf68f 100644
---- a/h5py/h5fd.pyx
-+++ b/h5py/h5fd.pyx
-@@ -144,10 +144,10 @@ cdef herr_t H5FD_fileobj_close(H5FD_fileobj_t *f) =
except -1 with gil:
-     stdlib_free(f)
-     return 0
-=20
--cdef haddr_t H5FD_fileobj_get_eoa(const H5FD_fileobj_t *f, H5FD_mem_t t=
ype):
-+cdef haddr_t H5FD_fileobj_get_eoa(const H5FD_fileobj_t *f, H5FD_mem_t t=
ype) noexcept nogil:
-     return f.eoa
-=20
--cdef herr_t H5FD_fileobj_set_eoa(H5FD_fileobj_t *f, H5FD_mem_t type, ha=
ddr_t addr):
-+cdef herr_t H5FD_fileobj_set_eoa(H5FD_fileobj_t *f, H5FD_mem_t type, ha=
ddr_t addr) noexcept nogil:
-     f.eoa =3D addr
-     return 0
-=20
-@@ -191,22 +191,38 @@ cdef herr_t H5FD_fileobj_flush(H5FD_fileobj_t *f, =
hid_t dxpl, hbool_t closing) e
- cdef H5FD_class_t info
- memset(&info, 0, sizeof(info))
-=20
-+# Cython doesn't support "except X" in casting definition currently
-+ctypedef herr_t (*file_free_func_ptr)(void *) except -1
-+
-+ctypedef herr_t (*file_close_func_ptr)(H5FD_t *) except -1
-+ctypedef haddr_t (*file_get_eoa_func_ptr)(const H5FD_t *, H5FD_mem_t) n=
oexcept
-+ctypedef herr_t (*file_set_eof_func_ptr)(H5FD_t *, H5FD_mem_t, haddr_t)=
 noexcept
-+ctypedef haddr_t (*file_get_eof_func_ptr)(const H5FD_t *, H5FD_mem_t) e=
xcept -1
-+ctypedef herr_t (*file_read_func_ptr)(H5FD_t *, H5FD_mem_t, hid_t, hadd=
r_t, size_t, void*) except -1
-+ctypedef herr_t (*file_write_func_ptr)(H5FD_t *, H5FD_mem_t, hid_t, had=
dr_t, size_t, const void*) except -1
-+ctypedef herr_t (*file_truncate_func_ptr)(H5FD_t *, hid_t, hbool_t) exc=
ept -1
-+ctypedef herr_t (*file_flush_func_ptr)(H5FD_t *, hid_t, hbool_t) except=
 -1
-+
-+
- info.name =3D 'fileobj'
- info.maxaddr =3D libc.stdint.SIZE_MAX - 1
- info.fc_degree =3D H5F_CLOSE_WEAK
- info.fapl_size =3D sizeof(PyObject *)
- info.fapl_get =3D <void *(*)(H5FD_t *)>H5FD_fileobj_fapl_get
- info.fapl_copy =3D <void *(*)(const void *)>H5FD_fileobj_fapl_copy
--info.fapl_free =3D <herr_t (*)(void *)>H5FD_fileobj_fapl_free
-+
-+info.fapl_free =3D <file_free_func_ptr>H5FD_fileobj_fapl_free
-+
- info.open =3D <H5FD_t *(*)(const char *name, unsigned flags, hid_t fapl=
, haddr_t maxaddr)>H5FD_fileobj_open
--info.close =3D <herr_t (*)(H5FD_t *)>H5FD_fileobj_close
--info.get_eoa =3D <haddr_t (*)(const H5FD_t *, H5FD_mem_t)>H5FD_fileobj_=
get_eoa
--info.set_eoa =3D <herr_t (*)(H5FD_t *, H5FD_mem_t, haddr_t)>H5FD_fileob=
j_set_eoa
--info.get_eof =3D <haddr_t (*)(const H5FD_t *, H5FD_mem_t)>H5FD_fileobj_=
get_eof
--info.read =3D <herr_t (*)(H5FD_t *, H5FD_mem_t, hid_t, haddr_t, size_t,=
 void *)>H5FD_fileobj_read
--info.write =3D <herr_t (*)(H5FD_t *, H5FD_mem_t, hid_t, haddr_t, size_t=
, const void *)>H5FD_fileobj_write
--info.truncate =3D <herr_t (*)(H5FD_t *, hid_t, hbool_t)>H5FD_fileobj_tr=
uncate
--info.flush =3D <herr_t (*)(H5FD_t *, hid_t, hbool_t)>H5FD_fileobj_flush
-+
-+info.close =3D <file_close_func_ptr>H5FD_fileobj_close
-+info.get_eoa =3D <file_get_eoa_func_ptr>H5FD_fileobj_get_eoa
-+info.set_eoa =3D <file_set_eof_func_ptr>H5FD_fileobj_set_eoa
-+info.get_eof =3D <file_get_eof_func_ptr>H5FD_fileobj_get_eof
-+info.read =3D <file_read_func_ptr>H5FD_fileobj_read
-+info.write =3D <file_write_func_ptr>H5FD_fileobj_write
-+info.truncate =3D <file_truncate_func_ptr>H5FD_fileobj_truncate
-+info.flush =3D <file_flush_func_ptr>H5FD_fileobj_flush
- # H5FD_FLMAP_DICHOTOMY
- info.fl_map =3D [H5FD_MEM_SUPER,  # default
-                H5FD_MEM_SUPER,  # super
-diff --git a/h5py/h5p.pyx b/h5py/h5p.pyx
-index 779ea1b5..dc8bf65a 100644
---- a/h5py/h5p.pyx
-+++ b/h5py/h5p.pyx
-@@ -1177,7 +1177,7 @@ cdef class PropFAID(PropInstanceID):
-                 size_t block_size   IN: File system block size
-                 size_t cbuf_size    IN: Copy buffer size
-=20
--            Properites with value of 0 indicate that the HDF5 library s=
hould
-+            Properties with value of 0 indicate that the HDF5 library s=
hould
-             choose the value.
-             """
-             H5Pset_fapl_direct(self.id, alignment, block_size, cbuf_siz=
e)
-@@ -1761,7 +1761,7 @@ cdef class PropOCID(PropCreateID):
-=20
-         max_compact -- maximum number of attributes to be stored in com=
pact storage(default:8)
-         must be greater than or equal to min_dense
--        min_dense  -- minmum number of attributes to be stored in dense=
 storage(default:6)
-+        min_dense  -- minimum number of attributes to be stored in dens=
e storage(default:6)
-=20
-         """
-         H5Pset_attr_phase_change(self.id, max_compact, min_dense)
-diff --git a/h5py/h5t.pyx b/h5py/h5t.pyx
-index e7aae14f..b9d7e74d 100644
---- a/h5py/h5t.pyx
-+++ b/h5py/h5t.pyx
-@@ -1938,7 +1938,7 @@ def check_dtype(**kwds):
-=20
-     vlen =3D dtype
-         If the dtype represents an HDF5 vlen, returns the Python base c=
lass.
--        Currently only builting string vlens (str) are supported.  Retu=
rns
-+        Currently only built-in string vlens (str) are supported.  Retu=
rns
-         None if the dtype does not represent an HDF5 vlen.
-=20
-     enum =3D dtype
-diff --git a/h5py/tests/test_attrs_data.py b/h5py/tests/test_attrs_data.=
py
-index 56481ca0..5083a1aa 100644
---- a/h5py/tests/test_attrs_data.py
-+++ b/h5py/tests/test_attrs_data.py
-@@ -262,7 +262,7 @@ class TestEmpty(BaseAttrs):
-         self.assertTrue(is_empty_dataspace(h5a.open(self.f.id, b'y')))
-=20
-     def test_modify(self):
--        with self.assertRaises(IOError):
-+        with self.assertRaises(OSError):
-             self.f.attrs.modify('x', 1)
-=20
-     def test_values(self):
-diff --git a/h5py/tests/test_big_endian_file.py b/h5py/tests/test_big_en=
dian_file.py
-index 4d81de01..170b5bcc 100644
---- a/h5py/tests/test_big_endian_file.py
-+++ b/h5py/tests/test_big_endian_file.py
-@@ -24,14 +24,14 @@ def test_vlen_big_endian():
-         assert dset[4] =3D=3D 1.2
-         assert dset.dtype =3D=3D "<f8"
-=20
--        # Same float values with big endianess
-+        # Same float values with big endianness
-         assert f["DSBEfloat"][0] =3D=3D 3.14
-         assert f["DSBEfloat"].dtype =3D=3D ">f8"
-=20
-         assert f["DSLEint"][0] =3D=3D 1
-         assert f["DSLEint"].dtype =3D=3D "<u8"
-=20
--        # Same int values with big endianess
-+        # Same int values with big endianness
-         assert f["DSBEint"][0] =3D=3D 1
-         assert f["DSBEint"].dtype =3D=3D ">i8"
-=20
-diff --git a/h5py/tests/test_dataset.py b/h5py/tests/test_dataset.py
-index e104dd53..0ffa5c80 100644
---- a/h5py/tests/test_dataset.py
-+++ b/h5py/tests/test_dataset.py
-@@ -1939,9 +1939,9 @@ class TestCommutative(BaseDataset):
-         dset =3D self.f.create_dataset("test", shape, dtype=3Dfloat,
-                                      data=3Dnp.random.rand(*shape))
-=20
--        # grab a value from the elements, ie dset[0]
-+        # grab a value from the elements, ie dset[0, 0]
-         # check that mask arrays are commutative wrt =3D=3D, !=3D
--        val =3D np.float64(dset[0])
-+        val =3D np.float64(dset[0, 0])
-=20
-         assert np.all((val =3D=3D dset) =3D=3D (dset =3D=3D val))
-         assert np.all((val !=3D dset) =3D=3D (dset !=3D val))
-diff --git a/h5py/tests/test_file.py b/h5py/tests/test_file.py
-index b47d408e..1aa38731 100644
---- a/h5py/tests/test_file.py
-+++ b/h5py/tests/test_file.py
-@@ -326,7 +326,7 @@ class TestDrivers(TestCase):
-         # could be an integer multiple of 512
-         #
-         # To allow HDF5 to do the heavy lifting for different platform,
--        # We didn't provide any argumnets to the first call
-+        # We didn't provide any arguments to the first call
-         # and obtained HDF5's default values there.
-=20
-         # Testing creation with a few different property lists
-@@ -639,9 +639,9 @@ class TestUnicode(TestCase):
-         Modes 'r' and 'r+' do not create files even when given unicode =
names
-         """
-         fname =3D self.mktemp(prefix=3Dchr(0x201a))
--        with self.assertRaises(IOError):
-+        with self.assertRaises(OSError):
-             File(fname, 'r')
--        with self.assertRaises(IOError):
-+        with self.assertRaises(OSError):
-             File(fname, 'r+')
-=20
-=20
-diff --git a/h5py/tests/test_file_alignment.py b/h5py/tests/test_file_al=
ignment.py
-index c280bb76..da13ee04 100644
---- a/h5py/tests/test_file_alignment.py
-+++ b/h5py/tests/test_file_alignment.py
-@@ -50,7 +50,7 @@ class TestFileAlignment(TestCase):
-         alignment_interval =3D 4096
-=20
-         for shape in [
--            (1033,),  # A prime number above the thresold
-+            (1033,),  # A prime number above the threshold
-             (1000,),  # Exactly equal to the threshold
-             (1001,),  # one above the threshold
-         ]:
-@@ -75,7 +75,7 @@ class TestFileAlignment(TestCase):
-         alignment_interval =3D 1024
-=20
-         for shape in [
--            (881,),  # A prime number below the thresold
-+            (881,),  # A prime number below the threshold
-             (999,),  # Exactly one below the threshold
-         ]:
-             fname =3D self.mktemp()
-diff --git a/h5py/tests/test_group.py b/h5py/tests/test_group.py
-index 328c352a..4af1fb1f 100644
---- a/h5py/tests/test_group.py
-+++ b/h5py/tests/test_group.py
-@@ -771,7 +771,7 @@ class TestExternalLinks(TestCase):
-         with self.assertRaises(KeyError):
-             self.f['ext']
-=20
--    # I would prefer IOError but there's no way to fix this as the exce=
ption
-+    # I would prefer OSError but there's no way to fix this as the exce=
ption
-     # class is determined by HDF5.
-     def test_exc_missingfile(self):
-         """ KeyError raised when attempting to open missing file """
-@@ -844,7 +844,7 @@ class TestExtLinkBugs(TestCase):
-                 try:
-                     if x:
-                         x.close()
--                except IOError:
-+                except OSError:
-                     pass
-             return w
-         orig_name =3D self.mktemp()
-diff --git a/h5py/tests/test_selections.py b/h5py/tests/test_selections.=
py
-index 0b1722d7..01f6dcb7 100644
---- a/h5py/tests/test_selections.py
-+++ b/h5py/tests/test_selections.py
-@@ -65,7 +65,7 @@ class TestTypeGeneration(BaseSelection):
-         self.assertEqual(out, np.dtype('i'))
-         self.assertEqual(format, np.dtype( [('a','i')] ))
-=20
--        # Field does not apear in named typed
-+        # Field does not appear in named typed
-         with self.assertRaises(ValueError):
-             out, format =3D sel2.read_dtypes(dt, ('j', 'k'))
-=20
-diff --git a/pylintrc b/pylintrc
-index 045df2f7..2401d3b0 100644
---- a/pylintrc
-+++ b/pylintrc
-@@ -44,7 +44,7 @@ confidence=3D
- # can either give multiple identifiers separated by comma (,) or put th=
is
- # option multiple times (only on the command line, not in the configura=
tion
- # file where it should appear only once).You can also use "--disable=3D=
all" to
--# disable everything first and then reenable specific checks. For examp=
le, if
-+# disable everything first and then re-enable specific checks. For exam=
ple, if
- # you want to run only the similarities checker, you can use "--disable=
=3Dall
- # --enable=3Dsimilarities". If you want to run only the classes checker=
, but have
- # no Warning level messages displayed, use"--disable=3Dall --enable=3Dc=
lasses
-diff --git a/pyproject.toml b/pyproject.toml
-index ee573d2f..717200ef 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,6 +1,6 @@
- [build-system]
- requires =3D [
--    "Cython >=3D0.29.31,<1",
-+    "Cython >=3D0.29.31,<4",
-     "oldest-supported-numpy",
-     "pkgconfig",
-     "setuptools >=3D61",
-diff --git a/setup_configure.py b/setup_configure.py
-index 0fba53ba..c3b86a64 100644
---- a/setup_configure.py
-+++ b/setup_configure.py
-@@ -165,7 +165,7 @@ class BuildConfig:
-         try:
-             if pkgconfig.exists(pc_name):
-                 pc =3D pkgconfig.parse(pc_name)
--        except EnvironmentError:
-+        except OSError:
-             if os.name !=3D 'nt':
-                 print(
-                     "Building h5py requires pkg-config unless the HDF5 =
path "
-diff --git a/tox.ini b/tox.ini
-index 0efb88a6..86a176dd 100644
---- a/tox.ini
-+++ b/tox.ini
-@@ -65,7 +65,7 @@ skip_install=3DTrue
- package_env =3D DUMMY NON-EXISTENT ENV NAME
- changedir=3Ddocs
- deps=3D
--    sphinx
-+    -r docs/requirements-rtd.txt
- commands=3D
-     sphinx-build -W -b html -d {envtmpdir}/doctrees .  {envtmpdir}/html
-=20
diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb b=
/meta-python/recipes-devtools/python/python3-h5py_3.11.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
rename to meta-python/recipes-devtools/python/python3-h5py_3.11.0.bb
index 8a9158525e..1cf5f5638e 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.11.0.bb
@@ -4,10 +4,9 @@ SECTION =3D "devel/python"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D113251d71fb0384712c719b567261=
c5c"
=20
-SRC_URI[sha256sum] =3D "d93adc48ceeb33347eb24a634fb787efc7ae4644e6ea4ba7=
33d099605045c049"
+SRC_URI[sha256sum] =3D "7b7e8f78072a2edec87c9836f25f34203fd492a4475709a1=
8b417a33cfb21fa9"
=20
-SRC_URI +=3D "file://0001-setup_build.py-avoid-absolute-path.patch \
-            file://0001-Fix-Cython-3-compatibility.patch"
+SRC_URI +=3D "file://0001-setup_build.py-avoid-absolute-path.patch"
=20
 inherit pkgconfig pypi setuptools3
=20
--=20
2.34.1


