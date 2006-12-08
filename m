Received: from [64.233.162.238] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Gsp5R-0001w6-4e
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Dec 2006 00:25:01 +0100
Received: by nz-out-0102.google.com with SMTP id m22so570099nzf
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Dec 2006 15:23:47 -0800 (PST)
Received: by 10.64.242.5 with SMTP id p5mr6741668qbh.1165620227711;
	Fri, 08 Dec 2006 15:23:47 -0800 (PST)
Received: by 10.65.230.8 with HTTP; Fri, 8 Dec 2006 15:23:47 -0800 (PST)
Message-ID: <c384c5ea0612081523k416385a5mf40fc87f9f8a24bc@mail.gmail.com>
Date: Sat, 9 Dec 2006 00:23:47 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: {PACKAGE,TARGET_{,PACKAGE_,EXTRA_}}ARCH blues
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
X-List-Received-Date: Fri, 08 Dec 2006 23:25:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Please follow me through here:

In my case, an IXP4xx target, with big-endian ARCH_BYTE_SEX I have this:

from conf/machine/ixp4xx.conf sets:

TARGET_ARCH = armeb
TARGET_PACKAGE_ARCH = armv5teb

conf/machine/ixp4xx.conf then sets (overrides):
PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5e armv5te ixp4xx${ARCH_BYTE_SEX}"

conf/bitbake.conf then sets PACKAGE_ARCHS to this:

PACKAGE_ARCHS = "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS}
${MACHINE}"

(note, it does not include TARGET_PACKAGE_ARCH, i.e. armv5teb is not there).

so later 'rootfs_ipk' sets ipkgarchs without 'armv5teb' in there.

classes/rootfs_ipk.bbclass:45:     ipkgarchs="${PACKAGE_ARCHS}"

end I end up with a full set of 'armv5teb' packages, which fail to
install to my image.

I can work around this by twiddling with the variable definitions and
settings, but I rather want to discuss what is the proper fix here?

Should PACKAGE_EXTRA_ARCH be appended by TARGET_PACKAGE_ARCH?

Regards,
-- 
Leon


