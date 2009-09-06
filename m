Received: from [91.121.26.226] (helo=2.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1MkLeC-0005u8-GW
	for openembedded-devel@openembedded.org; Sun, 06 Sep 2009 19:35:28 +0200
Received: (qmail 24366 invoked by uid 503); 6 Sep 2009 19:30:48 -0000
Received: from b6.ovh.net (HELO mail408.ha.ovh.net) (213.186.33.56)
	by 2.mail-out.ovh.net with SMTP; 6 Sep 2009 19:30:48 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 6 Sep 2009 17:16:28 -0000
Received: from tal33-2-82-228-175-43.fbx.proxad.net (HELO ?192.168.1.13?)
	(ebenard%eukrea.com@82.228.175.43)
	by ns0.ovh.net with SMTP; 6 Sep 2009 17:16:26 -0000
Message-ID: <4AA3EE5E.70409@eukrea.com>
Date: Sun, 06 Sep 2009 19:16:14 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: holger+oe@freyther.de
References: <4AA3ABA8.304@eukrea.com>
	<200909061703.48206.holger+oe@freyther.de>
In-Reply-To: <200909061703.48206.holger+oe@freyther.de>
X-Ovh-Tracer-Id: 17179543728671599969
X-Ovh-Remote: 82.228.175.43 (tal33-2-82-228-175-43.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: qt4-embedded & tslib
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
X-List-Received-Date: Sun, 06 Sep 2009 17:35:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Holger Hans Peter Freyther a écrit :
> On Sunday 06 September 2009 14:31:36 Eric Bénard wrote:
>> Without this, tslib loads properly the module_raw (input in my case) but
>> none of the module (pthres, linear & co) defined in ts.conf (despite the
>> fact ts_test & co are running fine).
> 
> Please google for the QWS_MOUSE_PROTO environement variable... tslib support 
> is built as a plugin and Qt needs to be instructed to load it.
> 
of course, without this variable it's not loaded at all.
But even with this variable, it doesn't work for me with 
-plugin-mouse-tslib but works with -qt-mouse-tslib.
I tried :
tslib:/dev/input/event0 & tslib:/dev/input/touchscreen0

In fact, the module_raw (input) is properly loaded (which means QT was 
instructed by QWS_MOUSE_PROTO to use tslib and TSLIB_PLUGINDIR is 
properly set) but the other modules (pthres, linear & co) are not 
properly loaded (from what I saw with strace they are found, opened, and 
closed). If I comment out all the modules (not module_raw) from ts.conf 
everything is properly loaded but of course tslib gives raw values to QT 
so touchscreen is unusable.

Eric




