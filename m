Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NB9yr-0008UY-3m
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 17:35:40 +0100
Received: by fxm1 with SMTP id 1so2468414fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 08:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=TImIUXKtdk9owQb863aRtor+4IQQChxmm6yujlogDog=;
	b=SdKBViRa9gZ9BESZ41Hn6/mH6znc2wYYGF2YrY2icHlAoapWwaiJUiX3euo6+vqxl5
	QT3DYQ0dlpOJJRODY+AVfH3t+CSk9sLTQvgrthbpYijpmURmpUizxjLYONbWpCf/0yio
	jcdV/2hDHef25iU3y/1G6Sz7euw174MXeXybg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=dbPDkgVDLQgBAqi9+c2YhlUspEWKnIbxEzaE+uV+xbFjsF89F01S1tfItwAghN66T1
	1LSMqQCaE6pXbHc9Ji5dKoJRSW7T3WNCy+6/JjlB0AyTtO/nYoW4aAeIfKHoUf0EZwLq
	PvZ8imelaNTOjhzxvhaERXnZobDEBsqxLbi4c=
Received: by 10.204.160.73 with SMTP id m9mr155209bkx.214.1258648452108;
	Thu, 19 Nov 2009 08:34:12 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm243209fxm.11.2009.11.19.08.34.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 19 Nov 2009 08:34:10 -0800 (PST)
Date: Thu, 19 Nov 2009 17:34:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091119163403.GD3366@jama>
References: <20091115163618.GA3317@jama> <hdr31n$8b0$1@ger.gmane.org>
	<1258364356.5799.94.camel@dax.rpnet.com>
	<hdra17$t4d$1@ger.gmane.org>
	<1258368570.5799.99.camel@dax.rpnet.com>
	<hdrb9v$1dp$1@ger.gmane.org>
	<1258371591.5799.112.camel@dax.rpnet.com>
	<hdrffa$do6$1@ger.gmane.org>
	<1258375022.16625.3.camel@dax.rpnet.com>
	<he3q5u$mq2$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <he3q5u$mq2$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SRCPV migration
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
X-List-Received-Date: Thu, 19 Nov 2009 16:35:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 19, 2009 at 05:02:05PM +0100, Koen Kooi wrote:
> On 16-11-09 13:37, Richard Purdie wrote:
> 
> >I think we will have to hold off some of the SRCPV migration until
> >bitbake has some kind of lock down functionality for the local build
> >numbers.
> 
> So at least 2 core developers (Richard, me) have said we shouldn't
> use SRCPV for git stuff, and what do I spot today:
> 
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=4f1f60e0f46324c6a968aff9bffeb727d98d5283
> 
> +PV = "0.0+1.0rc2+gitr${SRCPV}"
> 
> FFS!

Hi again.. 

