Received: from [72.14.220.158] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JNmOk-00087r-Gr
	for openembedded-devel@openembedded.org; Sat, 09 Feb 2008 10:53:26 +0100
Received: by fg-out-1718.google.com with SMTP id e12so3085385fga.0
	for <openembedded-devel@openembedded.org>;
	Sat, 09 Feb 2008 01:53:39 -0800 (PST)
Received: by 10.82.145.7 with SMTP id s7mr25072077bud.6.1202550818936;
	Sat, 09 Feb 2008 01:53:38 -0800 (PST)
Received: from widy.localdomain ( [88.231.85.196])
	by mx.google.com with ESMTPS id z40sm14221661ikz.4.2008.02.09.01.53.36
	(version=SSLv3 cipher=OTHER); Sat, 09 Feb 2008 01:53:37 -0800 (PST)
Date: Sat, 9 Feb 2008 11:56:07 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@openembedded.org
Message-ID: <20080209115607.23cb1fbf@widy.localdomain>
In-Reply-To: <20080131144417.58877daf@widy.localdomain>
References: <20080129011635.42467fc9@widy.localdomain>
	<1201562570.4687.79.camel@localhost.localdomain>
	<20080129023105.1a0cf354@widy.localdomain>
	<1201568452.4687.123.camel@localhost.localdomain>
	<20080131144417.58877daf@widy.localdomain>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [RFC] A case of distro config overriding DISTRO var
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Feb 2008 09:53:26 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Thu, 31 Jan 2008 14:44:17 +0200
Paul Sokolovsky <pmiscml@gmail.com> wrote:

[]
> 
> Ok, so at least we agree that overriding DISTRO without good reasons
> is superfluous, if not bad. Please see patch below. This actually
> leaves only Angstrom as overriding that variable.

Ok, that patch was applied, now one to actually preserve original
DISTRO value. Fully made per Richard's suggestions:

============================================================
--- classes/image.bbclass	4d92381733b09bae07a07da35bd0024744924c3c
+++ classes/image.bbclass	6eeae6a01c36465bc36cc737d42ea6b8ab09b152
@@ -90,6 +90,7 @@ fakeroot do_rootfs () {
 	${IMAGE_PREPROCESS_COMMAND}
 		
 	export TOPDIR=${TOPDIR}
+	export DISTRO=${USERDISTRO}
 	export MACHINE=${MACHINE}
 
 	for type in ${IMAGE_FSTYPES}; do
============================================================
--- conf/bitbake.conf	5044eed5572b1c9c12c31cf7952ccedc1648524c
+++ conf/bitbake.conf	3c7aa4886bde62462e9fcbbb9bbd4324bdee89af
@@ -529,6 +531,10 @@ include conf/local.conf
 include conf/site.conf
 include conf/auto.conf
 include conf/local.conf
+# USERDISTRO should always contain original DISTRO value as set by user
+# If a distro config overrides DISTRO for whatever reason (e.g. to get
+# overrides like it wants), USERDISTRO must be reassigned with := first
+USERDISTRO = "${DISTRO}"
 include conf/build/${BUILD_SYS}.conf
 include conf/target/${TARGET_SYS}.conf
 include conf/machine/${MACHINE}.conf
============================================================
--- conf/distro/include/angstrom.inc	6d2902857b621e681b3f0d4780dcd51ee236074e
+++ conf/distro/include/angstrom.inc	e5988ce8ee4aed5e7c532ed792c344cc08b7f3c4
@@ -1,7 +1,9 @@
 #@TYPE: Distribution
 #@NAME: Angstrom 
 #@DESCRIPTION: Release independent distribution configuration for Angstrom
 
+# Preserve original DISTRO value
+USERDISTRO := "${DISTRO}"
 DISTRO = "angstrom"
 DISTRO_NAME = "Angstrom"
 


[]


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


