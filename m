Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 132AD60703
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jun 2014 23:39:03 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id hy4so4325591vcb.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jun 2014 16:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=iZ3YkwcyhzPWbe6KWc/nuEYdxDJYVAPaMBnYnD+1fQA=;
	b=RZqBWh/OazEstRz8nrH6HbyrygfDkl55E4bYNnYymzD1vFW7Rl2B9/7mgOJGWbPseL
	vVwkkXzVlHsi49IzDAS6GTY4kxxlAubQlFZzoV+DI2zRSfi6tqo9Kh2mCpX0SLxhMx5U
	6DxHyiPUfVNPTZHlhHO9loV36zWdFDv/xklRDWXqa1xad/VkbcVrGK25OcHgmZB50yrf
	Fs/nCmwu6J3MtY18xQ93mSdA9p0HQWUuprktmG6ZarNTVFVBBtXcGwt1ZEexQ6F9e4JL
	n3dKH5svs1TrTEzis0JgCHfR/BEaPseHUP+sNiRlE/WB+iIw+A9/Kcg//XFxWeGouV+5
	XRUQ==
MIME-Version: 1.0
X-Received: by 10.220.103.141 with SMTP id k13mr16483473vco.25.1403825944271; 
	Thu, 26 Jun 2014 16:39:04 -0700 (PDT)
Received: by 10.52.234.105 with HTTP; Thu, 26 Jun 2014 16:39:04 -0700 (PDT)
Date: Thu, 26 Jun 2014 16:39:04 -0700
Message-ID: <CAFeBWL4p+pD1bEhjfQNVWLUowd1FmQOc7Y5m4845462yJ22OFw@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Installing RPM packages in SDK sysroot
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
X-List-Received-Date: Thu, 26 Jun 2014 23:39:06 -0000
Content-Type: text/plain; charset=UTF-8

Hello everyone, in the section 4.2. Configuring the PMS of the Yocto ADT
manual, it describes adding packages to a target sysroot using OPKG. This
method works well as documented. However my choice of package manager is
Yocto's default - RPM. And I was not able to successfully install RPM
packages in the SDK sysroot.

Ultimately, I think installing RPM packages using SmartPM fails because the
list of installed packages is not included in the SDK sysroot. A deployable
image contains a file called Packages in /var/lib/rpm. The SDK sysroot does
not have this file and shows 0 installed packages when I run `smart stats`.
Note that when I am using OPKG instead of RPM, I have the equivalent
package index file in /var/lib/opkg/lists for both sysroot and deployable
images.

I can still attempt to install a package, but it quite literally wants to
rebuild the entire rootfs. For example, running `smart install opencv-dev`
warns that it has to install 400 packages. These packages include
base-files, bash, m4, make, python-dev etc.

So this makes me think that either RPM is not supported in SDK sysroot or
the feature is incomplete. It's also possible that I have missed an
important detail.

I will be looking into the sdk class and the package manager class to see
what's really happening. In the meanwhile I'd appreciate if someone can
provide some pointers!

Thanks,

Adam

