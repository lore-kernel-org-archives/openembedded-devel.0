Received: from [66.249.82.225] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HZTsK-0000Ue-5b
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Apr 2007 17:27:48 +0200
Received: by wx-out-0506.google.com with SMTP id t14so560899wxc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Apr 2007 08:27:47 -0700 (PDT)
Received: by 10.90.104.14 with SMTP id b14mr1715845agc.1175786867253;
	Thu, 05 Apr 2007 08:27:47 -0700 (PDT)
Received: from cube ( [82.193.98.4])
	by mx.google.com with ESMTP id 38sm3068788nzf.2007.04.05.08.27.46;
	Thu, 05 Apr 2007 08:27:47 -0700 (PDT)
Date: Thu, 5 Apr 2007 18:27:52 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1597775703.20070405182752@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [RFC] Adding sanity to OE startup process
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
X-List-Received-Date: Thu, 05 Apr 2007 15:27:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello openembedded-devel,

  I hope many people will agree that boot process is one of the pain
points of OE. Boot/service scripts are collected from Debian and other
various sources, which are mostly intended for "desktop" systems, and
doesn't really scale for embedded usage. For example, on typical
desktop system you have:

1. Big screen and good chance to see a message before it scrolls
away.
2. Ability to pause boot process from console with common Ctrl+S/Q.
3. Scrollback buffer.

  All these are usually not available for embedded system (not
speaking that some embedded systems don't have screen at all).

  So, to start with, I'd like to propose to make it possible for boot
process to log to syslog. I have following in mind:

1. Make a convention that boot/service scripts should use "$echo"
instead of "echo" to do output.
2. Have default define of "echo=echo" for this.
3. Turn /etc/init.d/syslogd into /etc/init.d/syslogd.sh so it was
sourced by /etc/init.d/rc and could export new value for the rest of
scripts.
4. Make /etc/init.d/syslogd.sh start earlier so it could capture as
mush output as possible.
5. Using syslogd for boot messages capture is of course optional.


Thanks,

-- 
 Paul                          mailto:pmiscml@gmail.com



