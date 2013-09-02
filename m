Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DE0EA6BD13
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Sep 2013 02:54:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r822sF88028310
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 1 Sep 2013 19:54:15 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 1 Sep 2013 19:54:14 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Sep 2013 10:54:10 +0800
Message-ID: <cover.1378089935.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1] remove the unnecessary protocol parameters
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Sep 2013 02:54:19 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

What I did to remove these:
I checked that we should remove those using default protocol git for git fetcher:
$ find meta* \( -name *.bb -o -name *.inc -o -name *.bbclass \) -exec sed -n 's/.*"\(\w*:\/\/\).*\(;protocol=\w*\)/\1 \2/p' {} \; | sort | uniq
git:// ;protocol=git \
git:// ;protocol=git"
git:// ;protocol=git;branch=${BRANCH}"
git:// ;protocol=git;branch=gnome-2-32"
git:// ;protocol=git;branch=master \
git:// ;protocol=git;branch=master"
git:// ;protocol=git;tag=ca39eb1d98e736109c64ff9c1aa2a6ecca222d8f \
git:// ;protocol=git;tag=${TAG} \
git:// ;protocol=http"
git:// ;protocol=http;branch=master \
git:// ;protocol=http;branch=master"
hg:// ;protocol=http"
hg:// ;protocol=https;module=vim"
svn:// ;protocol=http \
svn:// ;protocol=http"
svn:// ;protocol=https \
svn:// ;protocol=https"
svn:// ;protocol=https;module=trunk"

To remove:
$ find meta* \( -name *.bb -o -name *.inc -o -name *.bbclass \) -exec sed -i 's/;protocol=git//' {} \;

What left with protocol parameter after removal is:
$ find meta* \( -name *.bb -o -name *.inc -o -name *.bbclass \) -exec sed -n 's/.*"\(\w*:\/\/\).*\(;protocol=\w*\)/\1 \2/p' {} \; | sort | uniq
git:// ;protocol=http"
git:// ;protocol=http;branch=master \
git:// ;protocol=http;branch=master"
hg:// ;protocol=http"
hg:// ;protocol=https;module=vim"
svn:// ;protocol=http \
svn:// ;protocol=http"
svn:// ;protocol=https \
svn:// ;protocol=https"
svn:// ;protocol=https;module=trunk"

Martin will do the "bitbake world" test.

--
The following changes since commit 72e23c12296fbc77193898c38426add58d0c2d71:

  mysql5: replace with mariadb 5.1.67 and tweak (2013-08-27 16:39:31 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/d_remove_protocol_0902_0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_remove_protocol_0902_0

Jackie Huang (1):
  remove the unnecessary protocol parameters

 meta-efl/recipes-efl/e17/e-tasks_git.bb            |    2 +-
 .../recipes-filesystems/smbnetfs/smbnetfs_git.bb   |    2 +-
 .../recipes-utils/f2fs-tools/f2fs-tools_1.1.0.bb   |    2 +-
 .../recipes-gnome/eds/evolution-data-server_git.bb |    2 +-
 .../gnome-settings-daemon_2.32.1.bb                |    2 +-
 meta-gnome/recipes-gnome/pimlico/contacts_git.bb   |    2 +-
 meta-gnome/recipes-gnome/pimlico/dates_git.bb      |    2 +-
 meta-gnome/recipes-gnome/pimlico/tasks_git.bb      |    2 +-
 .../recipes-bsp/kexecboot/kexecboot-klibc_git.bb   |    2 +-
 .../recipes-bsp/kexecboot/kexecboot_git.bb         |    2 +-
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |    2 +-
 .../recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb  |    2 +-
 .../recipes-mediacentre/xbmc/xbmc_git.bb           |    2 +-
 .../dleyna/media-service-demo_git.bb               |    2 +-
 meta-networking/recipes-daemons/atftp/atftp_git.bb |    2 +-
 .../recipes-connectivity/gnuradio/gnuradio_git.bb  |    2 +-
 .../phonet-utils/phonet-utils_git.bb               |    2 +-
 meta-oe/recipes-connectivity/soft66/soft66_git.bb  |    2 +-
 meta-oe/recipes-connectivity/uhd/uhd_git.bb        |    2 +-
 meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb |    2 +-
 .../concurrencykit/concurrencykit_git.bb           |    2 +-
 meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb  |    2 +-
 .../vala-dbus-binding-tool_git.bb                  |    2 +-
 .../recipes-extended/socketcan/canutils_4.0.6.bb   |    2 +-
 .../socketcan/libsocketcan_0.0.8.bb                |    2 +-
 .../recipes-graphics/dietsplash/dietsplash_git.bb  |    2 +-
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |    2 +-
 .../recipes-graphics/ttf-fonts/ttf-droid_git.bb    |    2 +-
 .../xorg-driver/xf86-video-glamo_git.bb            |    2 +-
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    2 +-
 .../recipes-multimedia/v4l2apps/media-ctl_git.bb   |    2 +-
 .../recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb |    2 +-
 meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb   |    2 +-
 meta-oe/recipes-navigation/gypsy/gypsy_git.bb      |    2 +-
 meta-oe/recipes-support/daemonize/daemonize_git.bb |    2 +-
 meta-oe/recipes-support/inih/libinih_git.bb        |    2 +-
 .../libatasmart/libatasmart_0.19.bb                |    2 +-
 meta-oe/recipes-support/lockdev/lockdev_git.bb     |    2 +-
 .../serial-utils/pty-forward-native.bb             |    2 +-
 .../serial-utils/serial-forward_git.bb             |    2 +-
 .../vala-terminal/vala-terminal_git.bb             |    2 +-
 meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb  |    2 +-
 .../closebutton/xfce4-closebutton-plugin_git.bb    |    2 +-
 43 files changed, 43 insertions(+), 43 deletions(-)

-- 
1.7.4.1


