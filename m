Received: from [66.249.82.238] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Hh7Tg-0004M4-KA
	for openembedded-devel@openembedded.org; Thu, 26 Apr 2007 19:09:56 +0200
Received: by wx-out-0506.google.com with SMTP id t13so612588wxc
	for <openembedded-devel@openembedded.org>;
	Thu, 26 Apr 2007 10:01:06 -0700 (PDT)
Received: by 10.90.29.18 with SMTP id c18mr2438615agc.1177606866190;
	Thu, 26 Apr 2007 10:01:06 -0700 (PDT)
Received: by 10.90.65.4 with HTTP; Thu, 26 Apr 2007 10:01:06 -0700 (PDT)
Message-ID: <c384c5ea0704261001x7756fd58yc637a6b1aec12440@mail.gmail.com>
Date: Thu, 26 Apr 2007 19:01:06 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
Subject: HEADS UP: insane.bbclass will now detect and stop the build on wrong RPATHs.
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
X-List-Received-Date: Thu, 26 Apr 2007 17:09:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,

for those of you using insane.bbclass, it will now correctly detect
wrong RPATH's in shared libraries and fail on them.

Unfortunately, as we have not fixed wrong RPATH's yet in our shared
library handling, this will cause builds using insane.bbclass to fail.

See bug #2140.

I hope to be able to fix the .so RPATH stuff as well, but any help is welcomed.

Regards,
-- 
Leon


