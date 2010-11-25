Received: from anti.mobis.co.kr ([211.217.52.67] helo=sniper.mobis.co.kr)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <srinivasa.ragolu@gmobis.com>) id 1PLV5V-0006L4-Bq
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 07:13:46 +0100
Received: (snipe 29320 invoked by uid 0); 25 Nov 2010 15:12:26 +0900
Received: from srinivasa.ragolu@gmobis.com with Spamsniper 2.94.22 (Processed
	in 0.012049 secs); 
Received: from unknown (HELO msmobiweb.mobis.co.kr) (10.240.100.165)
	by unknown with SMTP; 25 Nov 2010 15:12:26 +0900
X-RCPTTO: openembedded-devel@lists.openembedded.org
Received: from mkegmal01.global.mobis.co.kr ([10.240.200.82]) by
	msmobiweb.mobis.co.kr with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Nov 2010 15:12:26 +0900
Received: from [10.126.162.122] ([10.126.162.122]) by
	mkegmal01.global.mobis.co.kr with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Nov 2010 15:12:26 +0900
Message-ID: <4CEE4BB7.3060209@gmobis.com>
Date: Thu, 25 Nov 2010 17:12:47 +0530
From: Srinivasa Rao Ragolu <srinivasa.ragolu@gmobis.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.11) Gecko/20100720 Fedora/3.0.6-1.fc12 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 25 Nov 2010 06:12:26.0138 (UTC)
	FILETIME=[BB420FA0:01CB8C67]
X-SA-Exim-Connect-IP: 211.217.52.67
X-SA-Exim-Mail-From: srinivasa.ragolu@gmobis.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,
	DATE_IN_FUTURE_03_06, HTML_MESSAGE, SPF_PASS,
	UNPARSEABLE_RELAY autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: do_rootfs failing with gpgkey error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Nov 2010 06:13:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Hi Friends,
                  I have been working on a linux platform and mips 
processor. I am using openembedded to prepare rootfs and SDK. Till now 
for every package .ipk files are getting created. Now Its necessary to 
me to move from .ipk to .rpm. so I modified the following stanzas in distro

                  INHERIT += "package_rpm"
                 PREFERRED_PKG_FORMAT ?= "rpm"
# If we're using an .ipk based rootfs, we want to have opkg-nogpg 
installed so postinst script can run
IPKG_VARIANT = "opkg-nogpg" (/kept as it is for .rpm/)

                      Now I could able to build all the packages as 
.rpms successfully but in the final task do_rootfs failing with 
following errors...

| Yum Version: 3.2.18
| COMMAND: yum -c /home/srinivas/Downloads/build/openembedded/tmp/rootfs/avn-debug-image/etc/yum.conf --installroot /home/srinivas/Downloads/build/openembedded/tmp/rootfs/avn-debug-image -y install task-boot base-files base-passwd qt4-embedded dbus gstreamer gst-meta-base gst-meta-audio gst-meta-debug mtd-utils e2fsprogs upstart devicekit-disks audiomanagercore audiomanagerdistro gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-ffmpeg libncurses5 ncurses-base tmux ckermit python task-avn-debug wvdial usb-modeswitch usb-modeswitch-data libfontconfig1 tracker browser udev sysvinit sysvinit-pidof busybox
| Installroot: /home/srinivas/Downloads/build/openembedded/tmp/rootfs/avn-debug-image
| Ext Commands:
|
|    task-boot
|    base-files
|    base-passwd
|    qt4-embedded
|    dbus
|    gstreamer
|    gst-meta-base
|    gst-meta-audio
|    gst-meta-debug
|    mtd-utils
|    e2fsprogs
|    upstart
|    devicekit-disks
|    audiomanagercore
|    audiomanagerdistro
|    gst-plugins-base
|    gst-plugins-good
|    gst-plugins-bad
|    gst-plugins-ugly
|    gst-ffmpeg
|    libncurses5
|    ncurses-base
|    tmux
|    ckermit
|    python
|    task-avn-debug
|    wvdial
|    usb-modeswitch
|    usb-modeswitch-data
|    libfontconfig1
|    tracker
|    browser
|    udev
|    sysvinit
|    sysvinit-pidof
|    busybox
|
| You have enabled checking of packages via GPG keys. This is a good thing.
| However, you do not have any GPG public keys installed. You need to download
| the keys for packages you wish to install and install them.
| You can do that by running the command:
|     rpm --import public.gpg.key
|
|
| Alternatively you can specify the url to the key you would like to use
| for a repository in the 'gpgkey' option in a repository section and yum
| will install it for you.
|
| For more information contact your distribution or package provider.
|
NOTE: Task failed: /home/srinivas/Downloads/build/openembedded/tmp/work/avngen3-avn-linux/avn-debug-image-1.0-r0/temp/log.do_rootfs.2178
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/srinivas/Downloads/build/openembedded/recipes/images/avn-debug-image.bb do_rootfs failed
ERROR: Task 9 (/home/srinivas/Downloads/build/openembedded/recipes/images/avn-debug-image.bb, do_rootfs) failed
NOTE: Tasks Summary: Attempted 2492 tasks of which 2480 didn't need to be rerun and 1 failed.
ERROR: '/home/srinivas/Downloads/build/openembedded/recipes/images/avn-debug-image.bb' failed

                              *  I have tried so many things to resolve this issue. Could you please suggest me, How to disable gpg keys and build rootfs successfully.....

*

-- 
Thanks&  Regards
Srinivasa Rao Ragolu


