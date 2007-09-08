Received: from [194.158.229.41] (helo=mail-ps.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dv@vollmann.ch>) id 1IU945-0007yU-E2
	for openembedded-devel@openembedded.org; Sun, 09 Sep 2007 00:46:09 +0200
Received: from octo.vollmann.ch (212.98.43.140) by mail-ps.sunrise.ch (8.0.010)
	id 46CB871F00311803 for openembedded-devel@openembedded.org;
	Sun, 9 Sep 2007 00:43:22 +0200
Received: from octo (localhost [127.0.0.1])
	by octo.vollmann.ch (8.11.2/8.11.2) with SMTP id l88MkaR05381;
	Sun, 9 Sep 2007 00:46:36 +0200
Sender: dv@vollmann.ch
Message-ID: <46E3264C.39BD31A5@vollmann.ch>
Date: Sun, 09 Sep 2007 00:46:36 +0200
From: Detlef Vollmann <dv@vollmann.ch>
Organization: vollmann engineering gmbh
X-Mailer: Mozilla 3.04 (X11; U; Linux 2.4.21 i686)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
Subject: What is glibc-intermediate for?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Sep 2007 22:46:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

building a (cross-)toolchain isn't easy and I'm currently trying
to get my mind around it.

My understanding was always that we have the following order:
 linux-libc-headers
 glibc-initial
 gcc-cross-initial
 glibc-intermediate
 gcc-cross
 glibc

But looking at my current build, it turns out that the actual order
is different:
 linux-libc-headers
 glibc-initial
 gcc-cross-initial
 glibc-intermediate
 glibc
 gcc-cross

So, what is glibc-intermediate for (except wasting quite a lot of time)?

  Detlef

-- 
Detlef Vollmann   vollmann engineering gmbh
Linux and C++ for Embedded Systems    http://www.vollmann.ch/


