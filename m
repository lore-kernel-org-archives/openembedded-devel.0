Received: from [209.85.198.248] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LRZtZ-0004MT-Ai
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jan 2009 23:25:29 +0100
Received: by rv-out-0708.google.com with SMTP id f25so6693169rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2009 14:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=r8EdLgmkmkmk8wtlNvZ16JY+5y2aqXiiqpah0ufclx8=;
	b=OLadr6IXyQjULOr5lqUNsyQX6QLeK/Iop7A01pjpwGXifOpuiWWxjNLrgtT9dYB/7R
	vl1UpvO6nc2yujAWfsmvRjK7Puo1MSKZ3vcq7HoHa0lXLt9box2mwRuQnceXSiiJWnqf
	OoZzGW9x8XnpTpsRE8u/nucFD26dgd65Tw0LM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=TbXnghuCFlj9H8RqYbI4HKl2SBzSWLqaWu3XGaWc4e77Xw/TG2uGc6N8H/A7byyypS
	dAT5GWoQXAuefpP498439r4nYoI/mhHSUfjyjtuiUHSigUo8uAqQBo6jlFGClpI5Nrhv
	rHJviXUX2xKV6Uqx2IP9ueWpoeQnlPpKUETrI=
MIME-Version: 1.0
Received: by 10.141.203.7 with SMTP id f7mr407478rvq.67.1233008279299; Mon, 26 
	Jan 2009 14:17:59 -0800 (PST)
Date: Mon, 26 Jan 2009 17:17:59 -0500
Message-ID: <f96d234e0901261417o380cd173w781d412e8d3048eb@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC] module.bbclass: add make flags to module_do_install
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
X-List-Received-Date: Mon, 26 Jan 2009 22:25:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Anyone see any problems with this?  I was running into an issue where
KERNELDIR needs to be set for module_do_install, or else it would use
the host kernel directory, and thus version.

Thanks,
Cliff

diff --git a/classes/module.bbclass b/classes/module.bbclass
index 8ab92a5..eef9829 100644
--- a/classes/module.bbclass
+++ b/classes/module.bbclass
@@ -3,21 +3,24 @@ DEPENDS += "virtual/kernel"

 inherit module-base

+MODULE_MAKE_FLAGS = '\
+       KERNEL_PATH=${STAGING_KERNEL_DIR}\
+       KERNEL_SRC=${STAGING_KERNEL_DIR}\
+       KDIR=${STAGING_KERNEL_DIR}\
+       KERNELDIR=${STAGING_KERNEL_DIR}\
+       KERNEL_VERSION=${KERNEL_VERSION}\
+       CC="${KERNEL_CC}" LD="${KERNEL_LD}"\
+       AR="${KERNEL_AR}"\
+       '
+
 module_do_compile() {
        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-       oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
-                  KERNEL_SRC=${STAGING_KERNEL_DIR}    \
-                  KDIR=${STAGING_KERNEL_DIR}    \
-                  KERNELDIR=${STAGING_KERNEL_DIR} \
-           KERNEL_VERSION=${KERNEL_VERSION}    \
-                  CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
-                  AR="${KERNEL_AR}" \
-                   ${MAKE_TARGETS}
+       oe_runmake ${MODULE_MAKE_FLAGS} ${MAKE_TARGETS}
 }

 module_do_install() {
        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-       oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}"
CC="${KERNEL_CC}" LD="${KERNEL_LD}" modules_install
+       oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}"
${MODULE_MAKE_FLAGS} modules_install
 }



-- 
=======================
Cliff Brake
http://bec-systems.com


