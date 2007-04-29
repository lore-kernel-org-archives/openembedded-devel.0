Received: from [66.249.82.225] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1HiHGY-0000Pc-7g
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Apr 2007 23:49:10 +0200
Received: by wx-out-0506.google.com with SMTP id t14so1353144wxc
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2007 14:40:01 -0700 (PDT)
Received: by 10.90.25.3 with SMTP id 3mr4833709agy.1177882801079;
	Sun, 29 Apr 2007 14:40:01 -0700 (PDT)
Received: by 10.90.50.5 with HTTP; Sun, 29 Apr 2007 14:40:01 -0700 (PDT)
Message-ID: <c384c5ea0704291440w16f8890cy29dbf336f26e850a@mail.gmail.com>
Date: Sun, 29 Apr 2007 23:40:01 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: RFC: Recent insane.bbclass / RPATH issues need attention
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
X-List-Received-Date: Sun, 29 Apr 2007 21:49:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

the current insane.bbclass *behaviour* is bad (insane.bbclass itself is good!):

- insane.bbclass will detect invalid rpath and error (bitbake will bail out).
- *however*, on a new bitbake run, no errors are reported and the
build happily continues, *but* the invalid file is never
staged/installed.

This gives me similar errors as also reported on IRC:

sirfred> I don't know why, but gcc-cross didn't generate for me
neither libgcc nor libstdc++

Alternative approaches from here:

0) Leave as is.

1) The correct behaviour would be that subsequent bitbake runs *also* error out.

2) We regard invalid RPATHs only as a warning, so that the files *do*
get installed.

3) We do not use insane.bbclass by default in the distro's.

4) We fix the invalid RPATHs soon.

I only think I can (2) or (3) done soon, I'm struggling to get (4)
implemented, did not try (1).

(0) is not an option because resulting images will miss important
files, resulting in bogus error reports.

Regards,
-- 
Leon


