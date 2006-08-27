Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GHUFp-0002Or-Aw
	for openembedded-devel@openembedded.org; Mon, 28 Aug 2006 01:41:27 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id A1E4486268
	for <openembedded-devel@openembedded.org>;
	Mon, 28 Aug 2006 09:39:29 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05194-04 for <openembedded-devel@openembedded.org>;
	Mon, 28 Aug 2006 09:39:27 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id C8E59861CC
	for <openembedded-devel@openembedded.org>;
	Mon, 28 Aug 2006 09:39:27 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id BED5ED98F5B; Mon, 28 Aug 2006 09:39:27 +1000 (EST)
Date: Mon, 28 Aug 2006 09:39:27 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@openembedded.org
Message-ID: <20060827233927.GA9807@twibble.org>
References: <E1GGZOX-0002WU-1s@linuxtogo.org>
Mime-Version: 1.0
In-Reply-To: <E1GGZOX-0002WU-1s@linuxtogo.org>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: Section list
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 27 Aug 2006 23:41:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 25, 2006 at 12:58:37PM +0200, "mickeyl commit" wrote:
> nfs-utils: s/networking/network/
[...]

Ah, good. I went through the sections used by all the recipes a while
back and generated a list and some suggested renames. I'll include it
here, along with the suggested renaming for some of the existing
sections.

I'll add this to the user manual once everyone is happy with it. I
also think it would be a good idea might to emit a warning if someone
tries to use a section name which is not definied in the list, so I
might code that up as well.

    * admin
    * applications		-> Really should find some other section?
    * apps			-> REPLACE with applications
    * base
    * base/shell
    * bootloader
    * console
    * console/editors
    * console/games
    * console/multimedia
    * console/net		-> REPLACE with console/network
    * console/network
    * console/networking	-> REPLACE with console/network
    * console/scientific
    * console/shells
    * console/telephony
    * console/tools
    * console/util		-> REPLACE with console/utils
    * console/utils
    * devel
    * devel/libs
    * devel/python
    * devel/rexx
    * devel/ruby
    * devel/tcltk
    * dev-lang			-> REPALCE with devel
    * doc
    * e/apps
    * e/libs
    * e/utils
    * games
    * games/arcade
    * gnome/libs
    * gnome/multimedia
    * gpe
    * gpe/applications
    * gpe/base
    * gpe/games
    * gpe/libs
    * gpe/multimedia
    * gui
    * interpreters
    * kde
    * kde/dev
    * kernel
    * kernel/module		-> REPALCE with kernel/modules
    * kernel/modules
    * kernel/userland
    * libs
    * libs/inputmethod		-> REPALCE with kernel/inputmethods
    * libs/inputmethods
    * libs/multimedia
    * libs/network
    * media-gfx			-> Find an existing category?
    * multimedia
    * net: Use network
    * net-misc			-> REPALCE with network/misc
    * net/misc			-> REPALCE with nerwork/misc
    * network
    * network/cms
    * network/misc
    * opie
    * opie/applets
    * opie/applications
    * opie/base
    * opie/codecs
    * opie/datebook
    * opie/decorations
    * opie/fontfactories
    * opie/fonts
    * opie/games
    * opie/help
    * opie/inputmethods
    * opie/libs
    * opie/multimedia
    * opie/network
    * opie/pim
    * opie/security
    * opie/settings
    * opie/shell
    * opie/Shell		-> REPLACE with opie/shell
    * opie/styles
    * opie/today
    * unknown			-> Should make it a known section...
    * utility			-> REPLACE with utils
    * utils
    * x11
    * x11/apps			-> Really should be x11/applications and probably should go somewhere else
    * x11/base
    * x11/data
    * x11/fonts
    * x11/games
    * x11/gnome
    * x11/gnome/libs
    * x11/graphics
    * x11/libs
    * x11-misc			-> Use x11/apps or other appropriate type?
    * x11/multimedia
    * x11/network
    * x11/office
    * x11/scientific
    * x11/utils
    * x11/wm 

-- 
 Jamie Lenehan <lenehan@twibble.org>


