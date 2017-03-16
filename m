Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3A8827300F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 17:22:20 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id g138so52433974itb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 10:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=jTl1ncrGzs9KrB2IRacYd8z1k0c+dSZe9iYJLynGq+s=;
	b=eVv6ytZRhPqP/3wOiV8LsW3apBVQp8hacKzzcyMj5VnObVMGi+L7K0MsHD5tUVyN0u
	ioY+5/5xt47awq8q7iL+bDDuMws9cTuQ8c07BGAoYo2Kiwn4TzQtEtxvS6CaRCXwT3g/
	1nEUazioqqL7rQ2OnSTfjjmOogIO1UjOn0tQEPVnEQd05ObHlsiKSvag8A5uZ/sFlFEA
	81cLi/GhcbF42T/50wncGIWM4Iz6CSCQGjwhs36iF2ejunuSagR3W0r8/BHMBBkb4Xib
	qowwU9n6clqv7e64cE3HXKoUuP50dh3tNhTAax9As27ME2Pk4AkwiNs0e5qEKOvM1IKk
	LOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=jTl1ncrGzs9KrB2IRacYd8z1k0c+dSZe9iYJLynGq+s=;
	b=ZvuKmzQaWvBUJwjowMgD20ibeqSKm5RTA/+NnB1bAv/3GCiRVbNiYymsxBVNLbrrOA
	RtlXkqtP4VDDdrI5/URsTVP8aNVbX1bTWqUxEzHsgzdF/JYZ8/zWINNHNYqyIFydXBq0
	odGJq/yKgeaVnTC0OLRhmvswYVNPUWSs9brC7NVajOK8EM7s+ceLA9gJxTxsIY5s+sHn
	ooX3PRPVUfn6D5jOOfRFsP20WhNGYlc2VwnAgBO7MJD8jPJ7zT+wu5/sQ6WUkd5WC43u
	oSVh5DF0ngACapugCUAUw/GkXWrK3uSGzEZ+rvwmm6q3WaC8lFB2YIxzZ/xC7Dg5nNHD
	qOmA==
X-Gm-Message-State: AFeK/H0HlxqprTjvPwH/h4rGav1wdi1cvIhggcBadTxn9U0bgWb+WRE5S09GuRMo2KrdNzF2
X-Received: by 10.36.90.144 with SMTP id v138mr11682211ita.24.1489684941258;
	Thu, 16 Mar 2017 10:22:21 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8DCA9.dip0.t-ipconnect.de. [93.232.220.169])
	by smtp.gmail.com with ESMTPSA id s21sm1901439ite.0.2017.03.16.10.22.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Mar 2017 10:22:20 -0700 (PDT)
Message-ID: <1489684937.6396.123.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Mar 2017 18:22:17 +0100
In-Reply-To: <1489678953.6396.121.camel@intel.com>
References: <20170218021012.31978-1-pkj@axis.com>
	<20170218021012.31978-8-pkj@axis.com>
	<1489678953.6396.121.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [meta-oe][PATCH 8/8] lvm2: Move libdevmapper to a separate package
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
X-List-Received-Date: Thu, 16 Mar 2017 17:22:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-03-16 at 16:42 +0100, Patrick Ohly wrote:
> On Sat, 2017-02-18 at 03:10 +0100, Peter Kjellerstedt wrote:
> > This allows, e.g., cryptsetup to use libdevmapper without having to
> > pull in all of lvm2.
> 
> I'm experiencing an issue where both kpartx and cryptsetup hang
> infinitely. For kpartx, I traced it down to the lack of dmsetup udev
> rules in the rootfs, the same problem as in
> https://github.com/docker/docker/issues/22025#issuecomment-243943728
> 
> Adding lvm2 to my image fixed it, but that defeats the purpose of this
> patch... ;-}
> 
> Peter, do you know which parts of lvm2 are needed for kpartx
> +libdevicemapper to work correctly? My initial attempt with moving just
> the udev rules to the libdevicemapper packages was either flawed or
> incomplete.

The rules call dmsetup. Moving that also to libdevicemapper works for
me, see below. Shall I submit that as patch?

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index b25d775f1..4804b6fb3 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -83,14 +83,17 @@ SYSTEMD_AUTO_ENABLE = "disable"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-FILES_${PN} += "${libdir}/device-mapper/*.so ${nonarch_base_libdir}/udev"
+FILES_${PN} += "${libdir}/device-mapper/*.so"
 FILES_${PN}-scripts = " \
     ${sbindir}/blkdeactivate \
     ${sbindir}/fsadm \
     ${sbindir}/lvmconf \
     ${sbindir}/lvmdump \
 "
-FILES_libdevmapper = "${libdir}/libdevmapper.so.*"
+# Specified explicitly for the udev rules, just in case that it does not get picked
+# up automatically:
+RDEPENDS_${PN} += "libdevmapper"
+FILES_libdevmapper = "${sbindir}/dmsetup ${libdir}/libdevmapper.so.* ${nonarch_base_libdir}/udev/rules.d"
 FILES_libdevmapper-dev = " \
     ${libdir}/libdevmapper.so \
     ${libdir}/pkgconfig/devmapper.pc \


-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




