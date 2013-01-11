Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Ttlvi-0004j3-Fg
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jan 2013 22:14:27 +0100
Received: (qmail 32008 invoked by uid 1003); 11 Jan 2013 20:59:06 -0000
Received: from unknown (HELO ?192.168.1.105?)
	(philip@opensdr.com@96.240.164.36)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	11 Jan 2013 20:59:06 -0000
Message-ID: <50F07D19.1010107@balister.org>
Date: Fri, 11 Jan 2013 15:59:05 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1357936861-8245-1-git-send-email-philip@balister.org>
	<CAK18fxENpqFbRG9fOdLVB5_o+A+E1zvDjZZCzwXv61wao9KT_A@mail.gmail.com>
In-Reply-To: <CAK18fxENpqFbRG9fOdLVB5_o+A+E1zvDjZZCzwXv61wao9KT_A@mail.gmail.com>
X-Enigmail-Version: 1.4.6
Subject: Re: [meta-oe][PATCH 1/3] uhd-firmware : Update to version 3.5.0.
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
X-List-Received-Date: Fri, 11 Jan 2013 21:14:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/11/2013 03:49 PM, Andrei Gherzan wrote:
> Send emails with -M flag please. Thanks.

Should always use the -M flag? If so, I'll submit a patch to change the
command shown in the README file.

Philip

> 
> 
> 
> *Andrei Gherzan*
> mobile +40.744.478.414  fax +40.31.816.28.12
> Email: andrei@gherzan.ro
> Email: andrei.gherzan@windriver.com
> Romania
> 
> 
> On Fri, Jan 11, 2013 at 10:40 PM, Philip Balister <philip@balister.org>wrote:
> 
>> Signed-off-by: Philip Balister <philip@balister.org>
>> ---
>>  .../uhd/uhd-firmware_003.004.000.bb                | 27
>> ----------------------
>>  .../uhd/uhd-firmware_003.005.000.bb                | 27
>> ++++++++++++++++++++++
>>  2 files changed, 27 insertions(+), 27 deletions(-)
>>  delete mode 100644 meta-oe/recipes-connectivity/uhd/
>> uhd-firmware_003.004.000.bb
>>  create mode 100644 meta-oe/recipes-connectivity/uhd/
>> uhd-firmware_003.005.000.bb
>>
>> diff --git a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.004.000.bbb/meta-oe/recipes-connectivity/uhd/
>> uhd-firmware_003.004.000.bb
>> deleted file mode 100644
>> index b445307..0000000
>> --- a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.004.000.bb
>> +++ /dev/null
>> @@ -1,27 +0,0 @@
>> -DESCRIPTION = "Universal Hardware Driver Firmware"
>> -HOMEPAGE = "http://www.ettus.com"
>> -
>> -PE = "1"
>> -
>> -LICENSE = "GPLv3"
>> -LIC_FILES_CHKSUM =
>> "file://share/uhd/images/usrp_e100_fpga_v2.bin;md5=d8a4f8958d3b56a11bbb1bb134826b28"
>> -
>> -inherit allarch
>> -
>> -SRC_URI = "
>> http://files.ettus.com/binaries/uhd_stable/releases/uhd_${PV}-release/uhd-images_${PV}-release.tar.gz
>> "
>> -SRC_URI[md5sum] = "4269fac82df1fe593ba76206773ce551"
>> -SRC_URI[sha256sum] =
>> "4b80ebf90079a823212d3b77e5311ef1b467497a4a3585c2cfb4fe65bff71acf"
>> -
>> -S = "${WORKDIR}/uhd-images_${PV}-release"
>> -
>> -do_install() {
>> -       install -d ${D}${datadir}/uhd/images
>> -       install -d ${D}${datadir}/uhd/images/bit
>> -       install -m 0644 ${S}/share/uhd/images/bit/*
>> ${D}${datadir}/uhd/images/bit
>> -       rm -rf ${S}/share/uhd/images/bit
>> -       install -m 0644 ${S}/share/uhd/images/* ${D}${datadir}/uhd/images
>> -}
>> -
>> -PACKAGES = "${PN}"
>> -FILES_${PN} = "${datadir}/uhd/images"
>> -
>> diff --git a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.000.bbb/meta-oe/recipes-connectivity/uhd/
>> uhd-firmware_003.005.000.bb
>> new file mode 100644
>> index 0000000..ee771fb
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.000.bb
>> @@ -0,0 +1,27 @@
>> +DESCRIPTION = "Universal Hardware Driver Firmware"
>> +HOMEPAGE = "http://www.ettus.com"
>> +
>> +PE = "1"
>> +
>> +LICENSE = "GPLv3"
>> +LIC_FILES_CHKSUM =
>> "file://share/uhd/images/usrp_e100_fpga_v2.bin;md5=8df143216c46b7c49804f95056c7057a"
>> +
>> +inherit allarch
>> +
>> +SRC_URI = "
>> http://files.ettus.com/binaries/uhd_stable/releases/uhd_${PV}-release/uhd-images_${PV}-release.tar.gz
>> "
>> +SRC_URI[md5sum] = "dd2373263740d2d48fb39e57846bcd2a"
>> +SRC_URI[sha256sum] =
>> "352fbf69fbfff03a02b5d9b3c398771db40e4c5b77f99f0fdbff67c547cc0d18"
>> +
>> +S = "${WORKDIR}/uhd-images_${PV}-release"
>> +
>> +do_install() {
>> +       install -d ${D}${datadir}/uhd/images
>> +       install -d ${D}${datadir}/uhd/images/bit
>> +       install -m 0644 ${S}/share/uhd/images/bit/*
>> ${D}${datadir}/uhd/images/bit
>> +       rm -rf ${S}/share/uhd/images/bit
>> +       install -m 0644 ${S}/share/uhd/images/* ${D}${datadir}/uhd/images
>> +}
>> +
>> +PACKAGES = "${PN}"
>> +FILES_${PN} = "${datadir}/uhd/images"
>> +
>> --
>> 1.7.11.7
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 


