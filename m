Received: from [81.228.8.83] (helo=pne-smtpout1-sn2.hy.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1McFcu-0006Uf-2M
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Aug 2009 11:32:40 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout1-sn2.hy.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A7285AE0015CBC1 for openembedded-devel@lists.openembedded.org;
	Sat, 15 Aug 2009 11:15:55 +0200
Message-ID: <4A867CCA.7060609@atmel.com>
Date: Sat, 15 Aug 2009 11:15:54 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1242504969-15764-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1242507547.4226.1.camel@lenovo.internal.reciva.com>
In-Reply-To: <1242507547.4226.1.camel@lenovo.internal.reciva.com>
Subject: xtscal fails + other Xorg init problems.
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
X-List-Received-Date: Sat, 15 Aug 2009 09:32:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Looks like xtscal in x11-image fails.

$ DISPLAY=":0.0" xtscal
XCALIBRATE extension missing



When I look at /usr/lib/xorg/modules
I find
	libdri.la, but no libdri.so
	libglx.la, but no libglx.so

so they are not loaded.
Should they be there and loaded?


-------------------------------

Have gotten the touchscreen to work,
by

Section "ServerFlags"
	Option "AllowEmptyInput" "off"
EndSection
in xorg.conf

The touchscreen cursor travels in the x direction
when the pen moves in the y-direction,
but I think this is because the Linux config
specifies that the screen should be rotated 90',
which is does not do.
That is probably an fb driver problem,
which can be workaround by clearing the config.

------------------------------

But now the keyboard behaves in a strange manner
I get three chararcters per press.
I first through that the repeat rate was too
high, but the problem remained after
xset -r

I just realized that I get two characters
when I press the key, and the third character
when I release the key.

I think the driver reports key press, and something
else when I press, and key release when I release the button
and each event is interpreted as one character.

Any clues?

----------------------------------------------

BTW: You cannot set the repeat rate using
	Option "AutoRepeat" "500" "30"
since XFree86-Misc is no longer available.

"xset r rate 500" fails as well due to this.

Any alternative methods to turn off the repeat?










-- 
Best Regards
Ulf Samuelsson



