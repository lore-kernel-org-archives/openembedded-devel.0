Return-Path: <amit.k.chaudhuri@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2B270608B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 09:29:01 +0000 (UTC)
Received: by oiev193 with SMTP id v193so116134279oie.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 02:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=6swpkPCQAqD+l7BIfXQTceb0dNDH4aaqb+6a3oUHJ5k=;
	b=xtLTopPaoSj4w64bOJ7/z6/BMwHe/QoOAWTQV5yJDWcn8o3me5pfco15ReQEJKL5xT
	tq+Lu/jYpohPvUWS/qub8Mxdr4BW4GS4naCEA/gW1QRRp0ffpw8QVFyEcgti2dFrfKpn
	SmnQGqmKqkVf/dv7QYMBOlrKE/IRVGZF55xpYsyawNdRPG9lEmIlRz3X4X0UmOovx17B
	5hwuon0tvTR9tjVfb7M/3PKZ+9sYvLg3BVs/NEcQFqp80lvPlshpxccEMm5dPt2MLwm2
	fzu+r5itr2D9u2rQYnOuPhaHgZ9ARVYR/j+bxoM98Ejt7dKSO7SxZEtiu95lBD5BIukR
	E4qw==
MIME-Version: 1.0
X-Received: by 10.202.107.193 with SMTP id g184mr9444387oic.61.1439976541928; 
	Wed, 19 Aug 2015 02:29:01 -0700 (PDT)
Received: by 10.76.36.2 with HTTP; Wed, 19 Aug 2015 02:29:01 -0700 (PDT)
Date: Wed, 19 Aug 2015 10:29:01 +0100
Message-ID: <CAH=VbNdQiv4+2fVfLHC1WfjHPqD1WTMy90Sa+41g09A-HivhMw@mail.gmail.com>
From: Amit Chaudhuri <amit.k.chaudhuri@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Status of glibc patch for function inlining with -O or -Os
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Aug 2015 09:29:06 -0000
Content-Type: text/plain; charset=UTF-8

http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/60843

Hi,

in section 5.24 in the latest mega-manual it says:

"For successful call graph analysis, the binaries must preserve the
frame pointer register and should also be compiled with the
-fno-omit-framepointer flag. You can achieve this by setting the
SELECTED_OPTIMIZATION variable with the following options:

     -fexpensive-optimizations
     -fno-omit-framepointer
     -frename-registers
     -O2


You can also achieve it by setting the DEBUG_BUILD variable to "1" in
the local.conf configuration file. If you use the DEBUG_BUILD
variable, you also add extra debugging information that can make the
debug packages large. "

The second of these options does not work with core-image-sato on
qemuarm, failing with errors about failed function inlining when
building glibc. I stumbled across 3 google references (one listed
above) to a problem with glibc and function inlining dated ~ 6 months
ago. The threads imply patches were being worked on but they don't
appear to have been adopted.  Is there a reason for this that should
discourage use of those patches?

Regards,

Amit

