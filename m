Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RPu08-00076s-LT for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 11:42:56 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RPttx-00051x-SC for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 11:36:33 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 11:36:33 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 11:36:33 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 14 Nov 2011 11:36:19 +0100
Message-ID: <j9qqv3$usr$1@dough.gmane.org>
References: <99AD691F1FA415449470C6EA37B6FE4606D917@DNCE03.ent.ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <99AD691F1FA415449470C6EA37B6FE4606D917@DNCE03.ent.ti.com>
X-Enigmail-Version: 1.3.3
Subject: Re: FW: [PATCH] bluez4_4.95.bb: new recipe for building bluez-4.95
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
X-List-Received-Date: Mon, 14 Nov 2011 10:42:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 13-11-11 08:55, Preskovsky, Vita schreef:
> Ping to: [oe] [PATCH] bluez4_4.95.bb: new recipe for building bluez-4.95

Send an updated set of patches addressing all the feedback. Pinging patches
without having done so doesn't help.
> 
> Regards, Vita Preskovsky
> 
> -----Original Message----- From:
> openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Preskovsky, Vita Sent: Monday, October 31, 2011 11:19 PM To: Paul Menzel 
> Cc: openembedded-devel@lists.openembedded.org Subject: Re: [oe] [PATCH]
> bluez4_4.95.bb: new recipe for building bluez-4.95
> 
> Paul,
> 
> I'm subscribed to the list and receive mails from it, but I'm new to
> arago and openembeded. I have a question about the right way to define
> DEFAULT_PREFERENCE in recipes. In all bluez4_4.x recipes there is
> definition of default preference as DEFAULT_PREFERENCE = "-1", and
> bitbake takes the last one. In the last recipe version 4.89 they defined
> also angstrom default preference: DEFAULT_PREFERENCE_angstrom = "1" So
> everyone, working under angstrom, as we do, compiles with the version
> 4.89. We chose to work with version 4.95 (despite existence of 4.96) but
> we don't want this recipe will be compiled as default, only for those who
> will compile this recipe for specific machine as am180x-evm. So instead
> of DEFAULT_PREFERENCE_angstrom I can define DEFAULT_PREFERENCE_am180x-evm
> = "1", that meets our goal. Is this way more appropriate than I did
> previously?
> 
> Thank you, Vita.
> 
> -----Original Message----- From: Paul Menzel
> [mailto:paulepanter@users.sourceforge.net] Sent: Sunday, October 30, 2011
> 1:42 PM To: openembedded-devel@lists.openembedded.org Cc: Preskovsky,
> Vita; Vita Preskovsky Subject: Re: [oe] [PATCH] bluez4_4.95.bb: new
> recipe for building bluez-4.95
> 
> Dear Vita,
> 
> 
> are you reading the list or do I have to add your address to the CC
> field?
> 
> 
> Am Sonntag, den 30.10.2011, 10:58 +0100 schrieb Preskovsky, Vita:
> 
>> Please see my answers bellow.
> 
> thank you for your answer.
> 
>> -----Original Message-----
> 
>> Sent: Tuesday, October 11, 2011 4:32 PM
> 
>> Subject: Re: [oe] [PATCH] bluez4_4.95.bb: new recipe for building 
>> bluez-4.95
>> 
>> Dear Vita,
>> 
>> 
>> thank you for your patch.
>> 
>> Am Dienstag, den 11.10.2011, 11:08 +0200 schrieb Vita Preskovsky:
>> 
>> Using
>> 
>> bluez4: Add version 4.95
>> 
>> as the commit summary would be cleaner. Use `git commit --amend` to
>> change that.
>> 
>> Additionally you should elaborate more in the commit message what the
>> patch is doing.
>> 
>> 1. Have you tested it? Is it just an upgrade because of or does 
>> version 4.91 in the repository have any short comings so that it should
>> be removed?
>> 
>> I tested this recipe, and the reason I added this version is that we
>> want to use this version of Bluez in our release.
> 
> I guess you tested it using Ȧngström, so the old recipe can be removed. 
> Please note that oe-core already has version 4.96.
> 
>>> Signed-off-by: Vita Preskovsky <vitap@ti.com> --- 
>>> recipes/bluez/bluez4_4.95.bb |   30 ++++++++++++++++++++++++++++++ 1
>>> files changed, 30 insertions(+), 0 deletions(-)  create mode 100644
>>> recipes/bluez/bluez4_4.95.bb
>>> 
>>> diff --git a/recipes/bluez/bluez4_4.95.bb 
>>> b/recipes/bluez/bluez4_4.95.bb new file mode 100644 index 
>>> 0000000..a682d6a --- /dev/null +++ b/recipes/bluez/bluez4_4.95.bb @@
>>> -0,0 +1,30 @@ +require bluez4.inc +SRC_URI = "\ +
>>> http://www.kernel.org/pub/linux/bluetooth/bluez-${PV}.tar.gz \
>> 
>> 2. As far as I know kernel.org after the compromise presently does not
>> provide that archive. So the recipe will not build unless there is a
>> mirror somewhere. Do you know of a mirror?
>> 
>> There are two possible locations for this package: 
>> http://www.mirrorservice.org/sites/ftp.kernel.org/pub/linux/bluetooth/bluez-4.95.tar.gz
>>
>>  
>> http://www.angstrom-distribution.org/unstable/sources/bluez-4.95.tar.g 
>> z I changed the SRC_URI in my working directory for the first location
>>  and it worked fine. So with what location do you prefer the recipe
>> will be released?
> 
> I am unsure about the policy myself and I do not think an “OE mirror” has
> that particular archive.
> 
>>> + file://bluetooth.conf \ +" + +SRC_URI[md5sum] =
>>> "341294b2849a04a4afff5c96bfbf30b2" +SRC_URI[sha256sum] =
>>> "d6ea9de410fc2bcd2620d709c2202893b218e2e6a55c3c0ce6bebd27fa4120f6" + 
>>> +DEFAULT_PREFERENCE = "-1"
>> 
>> 3. Why?
>>> +DEFAULT_PREFERENCE_angstrom = "1"
>> 
>> 4. Have you talked to the Ȧngström maintainers?
>> 
>> These two variables are defined in the previous version of bluez4
>> recipe: bluez4_4.89.bb. Without these two definitions in my recipe
>> bitbake prefers the old recipe upon mine, which doesn't leave me a
>> choice but to define these variables.
> 
> The “correct” way would be to first add that recipe and then afterward
> sent a patch to change the preferences which the Ȧngström maintainers
> have to acknowledge.
> 
>>> + +DEPENDS += "libsndfile1" + +PR = "${INC_PR}.0" + +# Not all
>>> distros have a recent enough udev BTUDEV = " +--disable-udevrules" 
>>> +BTUDEV_angstrom = " --enable-udevrules" +BTUDEV_shr = "
>>> --enable-udevrules" + +EXTRA_OECONF += "${BTUDEV}" 
>>> +do_configure_append(){ +	echo "#define
>>> LIBUDEV_I_KNOW_THE_API_IS_SUBJECT_TO_CHANGE" >> +${S}/config.h } + 
>>> +FILES_${PN}-dbg += "\ +  ${base_libdir}/udev/.debug \ +
>>> ${libdir}/*/.debug \ +"
>> 
>> Otherwise this recipe looks good. Is it planned for branch
>> 2011.03-maintenance?
> 
> 
> Thanks,
> 
> Paul _______________________________________________ Openembedded-devel
> mailing list Openembedded-devel@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel 
> _______________________________________________ Openembedded-devel
> mailing list Openembedded-devel@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7A7yAACgkQMkyGM64RGpGJZwCgiF56zT1WLLiMfbkEOzWwtUCy
ShMAnA6aeHK81PaDXUUglKtmi68Pqwa+
=xYOI
-----END PGP SIGNATURE-----



