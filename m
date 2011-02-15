Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gdalex@gmail.com>) id 1PpIyF-0005DE-VK
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 12:21:28 +0100
Received: by bwz10 with SMTP id 10so304268bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 03:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=rxlv+IsP5WX8whl04aaGeZOzQP3l1P2hq/t8A0kKtpQ=;
	b=h+KvT9j5tsa1CQCpLNJbzFaHHcu83symmcE5K7MKMYYNCTW8xJX4d5o0ep2vYfpduP
	aNkXEhk7VLWSWUgWazguLV/ewT8mNxhHOzqDu/5tdVe9wiOmRGVahCPJzwW+TJu71xzc
	IqMAL1rtN2yMoeK5m8HSbKtNyk80DGASNpa+k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=NAZ5tmD5D+khJ9JZ3hz5RXRupipx7fl2oQPrjWGmt/T/wiJd19owVHU/2xHhzu6vfP
	oaIDQ4OH5R/0pLVi+ewOohf3gDcxQ8HniTL8biOJ4C0frL3X5oeQy3xFTi6hLS78maTf
	09YLa3PsFgg/S3aKNqTD2twVm6+LV2KJxXdMU=
MIME-Version: 1.0
Received: by 10.204.138.130 with SMTP id a2mr14404374bku.211.1297768817851;
	Tue, 15 Feb 2011 03:20:17 -0800 (PST)
Received: by 10.204.120.133 with HTTP; Tue, 15 Feb 2011 03:20:17 -0800 (PST)
Date: Tue, 15 Feb 2011 06:20:17 -0500
Message-ID: <AANLkTimE1MUCjZx+dRSna8+38OHy+cZ0GdQDL+EN+it7@mail.gmail.com>
From: George Alexandru Dorobantu <gdalex@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: linux-libc-headers and eglibc having circular dependency
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
X-List-Received-Date: Tue, 15 Feb 2011 11:21:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello guys,

I've just started a new building and I got this error:

g@g-home:/media/500GB/oe/openembedded$ bitbake qt4e-base-image
NOTE: Handling BitBake files: - (7318/7318) [100 %]
Parsing of 7318 .bb files complete (6892 cached, 426 parsed). 7596 targets,
357 skipped, 0 masked, 0 errors.

Build Configuration:
BB_VERSION        = "1.10.2"
METADATA_BRANCH   = "org.openembedded.dev"
METADATA_REVISION = "b4a8a11"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "qemuarm"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v20110215"
TARGET_FPU        = "soft"

NOTE: Resolving any missing task queue dependencies
FATAL: Task /media/500GB/oe/openembedded/recipes/linux-libc-headers/
linux-libc-headers_2.6.32.bb (do_package) has circular dependency on
/media/500GB/oe/openembedded/recipes/eglibc/eglibc_2.12.bb (do_package)


Can anyone help me with this?

Thank you
George A. Dorobantu

