Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OdaXw-0000Uw-4x
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 05:09:58 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id CD6F116605F5; Mon, 26 Jul 2010 21:09:04 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 02892166067E;
	Mon, 26 Jul 2010 21:08:34 -0600 (MDT)
Message-ID: <4C4E4DB2.9090606@mlbassoc.com>
Date: Mon, 26 Jul 2010 21:08:34 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Checkin policy??
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
X-List-Received-Date: Tue, 27 Jul 2010 03:09:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Surely, there must not be any or else simple compile errors wouldn't get through :-(

Trying to build angstrom-gnome-image, MACHINE=beagleboard, DISTRO=angstrom, latest
org.openembedded.dev:
   commit 45fc36a32fb23c513833d7e27fb4b9cd8be68fb5
   Author: Chris Larson <clarson@kergoth.com>
   Date:   Sun Jun 20 14:35:05 2010 -0700

NOTE: package perl-5.8.8-r35: task do_configure: Started
NOTE: <type 'exceptions.NameError'>:name 'siteinfo_get_bits' is not defined while evaluating:
         # Make hostperl in build directory be the native perl
         ln -sf /local/Angstrom_BeagleBoard/tmp/sysroots/i686-linux/usr/bin/perl5.8.8 hostperl

         # Do out work in the cross subdir
         cd Cross

         # Generate configuration
         rm -f config.sh-arm-linux-gnueabi
         for i in /local/Angstrom_BeagleBoard/tmp/work/armv7a-angstrom-linux-gnueabi/perl-5.8.8-r35/config.sh \
                  /local/Angstrom_BeagleBoard/tmp/work/armv7a-angstrom-linux-gnueabi/perl-5.8.8-r35/config.sh-${@siteinfo_get_bits(d)} \
                  /local/Angstrom_BeagleBoard/tmp/work/armv7a-angstrom-linux-gnueabi/perl-5.8.8-r35/config.sh-${@siteinfo_get_bits(d)}-${@siteinfo_get_endianess(d)}; do
             cat $i >> config.sh-arm-linux-gnueabi
         done

         # Fixups for uclibc
         if [ "linux-gnueabi" = "linux-uclibc" -o "linux-gnueabi" = "linux-uclibceabi" ]; then
                 sed -i -e "s,\(d_crypt_r=\)'define',\1'undef',g" \
                        -e "s,\(d_futimes=\)'define',\1'undef',g" \
                        -e "s,\(crypt_r_proto=\)'\w+',\1'0',g" \
                        -e "s,\(d_getnetbyname_r=\)'define',\1'undef',g" \
                        -e "s,\(getnetbyname_r_proto=\)'\w+',\1'0',g" \
                        -e "s,\(d_getnetbyaddr_r=\)'define',\1'undef',g" \
                        -e "s,\(getnetbyaddr_r_proto=\)'\w+',\1'0',g" \
                        -e "s,\(d_getnetent_r=\)'define',\1'undef',g" \
                        -e "s,\(getnetent_r_proto=\)'\w+',\1'0',g" \
                        -e "s,\(d_sockatmark=\)'define',\1'undef',g" \
                        -e "s,\(d_sockatmarkproto=\)'\w+',\1'0',g" \
                     config.sh-arm-linux-gnueabi
         fi

         # Update some paths in the configuration
         sed -i -e 's,@DESTDIR@,/local/Angstrom_BeagleBoard/tmp/work/armv7a-angstrom-linux-gnueabi/perl-5.8.8-r35/image,g' \
                -e 's,@ARCH@,arm-linux-gnueabi,g' \
                -e "s%/usr/include/%/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/%g" \
                -e 's,/usr/,/usr/,g' \
             config.sh-arm-linux-gnueabi

         if test "beagleboard" != "native"; then
             # These are strewn all over the source tree
             for foo in `grep -I -m1 \/usr\/include\/.*\\.h /local/Angstrom_BeagleBoard/tmp/work/armv7a-angstrom-linux-gnueabi/perl-5.8.8-r35/* -r | cut -f 1 -d ":"` ; do
                 echo Fixing: $foo
                 sed -e "s%/usr/include/%/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/%g" -i $foo
             done
         fi

         rm -f config
         echo "ARCH = arm" > config
         echo "OS = linux-gnueabi" >> config

ERROR: Function do_configure failed

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


