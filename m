Received: from mail-pz0-f180.google.com ([209.85.222.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1Njgon-000423-84
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 23:32:00 +0100
Received: by pzk10 with SMTP id 10so335220pzk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2010 14:29:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.143.26.4 with SMTP id d4mr947195wfj.232.1266877752150; Mon, 22 
	Feb 2010 14:29:12 -0800 (PST)
Date: Mon, 22 Feb 2010 14:29:12 -0800
Message-ID: <18e217241002221429m1939c786u52da4672f626ca07@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.180
X-SA-Exim-Mail-From: msundius@sundius.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: using initramfs with openembedded.
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
X-List-Received-Date: Mon, 22 Feb 2010 22:32:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

We'd like to put our initial boottime file system into the initramfs in the
kernel. But we also need to build some separate drivers to put into that
filesystem image.

Of course we can't build those drivers without the kernel staging dir
populated. (which doesn't happen until after the build of the kernel).

Has anyone run into this problem? how did you solve it? do I need to stage
the headerfiles and config info before the kernel build?

maybe this problem is solved some other way.. I haven't really tried this so
I'm just speculating here.

If anyone has some experience with this it would be great to hear how to go
about this. thanks for you help

Mike

