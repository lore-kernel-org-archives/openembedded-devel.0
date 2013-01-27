Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TzZGA-0003v5-0j for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jan 2013 21:55:26 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TzZ1K-0006mI-OG for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jan 2013 21:40:06 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jan 2013 21:40:06 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jan 2013 21:40:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 27 Jan 2013 21:39:39 +0100
Message-ID: <ke43a7$5d8$1@ger.gmane.org>
References: <1359182715-3063-1-git-send-email-raj.khem@gmail.com>
	<20130127192151.GN16904@jama.palm1.palmone.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
In-Reply-To: <20130127192151.GN16904@jama.palm1.palmone.com>
X-Enigmail-Version: 1.4.6
Subject: Re: [meta-oe][PATCH 1/2] i2c-tools: Upgrade to 3.0.3 -> 3.1.0
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
X-List-Received-Date: Sun, 27 Jan 2013 20:55:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 27-01-13 20:21, Martin Jansa schreef:
> On Fri, Jan 25, 2013 at 10:45:14PM -0800, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com> --- 
>> .../i2c-tools/i2c-tools-3.0.3/Module.mk            |   72
>> -------------------- .../i2c-tools/i2c-tools-3.1.0/Module.mk
>> |   72 ++++++++++++++++++++ 
>> .../recipes-support/i2c-tools/i2c-tools_3.0.3.bb   |   24 ------- 
>> .../recipes-support/i2c-tools/i2c-tools_3.1.0.bb   |   26 +++++++ 4
>> files changed, 98 insertions(+), 96 deletions(-) delete mode 100644
>> meta-oe/recipes-support/i2c-tools/i2c-tools-3.0.3/Module.mk create mode
>> 100644 meta-oe/recipes-support/i2c-tools/i2c-tools-3.1.0/Module.mk 
>> delete mode 100644
>> meta-oe/recipes-support/i2c-tools/i2c-tools_3.0.3.bb create mode 100644
>> meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb
>> 
>> diff --git
>> a/meta-oe/recipes-support/i2c-tools/i2c-tools-3.0.3/Module.mk
>> b/meta-oe/recipes-support/i2c-tools/i2c-tools-3.0.3/Module.mk deleted
>> file mode 100644 index fcaf72f..0000000 ---
>> a/meta-oe/recipes-support/i2c-tools/i2c-tools-3.0.3/Module.mk +++
>> /dev/null @@ -1,72 +0,0 @@ -# EEPROMER -# -# Licensed under the GNU
>> General Public License. - -EEPROMER_DIR	:= eepromer - -EEPROMER_CFLAGS
>> := -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast-qual \ -
>> -Wcast-align -Wwrite-strings -Wnested-externs -Winline \ -		   -W
>> -Wundef -Wmissing-prototypes -Iinclude - -EEPROMER_TARGETS	:= eepromer
>> eeprom eeprog - -# -# Programs -# - -$(EEPROMER_DIR)/eepromer:
>> $(EEPROMER_DIR)/eepromer.o -	$(CC) $(LDFLAGS) -o $@ $^ - 
>> -$(EEPROMER_DIR)/eeprom: $(EEPROMER_DIR)/eeprom.o -	$(CC) $(LDFLAGS) -o
>> $@ $^ - -$(EEPROMER_DIR)/eeprog: $(EEPROMER_DIR)/eeprog.o
>> $(EEPROMER_DIR)/24cXX.o -	$(CC) $(LDFLAGS) -o $@ $^ - -# -# Objects -# 
>> - -$(EEPROMER_DIR)/eepromer.o: $(EEPROMER_DIR)/eepromer.c -	$(CC)
>> $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@ - -$(EEPROMER_DIR)/eeprom.o:
>> $(EEPROMER_DIR)/eeprom.c -	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o
>> $@ - -$(EEPROMER_DIR)/eeprog.o: $(EEPROMER_DIR)/eeprog.c -	$(CC)
>> $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@ - -$(EEPROMER_DIR)/24cXX.o:
>> $(EEPROMER_DIR)/24cXX.c -	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o
>> $@ - -# -# Commands -# - -all-eepromer: $(addprefix
>> $(EEPROMER_DIR)/,$(EEPROMER_TARGETS)) - -strip-eepromer: $(addprefix
>> $(EEPROMER_DIR)/,$(EEPROMER_TARGETS)) -	strip $(addprefix
>> $(EEPROMER_DIR)/,$(EEPROMER_TARGETS)) - -clean-eepromer: -	$(RM)
>> $(addprefix $(EEPROMER_DIR)/,*.o $(EEPROMER_TARGETS)) - 
>> -install-eepromer: $(addprefix $(EEPROMER_DIR)/,$(EEPROMER_TARGETS)) -
>> $(INSTALL_DIR) $(DESTDIR)$(sbindir) $(DESTDIR)$(man8dir) -	for program
>> in $(EEPROMER_TARGETS) ; do \ -	$(INSTALL_PROGRAM)
>> $(EEPROMER_DIR)/$$program $(DESTDIR)$(sbindir) ; done - 
>> -uninstall-eepromer: -	for program in $(EEPROMER_TARGETS) ; do \ -
>> $(RM) $(DESTDIR)$(sbindir)/$$program ; \ -	$(RM)
>> $(DESTDIR)$(man8dir)/$$program.8 ; done - -all: all-eepromer - -strip:
>> strip-eepromer - -clean: clean-eepromer - -install: install-eepromer - 
>> -uninstall: uninstall-eepromer diff --git
>> a/meta-oe/recipes-support/i2c-tools/i2c-tools-3.1.0/Module.mk
>> b/meta-oe/recipes-support/i2c-tools/i2c-tools-3.1.0/Module.mk new file
>> mode 100644 index 0000000..fcaf72f --- /dev/null +++
>> b/meta-oe/recipes-support/i2c-tools/i2c-tools-3.1.0/Module.mk @@ -0,0
>> +1,72 @@ +# EEPROMER +# +# Licensed under the GNU General Public
>> License. + +EEPROMER_DIR	:= eepromer + +EEPROMER_CFLAGS	:=
>> -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast-qual \ +
>> -Wcast-align -Wwrite-strings -Wnested-externs -Winline \ +		   -W
>> -Wundef -Wmissing-prototypes -Iinclude + +EEPROMER_TARGETS	:= eepromer
>> eeprom eeprog + +# +# Programs +# + +$(EEPROMER_DIR)/eepromer:
>> $(EEPROMER_DIR)/eepromer.o +	$(CC) $(LDFLAGS) -o $@ $^ + 
>> +$(EEPROMER_DIR)/eeprom: $(EEPROMER_DIR)/eeprom.o +	$(CC) $(LDFLAGS) -o
>> $@ $^ + +$(EEPROMER_DIR)/eeprog: $(EEPROMER_DIR)/eeprog.o
>> $(EEPROMER_DIR)/24cXX.o +	$(CC) $(LDFLAGS) -o $@ $^ + +# +# Objects +# 
>> + +$(EEPROMER_DIR)/eepromer.o: $(EEPROMER_DIR)/eepromer.c +	$(CC)
>> $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@ + +$(EEPROMER_DIR)/eeprom.o:
>> $(EEPROMER_DIR)/eeprom.c +	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o
>> $@ + +$(EEPROMER_DIR)/eeprog.o: $(EEPROMER_DIR)/eeprog.c +	$(CC)
>> $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@ + +$(EEPROMER_DIR)/24cXX.o:
>> $(EEPROMER_DIR)/24cXX.c +	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o
>> $@ + +# +# Commands +# + +all-eepromer: $(addprefix
>> $(EEPROMER_DIR)/,$(EEPROMER_TARGETS)) + +strip-eepromer: $(addprefix
>> $(EEPROMER_DIR)/,$(EEPROMER_TARGETS)) +	strip $(addprefix
>> $(EEPROMER_DIR)/,$(EEPROMER_TARGETS)) + +clean-eepromer: +	$(RM)
>> $(addprefix $(EEPROMER_DIR)/,*.o $(EEPROMER_TARGETS)) + 
>> +install-eepromer: $(addprefix $(EEPROMER_DIR)/,$(EEPROMER_TARGETS)) +
>> $(INSTALL_DIR) $(DESTDIR)$(sbindir) $(DESTDIR)$(man8dir) +	for program
>> in $(EEPROMER_TARGETS) ; do \ +	$(INSTALL_PROGRAM)
>> $(EEPROMER_DIR)/$$program $(DESTDIR)$(sbindir) ; done + 
>> +uninstall-eepromer: +	for program in $(EEPROMER_TARGETS) ; do \ +
>> $(RM) $(DESTDIR)$(sbindir)/$$program ; \ +	$(RM)
>> $(DESTDIR)$(man8dir)/$$program.8 ; done + +all: all-eepromer + +strip:
>> strip-eepromer + +clean: clean-eepromer + +install: install-eepromer + 
>> +uninstall: uninstall-eepromer diff --git
>> a/meta-oe/recipes-support/i2c-tools/i2c-tools_3.0.3.bb
>> b/meta-oe/recipes-support/i2c-tools/i2c-tools_3.0.3.bb deleted file
>> mode 100644 index 021090c..0000000 ---
>> a/meta-oe/recipes-support/i2c-tools/i2c-tools_3.0.3.bb +++ /dev/null @@
>> -1,24 +0,0 @@ -DESCRIPTION = "Set of i2c tools for linux" -SECTION =
>> "base" -LICENSE = "GPLv2" -LIC_FILES_CHKSUM =
>> "file://COPYING;md5=751419260aa954499f7abaabaa882bbe" - -SRC_URI =
>> "http://dl.lm-sensors.org/i2c-tools/releases/i2c-tools-${PV}.tar.bz2 \ 
>> -           file://Module.mk \ -          " -SRC_URI[md5sum] =
>> "511376eed04455cdb277ef19c5f73bb4" -SRC_URI[sha256sum] =
>> "23b28e474741834e3f1b35b0686528769a13adc92d2ff5603cbda1d6bd5e5629" - 
>> -inherit autotools - -do_compile_prepend() { -        cp
>> ${WORKDIR}/Module.mk ${S}/eepromer/ -        sed -i
>> 's#/usr/local#/usr#' Makefile -        echo "include
>> eepromer/Module.mk" >> Makefile -} - -do_install_append() { -
>> install -d ${D}${includedir}/linux -        install -m 0644
>> include/linux/i2c-dev.h ${D}${includedir}/linux/i2c-dev-user.h -	rm -f
>> ${D}${includedir}/linux/i2c-dev.h -} diff --git
>> a/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb
>> b/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb new file mode
>> 100644 index 0000000..7589537 --- /dev/null +++
>> b/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb @@ -0,0 +1,26
>> @@ +DESCRIPTION = "Set of i2c tools for linux" +SECTION = "base" 
>> +LICENSE = "GPLv2" +LIC_FILES_CHKSUM =
>> "file://COPYING;md5=751419260aa954499f7abaabaa882bbe" + +RDEPENDS +=
>> "perl"
> 
> Also RDEPENDS_${PN} and also fixed in jansa/in-test

Can we please just split out read_edid and keep i2cdetect perl free?



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRBZCLMkyGM64RGpERAkyKAJ9lgADO4yYgmzNJS7kKqCX5doSkhgCfXuHI
lq2opQscNEqDxmHf2P/o3ag=
=8+Jq
-----END PGP SIGNATURE-----



