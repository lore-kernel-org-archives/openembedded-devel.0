Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5C3C47422
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 06:56:24 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.9102.1706511384105537260
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jan 2024 22:56:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U7/MNuYu;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55ef4a66008so714040a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jan 2024 22:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706511382; x=1707116182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJeq0pyvPNZx19qdf7XWY0rof1S1VMKPVk0Qi723Asw=;
        b=U7/MNuYu4is2NgzG2LhgUlbwQ6GVVx6LcdIBKgBxxjpNMWAHnuaBNG6onv1mbWNt3o
         CW8ejmR2+w+TTp78qBldZLsMZyDNqEcC8wAu1RfaPuCTuFhMEcmfuLq+Bj/n0LswD/RC
         9jFJdp/9BF6x7QT/Ui2Be19m4SRcZyLwNcSxaFB/ZxRGCAER1Z6ugvi1CYQpVt8/by2z
         gSoH6ObYhLcJd2GSwhwSUPYzFqkLEmcKqAYWU2c11Hz2UTTJhuYGdlu6D/MZuBJpdBDl
         UKgiNcXYMqm1nsIsOjxNsOPx9OXt1pRCx4JFlsRvfd+JpUVtyuxLREA4rok6r1ONFBcw
         zgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706511382; x=1707116182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJeq0pyvPNZx19qdf7XWY0rof1S1VMKPVk0Qi723Asw=;
        b=CNtZffipUO4vjp4wZhCj14Sevmibd++PRBzUYK3bspWBDL4y/vXHeuNUe0DDwBeZjy
         Skgn+vd+r00XItgy1eWtqUVEMP5r7kqXq8W2GqYcLAxzF+xvjkpkohl/hvdl46kP+54n
         HHbHyhdMV585gt1t8kY2a0aUQ/4bYJZozJe1Be2i79mOlUOoAHqr6ffmANAe7h9xb/wy
         nwlJiHv9wPvW7o2EclUkVPfoP68QU+e6t278euu95TyzU1Uq6p1WHxJWSO/PsvrLrQCL
         vysCjQwsWS1eUyT9gYyEEKMAFScZ9fJb0gNpjtAyq3RiOjXGy20cDrTF5Yr9gcend/lq
         aJkA==
X-Gm-Message-State: AOJu0YyQevgn6x9seOi1aWl4zDFOqSJCmsVV50V2BD6cjxfoU9yXTfjx
	7tTKBwdgRmMQVYX4Cnuxmx5gswPZXWS++FYptQutYmfeDSqecJqZQR8lPknzkT0=
X-Google-Smtp-Source: AGHT+IHvgsAe0bUFiuOv2XmhC/LR/cnAdSSATXjys4FojOvtg48VD4aJVST2gWHjVpmxmOWWQFTsxg==
X-Received: by 2002:a05:6402:348a:b0:55e:fd6f:fddc with SMTP id v10-20020a056402348a00b0055efd6ffddcmr1359954edc.34.1706511382194;
        Sun, 28 Jan 2024 22:56:22 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id d15-20020a056402000f00b0055f1af929c2sm44859edu.28.2024.01.28.22.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jan 2024 22:56:21 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-aiohttp: upgrade 3.9.1 -> 3.9.2
Date: Mon, 29 Jan 2024 09:56:14 +0300
Message-Id: <20240129065614.38288-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jan 2024 06:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108482

Updated RDEPENDS accordingly setup.cfg

Changelog:

Bug fixes
---------

- Fixed server-side websocket connection leak.

  *Related issues and pull requests on GitHub:*
  :issue:`7978`.

- Fixed ``web.FileResponse`` doing blocking I/O in the event loop.

  *Related issues and pull requests on GitHub:*
  :issue:`8012`.

- Fixed double compress when compression enabled and compressed file exists in server file responses.

  *Related issues and pull requests on GitHub:*
  :issue:`8014`.

- Added runtime type check for ``ClientSession`` ``timeout`` parameter.

  *Related issues and pull requests on GitHub:*
  :issue:`8021`.

- Fixed an unhandled exception in the Python HTTP parser on header lines starting with a colon -- by :user:`pajod`.

  Invalid request lines with anything but a dot between the HTTP major and minor version are now rejected.
  Invalid header field names containing question mark or slash are now rejected.
  Such requests are incompatible with :rfc:`9110#section-5.6.2` and are not known to be of any legitimate use.

  *Related issues and pull requests on GitHub:*
  :issue:`8074`.

