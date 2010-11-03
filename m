Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PDhZY-0000kB-9W for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 18:56:33 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PDhYi-0007xt-IY for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 18:55:40 +0100
Received: from d75-157-36-238.bchsia.telus.net ([75.157.36.238])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 18:55:40 +0100
Received: from dfoley by d75-157-36-238.bchsia.telus.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 18:55:40 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Dallas Foley <dfoley@telus.net>
Date: Wed, 03 Nov 2010 10:55:28 -0700
Message-ID: <4CD1A210.5000007@telus.net>
References: <1288776534.3980.33.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: d75-157-36-238.bchsia.telus.net
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
In-Reply-To: <1288776534.3980.33.camel@mattotaupa>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH] vlc_1.1.4.1: add `lua5.1` to `DEPENDS`
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
X-List-Received-Date: Wed, 03 Nov 2010 17:56:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10-11-03 02:28 AM, Paul Menzel wrote:
> Date: Wed, 3 Nov 2010 09:52:36 +0100
>
> After VLC 1.0.6, being the latest version in OE until addition of 1.1.4.1 in commit 30e362 [2], some interfaces were implemented in Lua in VLC 1.1.0 [1].
>
> 	Interfaces:
> 	 * Renamed the legacy rc, telnet and http interfaces to oldrc, oldtelnet and oldhttp.
> 	 * rc, telnet and http are now implemented using the lua interface system.
>
> Task `configure` fails with the following error message.
>
> 	[…]
> 	| checking for LUA... no
> 	| configure: WARNING: lua5.1 not found, trying lua>= 5.1 instead
> 	| checking for LUA... no
> 	| checking lua.h usability... no
> 	| checking lua.h presence... no
> 	| checking for lua.h... no
> 	| checking lauxlib.h usability... no
> 	| checking lauxlib.h presence... no
> 	| checking for lauxlib.h... no
> 	| checking lualib.h usability... no
> 	| checking lualib.h presence... no
> 	| checking for lualib.h... no
> 	| checking for luaL_newstate in -llua5.1 ... no
> 	| checking for luaL_newstate in -llua51 ... no
> 	| checking for luaL_newstate in -llua ... no
> 	| configure: error: Could not find lua. Lua is needed for some interfaces (rc, telnet, http) as well as many other custom scripts. Use --disable-lua to ignore this error.
> 	| ERROR: Function do_configure failed
> 	NOTE: package vlc-1.1.4.1-r0: task do_configure: Failed
> 	[…]
>
> Adding `lua5.1` to `DEPENDS` is chosen in favor of disabling it.
>
> [1] http://git.videolan.org/?p=vlc.git;a=commitdiff;h=3c1df96cda8086f605f2eacaa5653c9e43ec45ac
> [2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=30e362c22a49521ebeef9bed1f0c58902b7dc50b
>
> Signed-off-by: Paul Menzel<paulepanter@users.sourceforge.net>
> ---
>   recipes/vlc/vlc_1.1.4.1.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/vlc/vlc_1.1.4.1.bb b/recipes/vlc/vlc_1.1.4.1.bb
> index d4535a5..ef764c1 100644
> --- a/recipes/vlc/vlc_1.1.4.1.bb
> +++ b/recipes/vlc/vlc_1.1.4.1.bb
> @@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "61c9ea30a17ea40c6ccbfd507026e5c83ad9e0691f221d3667c8e49696
>
>   # ffmpeg from git (library version =>  52) is required
>   # libtool-native must be>= 2.2.4
> -DEPENDS += "libdvdcss libdvdread"
> +DEPENDS += "libdvdcss libdvdread lua"
>
>   EXTRA_OECONF += "\
>   	--enable-dvdread \
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

I seem to need lua5.1 and lua5.1-native in DEPENDS for this vlc as opposed to just lua.
ie. DEPENDS += "libdvdcss libdvdread lua5.1 lua5.1-native"

I doubt this has anything to do with it, but I am using DISTRO="angstrom-2010.x"
and setting
ANGSTROM_LIBTOOL_VERSION = "2.2.6b"
LIBTOOL_HAS_SYSROOT = "no"
only because apache2 does not configure with the newer libtool







