Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kg4ysn@gmail.com>) id 1QfC7Q-0000Ek-TR
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jul 2011 16:33:25 +0200
Received: by vws2 with SMTP id 2so1648282vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2011 07:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=WXq/ppbU1akcgsTrOzOkLQh+71AxxkYSFt7G+gRG3/g=;
	b=rVzOw0mP0IIhCJL/iV92SHlC+pNznwb4onLyZOGJ+t2YG3WY/AMkO3rFzA4RIDg37Z
	yTRTtZ0BRA0l6HIculUvMKQiDsb438nFSy/PISxISE522cpmNcaLq9DaXEQPogH/fNiX
	lLPxmxOwEXwerMy51FX/zWNqPn7qu/zZllDTM=
MIME-Version: 1.0
Received: by 10.220.6.135 with SMTP id 7mr727718vcz.201.1310134893329; Fri, 08
	Jul 2011 07:21:33 -0700 (PDT)
Received: by 10.220.176.194 with HTTP; Fri, 8 Jul 2011 07:21:33 -0700 (PDT)
Date: Fri, 8 Jul 2011 07:21:33 -0700
Message-ID: <CAG4_upTi2CKyBMig3jsSGesFikj_qXeQ87x4e5Yv0i3USO0Lww@mail.gmail.com>
From: Chris Verges <kg4ysn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Using ${DATE} in PR
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
X-List-Received-Date: Fri, 08 Jul 2011 14:33:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I'm attempting to use the ${DATE} variable from
openembedded/conf/bitbake.conf in the PR value of a local overlay
recipe.  The idea is to create a recipe that will automatically
rebuild each day.  (The recipe itself is creates a small text file in
/etc that tracks the build date.)  BitBake is at 1.12.0, and OE is on
2011.03-maintenance.

Unfortunately, the following didn't work as I expected:

PR = "r5.${DATE}.0"

(I use the "r5" prefix field to increment in case I make any major
changes to the PR format, and the "0" suffix field to increment any
minor changes to the recipe itself.)

The expected behavior is that the recipe will automatically rebuild
each day.  The actual behavior is that the recipe does not rebuild.

Does anyone have any ideas on what I'm overlooking?

Thanks,
Chris


