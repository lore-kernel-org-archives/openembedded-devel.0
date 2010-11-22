Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PKY7D-0000Vh-To
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 16:15:38 +0100
Received: from [192.168.178.20] (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 296D91B40D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 16:15:41 +0100 (CET)
Message-ID: <4CEA88D0.7070100@sensortherm.de>
Date: Mon, 22 Nov 2010 16:14:24 +0100
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CE64779.3020802@sensortherm.de>	<AANLkTinAj4fG48Ppz_jwT1nmp+tzntZ9YJPaqat4HbES@mail.gmail.com>	<4CE7D1F2.7010305@sensortherm.de>	<AANLkTi=VB3EJo1DU2pGWgCSqFrZX81t1Es4xTHP3eCWU@mail.gmail.com>	<4CEA2BFF.5090707@sensortherm.de>
	<AANLkTimabe75SmdGTA5EemH83-4Yd7KjNwdx8D3dCNR6@mail.gmail.com>
In-Reply-To: <AANLkTimabe75SmdGTA5EemH83-4Yd7KjNwdx8D3dCNR6@mail.gmail.com>
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: buildserver
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
X-List-Received-Date: Mon, 22 Nov 2010 15:15:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Am 22.11.2010 09:56, schrieb Frans Meulenbroeks:
> 2010/11/22 Klaus Schwarzkopf<schwarzkopf@sensortherm.de>:
>> Am 21.11.2010 19:08, schrieb Chris Larson:
>>>
>>> On Sat, Nov 20, 2010 at 6:49 AM, Klaus Schwarzkopf<
>>> schwarzkopf@sensortherm.de>    wrote:
>>>
>>>>
>>>>   Other good idea is to have sanity checker running once per day too. It
>>>>>
>>>>> may do next things:
>>>>> - check recipes syntax
>>>>> - check thath recipes SRC_URI can be fetched
>>>>>
>>>>
>>>> I think, bitbake can easily integrate this two features.
>>>>
>>>> For example the new options:
>>>>
>>>> --download-only                 only download the source files for the
>>>> given recipe
>>>>
>>>> --download-only-with-depencies  only download the source files for the
>>>> given recipe and its depencies
>>>>
>>>> --check-syntax                  check recipes syntax
>>>
>>>
>>>
>>> This seems pretty foolish and unnecessary to me.  This can be easily done
>>> in
>>> the metadata -- there's no need to modify bitbake for this at all.
>>
>>
>> Hi Chris,
>>
>> you are right! I don't see this function.
>>
>> I wrote some commands, to download the source files:
>>
>>
>> export MACHINE=dm355-evm # can be for all machines
>>
>> find /home/klaus/development/oe/openembedded/ -name '*.bb' -type f -exec
>>   bitbake  -c fetch -b '{}'  2>&1>  fetch.log \;
>>
>> egrep -n 'ERROR.*bb..failed' fetch.log
>>
>>
>> It is not perfect, but it shows some errors.
>>
>> Can somebody test it?
>
> You can also do
> bitbake -c fetchall world (although this has a little bit less
> coverage as it will not handle older versions).
>
> I'm not too good in find syntax so instead of your find cmd I would
> probably use something like:
>
> for i in recipes/*/*bb
> do
> bitbake -c fetch $i
> done>  fetch.log 2>&1
>
> Enjoy! Frans
>

Hi Frans,

this script looks good. I try it on the next run.

My script isn't finished yet, maybe tomorrow, but i post the results. I 
hope this helps a little.

Download the fetch.log, to see the error
http://fbi.hooster.de/download/sonstiges/oe/fetch.log.tar.gz

The first number is the row number.

klaus@ubuntu:~/development/oe$ egrep -n 'ERROR.*bb..failed' fetch.log
413:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/samsung-soc-utils/s3c2410-boot-usb-native_svn.bb' 
failed
4090:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opensync/libopensync-plugin-syncml-client-plugin_0.1.bb' 
failed
4274:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opensync/libopensync_0.22.bb' 
failed
4301:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opensync/libopensync-plugin-file_0.18.bb' 
failed
4367:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opensync/libopensync-plugin-irmc-sync_0.22.bb' 
failed
4434:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opensync/syncml-client_0.1.bb' 
failed
4480:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opensync/libopensync-plugin-gpe_0.18.bb' 
failed
4619:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opensync/msynctool_svn.bb' 
failed
5066:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opensync/libopensync-plugin-irmc_0.18.bb' 
failed
6325:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opensync/libopensync-plugin-evo2-sync_0.22.bb' 
failed
6392:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opensync/msynctool_0.22.bb' 
failed
6419:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opensync/libopensync-plugin-file-sync_0.22.bb' 
failed
6761:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/openjdk/openjdk-6_6b18-1.8.bb' 
failed
8551:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-tinykate/opie-tinykate_cvs.bb' 
failed
8749:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-alarm/opie-alarm_cvs.bb' 
failed
9027:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/openocd/openocd-native_svn.bb' 
failed
9057:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/openocd/openocd_svn.bb' 
failed
9380:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-sounds/opie-sounds_cvs.bb' 
failed
9915:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-sfcave/opie-sfcave_cvs.bb' 
failed
10038:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/howl/howl_0.9.7.bb' failed
10337:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/snes232/snes232_cvs.bb' 
failed
12069:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-multikeyapplet/opie-multikeyapplet_cvs.bb' 
failed
12154:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/dhcdbd/dhcdbd_1.14.bb' 
failed
14505:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/fltk/fltk_1.1.4.bb' failed
14662:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-recorder/opie-recorder_cvs.bb' 
failed
15214:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-style-fresh/opie-style-fresh_cvs.bb' 
failed
15279:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/nis/ypbind-mt_1.18.bb' 
failed
15425:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-launcher-settings/opie-launcher-settings_cvs.bb' 
failed
15473:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/dircproxy/dircproxy_1.1.0.bb' 
failed
15779:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-clipboardapplet/opie-clipboardapplet_cvs.bb' 
failed
16689:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/openmoko-projects/tichy_git.bb' 
failed
17314:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/upnp/gupnp-tools_0.8.bb' failed
17487:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/upnp/gupnp-vala_0.6.2.bb' 
failed
17600:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-deco-liquid/opie-deco-liquid_cvs.bb' 
failed
17841:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/gtkhtml/gtkhtml-2.0_2.6.3.bb' 
failed
18027:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-aboutapplet/opie-aboutapplet_cvs.bb' 
failed
18273:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/tsclient/tsclient_0.132.bb' 
failed
18309:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/tsclient/tsclient_0.140.bb' 
failed
18424:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/dgen/dgen-sdl_1.23.bb' 
failed
19321:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/spca5xx/spca5xx_20060501.bb' 
failed
19431:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-today/opie-today_cvs.bb' 
failed
19542:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-wellenreiter/opie-wellenreiter_cvs.bb' 
failed
19613:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/exmap-console/exmap-console_svn.bb' 
failed
20528:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-search/opie-search_cvs.bb' 
failed
21801:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/gtk2-ssh-askpass/gtk2-ssh-askpass_0.3.bb' 
failed
21887:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/ntfs-3g/ntfs-3g_1.0.bb' 
failed
22281:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/mailx/mailx_8.1.2-0.20020411cvs.bb' 
failed
22326:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/mailx/mailx_8.1.2-0.20040524cvs.bb' 
failed
35676:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-sshkeys/opie-sshkeys_cvs.bb' 
failed
35991:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-restartapplet2/opie-restartapplet2_cvs.bb' 
failed
36572:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/hibernate-script/hibernate-script_1.12.bb' 
failed
37113:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-calculator/opie-calculator_cvs.bb' 
failed
37227:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-todo/opie-todo_cvs.bb' 
failed
37376:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/disko/disko_1.6.0.bb' 
failed
37443:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/libeina/libeina_0.96.5.bb' 
failed
37515:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-backgammon/opie-backgammon_cvs.bb' 
failed
37891:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/openh323/openh323_1.13.5.4.bb' 
failed
38358:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/scummvm/opie-scummvm_1.0.1.bb' 
failed
38854:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/libxsettings/libxsettings_svn.bb' 
failed
38949:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-login/opie-login_cvs.bb' 
failed
39319:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-sysinfo/opie-sysinfo_cvs.bb' 
failed
39595:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-clockapplet/opie-clockapplet_cvs.bb' 
failed
41354:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-examples/opie-examples_cvs.bb' 
failed
42746:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/kismet/kismet_2007-10-R1.bb' 
failed
42776:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/kismet/kismet-newcore_svn.bb' 
failed
42806:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/kismet/kismet_svn.bb' 
failed
43284:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-zsame/opie-zsame_cvs.bb' 
failed
43446:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/ica/ica-bin_8.0.bb' failed
43518:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-fifteen/opie-fifteen_cvs.bb' 
failed
43704:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/waimea/waimea_cvs.bb' 
failed
45019:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/alsa/alsa-scenario_git.bb' 
failed
45574:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/juce/juce_1.29.bb' failed
46448:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-unikeyboard/opie-unikeyboard_cvs.bb' 
failed
46784:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/gnome/gnome-games_2.30.2.bb' 
failed
47212:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/gnome/libbacon_svn.bb' 
failed
49123:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/neuros-public/neuros-app-vplayer_git.bb' 
failed
49159:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/neuros-public/neuros-mainmenu_git.bb' 
failed
49195:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/neuros-public/neuros-qt-plugins_git.bb' 
failed
49231:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/neuros-public/neuros-lib-widgets_git.bb' 
failed
49267:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/neuros-public/neuros-nwm_git.bb' 
failed
49303:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/neuros-public/neuros-lib-gui_git.bb' 
failed
49339:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/neuros-public/neuros-app-photoalbum_git.bb' 
failed
49581:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/soundtracker/soundtracker-gtk2_0.6.7.bb' 
failed
49672:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-tonleiter/opie-tonleiter_cvs.bb' 
failed
49803:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/chillispot/chillispot_0.98.bb' 
failed
49839:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/chillispot/chillispot_1.0RC3.bb' 
failed
50286:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-remote/opie-remote_cvs.bb' 
failed
50380:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-securityplugins/opie-securityplugin-notice_cvs.bb' 
failed
50412:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-securityplugins/opie-securityplugin-dummy_cvs.bb' 
failed
50550:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-securityplugins/opie-securityplugin-pin_cvs.bb' 
failed
50603:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-securityplugins/opie-securityplugin-blueping_cvs.bb' 
failed
50630:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-help-en/opie-help-en_1.2.4.bb' 
failed
50663:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-help-en/opie-help-en_cvs.bb' 
failed
50691:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-help-en/opie-help-en_1.2.3.bb' 
failed
50785:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/libqanava/libqanava_0.0.7.bb' 
failed
51053:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-gutenbrowser/opie-gutenbrowser_cvs.bb' 
failed
51131:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/minipredict/dictionary_en-GB.bb' 
failed
51512:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-zsafe/opie-zsafe_cvs.bb' 
failed
51605:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/redfang/redfang.bb' failed
51696:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-ftplib/opie-ftplib_cvs.bb' 
failed
51877:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/xffm/xffm_4.3.99.2.bb' 
failed
52016:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-aqpkg/opie-aqpkg_cvs.bb' 
failed
52068:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-pimconverter/opie-pimconverter_cvs.bb' 
failed
52135:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/agg/agg-minimal_2.5.bb' 
failed
52341:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/treecc/treecc_0.3.6.bb' 
failed
52376:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/treecc/treecc-native_0.3.6.bb' 
failed
52680:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-symlinker/opie-symlinker_cvs.bb' 
failed
52805:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/xcb/xcb-proto_0.9.bb' 
failed
54628:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-mediaplayer1-libmadplugin/opie-mediaplayer1-libmadplugin_cvs.bb' 
failed
54716:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/frotz/frotz_2.42.bb' failed
54836:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-systemtime/opie-systemtime_cvs.bb' 
failed
55022:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-cardapplet/opie-cardapplet_cvs.bb' 
failed
55264:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-lockapplet/opie-lockapplet_cvs.bb' 
failed
57179:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-keyview/opie-keyview_cvs.bb' 
failed
57367:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-parashoot/opie-parashoot_cvs.bb' 
failed
57413:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/qc-usb/qc-usb-messenger_1.1.bb' 
failed
57440:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/qc-usb/qc-usb-messenger_0.8.bb' 
failed
57860:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-sheet/opie-sheet_cvs.bb' 
failed
59282:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-textedit/opie-textedit_cvs.bb' 
failed
59392:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/cxcrypt/cxcrypt_1.0.bb' 
failed
59446:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-memoryapplet/opie-memoryapplet_cvs.bb' 
failed
59596:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/tslib/tslib_git.bb' failed
59708:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-examples-python/opie-examples-python_cvs.bb' 
failed
59932:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/cdtool/cdtool_2.1.8.bb' 
failed
59984:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-write/opie-write_cvs.bb' 
failed
60132:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-qss/opie-qss_cvs.bb' 
failed
60785:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/pimlico/dates_svn.bb' 
failed
60872:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/pimlico/contacts_svn.bb' failed
60902:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/pimlico/tasks_svn.bb' 
failed
61101:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/libsvdrp/libsvdrp_hg.bb' failed
61550:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/inkspill/inkspill_0.1.bb' 
failed
61577:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/gnet/gnet_cvs.bb' failed
62827:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/hal/hal_git.bb' failed
63659:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/binutils/binutils_2.18.atmel.1.0.1.bb' 
failed
63883:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/binutils/mingw-binutils_2.20.bb' 
failed
64242:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/binutils/mingw-binutils-canadian-cross_2.20.bb' 
failed
77703:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-sh/opie-sh_cvs.bb' 
failed
77777:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-drawpad/opie-drawpad_cvs.bb' 
failed
79285:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/maxima/maxima_5.21.1.bb' failed
79709:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-networkapplet/opie-networkapplet_cvs.bb' 
failed
80410:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/opie-keytabs/opie-keytabs_cvs.bb' 
failed
80495:ERROR: 
'/home/klaus/development/oe/openembedded/recipes/gpsdrive/gpsdrive-pda_2.10pre2.bb' 
failed




What means KeyError?

Traceback (most recent call last):
   File "/home/klaus/development/oe/bitbake/bin/bitbake", line 143, in 
<module>
     main()
   File "/home/klaus/development/oe/bitbake/bin/bitbake", line 140, in main
     cooker.cook()
   File "/home/klaus/development/oe/bitbake/lib/bb/cooker.py", line 608, 
in cook
     if not self.buildFile(self.configuration.buildfile):
   File "/home/klaus/development/oe/bitbake/lib/bb/cooker.py", line 488, 
in buildFile
     self.status.task_deps[fn]['depends'] = {}
KeyError: 
'/home/klaus/development/oe/openembedded/recipes/linux/linux-handhelds-2.6_2.6.17-hh4.bb'

Greetings

Klaus





