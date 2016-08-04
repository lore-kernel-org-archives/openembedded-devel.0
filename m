Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 333F77391A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Aug 2016 03:42:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u743gQA0030437
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 3 Aug 2016 20:42:26 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Aug 2016 20:42:25 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 3 Aug 2016 23:42:22 -0400
Message-ID: <cover.1470281253.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 0/2] gnome-disk-utility: remove blacklist caused by avahi-ui
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
X-List-Received-Date: Thu, 04 Aug 2016 03:42:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Jackie Huang <jackie.huang@windriver.com>

gnome-disk-utility seems old and was only used by gvfs-gdu-volume-monitor which
has been removed by:

commit 52d0cb4348c2518af40d9019413ae046b9eb971b
Author: Andreas Müller <schnitzeltony@googlemail.com>
Date:   Sat Jan 9 22:47:20 2016 +0100

    gvfs: update to 1.24.2 to make access to windows shares work again

    * Our very old and heavily patched version was broken for windows shares by
      the update of samba to 4.x
    * Update to latest gvfs version (1.26.2 currently) is not possible due to
    | configure: error: Package requirements (glib-2.0 >= 2.45.7 gobject-2.0 gmodule-no-export-2.0 gio-unix-2.0 gio-2.0) were not met:
    |
    | Requested 'glib-2.0 >= 2.45.7' but version of GLib is 2.44.1
    * Licence checksum changed by updating the address of the FSF [1]
    * obexftp support was removed in [2]
    * the gdu/circular dependency hack using very old gnome-disk-utility was solved
      by using udisk2 volume monitor
    * systemd-login detection was fixed
    * some more PACKAGECONFIGs disabled by default (all set -except 'cdda'- was
      build tested)

    [1] https://git.gnome.org/browse/gvfs/commit/?id=1e9c89eafaac6b3a759115df9981526fe9083461
    [2] https://git.gnome.org/browse/gvfs/commit/?id=606ef241fb8677528bd5d5526854658f0f298a2c

    Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


This can fix the failure and return gnome-disk-utility back from blacklist,
but if there is any plan to remove it or upgrade it to 3.x, please ignore.

Thanks,
Jackie

--
The following changes since commit df5141af8dfd19c2b2dbfb65f58eda7a509fafd8:

  libssh2: upgrade to 1.7.0 (2016-07-29 11:01:02 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_gnome-disk-utility_160803_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_gnome-disk-utility_160803_0

Jackie Huang (2):
  meta-gnome/layer.conf: enable gtk for avahi-ui
  Revert "gnome-disk-utility: blacklist because of avahi-ui"

 meta-gnome/conf/layer.conf                                             | 2 ++
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb      | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

-- 
2.8.1


