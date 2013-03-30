Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1ULxWw-0004n3-9W
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Mar 2013 16:17:18 +0100
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id DAEBF20C6A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Mar 2013 16:00:14 +0100 (CET)
Message-ID: <5156FDFD.1030606@pseudoterminal.org>
Date: Sat, 30 Mar 2013 16:00:13 +0100
From: dv <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: gst-ffmpeg configure-fix patch and yasm
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
X-List-Received-Date: Sat, 30 Mar 2013 15:17:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I noticed this part of the configure-fix.patch file for gst-ffmpeg 0.10.13:

+  if test "x$disable_yasm" != "xyes"; then
+    embffmpeg_configure_args="$embffmpeg_configure_args --disable-yasm"
+  fi

Shouldn't the test be:  if test "x$disable_yasm" = "xyes"  ?
To me, it seems as if this code adds --disable-yasm if disable_yasm is 
not set to "yes", which is the complete opposite of the intended behavior.

Or am I missing some detail about shell script code here?


