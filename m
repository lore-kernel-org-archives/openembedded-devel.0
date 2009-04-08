Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1LrWwH-0006I1-Ne
	for openembedded-devel@openembedded.org; Wed, 08 Apr 2009 14:31:39 +0200
Received: (qmail 7917 invoked by uid 1003); 8 Apr 2009 12:28:28 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 8 Apr 2009 12:28:28 -0000
Message-ID: <49DC986A.3010900@balister.org>
Date: Wed, 08 Apr 2009 08:28:26 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1239174387-31686-1-git-send-email-k.kooi@student.utwente.nl>
In-Reply-To: <1239174387-31686-1-git-send-email-k.kooi@student.utwente.nl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_05,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] e-wm-config-angstrom: refresh configs, add systray
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
X-List-Received-Date: Wed, 08 Apr 2009 12:31:39 -0000
X-Groupsio-MsgNum: 9226
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms070204030801040700060104"

--------------ms070204030801040700060104
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>

Koen Kooi wrote:
> From: Koen Kooi <koen@openembedded.org>
> 
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  recipes/angstrom/e-wm-config-angstrom.bb           |    9 +-
>  recipes/angstrom/e-wm-config-angstrom/e.src        |  146 ++++++++++++--------
>  .../e-wm-config-angstrom/module.cpufreq.src        |    4 +-
>  .../e-wm-config-angstrom/module.places.src         |    6 +
>  4 files changed, 103 insertions(+), 62 deletions(-)
> 
> diff --git a/recipes/angstrom/e-wm-config-angstrom.bb b/recipes/angstrom/e-wm-config-angstrom.bb
> index a2c6f93..4b47e05 100644
> --- a/recipes/angstrom/e-wm-config-angstrom.bb
> +++ b/recipes/angstrom/e-wm-config-angstrom.bb
> @@ -2,9 +2,9 @@ DESCRIPTION = "Enlightenment DR17 theme for Angstrom"
>  LICENSE = "MIT/BSD"
>  DEPENDS = "edje-native eet-native"
>  RDEPENDS = "e-wm"
> -RRECOMMENDS_${PN} = "places"
> +RRECOMMENDS_${PN} = "places systray"
>  
> -PR = "r4"
> +PR = "r5"
>  
>  SRC_URI = " \
>            file://e.src \
> @@ -18,6 +18,11 @@ do_configure() {
>  	cp ${WORKDIR}/*.src ${WORKDIR}/*.desktop ${WORKDIR}/*.png ${S}/
>  }
>  
> +# [09:16:17] * koen mumbles something about binary config file
> +# [09:16:19] <raster> eet -d e.cfg config e.src
> +# [09:16:29] <raster> will get u a test dump of it (as e.src)
> +# [09:17:09] <raster> eet -e e.cfg config e.src 1
> +# [09:17:12] <raster> will re-encode 
>  
>  do_compile() {
>  	for i in *.src ; do
> diff --git a/recipes/angstrom/e-wm-config-angstrom/e.src b/recipes/angstrom/e-wm-config-angstrom/e.src
> index 3351424..859323d 100644
> --- a/recipes/angstrom/e-wm-config-angstrom/e.src
> +++ b/recipes/angstrom/e-wm-config-angstrom/e.src
> @@ -1,5 +1,5 @@
>  group "E_Config" struct {
> -  value "config_version" int: 65836;
> +  value "config_version" int: 65839;
>    value "show_splash" int: 0;
>    value "init_default_theme" string: "default.edj";
>    value "desktop_default_name" string: "Desktop %i, %i";
> @@ -10,6 +10,7 @@ group "E_Config" struct {
>    value "border_shade_transition" int: 3;
>    value "border_shade_speed" double: 3000.0000000000000000000000000;
>    value "framerate" double: 25.0000000000000000000000000;
> +  value "priority" int: 0;
>    value "image_cache" int: 4096;
>    value "font_cache" int: 512;
>    value "edje_cache" int: 32;
> @@ -19,8 +20,6 @@ group "E_Config" struct {
>    value "use_virtual_roots" int: 0;
>    value "show_desktop_icons" int: 1;
>    value "edge_flip_dragging" int: 1;
> -  value "edge_flip_moving" int: 1;
> -  value "edge_flip_timeout" double: 0.2500000000000000000000000;
>    value "evas_engine_default" int: 1;
>    value "evas_engine_container" int: 0;
>    value "evas_engine_init" int: 0;
> @@ -43,15 +42,15 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "start";
> +      value "name" string: "syscon";
>        value "enabled" uchar: 1;
> -      value "delayed" uchar: 0;
> +      value "delayed" uchar: 1;
>        value "priority" int: 0;
>      }
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "ibar";
> +      value "name" string: "msgbus_lang";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 0;
>        value "priority" int: 0;
> @@ -59,7 +58,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "ibox";
> +      value "name" string: "connman";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 0;
>        value "priority" int: 0;
> @@ -67,7 +66,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "clock";
> +      value "name" string: "places";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 0;
>        value "priority" int: 0;
> @@ -75,7 +74,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "cpufreq";
> +      value "name" string: "mixer";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 0;
>        value "priority" int: 0;
> @@ -83,15 +82,15 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "pager";
> +      value "name" string: "conf_window_remembers";
>        value "enabled" uchar: 1;
> -      value "delayed" uchar: 0;
> +      value "delayed" uchar: 1;
>        value "priority" int: 0;
>      }
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "exebuf";
> +      value "name" string: "conf_scale";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -99,7 +98,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "winlist";
> +      value "name" string: "conf_interaction";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -107,7 +106,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf";
> +      value "name" string: "fileman";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -115,7 +114,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_applications";
> +      value "name" string: "conf_engine";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -123,7 +122,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_borders";
> +      value "name" string: "conf_winlist";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -131,7 +130,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_clientlist";
> +      value "name" string: "conf_window_manipulation";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -139,7 +138,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_colors";
> +      value "name" string: "conf_window_focus";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -147,7 +146,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_desk";
> +      value "name" string: "conf_window_display";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -155,7 +154,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_desklock";
> +      value "name" string: "conf_wallpaper";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -163,7 +162,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_desks";
> +      value "name" string: "conf_transitions";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -171,7 +170,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_dialogs";
> +      value "name" string: "conf_theme";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -179,7 +178,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_display";
> +      value "name" string: "conf_startup";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -187,7 +186,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_dpms";
> +      value "name" string: "conf_shelves";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -195,7 +194,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_exebuf";
> +      value "name" string: "conf_screensaver";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -203,7 +202,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_fonts";
> +      value "name" string: "conf_profiles";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -211,7 +210,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_icon_theme";
> +      value "name" string: "conf_performance";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -219,7 +218,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_imc";
> +      value "name" string: "conf_paths";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -227,7 +226,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_intl";
> +      value "name" string: "conf_mouse_cursor";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -235,7 +234,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_keybindings";
> +      value "name" string: "conf_mousebindings";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -243,7 +242,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_menus";
> +      value "name" string: "conf_mouse";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -259,7 +258,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_mouse";
> +      value "name" string: "conf_menus";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -267,7 +266,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_mousebindings";
> +      value "name" string: "conf_keybindings";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -275,7 +274,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_mouse_cursor";
> +      value "name" string: "conf_intl";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -283,7 +282,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_paths";
> +      value "name" string: "conf_imc";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -291,7 +290,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_performance";
> +      value "name" string: "conf_icon_theme";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -299,7 +298,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_profiles";
> +      value "name" string: "conf_fonts";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -307,7 +306,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_screensaver";
> +      value "name" string: "conf_exebuf";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -315,7 +314,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_shelves";
> +      value "name" string: "conf_dpms";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -323,7 +322,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_startup";
> +      value "name" string: "conf_display";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -331,7 +330,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_theme";
> +      value "name" string: "conf_dialogs";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -339,7 +338,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_transitions";
> +      value "name" string: "conf_desks";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -347,7 +346,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_wallpaper";
> +      value "name" string: "conf_desklock";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -355,7 +354,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_window_display";
> +      value "name" string: "conf_desk";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -363,7 +362,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_window_focus";
> +      value "name" string: "conf_colors";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -371,7 +370,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_window_manipulation";
> +      value "name" string: "conf_clientlist";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -379,7 +378,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_winlist";
> +      value "name" string: "conf_borders";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -387,7 +386,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_engine";
> +      value "name" string: "conf_applications";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -395,7 +394,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "fileman";
> +      value "name" string: "conf";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -403,7 +402,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_interaction";
> +      value "name" string: "winlist";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -411,7 +410,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_scale";
> +      value "name" string: "exebuf";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 1;
>        value "priority" int: 0;
> @@ -419,15 +418,15 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "conf_window_remembers";
> +      value "name" string: "pager";
>        value "enabled" uchar: 1;
> -      value "delayed" uchar: 1;
> +      value "delayed" uchar: 0;
>        value "priority" int: 0;
>      }
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "mixer";
> +      value "name" string: "cpufreq";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 0;
>        value "priority" int: 0;
> @@ -435,7 +434,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "places";
> +      value "name" string: "clock";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 0;
>        value "priority" int: 0;
> @@ -443,7 +442,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "connman";
> +      value "name" string: "ibox";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 0;
>        value "priority" int: 0;
> @@ -451,7 +450,7 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "msgbus_lang";
> +      value "name" string: "ibar";
>        value "enabled" uchar: 1;
>        value "delayed" uchar: 0;
>        value "priority" int: 0;
> @@ -459,9 +458,17 @@ group "E_Config" struct {
>    }
>    group "modules" list {
>      group "E_Config_Module" struct {
> -      value "name" string: "syscon";
> +      value "name" string: "start";
>        value "enabled" uchar: 1;
> -      value "delayed" uchar: 1;
> +      value "delayed" uchar: 0;
> +      value "priority" int: 0;
> +    }
> +  }
> +  group "modules" list {
> +    group "E_Config_Module" struct {
> +      value "name" string: "systray";
> +      value "enabled" uchar: 1;
> +      value "delayed" uchar: 0;
>        value "priority" int: 0;
>      }
>    }
> @@ -1655,6 +1662,25 @@ group "E_Config" struct {
>            value "resizable" uchar: 0;
>          }
>        }
> +      group "clients" list {
> +        group "E_Config_Gadcon_Client" struct {
> +          value "name" string: "systray";
> +          value "id" string: "systray";
> +          value "geom.pos" int: 720;
> +          value "geom.size" int: 80;
> +          value "geom.res" int: 800;
> +          value "geom.pos_x" double: 0.0000000000000000000000000;
> +          value "geom.pos_y" double: 0.0000000000000000000000000;
> +          value "geom.size_w" double: 0.0000000000000000000000000;
> +          value "geom.size_h" double: 0.0000000000000000000000000;
> +          value "state_info.seq" int: 10;
> +          value "state_info.flags" int: 0;
> +          value "style" string: "inset";
> +          value "orient" int: 0;
> +          value "autoscroll" uchar: 0;
> +          value "resizable" uchar: 0;
> +        }
> +      }
>      }
>    }
>    group "gadcons" list {
> @@ -1956,7 +1982,9 @@ group "E_Config" struct {
>    value "border_raise_on_mouse_action" int: 1;
>    value "border_raise_on_focus" int: 1;
>    value "desk_flip_wrap" int: 0;
> +  value "fullscreen_flip" int: 0;
>    value "icon_theme" string: "gnome";
> +  value "icon_theme_overrides" uchar: 0;
>    value "desk_flip_animate_mode" int: 1;
>    value "desk_flip_animate_interpolation" int: 0;
>    value "desk_flip_animate_time" double: 0.2000000000000000111022302;
> diff --git a/recipes/angstrom/e-wm-config-angstrom/module.cpufreq.src b/recipes/angstrom/e-wm-config-angstrom/module.cpufreq.src
> index 5c97994..c782ac2 100644
> --- a/recipes/angstrom/e-wm-config-angstrom/module.cpufreq.src
> +++ b/recipes/angstrom/e-wm-config-angstrom/module.cpufreq.src
> @@ -1,4 +1,6 @@
>  group "Cpufreq_Config" struct {
> +  value "config_version" int: 1;
>    value "poll_interval" int: 32;
> -  value "restore_governor" int: 1;
> +  value "restore_governor" int: 0;
> +  value "auto_powersave" int: 1;
>  }
> diff --git a/recipes/angstrom/e-wm-config-angstrom/module.places.src b/recipes/angstrom/e-wm-config-angstrom/module.places.src
> index 4fb01da..57e941f 100644
> --- a/recipes/angstrom/e-wm-config-angstrom/module.places.src
> +++ b/recipes/angstrom/e-wm-config-angstrom/module.places.src
> @@ -15,4 +15,10 @@ group "Config" struct {
>        value "switch2" int: 0;
>      }
>    }
> +  value "show_home" uchar: 0;
> +  value "show_desk" uchar: 0;
> +  value "show_trash" uchar: 0;
> +  value "show_root" uchar: 0;
> +  value "show_temp" uchar: 0;
> +  value "show_bookm" uchar: 0;
>  }

--------------ms070204030801040700060104
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJRTCCAv0w
ggJmoAMCAQICEHW4VJIUQV0u11NnfLpF2IUwDQYJKoZIhvcNAQEFBQAwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA4MDQxNDE5MTkzMVoXDTA5MDQxNDE5MTkz
MVowYjERMA8GA1UEBBMIQmFsaXN0ZXIxDzANBgNVBCoTBlBoaWxpcDEYMBYGA1UEAxMPUGhpbGlw
IEJhbGlzdGVyMSIwIAYJKoZIhvcNAQkBFhNwaGlsaXBAYmFsaXN0ZXIub3JnMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxyNViPlSmMq2Kl4m7iDBI3gB7Pwhg+4vnXCKEF3qIoLwNDVl
27CP8RY0umjENzykOR6ZhzYx4fH8arNV5+nlXsH8KNnbDpd5ICTZvbUJdt1gPETmLczGy4hh8woC
u7qodyy7YZcGMiUY5LxoL7vIQHysir4rbMRV/JIdmhKfFrHb+glDe8XbfTJ3xKO+BsMgLDaSiRMe
lH6uFLAVv9oRoIJxHQhwKLvlrOSQj+ek2fL683BzOUsM4BN/fiwvtJ/y3doVEoKUp8ippOXrwLAX
FPprPAAdIydqufTxHotooFqbQzqSJv4cTNDTxf2fg9YfH2RAs8vTdc/wgIVlL8fJnQIDAQABozAw
LjAeBgNVHREEFzAVgRNwaGlsaXBAYmFsaXN0ZXIub3JnMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcN
AQEFBQADgYEASFC7i4DqutUTifbyNtEe+e9bqgqWUScDFl0BTV5fFVBX/mFpM3RBZJfq+iM5q0L7
qont3sGaXG0cdVvRk2dkuV2i0HwkmTLJ4HTLMyJ57BjMJWY9ydDiY+Ai1pINmjIgq/qI0aireByq
Nee68q+PaWE7bfW1XvfqZD56QunCijswggL9MIICZqADAgECAhB1uFSSFEFdLtdTZ3y6RdiFMA0G
CSqGSIb3DQEBBQUAMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAo
UHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTAe
Fw0wODA0MTQxOTE5MzFaFw0wOTA0MTQxOTE5MzFaMGIxETAPBgNVBAQTCEJhbGlzdGVyMQ8wDQYD
VQQqEwZQaGlsaXAxGDAWBgNVBAMTD1BoaWxpcCBCYWxpc3RlcjEiMCAGCSqGSIb3DQEJARYTcGhp
bGlwQGJhbGlzdGVyLm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMcjVYj5UpjK
tipeJu4gwSN4Aez8IYPuL51wihBd6iKC8DQ1Zduwj/EWNLpoxDc8pDkemYc2MeHx/GqzVefp5V7B
/CjZ2w6XeSAk2b21CXbdYDxE5i3MxsuIYfMKAru6qHcsu2GXBjIlGOS8aC+7yEB8rIq+K2zEVfyS
HZoSnxax2/oJQ3vF230yd8SjvgbDICw2kokTHpR+rhSwFb/aEaCCcR0IcCi75azkkI/npNny+vNw
czlLDOATf34sL7Sf8t3aFRKClKfIqaTl68CwFxT6azwAHSMnarn08R6LaKBam0M6kib+HEzQ08X9
n4PWHx9kQLPL03XP8ICFZS/HyZ0CAwEAAaMwMC4wHgYDVR0RBBcwFYETcGhpbGlwQGJhbGlzdGVy
Lm9yZzAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBQUAA4GBAEhQu4uA6rrVE4n28jbRHvnvW6oK
llEnAxZdAU1eXxVQV/5haTN0QWSX6vojOatC+6qJ7d7BmlxtHHVb0ZNnZLldotB8JJkyyeB0yzMi
eewYzCVmPcnQ4mPgItaSDZoyIKv6iNGoq3gcqjXnuvKvj2lhO231tV736mQ+ekLpwoo7MIIDPzCC
AqigAwIBAgIBDTANBgkqhkiG9w0BAQUFADCB0TELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rl
cm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUgQ29uc3VsdGluZzEo
MCYGA1UECxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhhd3Rl
IFBlcnNvbmFsIEZyZWVtYWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0
aGF3dGUuY29tMB4XDTAzMDcxNzAwMDAwMFoXDTEzMDcxNjIzNTk1OVowYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDE
pjxVc1X7TrnKmVoeaMB1BHCd3+n/ox7svc31W/Iadr1/DDph8r9RzgHU5VAKMNcCY1osiRVwjt3J
8CuFWqo/cVbLrzwLB+fxH5E2JCoTzyvV84J3PQO+K/67GD4Hv0CAAmTXp6a7n2XRxSpUhQ9IBH+n
ttE8YQRAHmQZcmC3+wIDAQABo4GUMIGRMBIGA1UdEwEB/wQIMAYBAf8CAQAwQwYDVR0fBDwwOjA4
oDagNIYyaHR0cDovL2NybC50aGF3dGUuY29tL1RoYXd0ZVBlcnNvbmFsRnJlZW1haWxDQS5jcmww
CwYDVR0PBAQDAgEGMCkGA1UdEQQiMCCkHjAcMRowGAYDVQQDExFQcml2YXRlTGFiZWwyLTEzODAN
BgkqhkiG9w0BAQUFAAOBgQBIjNFQg+oLLswNo2asZw9/r6y+whehQ5aUnX9MIbj4Nh+qLZ82L8D0
HFAgk3A8/a3hYWLD2ToZfoSxmRsAxRoLgnSeJVCUYsfbJ3FXJY3dqZw5jowgT2Vfldr394fWxghO
rvbqNOUQGls1TXfjViF4gtwhGTXeJLHTHUb/XV9lTzGCA2QwggNgAgEBMHYwYjELMAkGA1UEBhMC
WkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0
ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhB1uFSSFEFdLtdTZ3y6RdiFMAkGBSsOAwIa
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA5MDQwODEy
MjgyN1owIwYJKoZIhvcNAQkEMRYEFKnrygd7C51MncDcagKUh9/GpiQfMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQdbhUkhRBXS7XU2d8ukXYhTCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQdbhUkhRBXS7XU2d8ukXY
hTANBgkqhkiG9w0BAQEFAASCAQAk2+C48BECwdaIyxNn3Wg+oNgj7624SCJ79sYCpn4f+MyErCBJ
SAn2S2p1QgXUPS3dTaD6b7mz1d9m4oh5jFGuwD22qZ8GftTRaxjkpxP2gsa5mmZT5mU2syBSRPZw
gg3j5m60bFWTjCP+juTvtzU/UUZAwyNc0SS2A5SMdEqtuk3WWGF/Bn5Ovh+9RGZd+QkgVMggfphD
eYtnk2pZR4XddWg9cz5Hd/fmD3WxQiyd4qge6An1XdDaOfqCB526AYLI/HOumDe7+Ojj2dZ/DXrr
a+GuBJrFYojGaVurqd7EMexwqHncX+AkqHON5QcDsPlMt1wAmumqvzA7gZpKuIPWAAAAAAAA

--------------ms070204030801040700060104--
