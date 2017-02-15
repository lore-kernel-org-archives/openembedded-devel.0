Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 225A171E0C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 18:03:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1FI3WY5016267
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 15 Feb 2017 10:03:33 -0800
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 15 Feb 2017 10:03:32 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 15 Feb 2017 13:03:28 -0500
Message-ID: <1487181811-31445-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/3] fix gstreamer and its assoc. fallout
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
X-List-Received-Date: Wed, 15 Feb 2017 18:03:36 -0000
Content-Type: text/plain

Recently gstreamer was blacklisted due to the build issue here:

http://errors.yoctoproject.org/Errors/Details/130583/

Here, we fix the dependency issue causing the above issue, and
then undo all the blacklisting fallout from things that depended
on gstreamer directly and indirectly.

Paul.
--

Paul Gortmaker (3):
  gstreamer: fix dependency issue and un-blacklist it
  remove blacklist entries against blacklisted gstreamer
  farsight/xfce4-mixer: unblacklist recipes

 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb                       | 2 --
 meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb                      | 3 ---
 meta-gnome/recipes-support/florence/florence_0.5.4.bb                 | 2 --
 .../recipes-multimedia/gstreamer-0.10/gst-fluendo-mp3_0.10.31.bb      | 2 --
 .../gstreamer-0.10/gst-fluendo-mpegdemux_0.10.85.bb                   | 2 --
 .../recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb           | 2 --
 .../recipes-multimedia/gstreamer-0.10/gst-openmax_0.10.1.bb           | 2 --
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-bad_0.10.23.bb      | 2 --
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb     | 2 --
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb        | 2 --
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb     | 2 --
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb     | 2 --
 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb  | 2 --
 .../recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb            | 4 +---
 meta-oe/recipes-support/farsight/farsight2_0.0.22.bb                  | 4 ----
 meta-oe/recipes-support/farsight/libnice_0.0.13.bb                    | 2 --
 meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb              | 2 --
 17 files changed, 1 insertion(+), 38 deletions(-)

-- 
2.7.4


