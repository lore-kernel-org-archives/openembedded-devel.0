Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N9oAC-0002yu-0i
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 00:05:47 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N9Kq1-0001wp-I8 for openembedded-devel@lists.openembedded.org;
	Sat, 14 Nov 2009 10:46:57 -0500
Date: Sat, 14 Nov 2009 10:46:50 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0911141040530.14929@localhost>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: removing superseded packages?
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
X-List-Received-Date: Sun, 15 Nov 2009 23:05:47 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  is there a protocol for suggesting the removal of obsoleted(?)
packages?  i was looking at the recipes for some embedded tools, and
noticed:

$ ls recipes/i2c-tools
files               i2c-tools_3.0.2.bb  picodlp-control_0.1.bb
i2c-tools_3.0.1.bb  picodlp-control     read-edid_1.4.1.bb
$

  in other words, both versions 3.0.1 and 3.0.2 (3.0.2 is current).  a
recursive grep of the entire checkout reveals:

$ grep -r i2c-tools *
conf/checksums.ini:[http://dl.lm-sensors.org/i2c-tools/releases/i2c-tools-3.0.1.tar.bz2]
conf/checksums.ini:[http://dl.lm-sensors.org/i2c-tools/releases/i2c-tools-3.0.2.tar.bz2]
contrib/angstrom/build-feeds.sh:                      i2c-tools \
recipes/tasks/task-cli-tools.bb:  i2c-tools \
recipes/i2c-tools/i2c-tools_3.0.2.bb:SRC_URI =
"http://dl.lm-sensors.org/i2c-tools/releases/i2c-tools-${PV}.tar.bz2 \
recipes/i2c-tools/i2c-tools_3.0.1.bb:SRC_URI =
"http://dl.lm-sensors.org/i2c-tools/releases/i2c-tools-${PV}.tar.bz2"
$

  given the above, it would seem reasonable that version 3.0.1 can be
tossed, no?  unless there's a compelling reason to keep it around.

rday

p.s.  i can submit a patch if that's all it takes.  from what i can
see, that just involves removing that single older .bb file.

--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


