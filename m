Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19434C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 14:33:39 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.26699.1640615618136804523
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 06:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CP6Hf7Gf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640615616; i=@fujitsu.com;
	bh=hLDh9sTpyCPVsS9Q7bADiBdKA3qK7sG4iW/90b0hAgc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CP6Hf7GfNPPXZZEVJ3NCazkZqzyGRWW7SFsBhTE+12+SbGEh1gKCSfOka1twuCHJs
	 6kJxbjKhFpJKBeSwNDM8KFTmAWVR5d8ydwSlGQOheqfhusPRE8OLRTfquwsVfZUVoV
	 /NSFlr79MTxc5BMZ+CsR+9loQRie5toGnEeu5UbjhulseyEiPTY0C0xwgJTuKy5oU3
	 pAtYjwCu7pcWhHdpmC/XMLiHj4tUvnwJJ0XrX5UZFX1Gli2pheqrl0DdDFkv28G1Nl
	 VgLryg6AbXmdTzsw/rDU54npy123Mlz/BQ/EZhpH1SE6bZbFbzUkd7th7IzVQeKAQB
	 Zegp9D9GMBIZQ==
Received: from [100.115.70.228] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 E4/AA-31213-0CEC9C16; Mon, 27 Dec 2021 14:33:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsViZ8MxSXf/uZO
  JBgtfGFtcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBkrbt5kL7irUNH8bSNzA+MZmS5GLg4hgSeM
  Ep8vn2CEcC4wSeyZuYcNwjnBKPF871GmLkZODjYBNYnpt26wgtgiAvoSS2fvYQaxmQVUJF787
  mEHsYUF7CSOzTwHZHNwsAioSpx6nQsS5hVwknj1/xpYuYSAgsSUh++ZIeKCEidnPmGBGCMhcf
  DFC6gaRYnZl5tZIOwKiVmz2pggbDWJq+c2MU9g5J+FpH0WkvYFjEyrGO2SijLTM0pyEzNzdA0
  NDHQNDU11zcx0DU1N9RKrdBP1Ukt1k1PzSooSgdJ6ieXFeqnFxXrFlbnJOSl6eaklmxiBwZlS
  7DR7B+OOvp96hxglOZiURHm/TziZKMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCN/gUUE6wKDU9t
  SItMwcYKTBpCQ4eJRFejbNAad7igsTc4sx0iNQpRl2OJ4e372IWYsnLz0uVEue1BCkSACnKKM
  2DGwGL2kuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmdQKbwZOaVwG16BXQEE9ARMx2Ogxx
  RkoiQkmpg4nja8o5zm/nX4NfnuX8EsvZHce58t8ySLW3OmfwbnTanjlQBVfP/f75K7N+KZ1si
  5qh+PHWzvLR++YzPNZwXclgKTnk5Kf2fV+NUe4eJ/39gna6it+zm1ezHrlj6aPJ27nmw63v6m
  YIdbOe175/Wy92SYvPz2ZSE7z02Gmf1H5YZ7pn7TtG02WSt0a8PBxOLl8dwHl+sli9TtODaB9
  NwpcC/01f/mpIl7ynquK38bLXRvVwJ1uxq++hl/rEn/+4RDgk7sbmojmuW979/Xf8Yd0x/0Mf
  85Q7H5Dsfp5a1Bp+c+NDPbPaiI44P/nTNiJfeenNbdkuNjTzPHckWLqHG7udJ74/8dc/MVM6c
  sU9RiaU4I9FQi7moOBEArijwIVUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-528.messagelabs.com!1640615615!226968!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13118 invoked from network); 27 Dec 2021 14:33:35 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Dec 2021 14:33:35 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 60240100344
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 14:33:35 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 53B1A100331
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 14:33:35 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 27 Dec 2021 14:33:33 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] qpdf: upgrade 10.4.0 -> 10.5.0
Date: Mon, 27 Dec 2021 22:33:21 +0800
Message-ID: <1640615604-22927-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 14:33:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94509

