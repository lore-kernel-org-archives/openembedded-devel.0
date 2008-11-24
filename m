Received: from [209.85.198.242] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1L4drr-00010u-2M
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Nov 2008 17:00:57 +0100
Received: by rv-out-0708.google.com with SMTP id f25so2708639rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2008 07:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=B3WGWOZPedInzx0GQC2dRSekdoPoUjzUGBj8/04fewQ=;
	b=qB9P+reFSknGksqn6ghYCvJjagO/CPOSFecbSN4gFiNn80+r3e1MFNfM+Tf0IXOQrE
	mYZNmsvXgTiJY7l9m7oFMphRLShBnvlvwcBxrVHHqdhVSyj8NNlHhuxRfQZchP8/HIxY
	xJLbVn3I73KStCNAf9eaaMHKkdyy9QbcMVkmE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=BHjm1VfztcP9WGVRaEcAT6Z+Fnzipe+6KgOJvgkAvifbUoYfeUG3NPvyCloLE9ksyf
	j1jzNrmbiv+aDPoOvfqQ9rAnBsSuQqNluIsWDDXHYENkxXac09OyRGPxbSjAlRhSqKmF
	azWbDKhMUdY8AJEOvqV/B2agezOO27LtnOtow=
Received: by 10.141.177.2 with SMTP id e2mr1923752rvp.269.1227542283210;
	Mon, 24 Nov 2008 07:58:03 -0800 (PST)
Received: by 10.141.193.4 with HTTP; Mon, 24 Nov 2008 07:58:03 -0800 (PST)
Message-ID: <f96d234e0811240758l7ac33a24m1d2f90f4f5153346@mail.gmail.com>
Date: Mon, 24 Nov 2008 10:58:03 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Error, DISTRO_PR has changed (.1 to ) when switching from Angstrom glibc to uclibc
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
X-List-Received-Date: Mon, 24 Nov 2008 16:01:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I get this when I set ANGSTROM_MODE="uclibc" and restart a build with
an existing tmp directory created for a glibc build.  I like re-using
the same tmp directory for mixed glibc/uclibc builds to save
rebuilding a few packages, but the savings is probably negligible.
This obviously requires DISTRO_PR to track in glibc and uclibc conf
files, IE:

diff --git a/conf/distro/include/angstrom-uclibc.inc
b/conf/distro/include/angstrom-uclibc.inc
index c26613b..29a50cd 100644
--- a/conf/distro/include/angstrom-uclibc.inc
+++ b/conf/distro/include/angstrom-uclibc.inc
@@ -36,3 +36,5 @@ TARGET_LINK_HASH_STYLE = "-Wl,--hash-style=gnu"

 CXXFLAGS += "-fvisibility-inlines-hidden"

+DISTRO_PR = ".1"
+

As I not aware how DISTRO_PR is intended to be used, which way do we want to go:

1) force separate tmp dirs for glibc and uclibc builds?
2) keep DISTRO_PR in sync for Angstrom glibc, uclibc, eglibc distros?

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


