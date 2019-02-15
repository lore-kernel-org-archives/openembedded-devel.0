Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B56C06BE2A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 06:05:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1F65G2B008980
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Feb 2019 22:05:27 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.435.0;
	Thu, 14 Feb 2019 22:05:05 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 15 Feb 2019 01:04:44 -0500
Message-ID: <cover.1550210289.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/12] Add 11 recipes to help integrating TensorFlow to Yocto
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Feb 2019 06:05:51 -0000
Content-Type: text/plain

All these newly added recipes are fundamental packages of machine
leaning framework (such as TensorFlow).

//Hongxu

The following changes since commit d30d26c2796dc45ba274803815421e6f4aca9eb5:

  packagegroup-meta-oe: espeak-data is gone (2019-02-11 07:21:08 -0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/add-recipes-20190215
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/add-recipes-20190215

Hongxu Jia (12):
  python3-protobuf: add cpp implementation support
  python3-pkgconfig: add version 1.4.0
  hdf5: add version 1.8.19
  python3-h5py: add version 2.9.0
  python3-termcolor: add version 1.1.0
  python3-markdown: add version 3.0.1
  python3-wheel: add version 0.32.3
  python3-absl: add version 0.7.0
  python3-astor: add version 0.7.1
  python3-gast: add version 0.2.2
  python3-keras-applications: add version 1.0.6
  python3-keras-preprocessing: add version 1.0.5

 meta-oe/licenses/HDF5                              |  92 ++
 .../hdf5/files/0001-cross-compiling-support.patch  |  71 ++
 ...ve-suffix-shared-from-shared-library-name.patch |  50 ++
 meta-oe/recipes-support/hdf5/files/H5Tinit.c       | 991 +++++++++++++++++++++
 .../recipes-support/hdf5/files/H5lib_settings.c    |  98 ++
 meta-oe/recipes-support/hdf5/hdf5_1.8.19.bb        |  56 ++
 .../recipes-devtools/python/python-protobuf.inc    |   1 +
 .../recipes-devtools/python/python3-absl_0.7.0.bb  |  14 +
 .../recipes-devtools/python/python3-astor_0.7.1.bb |  14 +
 .../recipes-devtools/python/python3-gast_0.2.2.bb  |  14 +
 .../0001-cross-compiling-support.patch             |  46 +
 .../recipes-devtools/python/python3-h5py_2.9.0.bb  |  30 +
 .../python/python3-keras-applications_1.0.6.bb     |  19 +
 .../python/python3-keras-preprocessing_1.0.5.bb    |  15 +
 .../python/python3-markdown_3.0.1.bb               |  12 +
 .../python/python3-pkgconfig_1.4.0.bb              |  18 +
 .../0001-Add-Python-3.7-compatibility-4862.patch   |  98 ++
 .../python/python3-protobuf_3.6.1.bb               |   9 +
 .../python/python3-termcolor_1.1.0.bb              |  12 +
 .../python/python3-wheel_0.32.3.bb                 |  16 +
 20 files changed, 1676 insertions(+)
 create mode 100644 meta-oe/licenses/HDF5
 create mode 100644 meta-oe/recipes-support/hdf5/files/0001-cross-compiling-support.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/0002-Remove-suffix-shared-from-shared-library-name.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/H5Tinit.c
 create mode 100644 meta-oe/recipes-support/hdf5/files/H5lib_settings.c
 create mode 100644 meta-oe/recipes-support/hdf5/hdf5_1.8.19.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-absl_0.7.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-astor_0.7.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-gast_0.2.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-keras-applications_1.0.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-keras-preprocessing_1.0.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pkgconfig_1.4.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-protobuf/0001-Add-Python-3.7-compatibility-4862.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-wheel_0.32.3.bb

-- 
2.8.1


