Received: from www.dynamicdevices.co.uk ([89.200.136.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1SxMwy-0004ln-Qn
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Aug 2012 20:50:16 +0200
Received: from cpc8-live22-2-0-cust106.know.cable.virginmedia.com
	([82.42.168.107] helo=[127.0.0.1])
	by www.dynamicdevices.co.uk with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1SxMHJ-00006A-T1
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Aug 2012 18:07:13 +0000
Message-ID: <501C135F.8000303@dynamicdevices.co.uk>
Date: Fri, 03 Aug 2012 19:07:27 +0100
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Problem building with meta-oe udev_182 recipe
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
X-List-Received-Date: Fri, 03 Aug 2012 18:50:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I'm taking a look at building a Poky DISTRO out of oe-core (met-yocto) 
for an atom-pc
MACHINE target.

I've tried a number of image recipes, from core-image-minimal, -base, 
-sato and so
forth. I have the the meta-oe layer pulled in via bblayers.config.

All images seem to hang on start-up, with a suspicious message about a 
missing udevd.

I've tried a range of bblayer configurations, both with and without the 
new meta-systemd
I've been hearing about, to no avail.

Current bblayers config is simply:

   /data_drive/stream/oe-core/meta \
   /data_drive/stream/oe-core/meta-openembedded/meta-oe \
   /data_drive/stream/oe-core/meta-yocto/meta-yocto \

Having investigated a little, I see that when I build udev, meta-oe 
provides a udev_182 which is the
default and there are QA warnings reported when building:

NOTE: package udev-182-r1: task do_package: Started
WARNING: QA Issue: udev: Files/directories were installed but not 
shipped  /usr/sbin
WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.1.1, installed in the 
base_prefix, requires a shared library under exec_prefix (/usr): 
libgobject-2.0.so.0 => /usr/lib/libgobject-2.0.so.0 (0xdead1000)
WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.1.1, installed in the 
base_prefix, requires a shared library under exec_prefix (/usr): 
libgthread-2.0.so.0 => /usr/lib/libgthread-2.0.so.0 (0xdead2000)
WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.1.1, installed in the 
base_prefix, requires a shared library under exec_prefix (/usr): 
libffi.so.5 => /usr/lib/libffi.so.5 (0xdead3000)
WARNING: QA Issue: udev: /lib/libgudev-1.0.so.0.1.1, installed in the 
base_prefix, requires a shared library under exec_prefix (/usr): 
libglib-2.0.so.0 => /usr/lib/libglib-2.0.so.0 (0xdead4000)
WARNING: QA Issue: udev: /lib/udev/udevd, installed in the base_prefix, 
requires a shared library under exec_prefix (/usr): libkmod.so.2 => 
/usr/lib/libkmod.so.2 (0xdead3000)
NOTE: package udev-182-r1: task do_package: Succeeded

So that would seem to explain the missing udevd.

I did spot some conversation about a kmod_git.bb patch, which was 
reverted as it broke udev_182.bb, but this seems to have been reverted

http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg25435.html

I have found that setting PREFERRED_VERSION_udev = "164" in local.conf 
and rebuilding seems
to resolve the issue, but I'd like to understand what's going wrong 
rather than use the old udev.

Can anybody advise?

Is is as simple as "don't use the meta-oe layer"?

On a somewhat related note, when I add in the meta-systemd layer I get 
warnings about multiple providers for udev.
Should I be able simply to add in meta-systemd and define a 
PREFERRED_PROVIDER_udev = "systemd" ?

Thanks,

Alex


















