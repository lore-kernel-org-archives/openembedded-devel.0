Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35459.1792987103696722655
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Oct 2026 20:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FZ+4uCXv;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35b2c599f43so469169eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 20:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792987103; x=1793591903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cptz8115WqS2STkCxCImCt3e9lvkf0rpf13ex9P5AvQ=;
        b=FZ+4uCXvgTEeeF7T4rcqhYLEZ51bSE4hocTucnJFTTH9DRCtnn1KvAqv/+1C68TUOn
         VgJfyc7cM6uFfqKj8C0rpGoJgAtUkgsZzoO8VeftZ3X7NfPrFMaZqa8AYoFBi+lWJVfx
         xElPHo5rOWsu3dNrin3GxBgYrkLP/utNwn4ITdNQDEffOAeQi5KIys+Ynp5uuA2M1AoN
         +m5D4+OqyTEEZx9eV+sdfZ+bPlYrBcZ0pAWhymgMR0U1IYm5Ca1nvu1jFQ/N4L75GKLO
         TpD6bwu3RwD/hLhvoVYT+dL3VYPxOgTK2w2m4XFa7YFl+pIy7znnbx2/KtWO7hhryDkN
         zs1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792987103; x=1793591903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cptz8115WqS2STkCxCImCt3e9lvkf0rpf13ex9P5AvQ=;
        b=glw8qEKpu5OaZjuYB6lz5XVSJ+sjR90u3Ncl4ZaMEVAia37Lx9hlHnn4BbM4J7+9vl
         3QxEy5o9D0z7QjIrisbqQBgDsUNTfmCVe8yse0Wh8p0iZ0u5pTKnPvKU43+SW0wO8hUx
         TSFHNo3xdMdJ+AL8qkd2JWdreR691XwPIiEvabwV8kLfoyQneWlnC3zngD4hilIGj1VV
         iL1wvFbz7LNdpbhca54YXRL6sWykTMOiPiVikyBPoB4NGqI9wOX/BOGxeqi3i8xNeaAI
         b1IHDXPggxOOgvXLywEH0kWbGux5r6Uo1ENQoQfCUibhChXg5JtmEpvkFalnGlNLVb8r
         Bu+w==
X-Gm-Message-State: AFq9FYLqnwWgp3OW7s6woYBXsRC/JSkime3VBAWmlIP6B/tli2Wc/R/B
	D3A8DrO1dFrSyKiFEN83j6PGe+Xq10vjlUUnQKrNJmBFgtW2ctLEUL6+1cF2SveCTQc=
X-Gm-Gg: AYBFou10Cw6PctOVZOOnLa3NznQf7X9SrBUJA3lBfZXmjMxgaQiYjVof5qD2R4p7995
	v9sEqSJLoeIcCuzLAyciCNZNCgDOTRr0HOdxJUxU0a7voX7Psd+zdBPK4Hh1mQofmRZtLb9BzlY
	8MFNOFePfQZHMSZo8HEpDy9y3r30XceU+wgTJxR2gHK0b+bxvdycxLvX8b0p4pIzfYQ3Xk5/HFN
	oLWpCP8zFnvdWRFD9f5SnNzvMXE1YlB7YUejmklck026m+26bUudaGon67JrPVS2XxwXMY6P1g6
	lS4Cq5G7vZFPG+iQJYG5WUZNyBVdQUjCKa5h0Wwy/pLnQf9kF8N7aZg/q5TADHIFnYGVtfKehXI
	TwIAV4IRoLnlbK6Y9v2v9/SFkCWdDKTPvuXhwsltEFpM7O3QDMPX84oLtLN8JKlASjpFnIKwMR4
	5gc/Xt2fohnEDwNoMQh57S7bA8of6uYg77pgrwmiL7j9eHfn3QFPfaW5oexJ+qmA8JYDixka+gm
	SoX6Pl7DFgA1I1op8jxhx5oa4Wdhz0ughlWNv3LUIqPco60Fa79GftQ0hgWSP7p6VLYVPZcN0ki
	0bB6yOi1UlZ7DVEdxOdH0kasbd5jARn7U/bK/lArm0IlpWRCFn+byflnoJc62CiiajfkrPoQZdm
	s2qnrVB2iHwSbD3CBFuYBpYBc29RJRlrI7CqW/nRtpBF8qxPKXCzQTYW1HOqIu1Tl4j5zt/sl2Y
	05+KG6fojWYGTIK+/FHdekPVIope1UMGUavC/Qb58o3bgtoB4dbd3Mj+0ytBZS9K67q7fNCV0Rg
	P9XVtSO1nN7EBY7xk1tN7KAezendZU=
X-Received: by 2002:a05:7301:4205:b0:369:d793:328d with SMTP id 5a478bee46e88-369e84bd8b1mr8924356eec.31.1792987102792;
        Sun, 25 Oct 2026 20:58:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm13277417eec.15.2026.10.25.20.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:58:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 4/8] HDF5: Remove license file
Date: Sun, 25 Oct 2026 20:58:10 -0700
Message-ID: <20261026035814.55254-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026035814.55254-1-khem.raj@oss.qualcomm.com>
References: <20261026035814.55254-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 03:58:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131416
Content-Type: text/plain; charset="utf-8"

Its added to OE-core via below commit

