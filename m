Received: from [66.249.82.224] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1HgpFc-0004Em-Ol
	for openembedded-devel@openembedded.org; Wed, 25 Apr 2007 23:42:12 +0200
Received: by wx-out-0506.google.com with SMTP id t13so370462wxc
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Apr 2007 14:33:27 -0700 (PDT)
Received: by 10.90.88.13 with SMTP id l13mr1598627agb.1177536806271;
	Wed, 25 Apr 2007 14:33:26 -0700 (PDT)
Received: by 10.90.65.4 with HTTP; Wed, 25 Apr 2007 14:33:26 -0700 (PDT)
Message-ID: <c384c5ea0704251433v1324f303l799447c97e884164@mail.gmail.com>
Date: Wed, 25 Apr 2007 23:33:26 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
Subject: RPATH in shared libraries
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
X-List-Received-Date: Wed, 25 Apr 2007 21:42:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

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


