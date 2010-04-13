Received: from mail-yx0-f204.google.com ([209.85.210.204])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ttkrpink@gmail.com>) id 1O1WqB-0003qG-O9
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 05:31:08 +0200
Received: by yxe42 with SMTP id 42so3041252yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Apr 2010 20:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:received:message-id
	:subject:from:to:content-type;
	bh=c5iLdq0vkWli1DFbxfbDOEHVNXExTpAUQHHvoEx+Zdw=;
	b=YQnnWZhivfBXGV9CQjkESJ0kdjE3TvROjn8ztVH573+L2hcGEJO7mBk1pzLqKEQBDL
	OfJkiSL7VIHz/V9bf6d7A6YFMGWEMGVwYSzdU5RRUWydgknm/vxnjwsHOB9Xvv+DPgAF
	URBlGfDzc0YL+Nwk6Bxcxq6tQHTEdk3rL0/Vk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=aV5voo2+CvSpEVtT4MEmbDIvZQse1Xhx6ar46WZVh2LOJpxNNCZ1Mn1I5uKHGxnAzE
	KvY5bTkePVlUDEMMNUoj7EsjwHkSPX3FJQZPW7JGkx6I1kT+j+tCKr33IaYZXYNW7BmA
	8TJzBLUaeVU8g4scwCaUpnK95aF4BmtCGYOJs=
MIME-Version: 1.0
Received: by 10.100.152.3 with HTTP; Mon, 12 Apr 2010 20:27:38 -0700 (PDT)
Date: Mon, 12 Apr 2010 22:27:38 -0500
Received: by 10.101.149.40 with SMTP id b40mr8228867ano.99.1271129258956; Mon, 
	12 Apr 2010 20:27:38 -0700 (PDT)
Message-ID: <s2ud2a86f8e1004122027pf357420tc3cc7d0aea062740@mail.gmail.com>
From: ttk rpink <ttkrpink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.204
X-SA-Exim-Mail-From: ttkrpink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: OE failed at task 8045 of 8046
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
X-List-Received-Date: Tue, 13 Apr 2010 03:31:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

All,

My OE is updated. I want to build the beagleboard-demo-image. The job fail
at the rootfs stage 8045 of 8046. It seems the update-rc.d uses "-s" option
but my ubuntu system does not support that option. Is there a way to solve
this?

Thanks alot.

bitbake beagleboard-demo-image


Configuring angstrom-version.
Configuring xf86-input-evdev.
Collected errors:
 * satisfy_dependencies_for: Cannot satisfy the following dependencies for
task-beagleboard-demo:
 *      gnome-python-desktop *
 * opkg_install_cmd: Cannot install package task-beagleboard-demo.
+ export D=/home/setup/stuff/tmp/rootfs/beagleboard-demo-image
+ D=/home/setup/stuff/tmp/rootfs/beagleboard-demo-image
+ export OFFLINE_ROOT=/home/setup/stuff/tmp/rootfs/beagleboard-demo-image
+ OFFLINE_ROOT=/home/setup/stuff/tmp/rootfs/beagleboard-demo-image
+ export
IPKG_OFFLINE_ROOT=/home/setup/stuff/tmp/rootfs/beagleboard-demo-image
+ IPKG_OFFLINE_ROOT=/home/setup/stuff/tmp/rootfs/beagleboard-demo-image
+ export
OPKG_OFFLINE_ROOT=/home/setup/stuff/tmp/rootfs/beagleboard-demo-image
+ OPKG_OFFLINE_ROOT=/home/setup/stuff/tmp/rootfs/beagleboard-demo-image
+ '[' full '!=' none ']'
+ mkdir -p /home/setup/stuff/tmp/rootfs/beagleboard-demo-image/etc/opkg/
+ grep '^arch' /home/setup/stuff/tmp/staging/i686-linux/etc/opkg.conf
+ for i in
'/home/setup/stuff/tmp/rootfs/beagleboard-demo-image/usr/lib/opkg/info/*.preinst'
+ '[' -f
'/home/setup/stuff/tmp/rootfs/beagleboard-demo-image/usr/lib/opkg/info/*.preinst'
']'
+ for i in
'/home/setup/stuff/tmp/rootfs/beagleboard-demo-image/usr/lib/opkg/info/*.postinst'
+ '[' -f
/home/setup/stuff/tmp/rootfs/beagleboard-demo-image/usr/lib/opkg/info/dbus.postinst
']'
+ sh -e
/home/setup/stuff/tmp/rootfs/beagleboard-demo-image/usr/lib/opkg/info/dbus.postinst
configure
update-rc.d: error: unknown optionusage: update-rc.d [-n] [-f] <basename>
remove
       update-rc.d [-n] <basename> defaults [NN | SS KK]
       update-rc.d [-n] <basename> start|stop NN runlvl [runlvl] [...] .
       update-rc.d [-n] <basename> disable|enable [S|2|3|4|5]
                -n: not really
                -f: force




ttk

