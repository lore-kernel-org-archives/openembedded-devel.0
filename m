Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1KWsRT-0003d7-F2
	for openembedded-devel@openembedded.org; Sat, 23 Aug 2008 14:42:07 +0200
Received: (qmail 23987 invoked by uid 1003); 23 Aug 2008 12:40:46 -0000
Received: from localhost (HELO localhost.localdomain)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 23 Aug 2008 12:40:45 -0000
Message-ID: <48B0054B.5010702@balister.org>
Date: Sat, 23 Aug 2008 08:40:43 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <g8nfi3$viv$1@ger.gmane.org> <20080823070011.GA9448@gmail.com>
	<g8oid1$c4t$1@ger.gmane.org>
In-Reply-To: <g8oid1$c4t$1@ger.gmane.org>
Subject: Re: bitbake world
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
X-List-Received-Date: Sat, 23 Aug 2008 12:42:08 -0000
X-Groupsio-MsgNum: 5797
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms030603020605020807060303"

--------------ms030603020605020807060303
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Khem Raj wrote:
>> On (23/08/08 00:45), Rolf Leggewie wrote:
>>> Hi,
>>>
>>> as I wrote here previously, I am trying my luck with "bitbake world".
>>> And boy-oh-boy, I must have been the first to do so since 2006. Anyways,
>>> pb was kind enough to help me with one stubborn circular dependency in
>>> udhcp and so I could move on.  Today was the first day after locally
>>> dropping recipes left and right that "bitbake world" actually got to the
>>> compile stage.  Before, it would always abort, because the dependency
>>> tree was unresolvable.  It was suggested in IRC that I sent the list of
>>> stuff I had to temporarily drop to oe-devel.  It has about 200 entries.
>>> So, here it is (I hope the attachment makes it through).  I'll keep the
>>> list at http://oss.leggewie.org/wip/dropped.txt current.  My compile
>>> tests were for qemuarm/.dev/spitz.
>>
>> I see packages like packages/meta/meta-toolchain.bb being dropped that 
>> does not sound right to me. May be some of these recipes can be fixed 
>> for dependency issues instead of dropping them.
> 
> A lot of those packages just need a specific set of virtuals/foo to 
> parse correctly, so the current list is bogus

Should we comments to the recipes that need the virtual/foo to parse, so 
that future generation of OE users can identify this class of proeblems 
quickly?

Philip



