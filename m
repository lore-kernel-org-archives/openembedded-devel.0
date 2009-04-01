Received: from [74.125.78.27] (helo=ey-out-2122.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1LozD1-0002z6-1o
	for openembedded-devel@openembedded.org; Wed, 01 Apr 2009 14:06:19 +0200
Received: by ey-out-2122.google.com with SMTP id 22so594416eye.51
	for <openembedded-devel@openembedded.org>;
	Wed, 01 Apr 2009 05:04:00 -0700 (PDT)
Received: by 10.210.110.5 with SMTP id i5mr5897910ebc.76.1238587440788;
	Wed, 01 Apr 2009 05:04:00 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 5sm8123162ewy.76.2009.04.01.05.03.59
	(version=SSLv3 cipher=RC4-MD5); Wed, 01 Apr 2009 05:04:00 -0700 (PDT)
Message-ID: <49D3582F.4070304@xora.org.uk>
Date: Wed, 01 Apr 2009 13:03:59 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
X-Enigmail-Version: 0.95.0
Subject: klibc problems
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
X-List-Received-Date: Wed, 01 Apr 2009 12:06:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ok, its no mystery to some people that klibc has problems with modern
kernels.

But I think we also have a problem with the package in OE. Seeing as
klibc is machine dependent in that it includes mach-XXX/include/mach/*.h
files it really should not be staged as part of the base arch. I think
we need to stage it into ${MACHINE_ARCH} the same was as the kernel is.

We can then work on fixing the application compiles. I think I have a
suitable hack.

Graeme



