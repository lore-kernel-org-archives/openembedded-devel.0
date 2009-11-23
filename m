Received: from mail-px0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rk.raggit@gmail.com>) id 1NCSD9-0007tK-TM
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 07:15:47 +0100
Received: by pxi12 with SMTP id 12so3752609pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Nov 2009 22:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=5alDlZLS779WPAUqvYzmAUeI3yoQeQsxmqASm13vknc=;
	b=cluIKnAh72FIToyQT4L1lMfqN9zq2DauBX/0pWtvuziurtANXcnf8bBDe8FH2geVyI
	vDbcEnOL/m0oAOc/g9XdwZx3UlyO6PYGyALDfT1vforDsQJdCZG+ushi7y3b863A9RCz
	NSa8llAKrDIYBGvsp28sfKo4Ln0CfCVIvcHRg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=ozDSKjCdLxvdl8H3ryOu3s50/LGS7n5nr5z787fTvOPS+CvLuAvlSRPL83r/oqJ75C
	1qqLFlCnQSJb5eRfyypPLjJbOBNn55ItZZLk21Q43W54CeMIqALs6IJX4XNsqvOuZE78
	SsnMC50DH/oaerG+0I1y9DPTNhu8eI+ucAibs=
MIME-Version: 1.0
Received: by 10.141.45.9 with SMTP id x9mr250844rvj.220.1258956855143; Sun, 22 
	Nov 2009 22:14:15 -0800 (PST)
Date: Mon, 23 Nov 2009 11:44:15 +0530
Message-ID: <ec1f3d400911222214l37838f37i204c88bba6971d5b@mail.gmail.com>
From: RK Raggit <rk.raggit@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: rk.raggit@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: cortex-a9 machine build failure at gcc
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
X-List-Received-Date: Mon, 23 Nov 2009 06:15:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I am adding support for a cortex-a9 based machine but the build fails at gcc
with this error -

****************
|
/home/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.2.4-r9.1/gcc-4.2.4/gcc/crtstuff.c:1:
error: bad value (cortex-a9) for -mtune= switch
|
/home/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.2.4-r9.1/gcc-4.2.4/gcc/crtstuff.c:1:
error: bad value (armv7-a) for -march= switch
|
/home/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.2.4-r9.1/gcc-4.2.4/gcc/crtstuff.c:1:
error: invalid floating point option: -mfpu=neon
*****************

gcc variables in my local.conf read thus -

PREFERRED_VERSION_gcc                    = "4.2.4"
PREFERRED_VERSION_gcc-cross              = "csl-arm-2008q1"
PREFERRED_VERSION_gcc-cross-initial      = "csl-arm-2008q1"
PREFERRED_VERSION_gcc-cross-intermediate = "csl-arm-2008q1"

I had also tried something funky like below but to no avail -

PREFERRED_VERSION_gcc = "4.2.4+csl-arm-2008q1-126"
PREFERRED_VERSION_gcc-cross = "4.2.4+csl-arm-2008q1-126"
REFERRED_VERSION_gcc-cross-initial = "4.2.4+csl-arm-2008q1-126"
PREFERRED_VERSION_gcc-cross-intermediate = "4.2.4+csl-arm-2008q1-126"
Whats gone wrong ?

--RK