> 
> 
>>> Regards
>>>
>>> Rolf
>>
>>>    dropped  packages/angstrom/angstrom-bootmanager.bb
>>>    dropped  packages/antlr/antlr-native_2.7.5.bb
>>>    dropped  packages/antlr/antlr_2.7.5.bb
>>>    dropped  packages/boost-asio/boost-asio_0.3.7.bb
>>>    dropped  packages/bt950-cs/bt950-cs_0.1.bb
>>>    dropped  packages/elfkickers/elfkickers-native_2.0a.bb
>>>    dropped  packages/elfkickers/elfkickers_2.0a.bb
>>>    dropped  packages/feh/feh-1.2.6
>>>    dropped  packages/feh/feh-1.2.6/cross.patch
>>>    dropped  packages/feh/feh-1.2.7
>>>    dropped  packages/feh/feh-1.2.7/cross.patch
>>>    dropped  packages/feh/feh_1.2.6.bb
>>>    dropped  packages/feh/feh_1.2.7.bb
>>>    dropped  packages/freesmartphone/task-pyneo.bb
>>>    dropped  packages/gpe-mini-browser/gpe-mini-browser-hildon_0.15.bb
>>>    dropped  packages/gpe-mini-browser/gpe-mini-browser-hildon_0.16.bb
>>>    dropped  packages/gpe-mini-browser/gpe-mini-browser-hildon_0.17.bb
>>>    dropped  packages/gpe-todo/gpe-todo-hildon_0.54.bb
>>>    dropped  packages/gpe-todo/gpe-todo-hildon_0.55.bb
>>>    dropped  packages/gpephone/firewall_svn.bb
>>>    dropped  packages/gpephone/libmsgenabler2_svn.bb
>>>    dropped  packages/gpephone/libmsgenabler_1.0.bb
>>>    dropped  packages/gpephone/libmsgenabler_svn.bb
>>>    dropped  packages/gpephone/phoneserver
>>>    dropped  packages/gpephone/phoneserver/changeport.patch
>>>    dropped  packages/gpephone/phoneserver/phoneserver-gta01.patch
>>>    dropped  packages/gpephone/phoneserver_1.0.bb
>>>    dropped  packages/gpephone/sms-1.0
>>>    dropped  packages/gpephone/sms-1.0/somefixes.patch
>>>    dropped  packages/gpephone/sms_1.0.bb
>>>    dropped  packages/gpephone/sms_1.1.bb
>>>    dropped  packages/gthumb/gthumb_2.6.9.bb
>>>    dropped  packages/images/nylon-image-extended.bb
>>>    dropped  packages/inputpipe/inputpipe_svn.bb
>>>    dropped  packages/juce/juce_1.29.bb
>>>    dropped  packages/kdepimpi
>>>    dropped  packages/kdepimpi/files
>>>    dropped  packages/kdepimpi/files/gcc4.patch
>>>    dropped  packages/kdepimpi/files/gcc42.patch
>>>    dropped  packages/kdepimpi/files/qt-mt.patch
>>>    dropped  packages/kdepimpi/kdepimpi-base.inc
>>>    dropped  packages/kdepimpi/kdepimpi-qte.inc
>>>    dropped  packages/kdepimpi/kdepimpi-x11
>>>    dropped  packages/kdepimpi/kdepimpi-x11/kabc.patch
>>>    dropped  packages/kdepimpi/kdepimpi-x11/kammu.patch
>>>    dropped  packages/kdepimpi/kdepimpi-x11/korganizer.patch
>>>    dropped  packages/kdepimpi/kdepimpi-x11/libkcal.patch
>>>    dropped  packages/kdepimpi/kdepimpi-x11/nomail.patch
>>>    dropped  packages/kdepimpi/kdepimpi-x11.inc
>>>    dropped  packages/kdepimpi/kdepimpi-x11_2.2.3.bb
>>>    dropped  packages/kdepimpi/kdepimpi_2.2.7.bb
>>>    dropped  packages/kdepimpi/kphonepi_1.0.0.bb
>>>    dropped  packages/kdepimpi/ktimetrackerpi_0.9.7.bb
>>>    dropped  packages/kdepimpi/pwmpi.inc
>>>    dropped  packages/kdepimpi/pwmpi_2.2.7.bb
>>>    dropped  packages/libao/libao-plugin-alsa_0.8.6.bb
>>>    dropped  packages/libdbi/libdbi-drivers_0.7.1.bb
>>>    dropped  packages/libgpepimc/libgpepimc-hildon_0.5.bb
>>>    dropped  packages/libqanava/libqanava_0.0.7.bb
>>>    dropped  packages/librcf/librcf_0.4.bb
>>>    dropped  packages/maemo/audiofile_0.2.6-3osso4.bb
>>>    dropped  packages/maemo/hildon-control-panel
>>>    dropped  packages/maemo/hildon-control-panel/config-path.patch
>>>    dropped  packages/maemo/hildon-control-panel/noWerror.patch
>>>    dropped  packages/maemo/hildon-control-panel_0.9.1-1.2.bb
>>>    dropped  packages/maemo/hildon-status-bar
>>>    dropped  packages/maemo/hildon-status-bar/source.patch
>>>    dropped  packages/maemo/hildon-status-bar_0.8.11-1.bb
>>>    dropped  packages/maemo/lessertunjo_0.0.10.bb
>>>    dropped  packages/maemo/libosso-help
>>>    dropped  packages/maemo/libosso-help/help-header-pp.patch
>>>    dropped  packages/maemo/libosso-help/no-Werror.patch
>>>    dropped  packages/maemo/libosso-help_1.0.01.bb
>>>    dropped  packages/maemo/libosso_0.8.9.bb
>>>    dropped  packages/maemo/osso-af-settings_0.8.5.bb
>>>    dropped  packages/maemo/osso-af-startup
>>>    dropped  packages/maemo/osso-af-startup/launch-no-o.patch
>>>    dropped  packages/maemo/osso-af-startup/osso-af-startup-source.patch
>>>    dropped  packages/maemo/osso-af-startup_0.28-1.bb
>>>    dropped  packages/maemo/osso-af-utils_0.4.bb
>>>    dropped  packages/maemo/osso-app-killer_0.4-3.bb
>>>    dropped  packages/maemo/osso-application-installer
>>>    dropped  
>>> packages/maemo/osso-application-installer/fix-buildsystem.patch
>>>    dropped  packages/maemo/osso-application-installer_1.0.03-1.bb
>>>    dropped  packages/maemo/osso-bttools_0.25.1.bb
>>>    dropped  packages/maemo/osso-core-config_200515.1.bb
>>>    dropped  packages/maemo/osso-dsp-headers_0.1.bb
>>>    dropped  packages/maemo/osso-esd_0.5.bb
>>>    dropped  packages/maemo/osso-gwconnect
>>>    dropped  packages/maemo/osso-gwconnect/osso-gwconnect-stdio.patch
>>>    dropped  packages/maemo/osso-gwconnect_0.70.1.bb
>>>    dropped  packages/maemo/osso-gwobex_0.26.1.bb
>>>    dropped  packages/maemo/osso-sounds_0.3-1.bb
>>>    dropped  packages/maemo-mapper/files
>>>    dropped  packages/maemo-mapper/files/fix_segfault.patch
>>>    dropped  packages/maemo-mapper/files/mapper-hildon1.diff
>>>    dropped  packages/maemo-mapper/maemo-mapper-nohildon_svn.bb
>>>    dropped  packages/maemo-mapper/maemo-mapper_svn.bb
>>>    dropped  packages/maemo4/hildon-control-panel_2.0.1.bb
>>>    dropped  packages/maemo4/hildon-thumbnail.inc
>>>    dropped  packages/maemo4/hildon-thumbnail_0.14.bb
>>>    dropped  packages/maemo4/libconic_0.13.bb
>>>    dropped  packages/maemo4/libhildon
>>>    dropped  packages/maemo4/libhildon/libhildon-buildfix.patch
>>>    dropped  packages/maemo4/libhildon.inc
>>>    dropped  packages/maemo4/libhildon_1.99.0.bb
>>>    dropped  packages/maemo4/libhildonfm
>>>    dropped  packages/maemo4/libhildonfm/libhildonfm-gtkmaemo-ifdef.patch
>>>    dropped  packages/maemo4/libhildonfm.inc
>>>    dropped  packages/maemo4/libhildonfm_1.9.46.bb
>>>    dropped  packages/maemo4/libhildonhelp.inc
>>>    dropped  packages/maemo4/libhildonhelp_1.9.6.bb
>>>    dropped  packages/maemo4/libhildonmime.inc
>>>    dropped  packages/maemo4/libhildonmime_1.10.0.bb
>>>    dropped  packages/maemo4/libhildonmime_1.9.5.bb
>>>    dropped  packages/maemo4/libosso
>>>    dropped  packages/maemo4/libosso/libosso-buildfix.patch
>>>    dropped  packages/maemo4/libosso-gsf_1.11.10.4.bb
>>>    dropped  packages/maemo4/libosso-help_2.1.2.bb
>>>    dropped  packages/maemo4/libosso.inc
>>>    dropped  packages/maemo4/libosso_2.13.bb
>>>    dropped  packages/maemo4/osso-gnome-vfs2
>>>    dropped  packages/maemo4/osso-gnome-vfs2/gnome-vfs-no-kerberos.patch
>>>    dropped  packages/maemo4/osso-gnome-vfs2_2.16.3.bb
>>>    dropped  packages/maemo4/osso-gwconnect.inc
>>>    dropped  packages/maemo4/osso-gwconnect_1.0.12.bb
>>>    dropped  packages/maemo4/osso-ic-oss
>>>    dropped  packages/maemo4/osso-ic-oss/dbus-api-update.patch
>>>    dropped  packages/maemo4/osso-ic-oss_1.0.4.bb
>>>    dropped  packages/mamona/mamona-sound-n800_0.1.0.bb
>>>    dropped  packages/meta
>>>    dropped  packages/meta/cross-linkage_1.0.bb
>>>    dropped  packages/meta/distro-feed-configs.bb
>>>    dropped  packages/meta/external-toolchain.bb
>>>    dropped  packages/meta/foonas-packages.bb
>>>    dropped  packages/meta/mamona-buildall.inc
>>>    dropped  packages/meta/meta-angstrom-2007.bb
>>>    dropped  packages/meta/meta-e-x11-core.bb
>>>    dropped  packages/meta/meta-e-x11.bb
>>>    dropped  packages/meta/meta-gpe-extras.bb
>>>    dropped  packages/meta/meta-gpe.bb
>>>    dropped  packages/meta/meta-gpephone.bb
>>>    dropped  packages/meta/meta-maemo.bb
>>>    dropped  packages/meta/meta-mamona-light.bb
>>>    dropped  packages/meta/meta-mamona.bb
>>>    dropped  packages/meta/meta-nas-server.bb
>>>    dropped  packages/meta/meta-opie-all.bb
>>>    dropped  packages/meta/meta-opie.bb
>>>    dropped  packages/meta/meta-sdl.bb
>>>    dropped  packages/meta/meta-sectest-gpe.bb
>>>    dropped  packages/meta/meta-toolchain-gpe-sbox.bb
>>>    dropped  packages/meta/meta-toolchain-gpe.bb
>>>    dropped  packages/meta/meta-toolchain-neuros.bb
>>>    dropped  packages/meta/meta-toolchain-openmoko.bb
>>>    dropped  packages/meta/meta-toolchain-sbox.bb
>>>    dropped  packages/meta/meta-toolchain-slugos.bb
>>>    dropped  packages/meta/meta-toolchain.bb
>>>    dropped  packages/meta/nylon-feed.bb
>>>    dropped  packages/meta/nylon-feed.inc
>>>    dropped  packages/meta/openmoko-feed.bb
>>>    dropped  packages/meta/openprotium-packages.bb
>>>    dropped  packages/meta/oplinux-packages.bb
>>>    dropped  packages/meta/package-index.bb
>>>    dropped  packages/meta/slugos-native-packages.bb
>>>    dropped  packages/meta/slugos-native.bb
>>>    dropped  packages/meta/slugos-packages.bb
>>>    dropped  packages/meta/staging-linkage_1.0.bb
>>>    dropped  packages/meta/unslung-packages.bb
>>>    dropped  packages/meta/xbase-clients.bb
>>>    dropped  packages/midpath/midpath-backend-gtk-hildon_0.2+0.3rc1.bb
>>>    dropped  packages/minisip
>>>    dropped  packages/minisip/libmikey_svn.bb
>>>    dropped  packages/minisip/libmnetutil_svn.bb
>>>    dropped  packages/minisip/libmsip_svn.bb
>>>    dropped  packages/minisip/libmutil0_svn.bb
>>>    dropped  packages/minisip/minisip-video_svn.bb
>>>    dropped  packages/minisip/minisip_svn.bb
>>>    dropped  packages/neuros-public/neuros-app-photoalbum_git.bb
>>>    dropped  packages/neuros-public/neuros-app-vplayer_git.bb
>>>    dropped  packages/neuros-public/neuros-lib-gui_git.bb
>>>    dropped  packages/neuros-public/neuros-lib-widgets_git.bb
>>>    dropped  packages/neuros-public/neuros-mainmenu_git.bb
>>>    dropped  packages/neuros-public/neuros-nwm_git.bb
>>>    dropped  packages/neuros-public/neuros-qt-plugins_git.bb
>>>    dropped  packages/openmoko-base/openmoko-session_svn.bb
>>>    dropped  packages/opie-i18n/opie-i18n_1.2.3.bb
>>>    dropped  packages/opie-i18n/opie-i18n_cvs.bb
>>>    dropped  packages/qpf-fonts/qpf-bitstream-vera-sans-mono_1.10.bb
>>>    dropped  packages/qpf-fonts/qpf-bitstream-vera_1.10.bb
>>>    dropped  packages/qt4/qt-embedded_4.4.1.bb
>>>    dropped  packages/sphyrna/sphyrna_svn.bb
>>>    dropped  packages/swt/swt3.4-gtk-hildon_3.3+3.4M3.bb
>>>    dropped  packages/swt/swt3.4-gtk-hildon_3.3+3.4M5.bb
>>>    dropped  packages/tasks/task-gmae.bb
>>>    dropped  packages/tasks/task-gpe.bb
>>>    dropped  packages/tasks/task-gpephone.bb
>>>    dropped  packages/tasks/task-maemo.bb
>>>    dropped  packages/tasks/task-mamona-extras.bb
>>>    dropped  packages/tasks/task-mamona-nokia-it.bb
>>>    dropped  packages/tasks/task-mamona.bb
>>>    dropped  packages/tasks/task-openprotium.bb
>>>    dropped  packages/tasks/task-python-sharprom_20060425.bb
>>>    dropped  packages/tasks/task-qpe.bb
>>>    dropped  packages/tasks/task-sdk-extra.bb
>>>    dropped  packages/tasks/task-sdk-gpephone.bb
>>>    dropped  packages/tracker/tracker_0.5.4.bb
>>>    dropped  packages/ukeyboard
>>>    dropped  packages/ukeyboard/ukeyboard_1.2.bb
>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

