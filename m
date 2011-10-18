Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RG3kM-00068b-Hv for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 09:05:58 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RG3ei-0005H9-B0 for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 09:00:08 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 09:00:08 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 09:00:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 18 Oct 2011 08:55:12 +0200
Message-ID: <j7j7sg$ajc$2@dough.gmane.org>
References: <1318872201-26433-1-git-send-email-koen@dominion.thruhere.net>
	<1318872201-26433-2-git-send-email-koen@dominion.thruhere.net>
	<1318872201-26433-3-git-send-email-koen@dominion.thruhere.net>
	<201110180101.10576.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <201110180101.10576.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-xfce 3/4] xfce4-cpufreq-plugin: initial add
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
X-List-Received-Date: Tue, 18 Oct 2011 07:05:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 18-10-11 01:01, Andreas Müller schreef:
> On Monday, October 17, 2011 07:23:20 PM Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net> --- 
>> .../cpufreq/xfce4-cpufreq-plugin_1.0.0.bb          |    5 +++++ 1 files
>> changed, 5 insertions(+), 0 deletions(-) create mode 100644
>> meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.0.0.bb
>> 
>> diff --git
>> a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.0.0.bb
>> b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.0.0.bb
>>
>> 
new file mode 100644
>> index 0000000..484f794 --- /dev/null +++
>> b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.0.0.bb
>>
>> 
@@ -0,0 +1,5 @@
>> +inherit xfce-panel-plugin + +LICENSE = "MIT" +LIC_FILES_CHKSUM =
>> "file://COPYING;md5=1f6f1c0be32491a0c8d2915607a28f36" +
>> 
> I am run testing the libxfce4ui-based version. Right after I add it to
> panel, it complains that my system does not support cpu-frequency. The
> plugin reads it's information from /sys/devices/system/cpu/cpu0/cpufreq
> (or /proc/cpufreq). How can I make my system supply this information? Is
> there some magic kernel config for that?

For gumstix: use either a 'angstrom' kernel, instead of the sakoman version
or if you can find one, use a '-pm' sakoman version.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOnSLQMkyGM64RGpERArAUAJ9+PtsQpYvlk4ArrS5t+0gezHKDiQCggHiX
HTQEQPSgPoe/rWGh/NswTac=
=GU6R
-----END PGP SIGNATURE-----



