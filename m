Received: from [66.249.82.229] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Hh2z7-0002uX-1D
	for openembedded-devel@openembedded.org; Thu, 26 Apr 2007 14:22:05 +0200
Received: by wx-out-0506.google.com with SMTP id t13so529712wxc
	for <openembedded-devel@openembedded.org>;
	Thu, 26 Apr 2007 05:13:15 -0700 (PDT)
Received: by 10.90.113.18 with SMTP id l18mr1879806agc.1177589595456;
	Thu, 26 Apr 2007 05:13:15 -0700 (PDT)
Received: by 10.90.65.4 with HTTP; Thu, 26 Apr 2007 05:13:15 -0700 (PDT)
Message-ID: <c384c5ea0704260513h1e7e2283hfd439a2ff1421ff4@mail.gmail.com>
Date: Thu, 26 Apr 2007 14:13:15 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
Subject: shared libraries RPATH causes overhead
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2007 12:22:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

[resent, seems to be queued or lost earlier]

Hello,

During an strace run on my target, I noticed a considerable amount of
attempts to load shared libraries from their RPATH location (which is
the preferred location over what the linker thinks).

objdump -x libfontconfig.so.1  | grep RPATH
/home/leon/sandbox/e520/openembedded/build/tmp/staging/i686-angstrom-linux/lib

This results in considerable overhead during loading of shared libraries.

Koen secretly told me that there had been a masterplan amongst those
who may call themselves core developer to fix these paths.

I'm curious about what the fix would incur.

Also, might these RPATH's actually help when I am remotely debugging
using GDB, helping GDB find debugging info, or not?

Thanks for any hints on this,

Regards,
--
Leon


