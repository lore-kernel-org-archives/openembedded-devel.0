Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 6889871C54
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 11:48:00 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20170220114758887_0486
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 11:47:58 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [174.118.92.171] (port=53906 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cfmRd-00028E-A1 for openembedded-devel@lists.openembedded.org;
	Mon, 20 Feb 2017 06:47:53 -0500
Date: Mon, 20 Feb 2017 06:47:51 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1702200641270.22953@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: "Can't install krb5-dev-1.13.6-r0@ppc7400: no package provides krb5 = 1.13.6-r0"
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
X-List-Received-Date: Mon, 20 Feb 2017 11:48:00 -0000
Content-Type: text/plain; charset=US-ASCII


  ok, i hope this issue is not trivially simple. i'm building
core-image-minimal for qemuppc, and tossing in a bunch of other
recipes, everything builds until:

///// start /////
ERROR: core-image-minimal-1.0-r0 do_rootfs: Unable to install
packages. Command
'/home/rpjday/oe/builds/qemuppc_oe_small/tmp/work/qemuppc-poky-linux/core-image-minimal/1.0-r0/recipe-sysroot-native/usr/bin/smart
--log-level=info
--data-dir=/home/rpjday/oe/builds/qemuppc_oe_small/tmp/work/qemuppc-poky-linux/core-image-minimal/1.0-r0/rootfs/var/lib/smart
install -y packagegroup-core-boot@qemuppc rpm@ppc7400
packagegroup-wrl-regular-recipes@all smartpm@ppc7400
run-postinsts@all' returned 1:
Loading cache...
Updating cache...
######################################## [100%]

Computing transaction...error: Can't install
krb5-dev-1.13.6-r0@ppc7400: no package provides krb5 = 1.13.6-r0


ERROR: core-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs
ERROR: Logfile of failure stored in:
/home/rpjday/oe/builds/qemuppc_oe_small/tmp/work/qemuppc-poky-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.22573
ERROR: Task
(/home/rpjday/oe/dist/layers/poky/meta/recipes-core/images/core-image-minimal.bb:do_rootfs)
failed with exit code '1'
///// end /////

  a quick check shows the following rpms:

$ find tmp/deploy/rpm/ -name "*krb*"
tmp/deploy/rpm/qemuppc/kernel-module-rpcsec-gss-krb5-4.8.18-yocto-standard-4.8.18+git0+ea8a679c95_d2c3ea488f-r0.qemuppc.rpm
tmp/deploy/rpm/ppc7400/libgssapi-krb5-2-1.13.6-r0.ppc7400.rpm
tmp/deploy/rpm/ppc7400/krb5-kdc-1.13.6-r0.ppc7400.rpm
tmp/deploy/rpm/ppc7400/krb5-doc-1.13.6-r0.ppc7400.rpm
tmp/deploy/rpm/ppc7400/krb5-dev-1.13.6-r0.ppc7400.rpm
tmp/deploy/rpm/ppc7400/krb5-admin-server-1.13.6-r0.ppc7400.rpm
tmp/deploy/rpm/ppc7400/libkrb5samba-samba4-4.4.5-r0.ppc7400.rpm
tmp/deploy/rpm/ppc7400/krb5-gss-samples-1.13.6-r0.ppc7400.rpm
tmp/deploy/rpm/ppc7400/libkrb5-3-1.13.6-r0.ppc7400.rpm
tmp/deploy/rpm/ppc7400/krb5-locale-en-us-1.13.6-r0.ppc7400.rpm
tmp/deploy/rpm/ppc7400/krb5-otp-1.13.6-r0.ppc7400.rpm
tmp/deploy/rpm/ppc7400/libndr-krb5pac0-4.4.5-r0.ppc7400.rpm
tmp/deploy/rpm/ppc7400/krb5-user-1.13.6-r0.ppc7400.rpm
tmp/deploy/rpm/ppc7400/libauthkrb5-samba4-4.4.5-r0.ppc7400.rpm
tmp/deploy/rpm/ppc7400/krb5-dbg-1.13.6-r0.ppc7400.rpm
tmp/deploy/rpm/ppc7400/krb5-kpropd-1.13.6-r0.ppc7400.rpm
tmp/deploy/rpm/ppc7400/libkrb5support0-1.13.6-r0.ppc7400.rpm
tmp/deploy/rpm/ppc7400/krb5-pkinit-1.13.6-r0.ppc7400.rpm
tmp/deploy/rpm/ppc7400/krb5-k5tls-1.13.6-r0.ppc7400.rpm
$

and, sure enough, there's no krb5 rpm. why not? if i check the recipe,
i see:

  PACKAGES =+ "${PN}-admin-server \
             ${PN}-gss-samples \
             ${PN}-k5tls \
             ${PN}-kdc \
             ${PN}-kdc-ldap \
             ${PN}-kpropd \
             ${PN}-otp \
             ${PN}-pkinit \
             ${PN}-user \
             libgssapi-krb5 \
             libgssrpc \
             libk5crypto \
             libkadm5clnt-mit \
             libkadm5srv-mit \
             libkdb5 \
             libkrad \
             libkrb5 \
             libkrb5support \
             libverto"

  FILES_${PN} = ""

so ... while the recipe introduces a pile of new output packages, it
empties the base "krb5" package. does that mean it needs to be
identified as allowing empty just to exist?

  i've built a lot of qemu/core-image-minimal images, and this is the
first time i've seen this krb5-related issue.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


