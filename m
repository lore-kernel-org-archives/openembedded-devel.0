Received: from [64.233.162.230] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <raj.khem@gmail.com>) id 1IOe0s-0003Ne-24
	for Openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2007 20:36:06 +0200
Received: by nz-out-0506.google.com with SMTP id j2so570379nzf
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2007 11:34:47 -0700 (PDT)
Received: by 10.114.178.1 with SMTP id a1mr655638waf.1187980486787;
	Fri, 24 Aug 2007 11:34:46 -0700 (PDT)
Received: by 10.115.73.16 with HTTP; Fri, 24 Aug 2007 11:34:46 -0700 (PDT)
Message-ID: <19c1b8a90708241134m5974cdd5ue518525705a1cf0d@mail.gmail.com>
Date: Fri, 24 Aug 2007 11:34:46 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: Openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Prefer eglibc-initial for eglibc based angstrom distro.
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
X-List-Received-Date: Fri, 24 Aug 2007 18:36:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello

This is similar patch to commit 6951a4bf0c57a677b8f2cdf1144402fe1358e3e1

OK?

Thanks

-Khem

#
# old_revision [652ba8904b6a89303952bc2a381a883001ceda70]
#
# patch "conf/distro/include/angstrom-eglibc.inc"
#  from [4e302c110a6fbfde708303672e19e149984c7108]
#    to [58bb03f9d2c14cb37e201fb02fbd7f20e95a164e]
#
============================================================
--- conf/distro/include/angstrom-eglibc.inc
4e302c110a6fbfde708303672e19e149984c7108
+++ conf/distro/include/angstrom-eglibc.inc
58bb03f9d2c14cb37e201fb02fbd7f20e95a164e
@@ -1,7 +1,8 @@ PREFERRED_PROVIDER_virtual/libc ?= "egli
 # eglibc:
 PREFERRED_PROVIDER_virtual/libiconv ?= "eglibc"
 PREFERRED_PROVIDER_virtual/libintl ?= "eglibc"
 PREFERRED_PROVIDER_virtual/libc ?= "eglibc"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial ?= "eglibc-initial"

 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc
= "eglibc-intermediate"
 PREFERRED_PROVIDER_virtual/arm-angstrom-linux-gnueabi-libc-for-gcc
= "eglibc-intermediate"


