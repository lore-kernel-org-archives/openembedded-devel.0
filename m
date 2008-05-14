Received: from [209.85.132.248] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JwP7l-0005BU-HV
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 May 2008 00:07:02 +0200
Received: by an-out-0708.google.com with SMTP id b38so27632ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2008 15:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	bh=RF+VFnrMEYxmxcq9ETDGJMdDloUT8LZr4ap2l7YtH2o=;
	b=DA/thD2dC70i4gJh4oYGwv6a6qtbCWJ2ZmwrmdwocDl6oK82+ggZYmwWFGJyP0dr3k+qGQs/inmQrMhiShCyOEz4IRgqBRVIxfrTIU4QEuk6NRmYxIroNiZC1cBVnb9SSbfofHrwdYOCreaxMkY5yzo7EDDqTd2W/JnbviQ87Vc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=a01cEaj4gFsY8rodbjtK9+lq9Bs3WafBv0b7U7NBpi3Fu74j0y+1HLuC2+iQ2Gjr+H1C38V1Pb2L4rWVy9axwO8jz7Kkfvok7aXcH2xp3DVNa94XvfrhW0YhSuYVEW3mNucXbK6k43jZzU8Kf5jSO1tQnmxMzyXJIIHu18plha4=
Received: by 10.100.152.15 with SMTP id z15mr2058926and.138.1210802725522;
	Wed, 14 May 2008 15:05:25 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Wed, 14 May 2008 15:05:25 -0700 (PDT)
Message-ID: <c384c5ea0805141505r451510dar128090c7fc3d270@mail.gmail.com>
Date: Thu, 15 May 2008 00:05:25 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: Who is the wrt54oe maintainer?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Wed, 14 May 2008 22:07:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

who is the wrt54oe distro maintainer?

It needs love in conf/distro/wrt54oe.conf, as it  isn't up to date
with our external toolchain opt-in, binutils-cross is not locked down,
and the c library was not chosen, nor its version.


PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}binutils:binutils-cross"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}libc-for-gcc:uclibc"

PREFERRED_PROVIDERS += " virtual/libc:uclibc"
PREFERRED_PROVIDERS += " linux-libc-headers:linux-libc-headers"

#TODO lockdown?
#PREFERRED_VERSION_binutils-cross = "???"
PREFERRED_VERSION_gcc-cross-initial = "3.4.4"
PREFERRED_VERSION_gcc-cross = "3.4.4"
PREFERRED_VERSION_gcc-cross-sdk = "3.4.4"
PREFERRED_VERSION_gcc = "3.4.4"
PREFERRED_VERSION_uclibc = "0.9.29"


Regards,
-- 
Leon