there is more SRCPVs in stuff I merged.. (which weren't probably built before and hopefully
aren't built now)

Do I have to kill all SRCPV there?

.. bitbake patches are prepared, waiting for review.. as soon as there is newer bitbake version
forced by sanity check, then all builders with 
BB_LOCALCOUNT_OVERRIDE = "1"
LOCALCOUNT = "0"
in local.conf, should get consistent localcount numbers == 0

If its ok to stay with SRCPV for those new recipes then we can save PE bump there..

Thanks..

Regards,

./calc/calc_git.bb:PV = "0.0.1+gitr${SRCPV}"
./xorg-util/glamo-dri-tests/glamo-dri-tests_git.bb:PV = "1.0.0+gitr${SRCPV}"
./efl1/illume-keyboard-default-alt_git.bb:PV = "0.0+gitr${SRCPV}"
./efl1/illume-keyboard-dutch_git.bb:PV = "0.0+gitr${SRCPV}"
./efl1/illume-keyboard-german_git.bb:PV = "0.0+gitr${SRCPV}"
./efl1/illume-keyboard-russian-terminal_git.bb:PV = "0.0+gitr${SRCPV}"
./efl1/illume-keyboard-numeric-alt_git.bb:PV = "0.0+gitr${SRCPV}"
./efl1/illume-keyboard-dvorak_git.bb:PV = "0.0+gitr${SRCPV}"
./efl1/illume-keyboard-arabic_git.bb:PV = "0.0+gitr${SRCPV}"
./efl1/illume-keyboard-hebrew_git.bb:PV = "0.0+gitr${SRCPV}"
./efl1/illume-keyboard-russian_git.bb:PV = "0.0+gitr${SRCPV}"
./efl1/illume-keyboard-browse_git.bb:PV = "0.0+gitr${SRCPV}"
./efl1/illume-keyboard-french_git.bb:PV = "0.0+gitr${SRCPV}"
./efl1/illume-keyboard-danish_git.bb:PV = "0.0+gitr${SRCPV}"
./linux/linux-openmoko-2.6.31_git.bb:PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCPV}"
./linux/linux-openmoko-shr-devel_git.bb:PV = "${KERNEL_RELEASE}-${OMV}+gitr${SRCPV}"
./linux/linux-openmoko-shr-drm-devel_git.bb:PV = "${KERNEL_RELEASE}-drm-${OMV}+gitr${SRCPV}"
./openmoko-3rdparty/advancedcaching_git.bb:PV = "0.1.2+gitr${SRCPV}"
./blipomoko/blipomoko_git.bb:PV = "0.0+gitr${SRCPV}"
./openmoocow/openmoocow_git.bb:PV = "0.0.3+gitr${SRCPV}"
./shr/shr-dialer_git.bb:PV = "0.0.2+gitr${SRCPV}"
./shr/shr-theme_git.bb:PV = "0.0.2+gitr${SRCPV}"
./shr/shr-splash-theme-simple_git.bb:PV = "1.2+gitr${SRCPV}"
./shr/gtk-theme-neo_git.bb:PV = "0.2-${EFL_SRCREV}+gitr${SRCPV}"
./shr/shr-splash-theme-niebiee_git.bb:PV = "1.2+gitr${SRCPV}"
./shr/e-wm-theme-illume-sixteen_git.bb:PV = "0.1-${EFL_SRCREV}+gitr${SRCPV}"
./shr/shr-splash_git.bb:PV = "1.2+gitr${SRCPV}"
./shr/libphone-ui-shr_git.bb:PV = "0.0.0+gitr${SRCPV}"
./shr/phoneuid_git.bb:PV = "0.0.0+gitr${SRCPV}"
./shr/shr-config_git.bb:PV = "0.0.2+gitr${SRCPV}"
./shr/shr-settings_git.bb:PV = "0.1.1+gitr${SRCPV}"
./shr/shr-specs_git.bb:PV = "0.0.0+gitr${SRCPV}"
./shr/etk-theme-shr_git.bb:PV = "1.1.1-${EFL_SRCREV}+gitr${SRCPV}"
./shr/icon-theme-neo_git.bb:PV = "0.2-${EFL_SRCREV}+gitr${SRCPV}"
./shr/libframeworkd-phonegui_git.bb:PV = "0.0.2+gitr${SRCPV}"
./shr/etk-theme-neo_git.bb:PV = "0.2-${EFL_SRCREV}+gitr${SRCPV}"
./shr/e-wm-theme-illume-shr_git.bb:PV = "1.1-${EFL_SRCREV}+gitr${SRCPV}"
./shr/elementary-theme-neo_git.bb:PV = "0.2.1-${EFL_SRCREV}+gitr${SRCPV}"
./shr/shr-splash-theme-dontpanic_git.bb:PV = "1.2+gitr${SRCPV}"
./shr/frameworkd-config-shr_git.bb:PV = "0.9.5.9+gitr${SRCPV}"
./shr/e-wm-theme-illume-gry_git.bb:PV = "0.3-${EFL_SRCREV}+gitr${SRCPV}"
./shr/elementary-theme-gry_git.bb:PV = "0.8-${EFL_SRCREV}+gitr${SRCPV}"
./shr/libframeworkd-phonegui-efl_git.bb:PV = "0.0.3+gitr${SRCPV}"
./shr/phoneui-apps_git.bb:PV = "0.0.0+gitr${SRCPV}"
./shr/shr-splash-theme-handy_git.bb:PV = "1.2+gitr${SRCPV}"
./shr/phonefsod_git.bb:PV = "0.0.0+gitr${SRCPV}"
./shr/libframeworkd-phonegui-efl-theme-neo_git.bb:PV = "0.2-${EFL_SRCREV}+gitr${SRCPV}"
./shr/e-wm-menu-shr_git.bb:PV = "1.1-${EFL_SRCREV}+gitr${SRCPV}"
./shr/e-wm-theme-illume-neo_git.bb:PV = "0.1-${EFL_SRCREV}+gitr${SRCPV}"
./shr/libframeworkd-phonegui-efl2_git.bb:PV = "0.0.1+gitr${SRCPV}"
./shr/elementary-theme-niebiee_git.bb:PV = "0.1-${EFL_SRCREV}+gitr${SRCPV}"
./shr/e-wm-config-illume-shr_git.bb:PV = "1.1-${EFL_SRCREV}+gitr${SRCPV}"
./shr/shr-messages_git.bb:PV = "0.0.2+gitr${SRCPV}"
./shr/shr-splash-theme-tux_git.bb:PV = "0.1+gitr${SRCPV}"
./shr/alsa-scenarii-shr_git.bb:PV = "1.0+gitr${SRCPV}"
./shr/shr-contacts_git.bb:PV = "0.0.2+gitr${SRCPV}"
./shr/elementary-theme-sixteen_git.bb:PV = "0.1-${EFL_SRCREV}+gitr${SRCPV}"
./shr/libmodulo_git.bb:PV = "0.0.1+gitr${SRCPV}"
./shr/shr-installer_git.bb:PV = "0.0.1+gitr${SRCPV}"
./shr/shr-theme-gtk-e17lookalike_git.bb:PV = "0.1.1+gitr${SRCPV}"
./shr/libphone-utils_git.bb:PV = "0.0.2+gitr${SRCPV}"
./shr/shr-today_git.bb:PV = "0.0.1+gitr${SRCPV}"
./shr/e-wm-theme-illume-niebiee_git.bb:PV = "0.1-${EFL_SRCREV}+gitr${SRCPV}"
./shr/ologicd_git.bb:PV = "0.0.1+gitr${SRCPV}"
./shr/shr-splash-theme-logo_git.bb:PV = "0.1+gitr${SRCPV}"
./shr/libphone-ui_git.bb:PV = "0.0.0+gitr${SRCPV}"
./shr/e-wm-sysactions-shr_git.bb:PV = "1.1-${EFL_SRCREV}+gitr${SRCPV}"
./pyphonelog/pyphonelog_git.bb:PV = "0.17.0+gitr${SRCPV}"
./bt-configure/bt-configure_git.bb:PV = "1.0.0+gitr${SRCPV}"
./pidgin/msn-pecan_git.bb:PV="0.0.1+gitr${SRCPV}"
./openmoko-projects/paroli_git.bb:PV = "0.2.1+gitr${SRCPV}"
./python/python-phoneutils_git.bb:PV = "0.0.2+gitr${SRCPV}"

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