- Improved validation of paths for static resources requests to the server -- by :user:`bdraco`.

  *Related issues and pull requests on GitHub:*
  :issue:`8079`.

Features
--------

- Added support for passing :py:data:`True` to ``ssl`` parameter in ``ClientSession`` while
  deprecating :py:data:`None` -- by :user:`xiangyan99`.

  *Related issues and pull requests on GitHub:*
  :issue:`7698`.

Breaking changes
----------------

- Fixed an unhandled exception in the Python HTTP parser on header lines starting with a colon -- by :user:`pajod`.

  Invalid request lines with anything but a dot between the HTTP major and minor version are now rejected.
  Invalid header field names containing question mark or slash are now rejected.
  Such requests are incompatible with :rfc:`9110#section-5.6.2` and are not known to be of any legitimate use.

  *Related issues and pull requests on GitHub:*
  :issue:`8074`.

Improved documentation
----------------------

- Fixed examples of ``fallback_charset_resolver`` function in the :doc:`client_advanced` document. -- by :user:`henry0312`.

  *Related issues and pull requests on GitHub:*
  :issue:`7995`.

- The Sphinx setup was updated to avoid showing the empty
  changelog draft section in the tagged release documentation
  builds on Read The Docs -- by :user:`webknjaz`.

  *Related issues and pull requests on GitHub:*
  :issue:`8067`.

Packaging updates and notes for downstreams
-------------------------------------------

- The changelog categorization was made clearer. The
  contributors can now mark their fragment files more
  accurately -- by :user:`webknjaz`.

  The new category tags are:

      * ``bugfix``

      * ``feature``

      * ``deprecation``

      * ``breaking`` (previously, ``removal``)

      * ``doc``

      * ``packaging``

      * ``contrib``

      * ``misc``

  *Related issues and pull requests on GitHub:*
  :issue:`8066`.

Contributor-facing changes
--------------------------

- Updated :ref:`contributing/Tests coverage <aiohttp-contributing>` section to show how we use ``codecov`` -- by :user:`Dreamsorcerer`.

  *Related issues and pull requests on GitHub:*
  :issue:`7916`.

- The changelog categorization was made clearer. The
  contributors can now mark their fragment files more
  accurately -- by :user:`webknjaz`.

  The new category tags are:

      * ``bugfix``

      * ``feature``

      * ``deprecation``

      * ``breaking`` (previously, ``removal``)

      * ``doc``

      * ``packaging``

      * ``contrib``

      * ``misc``

  *Related issues and pull requests on GitHub:*
  :issue:`8066`.

Miscellaneous internal changes
------------------------------

- Replaced all ``tmpdir`` fixtures with ``tmp_path`` in test suite.

  *Related issues and pull requests on GitHub:*
  :issue:`3551`.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...iohttp_3.9.1.bb => python3-aiohttp_3.9.2.bb} | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.9.1.bb => python3-aiohttp_3.9.2.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.1.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.2.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.9.1.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.9.2.bb
index 566417047..42fe66908 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.2.bb
@@ -4,24 +4,17 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "8fc49a87ac269d4529da45871e2ffb6874e87779c3d0e2ccd813c0899221239d"
+SRC_URI[sha256sum] = "b0ad0a5e86ce73f5368a164c10ada10504bf91869c05ab75d982c6048217fbf7"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
 
 RDEPENDS:${PN} = "\
+    ${PYTHON_PN}-aiohappyeyeballs \
+    ${PYTHON_PN}-aiosignal \
     ${PYTHON_PN}-async-timeout \
-    ${PYTHON_PN}-attrs \
-    ${PYTHON_PN}-chardet \
-    ${PYTHON_PN}-html \
-    ${PYTHON_PN}-idna-ssl \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-misc \
+    ${PYTHON_PN}-frozenlist \
     ${PYTHON_PN}-multidict \
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-typing-extensions \
     ${PYTHON_PN}-yarl \
-    ${PYTHON_PN}-cchardet \
-    ${PYTHON_PN}-charset-normalizer \
-    ${PYTHON_PN}-aiosignal \
+    ${PYTHON_PN}-aiodns \
 "
-- 
2.25.1


