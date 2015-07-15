Return-Path: <keshavpeswani@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id C6BB165CBD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2015 01:29:49 +0000 (UTC)
Received: by ykay190 with SMTP id y190so23960433yka.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2015 18:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=t7USjWR0SJZ6vv9wHy10auCub0YoTPS2KZN4JGKo2pE=;
	b=VUOxBQ8v2Eytgh9y59QT1mX+0ztnqdX0UW1GHLaJo2fvw0gwbj9s7GfQrClcXWXCDC
	rxWro1BfVedeYITStjep2+PP8FmfIy9aUvd0y5hy1Ty+3PyEoAc6NfgZJvtclX8J9Xa7
	vtDbV3ommXMxtotZ0sHAWvbil+jWt9IFrWham/gPfghEcjF001YSuEiv4gVtCBytHFvZ
	dvGbczO3bDtZxdOM6FtqOUhEcP7IYcxPmEYlU6Jo7DasznAWzVJ1+jrglzS00Y+Oy+g/
	kEbOFGJZ9aGouC/XxlUNK4gWz1mOApDvoE3acmPCeCGjOXxuxg6789ZQzWHasPIvJ2tq
	X6SA==
MIME-Version: 1.0
X-Received: by 10.170.37.14 with SMTP id 14mr1566279ykf.129.1436923789975;
	Tue, 14 Jul 2015 18:29:49 -0700 (PDT)
Received: by 10.129.42.194 with HTTP; Tue, 14 Jul 2015 18:29:49 -0700 (PDT)
Date: Wed, 15 Jul 2015 06:59:49 +0530
Message-ID: <CAJJ_cjRPvVa9Uu=0jT3OCgPMKizq4+5s3r8q0izgnQm7eY=bNg@mail.gmail.com>
From: Keshav Peswani <keshavpeswani@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-gnome] Suggestion username and password in the login screen
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
X-List-Received-Date: Wed, 15 Jul 2015 01:29:51 -0000
Content-Type: text/plain; charset=UTF-8

Hi ,

While creating a customized distro for raspiberrypi 2 with meta-gnome
layer, the login screen username in the gdm_2.32.2.bb in
the USERADD_PARAM_${PN} (line number 89) is gdm but no password is
specified. Hence, when we are unable to login as /etc/shadow file has an
entry '!' instead of '*' as password for user 'gdm'.
To have a workaround for this, I created an encrypted password for 'root'
and added the same. Please go through the patch :

*keshav@L-41WKG32:~/workspace/yocto/meta-openembedded$ git diff
meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb <http://gdm_2.32.2.bb>*
*diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
<http://gdm_2.32.2.bb> b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
<http://gdm_2.32.2.bb>*
*index 723eee8..f6b9315 100644*
*--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb <http://gdm_2.32.2.bb>*
*+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb <http://gdm_2.32.2.bb>*
*@@ -89,7 +89,7 @@ INITSCRIPT_NAME = "gdm"*
* INITSCRIPT_PARAMS = "start 99 5 . stop 20 0 1 2 3 6 ."*

* USERADD_PACKAGES = "${PN}"*
*-USERADD_PARAM_${PN} = "--system --no-create-home --home
${localstatedir}/lib/gdm --user-group gdm"*
*+USERADD_PARAM_${PN} = "-p ZUVZbV/4Ia06k --system --no-create-home --home
${localstatedir}/lib/gdm --user-group gdm"*

* pkg_postinst_${PN} () {*
* # Register up as default dm*


Here, I have two suggestions :

1. The username could be more specific such as 'gnome' or something
2. The password could be specified such as 'root' or an entry in the
gdm.conf file for a passwordless login for that user.

Kindly suggest.
Also, I am very new to this so can I send a patch for this. Please suggest.

Thanks
Keshav

