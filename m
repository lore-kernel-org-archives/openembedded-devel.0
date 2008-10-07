Received: from [85.13.140.93] (helo=dd20204.kasserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1KnBpZ-0006lq-BP
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Oct 2008 14:38:25 +0200
Received: from [192.168.1.103] (91-65-152-238-dynip.superkabel.de
	[91.65.152.238])
	by dd20204.kasserver.com (Postfix) with ESMTP id A4C49180445F5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Oct 2008 14:33:54 +0200 (CEST)
Message-ID: <48EB5730.8030700@opensimpad.org>
Date: Tue, 07 Oct 2008 14:33:52 +0200
From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
User-Agent: Thunderbird 2.0.0.17 (X11/20080925)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <48E6624C.7000409@opensimpad.org>	<gc72hu$i8f$1@ger.gmane.org>	<48E758CB.7040209@opensimpad.org>	<48EB45F0.8080809@opensimpad.org>
	<gcfi87$g4t$1@ger.gmane.org>
In-Reply-To: <gcfi87$g4t$1@ger.gmane.org>
Subject: Re: X/Qt2 opie integration (patches included)
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
X-List-Received-Date: Tue, 07 Oct 2008 12:38:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi schrieb:
> On 07-10-2008 13:20, Bernhard Guillon wrote:
>> Any obstacles left? Else I would like to ask if some of you can please
>> commit it [2] [3] to .dev branch.
>
> I still dislike a single package handling so many different things 
> *and* containing config files for other packages.
>
It contains three different things:

-a config for blackbox which may is useless without xqtlauncher. it puts 
the taskbar from the bottom to the top of the screen.

-a .desktop(opie compliant) file for xkbd which is useless without 
xqtlauncher

-xqtlauncher skripts
--startxqt
    checks if x/qt2 is already running, creates a run file set up 
environment and starts x/qt2
--startxqt-wrapper
    starts startxqt in bg and also starts the wm (in this stage of 
development only blackbox)
--xqtlauncher
    takes an X11 application as argument e.g. xkbd
    check if this application is available
    check if xqt2 is running and starting it
    atomate count of the applications running +1
    run application
    atomate count of the applications running -1
    if application counter <= 0 kill xqt2

The symlink for xqtlauncher is needed because opie only takes the first 
exec argument of the .desktop file to decide if the application is 
already running and starts one application only once (discussed with 
bluelightning). The alternatives to this are creating shell script 
wrappers or change the code in opie. But changing the code in opie is no 
option for me.

For a useful xqt2 xkbd is currently needed because typing on opies 
keyboard kills xqt2 except of this it is quite stable on my simpad.

I can split the package.
For that I need some advice for spliting and naming of the packages.

What do you think about:

xqtlauncher-blackbox-config.bb
xqtlauncher-xkbd-desktop.bb
xqtlauncher.bb having the above as rdepends?

or
xqtlauncher-blackbox-config.bb
xqtlauncher-xkbd-desktop.bb
xqtlauncher.bb no depends except X/Qt2
and a task-xqtlauncher.
With this we could provide support for different window managers later. 
Currently only blackbox is supported.

or same as above but
xqt2-xqtlauncher-foo-bar.bb

best regards
Bernhard Guillon