Changelog:
=========
Packaging changes:
-----------------
Pre-built documentation is no longer distributed with the source distribution.
The AppImage and Windows binary distributions still contain embedded
documentation, and a separate doc distribution file is available from the qpdf
release site. Documentation is now available at https://qpdf.readthedocs.io
for every major/minor version starting with version 10.5. Please see Packaging
Documentation for details on how packagers should handle documentation.

The documentation sources have been switched from docbook to reStructuredText
processed with Sphinx. This will break previous documentation links.
A redirect is in place on the main website. A top-to-bottom review of the
documentation is planned for an upcoming release.

Library Enhancements:
--------------------
Since qpdf version 8, using object accessor methods on an instance of
QPDFObjectHandle may create warnings if the object is not of the expected type.
These warnings now have an error code of qpdf_e_object instead of
qpdf_e_damaged_pdf. Also, comments have been added to QPDFObjectHandle.hh to
explain in more detail what the behavior is. See Object Accessor Methods for
a more in-depth discussion.

Add Pl_Buffer::getMallocBuffer() to initialize a buffer allocated with malloc()
for better cross-language interoperability.

C API Enhancements:
-------------------
Many thanks to M. Holger whose contributions have heavily influenced these C
API enhancements. His several suggestions, pull requests, questions, and
critical reading of documentation and comments have resulted in significant
usability improvements to the C API.

Overhaul error handling for the object handle functions C API. Some rare error
conditions that would previously have caused a crash are now trapped and
reported, and the functions that generate them return fallback values.
See comments in the ERROR HANDLING section of include/qpdf/qpdf-c.h for details.
In particular, exceptions thrown by the underlying C++ code when calling object
accessors are caught and converted into errors. The errors can be checked by
calling qpdf_has_error. Use qpdf_silence_errors to prevent the error from being
written to stderr.

Add qpdf_get_last_string_length to the C API to get the length of the last
string that was returned. This is needed to handle strings that contain embedded
null characters.

Add qpdf_oh_is_initialized and qpdf_oh_new_uninitialized to the C API to make it
possible to work with uninitialized objects.

Add qpdf_oh_new_object to the C API. This allows you to clone an object handle.

Add qpdf_get_object_by_id, qpdf_make_indirect_object, and qpdf_replace_object,
exposing the corresponding methods in QPDF and QPDFObjectHandle.

Add several functions for working with pages. See PAGE FUNCTIONS in
include/qpdf/qpdf-c.h for details.

Add several functions for working with streams. See STREAM FUNCTIONS in
include/qpdf/qpdf-c.h for details.

Add qpdf_oh_get_type_code and qpdf_oh_get_type_name.

Add qpdf_oh_get_binary_string_value and qpdf_oh_new_binary_string for making it
easier to deal with strings that contain embedded null characters.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-printing/qpdf/{qpdf_10.4.0.bb => qpdf_10.5.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_10.4.0.bb => qpdf_10.5.0.bb} (90%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_10.4.0.bb b/meta-oe/recipes-printing/qpdf/qpdf_10.5.0.bb
similarity index 90%
rename from meta-oe/recipes-printing/qpdf/qpdf_10.4.0.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_10.5.0.bb
index 793dbb195..9644c653e 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_10.4.0.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_10.5.0.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 DEPENDS = "libpcre zlib libjpeg-turbo"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/qpdf/qpdf-${PV}.tar.gz"
-SRC_URI[sha256sum] = "9ac6e691cc3f35a9fe44632e3fba727e1b6ef21181c0a883287abf5cf97ae222"
+SRC_URI[sha256sum] = "88257d36a44fd5c50b2879488324dd9cafc11686ae49d8c4922a4872203ce006"
 
 LIC_FILES_CHKSUM = "file://Artistic-2.0;md5=7806296b9fae874361e6fb10072b7ee3"
 
-- 
2.25.1