--------------ms030603020605020807060303
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
BQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA4MDgyMzEy
NDA0M1owIwYJKoZIhvcNAQkEMRYEFNufLuIT2e11CMZ1XmrjdtdylLRrMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxU
aGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQdbhUkhRBXS7XU2d8ukXYhTCBhwYLKoZIhvcNAQkQAgsxeKB2MGIx
CzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQdbhUkhRBXS7XU2d8ukXY
hTANBgkqhkiG9w0BAQEFAASCAQBYJT53vB3Dewq+ChuxtFijIgg8Q74LFhMQ6CCdsAQATiZGf6Zv
XNJ7GohDwpJFfOd3zSJLito1/QURTwBDQp7lRLs2XrYkLAWg8xMcoViiMyvhqLcPnMOw9ckznK70
UDi0+NvyJafPf3Gku+50J52yuq5nESFVurXCpaUFsfF06RLMjfJKGIhdmSIp6tt0prpitni/0AhN
2Zbo0fy/avYn0uGrSQaICnyLDZKwXe2Wu+koZ1nGAD8Mpz1BRYjtfDLGEVhDqPvVzgbSTSyMbyoA
/n2J3HE9h7LVRa5jY1PY8jef31IzopdeWe3ZP9zbCy+oQagfAi1yckirK1xHNCb8AAAAAAAA

--------------ms030603020605020807060303--
