Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T1ywj-0004rW-Kd for openembedded-devel@lists.openembedded.org;
	Thu, 16 Aug 2012 14:13:05 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T1ylB-0003JW-LV for openembedded-devel@lists.openembedded.org;
	Thu, 16 Aug 2012 14:01:09 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2012 14:01:09 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2012 14:01:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 16 Aug 2012 14:00:59 +0200
Message-ID: <k0indq$f96$1@ger.gmane.org>
References: <1344903048-2800-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRQJHwSY5CC+c0na_nWH2mck0TjcKP87k4q=aMQKmRdvgQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <CALbNGRQJHwSY5CC+c0na_nWH2mck0TjcKP87k4q=aMQKmRdvgQ@mail.gmail.com>
X-Enigmail-Version: 1.4.3
Subject: Re: [meta-systemd,v2] wpa-supplicant: add systemd support
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
X-List-Received-Date: Thu, 16 Aug 2012 12:13:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-08-12 13:44, Andreas Müller schreef:
> On Tue, Aug 14, 2012 at 2:10 AM, Andreas Müller 
> <schnitzeltony@googlemail.com> wrote:
>> * native systemd support came in with v1.0 [1] * needs [2] to work
>> properly * mends my wlan under control of networkmanager
>> 
>> [1]
>> http://hostap.epitest.fi/gitweb/gitweb.cgi?p=hostap-1.git;a=blob_plain;f=wpa_supplicant/ChangeLog
>>
>> 
[2] http://patches.openembedded.org/patch/34335/
>> 
>> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com> --- 
>> .../wpa-supplicant/wpa-supplicant_1.0.bbappend     |    3 --- 
>> .../wpa-supplicant/wpa-supplicant_1.0.bbappend     |   14
>> ++++++++++++++ 2 files changed, 14 insertions(+), 3 deletions(-) delete
>> mode 100644
>> meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
>>
>> 
create mode 100644
meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
>> 
>> diff --git
>> a/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
>> b/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
>>
>> 
deleted file mode 100644
>> index 54da0ff..0000000 ---
>> a/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
>>
>> 
+++ /dev/null
>> @@ -1,3 +0,0 @@ -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:" - 
>> -PRINC = "1" diff --git
>> a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
>> b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
>>
>> 
new file mode 100644
>> index 0000000..6f62cd8 --- /dev/null +++
>> b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
>>
>> 
@@ -0,0 +1,14 @@
>> +PRINC = "2" + +inherit systemd + +SYSTEMD_PACKAGES = "${PN}-systemd" 
>> +SYSTEMD_SERVICE = "wpa_supplicant.service" + +do_install_append () { +
>> install -d ${D}${systemd_unitdir}/system +    install -m 644
>> ${S}/systemd/*.service ${D}${systemd_unitdir}/system +} + +#
>> systemd.bbclass does not catch all multiple-instance-service-files 
>> +FILES_${PN}-systemd += "${systemd_unitdir}/system/" -- 1.7.4.4
>> 
> I am testing
> 
> SYSTEMD_AUTO_ENABLE = "disable"
> 
> to avoid starting at every boot. First results look good and I think a V3
> will follow.

wpa-supplicant should get bus-activated using the dbus.service when
connman/networkmanager/whatever need it. Is something failing in the nm case?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQLOD7MkyGM64RGpERApwPAJ4rD/uo5K5qPUkYIcM6ryyjF20A1wCfcSy2
GlOQNzYL2vE+LzuxrMU8pQE=
=xMkp
-----END PGP SIGNATURE-----



