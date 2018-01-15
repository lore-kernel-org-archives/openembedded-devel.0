Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9431E78683
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 09:14:14 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id g1so339564wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 01:14:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=elF+fPydJL3GTwA3MB0KlkEb/GYdjhWo4zbUmcQzLxA=;
	b=f7zqGTsS8JcndfD4wbmpWWEogBVrCUGsQeHZwa7bDkZU6fvFZDihSmupxRR0gzEr8o
	p6ss5onfO6NWyXsYqeuHAi0Peijtul7e9CsESSrMgWzwVgcMaBQ1GZGYrwgQ3/f4QUfl
	8ZlxFDDSFhcnKmZyzf4QmgiSRqs+1Y4FS57VcaFc6T0k7Gk3c3DGVbSy9iDi8SSzIPlF
	hcs+3jb1qGeTwPIVs2VR42gl2OGGeLWnnTXkY2tGAolLgHoVLYeJjbp0nKzIkjo57HnB
	LFUFB0dHbQ02jXRQ0SIdoQtbCe7KRnr/orc4yAyEiA8O+9GY/vWcphR7sdDMi84RWcHP
	p3XQ==
X-Gm-Message-State: AKwxyteMKTRMZGwNF2FseAoGgrDuXJssxxhqXLzt/f7eo0OWlQ0sd+7z
	d8+4gMhwxI6hVnRDoz6DxCv+GkBU
X-Google-Smtp-Source: ACJfBovAi8b4mA+C0a4XbDKWPZaSO3IAIB5+b/fUD2xAE1t+SubD0+flf/ip4+ZspuVZdCn2uT1D5g==
X-Received: by 10.80.137.225 with SMTP id h30mr13452405edh.304.1516007655475; 
	Mon, 15 Jan 2018 01:14:15 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	d3sm17254591edc.15.2018.01.15.01.14.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 01:14:14 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jan 2018 09:14:07 +0000
Message-Id: <20180115091408.1133-7-git@andred.net>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180115091408.1133-1-git@andred.net>
References: <20180115091408.1133-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-python][PATCH 7/8] python-pyparted: use beginline= in LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 15 Jan 2018 09:14:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

'startline' is not a recognised keyword, it's beginline.

python-pyparted: The new md5 checksum is 9e53304db812b80d0939e11bb69dcab2
python-pyparted: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvv beginline=10 vvvvvvvvvvvvvvvvvvvvvvvvvvvv
 * This copyrighted material is made available to anyone wishing to use,
 * modify, copy, or redistribute it subject to the terms and conditions of
 * the GNU General Public License v.2, or (at your option) any later version.
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY expressed or implied, including the implied warranties of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
 * Public License for more details.  You should have received a copy of the
 * GNU General Public License along with this program; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301, USA.  Any Red Hat trademarks that are incorporated in the
 * source code or documentation are not subject to the GNU General Public
 * License and may only be used or replicated with the express permission of
 * Red Hat, Inc.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ endline=22 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-python/recipes-extended/python-pyparted/python-pyparted.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted.inc b/meta-python/recipes-extended/python-pyparted/python-pyparted.inc
index 2192179be..c82909d10 100644
--- a/meta-python/recipes-extended/python-pyparted/python-pyparted.inc
+++ b/meta-python/recipes-extended/python-pyparted/python-pyparted.inc
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/rhinstaller/pyparted"
 LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "\
     file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
-    file://src/_pedmodule.c;startline=10;endline=22;md5=ebcb25dde1ac9c46e986dec79b404e7e \
+    file://src/_pedmodule.c;beginline=10;endline=22;md5=9e53304db812b80d0939e11bb69dcab2 \
 "
 DEPENDS += "parted"
 
-- 
2.15.1