commit f9903f74ee36de4dd592f3bc8b1ce7b08f32608c
Author: Ross Burton <ross.burton@arm.com>
Date:   Fri Oct 17 14:16:25 2025 +0100

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/licenses/HDF5 | 92 -------------------------------------------
 1 file changed, 92 deletions(-)
 delete mode 100644 meta-oe/licenses/HDF5

diff --git a/meta-oe/licenses/HDF5 b/meta-oe/licenses/HDF5
deleted file mode 100644
index 10481dd107..0000000000
--- a/meta-oe/licenses/HDF5
+++ /dev/null
@@ -1,92 +0,0 @@
-Copyright Notice and License Terms for 
-HDF5 (Hierarchical Data Format 5) Software Library and Utilities
------------------------------------------------------------------------------
-
-HDF5 (Hierarchical Data Format 5) Software Library and Utilities
-Copyright (c) 2006-2018, The HDF Group. 
-
-NCSA HDF5 (Hierarchical Data Format 5) Software Library and Utilities
-Copyright (c) 1998-2006, The Board of Trustees of the University of Illinois. 
-
-All rights reserved.
-
-Redistribution and use in source and binary forms, with or without 
-modification, are permitted for any purpose (including commercial purposes) 
-provided that the following conditions are met:
-
-1. Redistributions of source code must retain the above copyright notice, 
-   this list of conditions, and the following disclaimer.
-
-2. Redistributions in binary form must reproduce the above copyright notice, 
-   this list of conditions, and the following disclaimer in the documentation 
-   and/or materials provided with the distribution.
-
-3. Neither the name of The HDF Group, the name of the University, nor the 
-   name of any Contributor may be used to endorse or promote products derived 
-   from this software without specific prior written permission from 
-   The HDF Group, the University, or the Contributor, respectively.
-
-DISCLAIMER: 
-THIS SOFTWARE IS PROVIDED BY THE HDF GROUP AND THE CONTRIBUTORS 
-"AS IS" WITH NO WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED. IN NO EVENT SHALL THE HDF GROUP OR THE CONTRIBUTORS BE LIABLE FOR ANY DAMAGES SUFFERED BY THE USERS ARISING OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- 
-You are under no obligation whatsoever to provide any bug fixes, patches, or upgrades to the features, functionality or performance of the source code ("Enhancements") to anyone; however, if you choose to make your Enhancements available either publicly, or directly to The HDF Group, without imposing a separate written license agreement for such Enhancements, then you hereby grant the following license: a non-exclusive, royalty-free perpetual license to install, use, modify, prepare derivative works, incorporate into other computer software, distribute, and sublicense such enhancements or derivative works thereof, in binary and source code form.
-
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-
-Limited portions of HDF5 were developed by Lawrence Berkeley National 
-Laboratory (LBNL). LBNL's Copyright Notice and Licensing Terms can be
-found here: COPYING_LBNL_HDF5 file in this directory or at 
-http://support.hdfgroup.org/ftp/HDF5/releases/COPYING_LBNL_HDF5. 
-
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-
-Contributors:   National Center for Supercomputing Applications (NCSA) at 
-the University of Illinois, Fortner Software, Unidata Program Center (netCDF), The Independent JPEG Group (JPEG), Jean-loup Gailly and Mark Adler (gzip), and Digital Equipment Corporation (DEC).
-
------------------------------------------------------------------------------
- 
-Portions of HDF5 were developed with support from the Lawrence Berkeley 
-National Laboratory (LBNL) and the United States Department of Energy 
-under Prime Contract No. DE-AC02-05CH11231.
-
------------------------------------------------------------------------------
-
-Portions of HDF5 were developed with support from the University of 
-California, Lawrence Livermore National Laboratory (UC LLNL).  
-The following statement applies to those portions of the product and must 
-be retained in any redistribution of source code, binaries, documentation, 
-and/or accompanying materials:
-
-   This work was partially produced at the University of California, 
-   Lawrence Livermore National Laboratory (UC LLNL) under contract 
-   no. W-7405-ENG-48 (Contract 48) between the U.S. Department of Energy 
-   (DOE) and The Regents of the University of California (University) 
-   for the operation of UC LLNL.
-
-   DISCLAIMER: 
-   This work was prepared as an account of work sponsored by an agency of 
-   the United States Government. Neither the United States Government nor 
-   the University of California nor any of their employees, makes any 
-   warranty, express or implied, or assumes any liability or responsibility 
-   for the accuracy, completeness, or usefulness of any information, 
-   apparatus, product, or process disclosed, or represents that its use 
-   would not infringe privately- owned rights. Reference herein to any 
-   specific commercial products, process, or service by trade name, 
-   trademark, manufacturer, or otherwise, does not necessarily constitute 
-   or imply its endorsement, recommendation, or favoring by the United 
-   States Government or the University of California. The views and 
-   opinions of authors expressed herein do not necessarily state or reflect 
-   those of the United States Government or the University of California, 
-   and shall not be used for advertising or product endorsement purposes.
-
------------------------------------------------------------------------------
-
-HDF5 is available with the SZIP compression library but SZIP is not part 
-of HDF5 and has separate copyright and license terms. See SZIP Compression 
-in HDF Products (www.hdfgroup.org/doc_resource/SZIP/) for further details.
-
------------------------------------------------------------------------------
-
