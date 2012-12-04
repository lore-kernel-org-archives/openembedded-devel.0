Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1Tfroy-00062e-Fc
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 13:41:59 +0100
Received: from localhost ([127.0.0.1]:49873 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1Tfrb3-00058o-SS
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 12:27:34 +0000
Received: from [195.171.99.130] (port=35210 helo=[192.168.0.47])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1Tfrb3-00058l-2S
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 12:27:33 +0000
Message-ID: <50BDECAC.5070805@communistcode.co.uk>
Date: Tue, 04 Dec 2012 12:29:32 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: php-cgi cannot install package
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
X-List-Received-Date: Tue, 04 Dec 2012 12:41:59 -0000
X-Groupsio-MsgNum: 41972
Content-Type: multipart/mixed; boundary="------------010403060304060907090300"

--------------010403060304060907090300
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I tried to build the recently commited PHP changes today and received 
this error at do_rootfs, any ideas?

The only package I select is php-cgi through IMAGE_INSTALL.

See attached (1).

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


--------------010403060304060907090300
Content-Type: text/plain; charset=UTF-8;
 name="log.do_rootfs.21904"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="log.do_rootfs.21904"

DEBUG: Executing shell function do_rootfs
+ rm -f /home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux=
-gnueabi/core-image-dev/1.0-r0/opkg.conf
+ touch /home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux=
-gnueabi/core-image-dev/1.0-r0/opkg.conf
+ package_update_index_ipk
+ set -x
+ ipkgarchs=3D'all any noarch arm armv4 armv5 armv5-vfp armv5e armv5e-vfp a=
rmv6 armv6-vfp armv7a armv7a-vfp armv7a-vfp-neon beaglebone all any noarch =
x86_64-nativesdk'
+ '[' '!' -z '' ']'
+ packagedirs=3D/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk
+ for arch in '$ipkgarchs'
+ packagedirs=3D'/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk /home/ja=
ck/Projects/oe-r0005/r0005/tmp/deploy/ipk/all'
+ for arch in '$ipkgarchs'
+ packagedirs=3D'/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk /home/ja=
ck/Projects/oe-r0005/r0005/tmp/deploy/ipk/all /home/jack/Projects/oe-r0005/=
r0005/tmp/deploy/ipk/any'
+ for arch in '$ipkgarchs'
+ packagedirs=3D'/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk /home/ja=
ck/Projects/oe-r0005/r0005/tmp/deploy/ipk/all /home/jack/Projects/oe-r0005/=
r0005/tmp/deploy/ipk/any /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/=
noarch'
+ for arch in '$ipkgarchs'
+ packagedirs=3D'/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk /home/ja=
ck/Projects/oe-r0005/r0005/tmp/deploy/ipk/all /home/jack/Projects/oe-r0005/=
r0005/tmp/deploy/ipk/any /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/=
noarch /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/arm'
+ for arch in '$ipkgarchs'
+ packagedirs=3D'/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk /home/ja=
ck/Projects/oe-r0005/r0005/tmp/deploy/ipk/all /home/jack/Projects/oe-r0005/=
r0005/tmp/deploy/ipk/any /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/=
noarch /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/arm /home/jack/Pro=
jects/oe-r0005/r0005/tmp/deploy/ipk/armv4'
+ for arch in '$ipkgarchs'
+ packagedirs=3D'/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk /home/ja=
ck/Projects/oe-r0005/r0005/tmp/deploy/ipk/all /home/jack/Projects/oe-r0005/=
r0005/tmp/deploy/ipk/any /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/=
noarch /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/arm /home/jack/Pro=
jects/oe-r0005/r0005/tmp/deploy/ipk/armv4 /home/jack/Projects/oe-r0005/r000=
5/tmp/deploy/ipk/armv5'
+ for arch in '$ipkgarchs'
+ packagedirs=3D'/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk /home/ja=
ck/Projects/oe-r0005/r0005/tmp/deploy/ipk/all /home/jack/Projects/oe-r0005/=
r0005/tmp/deploy/ipk/any /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/=
noarch /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/arm /home/jack/Pro=
jects/oe-r0005/r0005/tmp/deploy/ipk/armv4 /home/jack/Projects/oe-r0005/r000=
5/tmp/deploy/ipk/armv5 /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/ar=
mv5-vfp'
+ for arch in '$ipkgarchs'
+ packagedirs=3D'/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk /home/ja=
ck/Projects/oe-r0005/r0005/tmp/deploy/ipk/all /home/jack/Projects/oe-r0005/=
r0005/tmp/deploy/ipk/any /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/=
noarch /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/arm /home/jack/Pro=
jects/oe-r0005/r0005/tmp/deploy/ipk/armv4 /home/jack/Projects/oe-r0005/r000=
5/tmp/deploy/ipk/armv5 /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/ar=
mv5-vfp /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e'
+ for arch in '$ipkgarchs'
+ packagedirs=3D'/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk /home/ja=
ck/Projects/oe-r0005/r0005/tmp/deploy/ipk/all /home/jack/Projects/oe-r0005/=
r0005/tmp/deploy/ipk/any /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/=
noarch /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/arm /home/jack/Pro=
jects/oe-r0005/r0005/tmp/deploy/ipk/armv4 /home/jack/Projects/oe-r0005/r000=
5/tmp/deploy/ipk/armv5 /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/ar=
mv5-vfp /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e /home/jack=
/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e-vfp'
+ for arch in '$ipkgarchs'
+ packagedirs=3D'/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk /home/ja=
ck/Projects/oe-r0005/r0005/tmp/deploy/ipk/all /home/jack/Projects/oe-r0005/=
r0005/tmp/deploy/ipk/any /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/=
noarch /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/arm /home/jack/Pro=
jects/oe-r0005/r0005/tmp/deploy/ipk/armv4 /home/jack/Projects/oe-r0005/r000=
5/tmp/deploy/ipk/armv5 /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/ar=
mv5-vfp /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e /home/jack=
/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e-vfp /home/jack/Projects/oe-r=
0005/r0005/tmp/deploy/ipk/armv6'
+ for arch in '$ipkgarchs'
+ packagedirs=3D'/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk /home/ja=
ck/Projects/oe-r0005/r0005/tmp/deploy/ipk/all /home/jack/Projects/oe-r0005/=
r0005/tmp/deploy/ipk/any /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/=
noarch /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/arm /home/jack/Pro=
jects/oe-r0005/r0005/tmp/deploy/ipk/armv4 /home/jack/Projects/oe-r0005/r000=
5/tmp/deploy/ipk/armv5 /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/ar=
mv5-vfp /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e /home/jack=
/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e-vfp /home/jack/Projects/oe-r=
0005/r0005/tmp/deploy/ipk/armv6 /home/jack/Projects/oe-r0005/r0005/tmp/depl=
oy/ipk/armv6-vfp'
+ for arch in '$ipkgarchs'
+ packagedirs=3D'/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk /home/ja=
ck/Projects/oe-r0005/r0005/tmp/deploy/ipk/all /home/jack/Projects/oe-r0005/=
r0005/tmp/deploy/ipk/any /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/=
noarch /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/arm /home/jack/Pro=
jects/oe-r0005/r0005/tmp/deploy/ipk/armv4 /home/jack/Projects/oe-r0005/r000=
5/tmp/deploy/ipk/armv5 /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/ar=
mv5-vfp /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e /home/jack=
/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e-vfp /home/jack/Projects/oe-r=
0005/r0005/tmp/deploy/ipk/armv6 /home/jack/Projects/oe-r0005/r0005/tmp/depl=
oy/ipk/armv6-vfp /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a'
+ for arch in '$ipkgarchs'
+ packagedirs=3D'/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk /home/ja=
ck/Projects/oe-r0005/r0005/tmp/deploy/ipk/all /home/jack/Projects/oe-r0005/=
r0005/tmp/deploy/ipk/any /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/=
noarch /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/arm /home/jack/Pro=
jects/oe-r0005/r0005/tmp/deploy/ipk/armv4 /home/jack/Projects/oe-r0005/r000=
5/tmp/deploy/ipk/armv5 /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/ar=
mv5-vfp /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e /home/jack=
/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e-vfp /home/jack/Projects/oe-r=
0005/r0005/tmp/deploy/ipk/armv6 /home/jack/Projects/oe-r0005/r0005/tmp/depl=
oy/ipk/armv6-vfp /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a /=
home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp'
+ for arch in '$ipkgarchs'
+ packagedirs=3D'/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk /home/ja=
ck/Projects/oe-r0005/r0005/tmp/deploy/ipk/all /home/jack/Projects/oe-r0005/=
r0005/tmp/deploy/ipk/any /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/=
noarch /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/arm /home/jack/Pro=
jects/oe-r0005/r0005/tmp/deploy/ipk/armv4 /home/jack/Projects/oe-r0005/r000=
5/tmp/deploy/ipk/armv5 /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/ar=
mv5-vfp /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e /home/jack=
/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e-vfp /home/jack/Projects/oe-r=
0005/r0005/tmp/deploy/ipk/armv6 /home/jack/Projects/oe-r0005/r0005/tmp/depl=
oy/ipk/armv6-vfp /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a /=
home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp /home/jack/Proj=
ects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp-neon'
+ for arch in '$ipkgarchs'
+ packagedirs=3D'/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk /home/ja=
ck/Projects/oe-r0005/r0005/tmp/deploy/ipk/all /home/jack/Projects/oe-r0005/=
r0005/tmp/deploy/ipk/any /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/=
noarch /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/arm /home/jack/Pro=
jects/oe-r0005/r0005/tmp/deploy/ipk/armv4 /home/jack/Projects/oe-r0005/r000=
5/tmp/deploy/ipk/armv5 /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/ar=
mv5-vfp /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e /home/jack=
/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e-vfp /home/jack/Projects/oe-r=
0005/r0005/tmp/deploy/ipk/armv6 /home/jack/Projects/oe-r0005/r0005/tmp/depl=
oy/ipk/armv6-vfp /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a /=
home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp /home/jack/Proj=
ects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp-neon /home/jack/Projects/oe-r=
0005/r0005/tmp/deploy/ipk/beaglebone'
+ for arch in '$ipkgarchs'
+ packagedirs=3D'/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk /home/ja=
ck/Projects/oe-r0005/r0005/tmp/deploy/ipk/all /home/jack/Projects/oe-r0005/=
r0005/tmp/deploy/ipk/any /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/=
noarch /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/arm /home/jack/Pro=
jects/oe-r0005/r0005/tmp/deploy/ipk/armv4 /home/jack/Projects/oe-r0005/r000=
5/tmp/deploy/ipk/armv5 /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/ar=
mv5-vfp /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e /home/jack=
/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e-vfp /home/jack/Projects/oe-r=
0005/r0005/tmp/deploy/ipk/armv6 /home/jack/Projects/oe-r0005/r0005/tmp/depl=
oy/ipk/armv6-vfp /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a /=
home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp /home/jack/Proj=
ects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp-neon /home/jack/Projects/oe-r=
0005/r0005/tmp/deploy/ipk/beaglebone /home/jack/Projects/oe-r0005/r0005/tmp=
/deploy/ipk/all'
+ for arch in '$ipkgarchs'
+ packagedirs=3D'/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk /home/ja=
ck/Projects/oe-r0005/r0005/tmp/deploy/ipk/all /home/jack/Projects/oe-r0005/=
r0005/tmp/deploy/ipk/any /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/=
noarch /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/arm /home/jack/Pro=
jects/oe-r0005/r0005/tmp/deploy/ipk/armv4 /home/jack/Projects/oe-r0005/r000=
5/tmp/deploy/ipk/armv5 /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/ar=
mv5-vfp /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e /home/jack=
/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e-vfp /home/jack/Projects/oe-r=
0005/r0005/tmp/deploy/ipk/armv6 /home/jack/Projects/oe-r0005/r0005/tmp/depl=
oy/ipk/armv6-vfp /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a /=
home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp /home/jack/Proj=
ects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp-neon /home/jack/Projects/oe-r=
0005/r0005/tmp/deploy/ipk/beaglebone /home/jack/Projects/oe-r0005/r0005/tmp=
/deploy/ipk/all /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/any'
+ for arch in '$ipkgarchs'
+ packagedirs=3D'/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk /home/ja=
ck/Projects/oe-r0005/r0005/tmp/deploy/ipk/all /home/jack/Projects/oe-r0005/=
r0005/tmp/deploy/ipk/any /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/=
noarch /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/arm /home/jack/Pro=
jects/oe-r0005/r0005/tmp/deploy/ipk/armv4 /home/jack/Projects/oe-r0005/r000=
5/tmp/deploy/ipk/armv5 /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/ar=
mv5-vfp /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e /home/jack=
/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e-vfp /home/jack/Projects/oe-r=
0005/r0005/tmp/deploy/ipk/armv6 /home/jack/Projects/oe-r0005/r0005/tmp/depl=
oy/ipk/armv6-vfp /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a /=
home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp /home/jack/Proj=
ects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp-neon /home/jack/Projects/oe-r=
0005/r0005/tmp/deploy/ipk/beaglebone /home/jack/Projects/oe-r0005/r0005/tmp=
/deploy/ipk/all /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/any /home=
/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/noarch'
+ for arch in '$ipkgarchs'
+ packagedirs=3D'/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk /home/ja=
ck/Projects/oe-r0005/r0005/tmp/deploy/ipk/all /home/jack/Projects/oe-r0005/=
r0005/tmp/deploy/ipk/any /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/=
noarch /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/arm /home/jack/Pro=
jects/oe-r0005/r0005/tmp/deploy/ipk/armv4 /home/jack/Projects/oe-r0005/r000=
5/tmp/deploy/ipk/armv5 /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/ar=
mv5-vfp /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e /home/jack=
/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e-vfp /home/jack/Projects/oe-r=
0005/r0005/tmp/deploy/ipk/armv6 /home/jack/Projects/oe-r0005/r0005/tmp/depl=
oy/ipk/armv6-vfp /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a /=
home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp /home/jack/Proj=
ects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp-neon /home/jack/Projects/oe-r=
0005/r0005/tmp/deploy/ipk/beaglebone /home/jack/Projects/oe-r0005/r0005/tmp=
/deploy/ipk/all /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/any /home=
/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/noarch /home/jack/Projects/oe-=
r0005/r0005/tmp/deploy/ipk/x86_64-nativesdk'
+ multilib_archs=3D
+ for pkgdir in '$packagedirs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/ ']'
+ touch /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/Packages
+ flock /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/Packages.flock -c=
 'opkg-make-index -r /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/Pack=
ages -p /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/Packages -m /home=
/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/'
+ for pkgdir in '$packagedirs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/all/ ']'
+ touch /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/all/Packages
+ flock /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/all/Packages.floc=
k -c 'opkg-make-index -r /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/=
all/Packages -p /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/all/Packa=
ges -m /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/all/'
+ for pkgdir in '$packagedirs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/any/ ']'
+ for pkgdir in '$packagedirs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/noarch/ ']'
+ for pkgdir in '$packagedirs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/arm/ ']'
+ for pkgdir in '$packagedirs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv4/ ']'
+ for pkgdir in '$packagedirs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5/ ']'
+ for pkgdir in '$packagedirs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5-vfp/ ']'
+ for pkgdir in '$packagedirs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e/ ']'
+ for pkgdir in '$packagedirs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e-vfp/ ']'
+ for pkgdir in '$packagedirs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv6/ ']'
+ for pkgdir in '$packagedirs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv6-vfp/ ']'
+ for pkgdir in '$packagedirs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a/ ']'
+ for pkgdir in '$packagedirs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp/ ']'
+ for pkgdir in '$packagedirs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp-neon/=
 ']'
+ touch /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp-neon/P=
ackages
+ flock /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp-neon/P=
ackages.flock -c 'opkg-make-index -r /home/jack/Projects/oe-r0005/r0005/tmp=
/deploy/ipk/armv7a-vfp-neon/Packages -p /home/jack/Projects/oe-r0005/r0005/=
tmp/deploy/ipk/armv7a-vfp-neon/Packages -m /home/jack/Projects/oe-r0005/r00=
05/tmp/deploy/ipk/armv7a-vfp-neon/'
Found /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp-neon/php=
-cli_5.3.19-r3.0_armv7a-vfp-neon.ipk in Packages, but mtime differs - re-re=
ading
Found /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp-neon/php=
-dbg_5.3.19-r3.0_armv7a-vfp-neon.ipk in Packages, but mtime differs - re-re=
ading
Found /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp-neon/php=
-dev_5.3.19-r3.0_armv7a-vfp-neon.ipk in Packages, but mtime differs - re-re=
ading
Found /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp-neon/php=
-doc_5.3.19-r3.0_armv7a-vfp-neon.ipk in Packages, but mtime differs - re-re=
ading
Found /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp-neon/php=
-fpm-apache2_5.3.19-r3.0_armv7a-vfp-neon.ipk in Packages, but mtime differs=
 - re-reading
Found /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp-neon/php=
-fpm_5.3.19-r3.0_armv7a-vfp-neon.ipk in Packages, but mtime differs - re-re=
ading
Found /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp-neon/php=
-pear_5.3.19-r3.0_armv7a-vfp-neon.ipk in Packages, but mtime differs - re-r=
eading
Found /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp-neon/php=
_5.3.19-r3.0_armv7a-vfp-neon.ipk in Packages, but mtime differs - re-readin=
g
Found /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp-neon/r00=
05web-dbg_gitr1+330a21851b847c46d0d247308b10093903858e88-r0_armv7a-vfp-neon=
.ipk in Packages, but mtime differs - re-reading
Found /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp-neon/r00=
05web-dev_gitr1+330a21851b847c46d0d247308b10093903858e88-r0_armv7a-vfp-neon=
.ipk in Packages, but mtime differs - re-reading
Found /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp-neon/r00=
05web_gitr1+330a21851b847c46d0d247308b10093903858e88-r0_armv7a-vfp-neon.ipk=
 in Packages, but mtime differs - re-reading
+ for pkgdir in '$packagedirs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/beaglebone/ ']'
+ touch /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/beaglebone/Packag=
es
+ flock /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/beaglebone/Packag=
es.flock -c 'opkg-make-index -r /home/jack/Projects/oe-r0005/r0005/tmp/depl=
oy/ipk/beaglebone/Packages -p /home/jack/Projects/oe-r0005/r0005/tmp/deploy=
/ipk/beaglebone/Packages -m /home/jack/Projects/oe-r0005/r0005/tmp/deploy/i=
pk/beaglebone/'
+ for pkgdir in '$packagedirs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/all/ ']'
+ touch /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/all/Packages
+ flock /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/all/Packages.floc=
k -c 'opkg-make-index -r /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/=
all/Packages -p /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/all/Packa=
ges -m /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/all/'
+ for pkgdir in '$packagedirs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/any/ ']'
+ for pkgdir in '$packagedirs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/noarch/ ']'
+ for pkgdir in '$packagedirs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/x86_64-nativesdk=
/ ']'
+ touch /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/x86_64-nativesdk/=
Packages
+ flock /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/x86_64-nativesdk/=
Packages.flock -c 'opkg-make-index -r /home/jack/Projects/oe-r0005/r0005/tm=
p/deploy/ipk/x86_64-nativesdk/Packages -p /home/jack/Projects/oe-r0005/r000=
5/tmp/deploy/ipk/x86_64-nativesdk/Packages -m /home/jack/Projects/oe-r0005/=
r0005/tmp/deploy/ipk/x86_64-nativesdk/'
+ package_generate_ipkg_conf
+ package_generate_archlist
+ ipkgarchs=3D'all any noarch x86_64-nativesdk'
+ priority=3D1
+ for arch in '$ipkgarchs'
+ echo 'arch all 1'
++ expr 1 + 5
+ priority=3D6
+ for arch in '$ipkgarchs'
+ echo 'arch any 6'
++ expr 6 + 5
+ priority=3D11
+ for arch in '$ipkgarchs'
+ echo 'arch noarch 11'
++ expr 11 + 5
+ priority=3D16
+ for arch in '$ipkgarchs'
+ echo 'arch x86_64-nativesdk 16'
++ expr 16 + 5
+ priority=3D21
+ ipkgarchs=3D'all any noarch arm armv4 armv5 armv5-vfp armv5e armv5e-vfp a=
rmv6 armv6-vfp armv7a armv7a-vfp armv7a-vfp-neon beaglebone'
+ priority=3D1
+ for arch in '$ipkgarchs'
+ echo 'arch all 1'
++ expr 1 + 5
+ priority=3D6
+ for arch in '$ipkgarchs'
+ echo 'arch any 6'
++ expr 6 + 5
+ priority=3D11
+ for arch in '$ipkgarchs'
+ echo 'arch noarch 11'
++ expr 11 + 5
+ priority=3D16
+ for arch in '$ipkgarchs'
+ echo 'arch arm 16'
++ expr 16 + 5
+ priority=3D21
+ for arch in '$ipkgarchs'
+ echo 'arch armv4 21'
++ expr 21 + 5
+ priority=3D26
+ for arch in '$ipkgarchs'
+ echo 'arch armv5 26'
++ expr 26 + 5
+ priority=3D31
+ for arch in '$ipkgarchs'
+ echo 'arch armv5-vfp 31'
++ expr 31 + 5
+ priority=3D36
+ for arch in '$ipkgarchs'
+ echo 'arch armv5e 36'
++ expr 36 + 5
+ priority=3D41
+ for arch in '$ipkgarchs'
+ echo 'arch armv5e-vfp 41'
++ expr 41 + 5
+ priority=3D46
+ for arch in '$ipkgarchs'
+ echo 'arch armv6 46'
++ expr 46 + 5
+ priority=3D51
+ for arch in '$ipkgarchs'
+ echo 'arch armv6-vfp 51'
++ expr 51 + 5
+ priority=3D56
+ for arch in '$ipkgarchs'
+ echo 'arch armv7a 56'
++ expr 56 + 5
+ priority=3D61
+ for arch in '$ipkgarchs'
+ echo 'arch armv7a-vfp 61'
++ expr 61 + 5
+ priority=3D66
+ for arch in '$ipkgarchs'
+ echo 'arch armv7a-vfp-neon 66'
++ expr 66 + 5
+ priority=3D71
+ for arch in '$ipkgarchs'
+ echo 'arch beaglebone 71'
++ expr 71 + 5
+ priority=3D76
+ echo 'src oe file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk'
+ ipkgarchs=3D'all any noarch x86_64-nativesdk'
+ for arch in '$ipkgarchs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/all/Packages ']'
+ echo 'src oe-all file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/a=
ll'
+ for arch in '$ipkgarchs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/any/Packages ']'
+ for arch in '$ipkgarchs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/noarch/Packages =
']'
+ for arch in '$ipkgarchs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/x86_64-nativesdk=
/Packages ']'
+ echo 'src oe-x86_64-nativesdk file:/home/jack/Projects/oe-r0005/r0005/tmp=
/deploy/ipk/x86_64-nativesdk'
+ echo 'src oe file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk'
+ ipkgarchs=3D'all any noarch arm armv4 armv5 armv5-vfp armv5e armv5e-vfp a=
rmv6 armv6-vfp armv7a armv7a-vfp armv7a-vfp-neon beaglebone'
+ for arch in '$ipkgarchs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/all/Packages ']'
+ echo 'src oe-all file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/a=
ll'
+ for arch in '$ipkgarchs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/any/Packages ']'
+ for arch in '$ipkgarchs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/noarch/Packages =
']'
+ for arch in '$ipkgarchs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/arm/Packages ']'
+ for arch in '$ipkgarchs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv4/Packages '=
]'
+ for arch in '$ipkgarchs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5/Packages '=
]'
+ for arch in '$ipkgarchs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5-vfp/Packag=
es ']'
+ for arch in '$ipkgarchs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e/Packages =
']'
+ for arch in '$ipkgarchs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv5e-vfp/Packa=
ges ']'
+ for arch in '$ipkgarchs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv6/Packages '=
]'
+ for arch in '$ipkgarchs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv6-vfp/Packag=
es ']'
+ for arch in '$ipkgarchs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a/Packages =
']'
+ for arch in '$ipkgarchs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp/Packa=
ges ']'
+ for arch in '$ipkgarchs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-vfp-neon/=
Packages ']'
+ echo 'src oe-armv7a-vfp-neon file:/home/jack/Projects/oe-r0005/r0005/tmp/=
deploy/ipk/armv7a-vfp-neon'
+ for arch in '$ipkgarchs'
+ '[' -e /home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/beaglebone/Packa=
ges ']'
+ echo 'src oe-beaglebone file:/home/jack/Projects/oe-r0005/r0005/tmp/deplo=
y/ipk/beaglebone'
+ mkdir -p /home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-li=
nux-gnueabi/core-image-dev/1.0-r0/temp/
+ STATUS=3D/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-li=
nux-gnueabi/core-image-dev/1.0-r0/rootfs/var/lib/opkg/status
+ mkdir -p /home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-li=
nux-gnueabi/core-image-dev/1.0-r0/rootfs/var/lib/opkg
+ opkg-cl -f /home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-=
linux-gnueabi/core-image-dev/1.0-r0/opkg.conf -o /home/jack/Projects/oe-r00=
05/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/roo=
tfs --force_postinstall --prefer-arch-to-version update
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/Packages=
.
Updated list of available packages in /home/jack/Projects/oe-r0005/r0005/tm=
p/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//var/li=
b/opkg/lists/oe.
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/all/Pack=
ages.
Updated list of available packages in /home/jack/Projects/oe-r0005/r0005/tm=
p/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//var/li=
b/opkg/lists/oe-all.
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/Packages.
Updated list of available packages in /home/jack/Projects/oe-r0005/r0005/tm=
p/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//var/li=
b/opkg/lists/oe-armv7a-vfp-neon.
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/beaglebo=
ne/Packages.
Updated list of available packages in /home/jack/Projects/oe-r0005/r0005/tm=
p/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//var/li=
b/opkg/lists/oe-beaglebone.
+ export INSTALL_PACKAGES_ATTEMPTONLY_IPK=3D
+ INSTALL_PACKAGES_ATTEMPTONLY_IPK=3D
+ export INSTALL_PACKAGES_LINGUAS_IPK=3D
+ INSTALL_PACKAGES_LINGUAS_IPK=3D
+ export INSTALL_TASK_IPK=3Drootfs
+ INSTALL_TASK_IPK=3Drootfs
+ export INSTALL_ROOTFS_IPK=3D/home/jack/Projects/oe-r0005/r0005/tmp/work/b=
eaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs
+ INSTALL_ROOTFS_IPK=3D/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebo=
ne-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs
+ export INSTALL_CONF_IPK=3D/home/jack/Projects/oe-r0005/r0005/tmp/work/bea=
glebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/opkg.conf
+ INSTALL_CONF_IPK=3D/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone=
-oecore-linux-gnueabi/core-image-dev/1.0-r0/opkg.conf
+ export 'INSTALL_PACKAGES_IPK=3Dgit run-postinsts packagegroup-core-tools-=
debug php-cgi packagegroup-core-ssh-openssh r0005app valgrind hiawatha conn=
man r0005web htop r0005serial packagegroup-core-tools-profile packagegroup-=
core-boot openssh-sftp-server'
+ INSTALL_PACKAGES_IPK=3D'git run-postinsts packagegroup-core-tools-debug p=
hp-cgi packagegroup-core-ssh-openssh r0005app valgrind hiawatha connman r00=
05web htop r0005serial packagegroup-core-tools-profile packagegroup-core-bo=
ot openssh-sftp-server'
+ export D=3D/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-=
linux-gnueabi/core-image-dev/1.0-r0/rootfs
+ D=3D/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-g=
nueabi/core-image-dev/1.0-r0/rootfs
+ export OFFLINE_ROOT=3D/home/jack/Projects/oe-r0005/r0005/tmp/work/beagleb=
one-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs
+ OFFLINE_ROOT=3D/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oec=
ore-linux-gnueabi/core-image-dev/1.0-r0/rootfs
+ export IPKG_OFFLINE_ROOT=3D/home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs
+ IPKG_OFFLINE_ROOT=3D/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebon=
e-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs
+ export OPKG_OFFLINE_ROOT=3D/home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs
+ OPKG_OFFLINE_ROOT=3D/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebon=
e-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs
+ package_install_internal_ipk
+ local target_rootfs=3D/home/jack/Projects/oe-r0005/r0005/tmp/work/beagleb=
one-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs
+ local conffile=3D/home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-o=
ecore-linux-gnueabi/core-image-dev/1.0-r0/opkg.conf
+ local package_attemptonly=3D
+ local package_linguas=3D
+ local task=3Drootfs
+ split_multilib_packages
+ INSTALL_PACKAGES_NORMAL_IPK=3D
+ INSTALL_PACKAGES_MULTILIB_IPK=3D
+ for pkg in '${INSTALL_PACKAGES_IPK}'
+ is_multilib=3D0
+ '[' 0 =3D 0 ']'
+ INSTALL_PACKAGES_NORMAL_IPK=3D' git'
+ for pkg in '${INSTALL_PACKAGES_IPK}'
+ is_multilib=3D0
+ '[' 0 =3D 0 ']'
+ INSTALL_PACKAGES_NORMAL_IPK=3D' git run-postinsts'
+ for pkg in '${INSTALL_PACKAGES_IPK}'
+ is_multilib=3D0
+ '[' 0 =3D 0 ']'
+ INSTALL_PACKAGES_NORMAL_IPK=3D' git run-postinsts packagegroup-core-tools=
-debug'
+ for pkg in '${INSTALL_PACKAGES_IPK}'
+ is_multilib=3D0
+ '[' 0 =3D 0 ']'
+ INSTALL_PACKAGES_NORMAL_IPK=3D' git run-postinsts packagegroup-core-tools=
-debug php-cgi'
+ for pkg in '${INSTALL_PACKAGES_IPK}'
+ is_multilib=3D0
+ '[' 0 =3D 0 ']'
+ INSTALL_PACKAGES_NORMAL_IPK=3D' git run-postinsts packagegroup-core-tools=
-debug php-cgi packagegroup-core-ssh-openssh'
+ for pkg in '${INSTALL_PACKAGES_IPK}'
+ is_multilib=3D0
+ '[' 0 =3D 0 ']'
+ INSTALL_PACKAGES_NORMAL_IPK=3D' git run-postinsts packagegroup-core-tools=
-debug php-cgi packagegroup-core-ssh-openssh r0005app'
+ for pkg in '${INSTALL_PACKAGES_IPK}'
+ is_multilib=3D0
+ '[' 0 =3D 0 ']'
+ INSTALL_PACKAGES_NORMAL_IPK=3D' git run-postinsts packagegroup-core-tools=
-debug php-cgi packagegroup-core-ssh-openssh r0005app valgrind'
+ for pkg in '${INSTALL_PACKAGES_IPK}'
+ is_multilib=3D0
+ '[' 0 =3D 0 ']'
+ INSTALL_PACKAGES_NORMAL_IPK=3D' git run-postinsts packagegroup-core-tools=
-debug php-cgi packagegroup-core-ssh-openssh r0005app valgrind hiawatha'
+ for pkg in '${INSTALL_PACKAGES_IPK}'
+ is_multilib=3D0
+ '[' 0 =3D 0 ']'
+ INSTALL_PACKAGES_NORMAL_IPK=3D' git run-postinsts packagegroup-core-tools=
-debug php-cgi packagegroup-core-ssh-openssh r0005app valgrind hiawatha con=
nman'
+ for pkg in '${INSTALL_PACKAGES_IPK}'
+ is_multilib=3D0
+ '[' 0 =3D 0 ']'
+ INSTALL_PACKAGES_NORMAL_IPK=3D' git run-postinsts packagegroup-core-tools=
-debug php-cgi packagegroup-core-ssh-openssh r0005app valgrind hiawatha con=
nman r0005web'
+ for pkg in '${INSTALL_PACKAGES_IPK}'
+ is_multilib=3D0
+ '[' 0 =3D 0 ']'
+ INSTALL_PACKAGES_NORMAL_IPK=3D' git run-postinsts packagegroup-core-tools=
-debug php-cgi packagegroup-core-ssh-openssh r0005app valgrind hiawatha con=
nman r0005web htop'
+ for pkg in '${INSTALL_PACKAGES_IPK}'
+ is_multilib=3D0
+ '[' 0 =3D 0 ']'
+ INSTALL_PACKAGES_NORMAL_IPK=3D' git run-postinsts packagegroup-core-tools=
-debug php-cgi packagegroup-core-ssh-openssh r0005app valgrind hiawatha con=
nman r0005web htop r0005serial'
+ for pkg in '${INSTALL_PACKAGES_IPK}'
+ is_multilib=3D0
+ '[' 0 =3D 0 ']'
+ INSTALL_PACKAGES_NORMAL_IPK=3D' git run-postinsts packagegroup-core-tools=
-debug php-cgi packagegroup-core-ssh-openssh r0005app valgrind hiawatha con=
nman r0005web htop r0005serial packagegroup-core-tools-profile'
+ for pkg in '${INSTALL_PACKAGES_IPK}'
+ is_multilib=3D0
+ '[' 0 =3D 0 ']'
+ INSTALL_PACKAGES_NORMAL_IPK=3D' git run-postinsts packagegroup-core-tools=
-debug php-cgi packagegroup-core-ssh-openssh r0005app valgrind hiawatha con=
nman r0005web htop r0005serial packagegroup-core-tools-profile packagegroup=
-core-boot'
+ for pkg in '${INSTALL_PACKAGES_IPK}'
+ is_multilib=3D0
+ '[' 0 =3D 0 ']'
+ INSTALL_PACKAGES_NORMAL_IPK=3D' git run-postinsts packagegroup-core-tools=
-debug php-cgi packagegroup-core-ssh-openssh r0005app valgrind hiawatha con=
nman r0005web htop r0005serial packagegroup-core-tools-profile packagegroup=
-core-boot openssh-sftp-server'
+ local 'package_to_install=3D git run-postinsts packagegroup-core-tools-de=
bug php-cgi packagegroup-core-ssh-openssh r0005app valgrind hiawatha connma=
n r0005web htop r0005serial packagegroup-core-tools-profile packagegroup-co=
re-boot openssh-sftp-server'
+ local package_multilib=3D
+ mkdir -p /home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-li=
nux-gnueabi/core-image-dev/1.0-r0/rootfs/var/lib/opkg/
+ local 'ipkg_args=3D-f /home/jack/Projects/oe-r0005/r0005/tmp/work/beagleb=
one-oecore-linux-gnueabi/core-image-dev/1.0-r0/opkg.conf -o /home/jack/Proj=
ects/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/core-image-dev=
/1.0-r0/rootfs --force_postinstall --prefer-arch-to-version'
+ opkg-cl -f /home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-=
linux-gnueabi/core-image-dev/1.0-r0/opkg.conf -o /home/jack/Projects/oe-r00=
05/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/roo=
tfs --force_postinstall --prefer-arch-to-version update
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/Packages=
.
Updated list of available packages in /home/jack/Projects/oe-r0005/r0005/tm=
p/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//var/li=
b/opkg/lists/oe.
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/all/Pack=
ages.
Updated list of available packages in /home/jack/Projects/oe-r0005/r0005/tm=
p/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//var/li=
b/opkg/lists/oe-all.
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/Packages.
Updated list of available packages in /home/jack/Projects/oe-r0005/r0005/tm=
p/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//var/li=
b/opkg/lists/oe-armv7a-vfp-neon.
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/beaglebo=
ne/Packages.
Updated list of available packages in /home/jack/Projects/oe-r0005/r0005/tm=
p/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//var/li=
b/opkg/lists/oe-beaglebone.
+ '[' xlinux-gnueabi =3D xlinux ']'
+ '[' xlinux-gnueabi =3D xlinux-gnueabi ']'
+ '[' '!' -z '' ']'
+ '[' '!' -z ' git run-postinsts packagegroup-core-tools-debug php-cgi pack=
agegroup-core-ssh-openssh r0005app valgrind hiawatha connman r0005web htop =
r0005serial packagegroup-core-tools-profile packagegroup-core-boot openssh-=
sftp-server' ']'
+ opkg-cl -f /home/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-=
linux-gnueabi/core-image-dev/1.0-r0/opkg.conf -o /home/jack/Projects/oe-r00=
05/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/roo=
tfs --force_postinstall --prefer-arch-to-version install git run-postinsts =
packagegroup-core-tools-debug php-cgi packagegroup-core-ssh-openssh r0005ap=
p valgrind hiawatha connman r0005web htop r0005serial packagegroup-core-too=
ls-profile packagegroup-core-boot openssh-sftp-server
Installing git (1.7.7-r2) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/git_1.7.7-r2_armv7a-vfp-neon.ipk.
libcurl5: unsatisfied recommendation for curl-certs
Installing libgcc1 (4.7.2-r13) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libgcc1_4.7.2-r13_armv7a-vfp-neon.ipk.
Installing libc6 (2.16-r17) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libc6_2.16-r17_armv7a-vfp-neon.ipk.
Installing libssl1.0.0 (1.0.0j-r15.4) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libssl1.0.0_1.0.0j-r15.4_armv7a-vfp-neon.ipk.
Installing libcrypto1.0.0 (1.0.0j-r15.4) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libcrypto1.0.0_1.0.0j-r15.4_armv7a-vfp-neon.ipk.
Installing libz1 (1.2.7-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libz1_1.2.7-r0_armv7a-vfp-neon.ipk.
Installing libcurl5 (7.26.0-r2) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libcurl5_7.26.0-r2_armv7a-vfp-neon.ipk.
Installing libcap2 (2.22-r5) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libcap2_2.22-r5_armv7a-vfp-neon.ipk.
Installing libgnutls26 (2.12.21-r8.3) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libgnutls26_2.12.21-r8.3_armv7a-vfp-neon.ipk.
Installing libtasn1-3 (2.14-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libtasn1-3_2.14-r0_armv7a-vfp-neon.ipk.
Installing libgpg-error0 (1.10-r2) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libgpg-error0_1.10-r2_armv7a-vfp-neon.ipk.
Installing libgcrypt11 (1.5.0-r1) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libgcrypt11_1.5.0-r1_armv7a-vfp-neon.ipk.
Installing libexpat1 (2.1.0-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libexpat1_2.1.0-r0_armv7a-vfp-neon.ipk.
Installing run-postinsts (1.0-r8) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/run-postinsts_1.0-r8_armv7a-vfp-neon.ipk.
Installing update-rc.d (0.7-r4) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/all/upda=
te-rc.d_0.7-r4_all.ipk.
Installing packagegroup-core-tools-debug (1.0-r2) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/beaglebo=
ne/packagegroup-core-tools-debug_1.0-r2_beaglebone.ipk.
package libtinfo5 suggests installing ncurses-terminfo
Installing rsync (3.0.9-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/rsync_3.0.9-r0_armv7a-vfp-neon.ipk.
Installing libpopt0 (1.16-r2) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libpopt0_1.16-r2_armv7a-vfp-neon.ipk.
Installing tcf-agent (0.4.0+git1+4ef94ecb927a8912c3d79ce137182247786cff8f-r=
0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/tcf-agent_0.4.0+git1+4ef94ecb927a8912c3d79ce137182247786cff8f-r0_ar=
mv7a-vfp-neon.ipk.
Installing libuuid1 (2.22.1-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libuuid1_2.22.1-r0_armv7a-vfp-neon.ipk.
Installing bash (4.2-r6) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/bash_4.2-r6_armv7a-vfp-neon.ipk.
Installing libtinfo5 (5.9-r13.1) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libtinfo5_5.9-r13.1_armv7a-vfp-neon.ipk.
Installing ncurses-terminfo-base (5.9-r13.1) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/ncurses-terminfo-base_5.9-r13.1_armv7a-vfp-neon.ipk.
Installing strace (4.7-r3) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/strace_4.7-r3_armv7a-vfp-neon.ipk.
Installing gdbserver (7.5-r0.0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/gdbserver_7.5-r0.0_armv7a-vfp-neon.ipk.
Installing libthread-db1 (2.16-r17) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libthread-db1_2.16-r17_armv7a-vfp-neon.ipk.
Installing gdb (7.5-r0.0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/gdb_7.5-r0.0_armv7a-vfp-neon.ipk.
Installing libreadline6 (6.2-r4) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libreadline6_6.2-r4_armv7a-vfp-neon.ipk.
Installing eglibc-mtrace (2.16-r1) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/eglibc-mtrace_2.16-r1_armv7a-vfp-neon.ipk.
Installing perl (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing libperl5 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libperl5_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing openssh-sftp-server (6.0p1-r4) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/openssh-sftp-server_6.0p1-r4_armv7a-vfp-neon.ipk.
Unknown package 'php-cgi'.
Installing packagegroup-core-ssh-openssh (1.0-r1) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/all/pack=
agegroup-core-ssh-openssh_1.0-r1_all.ipk.
Installing openssh (6.0p1-r4) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/openssh_6.0p1-r4_armv7a-vfp-neon.ipk.
Installing openssh-scp (6.0p1-r4) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/openssh-scp_6.0p1-r4_armv7a-vfp-neon.ipk.
Installing openssh-ssh (6.0p1-r4) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/openssh-ssh_6.0p1-r4_armv7a-vfp-neon.ipk.
Installing openssh-keygen (6.0p1-r4) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/openssh-keygen_6.0p1-r4_armv7a-vfp-neon.ipk.
Installing openssh-sshd (6.0p1-r4) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/openssh-sshd_6.0p1-r4_armv7a-vfp-neon.ipk.
Installing shadow (4.1.4.3-r12) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/shadow_4.1.4.3-r12_armv7a-vfp-neon.ipk.
Installing shadow-securetty (4.1.4.3-r2) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/beaglebo=
ne/shadow-securetty_4.1.4.3-r2_beaglebone.ipk.
Installing base-passwd (3.5.26-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/base-passwd_3.5.26-r0_armv7a-vfp-neon.ipk.
Running useradd commands...
Installing r0005app (gitr3+c5078ae9bc7c197566ed359e73b362de0180a142-r0) to =
root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/r0005app_gitr3+c5078ae9bc7c197566ed359e73b362de0180a142-r0_armv7a-v=
fp-neon.ipk.
iptables: unsatisfied recommendation for kernel-module-nf-defrag-ipv4
iptables: unsatisfied recommendation for kernel-module-nf-conntrack
iptables: unsatisfied recommendation for kernel-module-ipt-masquerade
iptables: unsatisfied recommendation for kernel-module-nf-nat
iptables: unsatisfied recommendation for kernel-module-nf-conntrack-ipv4
iptables: unsatisfied recommendation for kernel-module-iptable-nat
iptables: unsatisfied recommendation for kernel-module-iptable-filter
Installing libwebsockets0 (0.5+git788c4a8fa847ce7f6900e529af73f1aed7311ccc-=
r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libwebsockets0_0.5+git788c4a8fa847ce7f6900e529af73f1aed7311ccc-r0_a=
rmv7a-vfp-neon.ipk.
Installing libpng12-0 (1.2.50-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libpng12-0_1.2.50-r0_armv7a-vfp-neon.ipk.
Installing connman (1.4-r17.0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/connman_1.4-r17.0_armv7a-vfp-neon.ipk.
Installing iptables (1.4.15-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/iptables_1.4.15-r0_armv7a-vfp-neon.ipk.
Installing dbus-1 (1.6.4-r5.0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/dbus-1_1.6.4-r5.0_armv7a-vfp-neon.ipk.
Installing libdbus-1-3 (1.6.4-r5.0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libdbus-1-3_1.6.4-r5.0_armv7a-vfp-neon.ipk.
Running groupadd commands...
Running useradd commands...
Installing libglib-2.0-0 (1:2.34.3-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libglib-2.0-0_2.34.3-r0_armv7a-vfp-neon.ipk.
Installing libffi6 (3.0.11-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libffi6_3.0.11-r0_armv7a-vfp-neon.ipk.
Running useradd commands...
Installing kernel-module-x-tables (3.2.28-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/beaglebo=
ne/kernel-module-x-tables_3.2.28-r0_beaglebone.ipk.
Installing update-modules (1.0-r13) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/all/upda=
te-modules_1.0-r13_all.ipk.
Installing kmod (9-r0.0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/kmod_9-r0.0_armv7a-vfp-neon.ipk.
Installing libkmod2 (9-r0.0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libkmod2_9-r0.0_armv7a-vfp-neon.ipk.
Installing kernel-3.2.28 (3.2.28-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/beaglebo=
ne/kernel-3.2.28_3.2.28-r0_beaglebone.ipk.
Installing kernel-image-3.2.28 (3.2.28-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/beaglebo=
ne/kernel-image-3.2.28_3.2.28-r0_beaglebone.ipk.
Installing kernel-module-ip-tables (3.2.28-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/beaglebo=
ne/kernel-module-ip-tables_3.2.28-r0_beaglebone.ipk.
Installing libsqlite3-0 (3.7.14.1-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libsqlite3-0_3.7.14.1-r0_armv7a-vfp-neon.ipk.
Installing libjansson4 (2.4-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libjansson4_2.4-r0_armv7a-vfp-neon.ipk.
Installing libjpeg8 (8d-r1) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libjpeg8_8d-r1_armv7a-vfp-neon.ipk.
Installing valgrind (3.7.0-r7) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/valgrind_3.7.0-r7_armv7a-vfp-neon.ipk.
Installing libc6-dbg (2.16-r17) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libc6-dbg_2.16-r17_armv7a-vfp-neon.ipk.
Installing hiawatha (8.6-r2) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/hiawatha_8.6-r2_armv7a-vfp-neon.ipk.
Installing libxml2 (2.9.0-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libxml2_2.9.0-r0_armv7a-vfp-neon.ipk.
Installing libxslt (1.1.28-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libxslt_1.1.28-r0_armv7a-vfp-neon.ipk.
Package connman (1.4-r17.0) installed in root is up to date.
Installing r0005web (gitr1+330a21851b847c46d0d247308b10093903858e88-r0) to =
root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/r0005web_gitr1+330a21851b847c46d0d247308b10093903858e88-r0_armv7a-v=
fp-neon.ipk.
Installing htop (0.9-r1) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/htop_0.9-r1_armv7a-vfp-neon.ipk.
Installing libncurses5 (5.9-r13.1) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libncurses5_5.9-r13.1_armv7a-vfp-neon.ipk.
Installing ncurses-terminfo (5.9-r13.1) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/ncurses-terminfo_5.9-r13.1_armv7a-vfp-neon.ipk.
Installing r0005serial (gitr1+de1859dba1528e52b33d49dca9c09e1479ef731c-r0) =
to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/r0005serial_gitr1+de1859dba1528e52b33d49dca9c09e1479ef731c-r0_armv7=
a-vfp-neon.ipk.
Installing libform5 (5.9-r13.1) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libform5_5.9-r13.1_armv7a-vfp-neon.ipk.
Installing libmenu5 (5.9-r13.1) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libmenu5_5.9-r13.1_armv7a-vfp-neon.ipk.
Installing packagegroup-core-tools-profile (1.0-r3) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/beaglebo=
ne/packagegroup-core-tools-profile_1.0-r3_beaglebone.ipk.
perl-modules: unsatisfied recommendation for perl-module-config-heavy
perl-modules: unsatisfied recommendation for perl-module-encode-.debug
perl-modules: unsatisfied recommendation for perl-module-warnings-register
Installing systemtap (1.8+git1+48fa6b5e1d3e636c34cbd5650370e6f634efc294-r0)=
 to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/systemtap_1.8+git1+48fa6b5e1d3e636c34cbd5650370e6f634efc294-r0_armv=
7a-vfp-neon.ipk.
Installing elfutils (0.148-r9) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/elfutils_0.148-r9_armv7a-vfp-neon.ipk.
Installing libbz2-0 (1.0.6-r5) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libbz2-0_1.0.6-r5_armv7a-vfp-neon.ipk.
Installing libstdc++6 (4.7.2-r13) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libstdc++6_4.7.2-r13_armv7a-vfp-neon.ipk.
Installing lttng2-ust (2.0.5-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/lttng2-ust_2.0.5-r0_armv7a-vfp-neon.ipk.
Installing liburcu (0.6.7-r1) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/liburcu_0.6.7-r1_armv7a-vfp-neon.ipk.
Installing lttng-tools (v2.0.4-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/lttng-tools_v2.0.4-r0_armv7a-vfp-neon.ipk.
Installing latencytop (0.5-r3) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/latencytop_0.5-r3_armv7a-vfp-neon.ipk.
Installing babeltrace (0.12+git1+0d8f8c2ea27df096269aa76b4baeab26b68b95d4-r=
2) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/babeltrace_0.12+git1+0d8f8c2ea27df096269aa76b4baeab26b68b95d4-r2_ar=
mv7a-vfp-neon.ipk.
Installing powertop (1.13-r4) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/powertop_1.13-r4_armv7a-vfp-neon.ipk.
Installing pciutils (3.1.10-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/pciutils_3.1.10-r0_armv7a-vfp-neon.ipk.
Installing pciutils-ids (3.1.10-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/pciutils-ids_3.1.10-r0_armv7a-vfp-neon.ipk.
Installing libpci3 (3.1.10-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libpci3_3.1.10-r0_armv7a-vfp-neon.ipk.
Installing oprofileui-server (0.0+git1+82ecf8c6b53b84f80682a8312f9defa83a95=
f2a3-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/oprofileui-server_0.0+git1+82ecf8c6b53b84f80682a8312f9defa83a95f2a3=
-r0_armv7a-vfp-neon.ipk.
Installing libavahi-common3 (0.6.31-r5.1) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libavahi-common3_0.6.31-r5.1_armv7a-vfp-neon.ipk.
Installing libavahi-client3 (0.6.31-r5.1) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libavahi-client3_0.6.31-r5.1_armv7a-vfp-neon.ipk.
Installing oprofile (0.9.7-r1.0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/oprofile_0.9.7-r1.0_armv7a-vfp-neon.ipk.
Installing binutils-symlinks (2.22-r17) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/binutils-symlinks_2.22-r17_armv7a-vfp-neon.ipk.
Installing binutils (2.22-r17) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/binutils_2.22-r17_armv7a-vfp-neon.ipk.
Installing libavahi-glib1 (0.6.31-r5.1) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libavahi-glib1_0.6.31-r5.1_armv7a-vfp-neon.ipk.
Installing kernel-vmlinux (3.2.28-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/beaglebo=
ne/kernel-vmlinux_3.2.28-r0_beaglebone.ipk.
Installing lttng-modules (2.0.5-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/beaglebo=
ne/lttng-modules_2.0.5-r0_beaglebone.ipk.
Installing kernel-module-oprofile (3.2.28-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/beaglebo=
ne/kernel-module-oprofile_3.2.28-r0_beaglebone.ipk.
Installing blktrace (1.0.5+git1+d6918c8832793b4205ed3bfede78c2f915c23385-r4=
) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/blktrace_1.0.5+git1+d6918c8832793b4205ed3bfede78c2f915c23385-r4_arm=
v7a-vfp-neon.ipk.
Installing libaio1 (0.3.109-r1) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libaio1_0.3.109-r1_armv7a-vfp-neon.ipk.
Installing perf (3.4-r5) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/beaglebo=
ne/perf_3.4-r5_beaglebone.ipk.
Installing libpython2.7-1.0 (2.7.3-r0.2) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libpython2.7-1.0_2.7.3-r0.2_armv7a-vfp-neon.ipk.
Installing perl-modules (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-modules_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing python-core (2.7.3-r0.2) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/python-core_2.7.3-r0.2_armv7a-vfp-neon.ipk.
Installing python-re (2.7.3-r0.2) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/python-re_2.7.3-r0.2_armv7a-vfp-neon.ipk.
Installing python-core (2.7.3-r0.2) to root...
Breaking cicular dependency on python-core for python-re.
Installing python-lang (2.7.3-r0.2) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/python-lang_2.7.3-r0.2_armv7a-vfp-neon.ipk.
Installing python-core (2.7.3-r0.2) to root...
Breaking cicular dependency on python-core for python-re.
Breaking cicular dependency on python-core for python-lang.
Breaking cicular dependency on python-core for python-lang.
Installing libnewt0.52 (0.52.14-r1) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libnewt0.52_0.52.14-r1_armv7a-vfp-neon.ipk.
Installing slang (2.2.4-r12) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/slang_2.2.4-r12_armv7a-vfp-neon.ipk.
Installing libpcre (8.31-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libpcre_8.31-r0_armv7a-vfp-neon.ipk.
Installing libpcreposix0 (8.31-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libpcreposix0_8.31-r0_armv7a-vfp-neon.ipk.
Installing libpcre (8.31-r0) to root...
Breaking cicular dependency on libpcre for libpcreposix0.
Installing perl-module-data-dumper (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-data-dumper_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-exporter (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-exporter_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-exporter-heavy (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-exporter-heavy_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-overload (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-overload_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-math-bigint-calc (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-math-bigint-calc_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-integer (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-integer_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-configlocal-pm (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-configlocal-pm_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-blib (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-blib_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-memoize-expiretest (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-memoize-expiretest_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-result-test (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-result-test_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-filter-simple (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-filter-simple_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-safe (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-safe_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-utf8 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-utf8_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-constant-xs (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-constant-xs_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-constant-base (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-constant-base_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-result-unknown (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-result-unknown_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-list-util (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-list-util_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-list-util-pp (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-list-util-pp_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-cbuilder-platform-darwin (5.14.2-r15) to ro=
ot...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-cbuilder-platform-darwin_5.14.2-r15_armv7a-vfp=
-neon.ipk.
Installing perl-module-pwd (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pwd_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-cgi-fast (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-cgi-fast_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-base (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-base_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-changes (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-changes_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-object (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-object_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-manifest (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-manifest_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-simple (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-locale-script (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-locale-script_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-autodie-hints (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-autodie-hints_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-jp (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-jp_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-time-piece (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-time-piece_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-dynaloader (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-dynaloader_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-carp (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-carp_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-mime-name (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-mime-name_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-compress-adapter-deflate (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-compress-adapter-deflate_5.14.2-r15_armv7a-vfp-neon.=
ipk.
Installing perl-module-pod-simple-transcode (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-transcode_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-devel (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-devel_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-compress-zlib-constants (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-compress-zlib-constants_5.14.2-r15_armv7a-vfp-neon.i=
pk.
Installing perl-module-load (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-load_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-iterator-process (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-iterator-process_5.14.2-r15_armv7a-vfp-neon.=
ipk.
Installing perl-module-extutils-mm-any (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-mm-any_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-file-temp (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-file-temp_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-symbol (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-symbol_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-simple-progress (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-progress_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-cjk-stroke (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-cjk-stroke_5.14.2-r15_armv7a-vfp-neon.i=
pk.
Installing perl-module-lib (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-lib_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-formatter-session (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-formatter-session_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-pipe (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-pipe_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-cbuilder-platform-unix (5.14.2-r15) to root=
...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-cbuilder-platform-unix_5.14.2-r15_armv7a-vfp-n=
eon.ipk.
Installing perl-module-pod-simple-simpletree (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-simpletree_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-simple-pullparserstarttoken (5.14.2-r15) to root=
...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-pullparserstarttoken_5.14.2-r15_armv7a-vfp-n=
eon.ipk.
Installing perl-module-cgi-carp (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-cgi-carp_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-cjk-big5 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-cjk-big5_5.14.2-r15_armv7a-vfp-neon.ipk=
.
Installing perl-module-unicode-collate-locale-zh-pin (5.14.2-r15) to root..=
.
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-zh-pin_5.14.2-r15_armv7a-vfp-neo=
n.ipk.
Installing perl-module-pod-parselink (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-parselink_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-uncompress-anyinflate (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-uncompress-anyinflate_5.14.2-r15_armv7a-vfp-neon.ipk=
.
Installing perl-module-tie-scalar (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tie-scalar_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-locale-currency (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-locale-currency_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-perldoc-tochecker (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-perldoc-tochecker_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-cn (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-cn_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-termcap (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-termcap_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-b-showlex (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-b-showlex_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-file-spec-functions (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-file-spec-functions_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-cpanplus (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-cpanplus_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-base (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-base_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tie-hash (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tie-hash_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-b-terse (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-b-terse_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-net-protoent (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-net-protoent_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-simple-pullparserendtoken (5.14.2-r15) to root..=
.
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-pullparserendtoken_5.14.2-r15_armv7a-vfp-neo=
n.ipk.
Installing perl-module-tap-parser-result-version (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-result-version_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-digest-base (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-digest-base_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-net-config (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-net-config_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-autoloader (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-autoloader_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-locale-maketext (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-locale-maketext_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-anydbm-file (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-anydbm-file_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-time-tm (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-time-tm_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-iteratorfactory (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-iteratorfactory_5.14.2-r15_armv7a-vfp-neon.i=
pk.
Installing perl-module-bytes-heavy (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-bytes-heavy_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-math-complex (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-math-complex_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-perldoc-tortf (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-perldoc-tortf_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-overloading (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-overloading_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-ca (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-ca_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-tap-parser-scheduler (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-scheduler_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-usage (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-usage_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-select (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-select_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-dbm-filter-encode (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-dbm-filter-encode_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-cs (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-cs_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-extutils-mm-dos (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-mm-dos_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-mm-unix (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-mm-unix_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-perldoc-topod (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-perldoc-topod_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-sq (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-sq_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-bignum (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-bignum_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-bigint (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-bigint_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-cgi (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-cgi_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-simple-xmloutstream (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-xmloutstream_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-formatter-file-session (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-formatter-file-session_5.14.2-r15_armv7a-vfp-neon.i=
pk.
Installing perl-module-extutils-parsexs (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-parsexs_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-sw (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-sw_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-text-abbrev (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-text-abbrev_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-sv (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-sv_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-i18n (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-i18n_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-autouse (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-autouse_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-packlist (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-packlist_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-sk (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-sk_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-log-message-handlers (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-log-message-handlers_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-time-gmtime (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-time-gmtime_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-command (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-command_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-makemaker (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-makemaker_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-my (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-my_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-mm (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-mm_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-liblist (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-liblist_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-liblist-kid (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-liblist-kid_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-makemaker (5.14.2-r15) to root...
Breaking cicular dependency on perl-module-extutils-makemaker for perl-modu=
le-extutils-my.
Installing perl-module-extutils-mm (5.14.2-r15) to root...
Breaking cicular dependency on perl-module-extutils-mm for perl-module-extu=
tils-liblist.
Breaking cicular dependency on perl-module-extutils-mm for perl-module-extu=
tils-makemaker.
Breaking cicular dependency on perl-module-extutils-makemaker for perl-modu=
le-extutils-mm.
Installing perl-module-tie-stdhandle (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tie-stdhandle_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-sort (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-sort_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tie-array (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tie-array_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-cpan (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-cpan_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-unicode-utf7 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-unicode-utf7_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-result-comment (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-result-comment_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-memoize-sdbm-file (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-memoize-sdbm-file_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-compress-zip-constants (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-compress-zip-constants_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-unicode-collate-locale-uk (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-uk_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-unicode-collate-locale-sl (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-sl_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-io-uncompress-inflate (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-uncompress-inflate_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-file-stat (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-file-stat_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-class-struct (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-class-struct_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-fcntl (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-fcntl_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-xsloader (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-xsloader_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-cbuilder-platform-dec-osf (5.14.2-r15) to r=
oot...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-cbuilder-platform-dec-osf_5.14.2-r15_armv7a-vf=
p-neon.ipk.
Installing perl-module-ipc-msg (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-ipc-msg_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-memoize-expire (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-memoize-expire_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-devel-ppport (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-devel-ppport_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-locale-maketext-gutsloader (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-locale-maketext-gutsloader_5.14.2-r15_armv7a-vfp-neon.i=
pk.
Installing perl-module-filter-util-call (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-filter-util-call_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-file-fetch (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-file-fetch_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-thread-queue (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-thread-queue_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-threads-shared (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-threads-shared_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-scalar-util (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-scalar-util_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-scalar-util-pp (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-scalar-util-pp_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-b (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-b_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-attributes (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-attributes_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-cbuilder-platform-windows-msvc (5.14.2-r15)=
 to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-cbuilder-platform-windows-msvc_5.14.2-r15_armv=
7a-vfp-neon.ipk.
Installing perl-module-file-spec-cygwin (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-file-spec-cygwin_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-file-spec-unix (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-file-spec-unix_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-symbol (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-symbol_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-perldoc-totext (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-perldoc-totext_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-mime-quotedprint (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-mime-quotedprint_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-makemaker-config (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-makemaker-config_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-vmsish (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-vmsish_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-sourcehandler-perl (5.14.2-r15) to root..=
.
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-sourcehandler-perl_5.14.2-r15_armv7a-vfp-neo=
n.ipk.
Installing perl-module-autodie (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-autodie_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-b-concise (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-b-concise_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-config-extensions (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-config-extensions_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-parent (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-parent_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-devel-innerpackage (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-devel-innerpackage_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-nb (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-nb_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-b-deparse (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-b-deparse_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-file-spec (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-file-spec_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-nn (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-nn_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-perlio-via (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-perlio-via_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encoding-warnings (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encoding-warnings_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-math-bigint-trace (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-math-bigint-trace_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-grammar (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-grammar_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-load.pm (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-load.pm_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-thread (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-thread_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-mm-macos (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-mm-macos_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-perlio (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-perlio_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-guess (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-guess_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-ipc-open3 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-ipc-open3_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-ipc-open2 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-ipc-open2_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-perlio-scalar (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-perlio-scalar_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-dbm-filter-compress (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-dbm-filter-compress_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-app-prove-state (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-app-prove-state_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-math-trig (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-math-trig_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-time-hires (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-time-hires_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-posix (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-posix_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-compress-gzip (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-compress-gzip_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-sdbm-file (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-sdbm-file_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-encoding (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-encoding_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-config (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-config_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-cgi-util (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-cgi-util_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-open (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-open_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-net-time (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-net-time_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-mm-uwin (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-mm-uwin_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-uncompress-adapter-identity (5.14.2-r15) to root.=
..
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-uncompress-adapter-identity_5.14.2-r15_armv7a-vfp-ne=
on.ipk.
Installing perl-module-locale-maketext-guts (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-locale-maketext-guts_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-hash-util (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-hash-util_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-term-ui-history (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-term-ui-history_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-socket (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-socket_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-kr (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-kr_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-perldoc-getoptsoo (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-perldoc-getoptsoo_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-file-compare (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-file-compare_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-iterator-stream (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-iterator-stream_5.14.2-r15_armv7a-vfp-neon.i=
pk.
Installing perl-module-tainted (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tainted_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-file-spec-vms (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-file-spec-vms_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-sourcehandler (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-sourcehandler_5.14.2-r15_armv7a-vfp-neon.ipk=
.
Installing perl-module-sys (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-sys_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-devel-peek (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-devel-peek_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-jp-h2z (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-jp-h2z_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tie-file (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tie-file_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-text-parsewords (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-text-parsewords_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-cn-hz (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-cn-hz_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-ig (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-ig_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-ipc-sysv (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-ipc-sysv_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-data (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-data_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-locale-codes-country (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-locale-codes-country_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-byte (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-byte_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-digest-md5 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-digest-md5_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-zlib (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-zlib_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-test-harness (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-test-harness_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-net-smtp (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-net-smtp_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-html (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-html_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-test (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-test_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-archive-tar-constant (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-archive-tar-constant_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-mime-header (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-mime-header_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-pl (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-pl_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-io-uncompress-rawinflate (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-uncompress-rawinflate_5.14.2-r15_armv7a-vfp-neon.ipk=
.
Installing perl-module-time-local (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-time-local_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-simple-xhtml (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-xhtml_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-digest-file (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-digest-file_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-simple-text (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-text_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-locale-codes-language (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-locale-codes-language_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-checker (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-checker_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-hostname (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-hostname_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-constant-utils (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-constant-utils_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tie-refhash (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tie-refhash_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-english (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-english_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-scheduler-spinner (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-scheduler-spinner_5.14.2-r15_armv7a-vfp-neon=
.ipk.
Installing perl-module-pod-simple-rtf (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-rtf_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-build.pm (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-build.pm_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-file-spec-os2 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-file-spec-os2_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-result-plan (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-result-plan_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-locale-constants (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-locale-constants_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-compress-zip (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-compress-zip_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-compress-zlib (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-compress-zlib_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-iterator-array (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-iterator-array_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-deprecate (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-deprecate_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-math-bigrat (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-math-bigrat_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-cbuilder-platform-vms (5.14.2-r15) to root.=
..
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-cbuilder-platform-vms_5.14.2-r15_armv7a-vfp-ne=
on.ipk.
Installing perl-module-gdbm-file (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-gdbm-file_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing libgdbm4 (1.10-r3) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libgdbm4_1.10-r3_armv7a-vfp-neon.ipk.
Installing perl-module-compress-raw-bzip2 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-compress-raw-bzip2_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-select (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-select_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-text-tabs (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-text-tabs_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-ar (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-ar_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-unicode-collate-locale-de-phone (5.14.2-r15) to root=
...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-de-phone_5.14.2-r15_armv7a-vfp-n=
eon.ipk.
Installing perl-module-time-seconds (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-time-seconds_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-math-bigfloat-trace (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-math-bigfloat-trace_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-list (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-list_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-functions (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-functions_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-tn (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-tn_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-unicode-collate-locale-to (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-to_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-unicode-collate-locale-tr (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-tr_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-unicode-collate-cjk-gb2312 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-cjk-gb2312_5.14.2-r15_armv7a-vfp-neon.i=
pk.
Installing perl-module-perlio-encoding (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-perlio-encoding_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-simple-transcodedumb (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-transcodedumb_5.14.2-r15_armv7a-vfp-neon.ipk=
.
Installing perl-module-extutils-mm-vos (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-mm-vos_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-cgi-switch (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-cgi-switch_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-cbuilder-base (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-cbuilder-base_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-app-prove-state-result-test (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-app-prove-state-result-test_5.14.2-r15_armv7a-vfp-neon.=
ipk.
Installing perl-module-extutils-mm-darwin (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-mm-darwin_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-cgi-apache (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-cgi-apache_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-storable (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-storable_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-da (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-da_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-pod-escapes (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-escapes_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-result (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-result_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-perldoc-tonroff (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-perldoc-tonroff_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pluggable (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pluggable_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-mt (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-mt_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-next (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-next_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-find (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-find_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-file-glob (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-file-glob_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-feature (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-feature_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-file (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-file_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-version (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-version_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-net-ftp-l (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-net-ftp-l_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-net-ftp-i (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-net-ftp-i_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-net-ftp-dataconn (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-net-ftp-dataconn_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tie-hash-namedcapture (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tie-hash-namedcapture_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-parse-cpan-meta (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-parse-cpan-meta_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-seekable (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-seekable_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-handle (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-handle_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pluggable.pm (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pluggable.pm_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-getopt-std (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-getopt-std_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-result-pragma (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-result-pragma_5.14.2-r15_armv7a-vfp-neon.ipk=
.
Installing perl-module-pod-perldoc (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-perldoc_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-perldoc-totk (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-perldoc-totk_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-formatter-console-parallelsession (5.14.2-r15) t=
o root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-formatter-console-parallelsession_5.14.2-r15_armv7a=
-vfp-neon.ipk.
Installing perl-module-validate (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-validate_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-gsm0338 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-gsm0338_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-assert (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-assert_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-simple-dumpastext (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-dumpastext_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-zh-strk (5.14.2-r15) to root.=
..
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-zh-strk_5.14.2-r15_armv7a-vfp-ne=
on.ipk.
Installing perl-module-net-hostent (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-net-hostent_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-ctime (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-ctime_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-installed (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-installed_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-dbm-filter-null (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-dbm-filter-null_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-memoize (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-memoize_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-fr (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-fr_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-extutils-makemaker-yaml (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-makemaker-yaml_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-math-bigfloat (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-math-bigfloat_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-makefile-pl (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-makefile-pl_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-fi (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-fi_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-term-ansicolor (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-term-ansicolor_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-install (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-install_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-test-builder-tester (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-test-builder-tester_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-benchmark (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-benchmark_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-file-path (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-file-path_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-cwd (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-cwd_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-filetest (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-filetest_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-text-overstrike (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-text-overstrike_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-zh-gb (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-zh-gb_5.14.2-r15_armv7a-vfp-neon=
.ipk.
Installing perl-module-universal (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-universal_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encoding (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encoding_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-app-cpan (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-app-cpan_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-simple-pullparser (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-pullparser_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-memoize-expirefile (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-memoize-expirefile_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-parser (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-parser_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-file-dosglob (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-file-dosglob_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-user-grent (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-user-grent_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-formatter-file (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-formatter-file_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-inc-latest (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-inc-latest_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-inc-latest-private (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-inc-latest-private_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-cgi-cookie (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-cgi-cookie_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-tw (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-tw_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-hu (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-hu_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-unicode-collate-locale-hr (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-hr_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-archive-extract (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-archive-extract_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-perldoc-baseto (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-perldoc-baseto_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-file-find (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-file-find_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-file-basename (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-file-basename_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-hy (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-hy_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-pod-latex (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-latex_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-parseutils (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-parseutils_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-ha (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-ha_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-term-cap (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-term-cap_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-dumpvar (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-dumpvar_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-time (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-time_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-formatter-base (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-formatter-base_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-ebcdic (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-ebcdic_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-utf8-heavy (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-utf8-heavy_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-simple-html (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-html_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-archive-tar (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-archive-tar_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-compress-adapter-bzip2 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-compress-adapter-bzip2_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-timelocal (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-timelocal_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-list-util-xs (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-list-util-xs_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-hash (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-hash_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-net-nntp (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-net-nntp_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-ipc (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-ipc_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-inputobjects (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-inputobjects_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-i18n-langtags-detect (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-i18n-langtags-detect_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-se (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-se_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-tie-memoize (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tie-memoize_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-simple-tiedoutfh (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-tiedoutfh_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-memoize-storable (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-memoize-storable_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-less (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-less_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-simple-dumpasxml (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-dumpasxml_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-test-builder-module (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-test-builder-module_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-fatal (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-fatal_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-net-ftp (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-net-ftp_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-charnames (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-charnames_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-memoize-anydbm-file (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-memoize-anydbm-file_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-compress-gzip-constants (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-compress-gzip-constants_5.14.2-r15_armv7a-vfp-neon.i=
pk.
Installing perl-module-unicode-collate-locale-af (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-af_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-pod-simple-pullparsertexttoken (5.14.2-r15) to root.=
..
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-pullparsertexttoken_5.14.2-r15_armv7a-vfp-ne=
on.ipk.
Installing perl-module-bigfloat (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-bigfloat_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-bytes (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-bytes_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-az (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-az_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-i18n-langinfo (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-i18n-langinfo_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-simple-blackbox (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-blackbox_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-compress-adapter-identity (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-compress-adapter-identity_5.14.2-r15_armv7a-vfp-neon=
.ipk.
Installing perl-module-io-socket-unix (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-socket-unix_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-sourcehandler-executable (5.14.2-r15) to =
root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-sourcehandler-executable_5.14.2-r15_armv7a-v=
fp-neon.ipk.
Installing perl-module-dbm-filter (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-dbm-filter_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-cbuilder (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-cbuilder_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-fields (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-fields_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-cbuilder-platform-aix (5.14.2-r15) to root.=
..
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-cbuilder-platform-aix_5.14.2-r15_armv7a-vfp-ne=
on.ipk.
Installing perl-module-extutils-constant (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-constant_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-locale-language (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-locale-language_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-dotsh (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-dotsh_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-kr-2022-kr (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-kr-2022-kr_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-sourcehandler-handle (5.14.2-r15) to root=
...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-sourcehandler-handle_5.14.2-r15_armv7a-vfp-n=
eon.ipk.
Installing perl-module-io-uncompress-anyuncompress (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-uncompress-anyuncompress_5.14.2-r15_armv7a-vfp-neon.=
ipk.
Installing perl-module-pod-simple-pullparsertoken (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-pullparsertoken_5.14.2-r15_armv7a-vfp-neon.i=
pk.
Installing perl-module-pod-simple-htmllegacy (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-htmllegacy_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-uncompress-base (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-uncompress-base_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-resultfactory (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-resultfactory_5.14.2-r15_armv7a-vfp-neon.ipk=
.
Installing perl-module-shell (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-shell_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-file-copy (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-file-copy_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-ucd (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-ucd_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-fastcwd (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-fastcwd_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-math-bigint (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-math-bigint_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-compress-rawdeflate (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-compress-rawdeflate_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-result-yaml (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-result-yaml_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-multiplexer (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-multiplexer_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-b-xref (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-b-xref_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-zh (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-zh_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-net-servent (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-net-servent_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-look (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-look_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-cbuilder-platform-windows-bcc (5.14.2-r15) =
to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-cbuilder-platform-windows-bcc_5.14.2-r15_armv7=
a-vfp-neon.ipk.
Installing perl-module-net-netrc (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-net-netrc_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-file-spec-epoc (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-file-spec-epoc_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-term-ui (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-term-ui_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tie-handle (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tie-handle_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-mm-beos (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-mm-beos_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-build (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-build_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-jp-jis7 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-jp-jis7_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-vi (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-vi_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-re (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-re_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-mm-cygwin (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-mm-cygwin_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-mm-win32 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-mm-win32_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-lt (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-lt_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-test-more (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-test-more_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-autodie-exception-system (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-autodie-exception-system_5.14.2-r15_armv7a-vfp-neon.ipk=
.
Installing perl-module-pod-text-color (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-text-color_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-unicode (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-unicode_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-miniperl (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-miniperl_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-simple-debug (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-debug_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-finddepth (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-finddepth_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-term-complete (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-term-complete_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-subs (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-subs_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-mksymlists (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-mksymlists_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-constant (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-constant_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-text (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-text_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-file-globmapper (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-file-globmapper_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-locale-codes (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-locale-codes_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-simple-search (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-search_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-digest-sha (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-digest-sha_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-et (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-et_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-open2 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-open2_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-open3 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-open3_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-es (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-es_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-test-builder (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-test-builder_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-normalize (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-normalize_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-uncompress-gunzip (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-uncompress-gunzip_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-mime-base64 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-mime-base64_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-exceptions (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-exceptions_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-b-lint (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-b-lint_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-net-domain (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-net-domain_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-stat (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-stat_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-file (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-file_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-selectsaver (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-selectsaver_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-compress-bzip2 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-compress-bzip2_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-eo (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-eo_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-tap-parser-iterator (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-iterator_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-perldoc-toxml (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-perldoc-toxml_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-if (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-if_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-compress-raw-zlib (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-compress-raw-zlib_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-utils (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-utils_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-getopt (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-getopt_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-math (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-math_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-dbm-filter-int32 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-dbm-filter-int32_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-sourcehandler-rawtap (5.14.2-r15) to root=
...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-sourcehandler-rawtap_5.14.2-r15_armv7a-vfp-n=
eon.ipk.
Installing perl-module-unicode-collate-locale-is (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-is_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-unicode-collate-locale-yo (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-yo_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-threads (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-threads_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-simple-textcontent (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-textcontent_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-cy (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-cy_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-opcode (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-opcode_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-mm-aix (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-mm-aix_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-locale-codes-currency (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-locale-codes-currency_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-yamlish-reader (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-yamlish-reader_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-filecache (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-filecache_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-cbuilder-platform-windows-gcc (5.14.2-r15) =
to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-cbuilder-platform-windows-gcc_5.14.2-r15_armv7=
a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-wo (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-wo_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-loaded.pm (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-loaded.pm_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode--t (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode--t_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-cjkconstants (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-cjkconstants_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-mime-header-iso-2022-jp (5.14.2-r15) to root.=
..
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-mime-header-iso-2022-jp_5.14.2-r15_armv7a-vfp-ne=
on.ipk.
Installing perl-module-syslog (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-syslog_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-devel-dprof (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-devel-dprof_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-find (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-find_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-net-netent (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-net-netent_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-cacheout (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-cacheout_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-net-ftp-a (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-net-ftp-a_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-importenv (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-importenv_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-net-pop3 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-net-pop3_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-net-ftp-e (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-net-ftp-e_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-ipc-semaphore (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-ipc-semaphore_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-mro (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-mro_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-formatter-console (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-formatter-console_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-search-dict (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-search-dict_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-math-bigint-fastcalc (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-math-bigint-fastcalc_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-nso (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-nso_5.14.2-r15_armv7a-vfp-neon.i=
pk.
Installing perl-module-pod-simple-linksection (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-linksection_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-constant-proxysubs (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-constant-proxysubs_5.14.2-r15_armv7a-vfp-neon.=
ipk.
Installing perl-module-complete (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-complete_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-bigrat (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-bigrat_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-object-accessor (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-object-accessor_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-cjk-korean (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-cjk-korean_5.14.2-r15_armv7a-vfp-neon.i=
pk.
Installing perl-module-unicode-collate-locale (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-yamlish-writer (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-yamlish-writer_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-encode--pm (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode--pm_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-autosplit (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-autosplit_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-file-spec-mac (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-file-spec-mac_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-overload-numbers (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-overload-numbers_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-mkbootstrap (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-mkbootstrap_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-package-constants (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-package-constants_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-lv (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-lv_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-unicode-collate-locale-fo (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-fo_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-db (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-db_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-b-lint-debug (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-b-lint-debug_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-filter (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-filter_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-getopt-long (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-getopt-long_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-math-bigint-calcemu (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-math-bigint-calcemu_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-zh-big5 (5.14.2-r15) to root.=
..
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-zh-big5_5.14.2-r15_armv7a-vfp-ne=
on.ipk.
Installing perl-module-app-prove-state-result (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-app-prove-state-result_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-selfloader (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-selfloader_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-o (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-o_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-getopts (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-getopts_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-ipc-sharedmem (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-ipc-sharedmem_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-es-trad (5.14.2-r15) to root.=
..
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-es-trad_5.14.2-r15_armv7a-vfp-ne=
on.ipk.
Installing perl-module-errno (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-errno_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-mm-nw5 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-mm-nw5_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-ro (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-ro_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-b-debug (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-b-debug_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-scheduler-job (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-scheduler-job_5.14.2-r15_armv7a-vfp-neon.ipk=
.
Installing perl-module-findbin (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-findbin_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-locale-codes-script (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-locale-codes-script_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-diagnostics (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-diagnostics_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicore (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicore_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-autodie-exception (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-autodie-exception_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-readme (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-readme_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-socket (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-socket_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-socket-inet (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-socket-inet_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-cjk-pinyin (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-cjk-pinyin_5.14.2-r15_armv7a-vfp-neon.i=
pk.
Installing perl-module-pod-simple-htmlbatch (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-htmlbatch_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-text (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-text_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-carp-heavy (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-carp-heavy_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tie (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tie_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-plaintext (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-plaintext_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tie-substrhash (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tie-substrhash_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-i18n-langtags (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-i18n-langtags_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-kk (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-kk_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-unicode-collate-locale-ko (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-ko_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-unicode-collate-locale-kl (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-kl_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-perlio-via-quotedprint (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-perlio-via-quotedprint_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-corelist.pm (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-corelist.pm_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-testlib (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-testlib_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-log-message-config (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-log-message-config_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-locale-country (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-locale-country_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-simple-checker (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-checker_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-compress-zlib-extra (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-compress-zlib-extra_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-cbuilder-platform-windows (5.14.2-r15) to r=
oot...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-cbuilder-platform-windows_5.14.2-r15_armv7a-vf=
p-neon.ipk.
Installing perl-module-cgi-push (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-cgi-push_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-cgi-pretty (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-cgi-pretty_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-compress-base (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-compress-base_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-alias (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-alias_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-encode-encoder (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-encode-encoder_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-simple-transcodesmart (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-transcodesmart_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-params-check (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-params-check_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-uncompress-adapter-inflate (5.14.2-r15) to root..=
.
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-uncompress-adapter-inflate_5.14.2-r15_armv7a-vfp-neo=
n.ipk.
Installing perl-module-extutils-mm-os2 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-mm-os2_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-test-builder-tester-color (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-test-builder-tester-color_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-extutils-cbuilder-platform-os2 (5.14.2-r15) to root.=
..
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-cbuilder-platform-os2_5.14.2-r15_armv7a-vfp-ne=
on.ipk.
Installing perl-module-pod-man (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-man_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-net-cmd (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-net-cmd_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-aggregator (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-aggregator_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-log-message (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-log-message_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-formatter-color (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-formatter-color_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-sigtrap (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-sigtrap_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-embed (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-embed_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-filehandle (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-filehandle_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-sys-syslog (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-sys-syslog_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-formatter-console-session (5.14.2-r15) to root..=
.
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-formatter-console-session_5.14.2-r15_armv7a-vfp-neo=
n.ipk.
Installing perl-module-io-compress-deflate (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-compress-deflate_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-net-ping (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-net-ping_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-source (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-source_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-archive-tar-file (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-archive-tar-file_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-cjk-jisx0208 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-cjk-jisx0208_5.14.2-r15_armv7a-vfp-neon=
.ipk.
Installing perl-module-io-compress-base-common (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-compress-base-common_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-mm-qnx (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-mm-qnx_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-mime (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-mime_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-text-wrap (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-text-wrap_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-ipc-cmd (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-ipc-cmd_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-harness (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-harness_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-compress (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-compress_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-log-message-simple (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-log-message-simple_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-uncompress-unzip (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-uncompress-unzip_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-ru (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-ru_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-hash-util-fieldhash (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-hash-util-fieldhash_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-ops (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-ops_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-poll (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-poll_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-uncompress-bunzip2 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-uncompress-bunzip2_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-simple-methody (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-simple-methody_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-command-mm (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-command-mm_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-attribute-handlers (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-attribute-handlers_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-perl5db (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-perl5db_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-cbuilder-platform-cygwin (5.14.2-r15) to ro=
ot...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-cbuilder-platform-cygwin_5.14.2-r15_armv7a-vfp=
-neon.ipk.
Installing perl-module-unicode-collate-locale-ja (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-ja_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-thread-semaphore (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-thread-semaphore_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-io-dir (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-dir_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-test-simple (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-test-simple_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-sourcehandler-file (5.14.2-r15) to root..=
.
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-sourcehandler-file_5.14.2-r15_armv7a-vfp-neo=
n.ipk.
Installing perl-module-extutils-mm-vms (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-mm-vms_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-shellwords (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-shellwords_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-flush (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-flush_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-time-localtime (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-time-localtime_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-log-message-item (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-log-message-item_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-text-termcap (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-text-termcap_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-haw (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-haw_5.14.2-r15_armv7a-vfp-neon.i=
pk.
Installing perl-module-io-uncompress-adapter-bunzip2 (5.14.2-r15) to root..=
.
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-io-uncompress-adapter-bunzip2_5.14.2-r15_armv7a-vfp-neo=
n.ipk.
Installing perl-module-config-git (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-config-git_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-text-balanced (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-text-balanced_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-pod-perldoc-toman (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-pod-perldoc-toman_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-tap-parser-result-bailout (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-tap-parser-result-bailout_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-getcwd (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-getcwd_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-digest (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-digest_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-app-prove (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-app-prove_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-dirhandle (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-dirhandle_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-locale-maketext-simple (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-locale-maketext-simple_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-extutils-mm-win95 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-extutils-mm-win95_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-sys-hostname (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-sys-hostname_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-newgetopt (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-newgetopt_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-locale (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-locale_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-dbm-filter-utf8 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-dbm-filter-utf8_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-memoize-ndbm-file (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-memoize-ndbm-file_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-devel-selfstubber (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-devel-selfstubber_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-user-pwent (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-user-pwent_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-om (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-om_5.14.2-r15_armv7a-vfp-neon.ip=
k.
Installing perl-module-abbrev (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-abbrev_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-unicode-collate-locale-fil (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-unicode-collate-locale-fil_5.14.2-r15_armv7a-vfp-neon.i=
pk.
Installing perl-module-sdbm (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-sdbm_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-i18n-langtags-list (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-i18n-langtags-list_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-file-spec-win32 (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-file-spec-win32_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-text-soundex (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-text-soundex_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing perl-module-term-readline (5.14.2-r15) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/perl-module-term-readline_5.14.2-r15_armv7a-vfp-neon.ipk.
Installing python-readline (2.7.3-r0.2) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/python-readline_2.7.3-r0.2_armv7a-vfp-neon.ipk.
Installing libncursesw5 (5.9-r13.1) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libncursesw5_5.9-r13.1_armv7a-vfp-neon.ipk.
Installing trace-cmd (1.2+git1+7055ffd37beeb44714e86a4abc703f7e175a0db5-r3)=
 to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/trace-cmd_1.2+git1+7055ffd37beeb44714e86a4abc703f7e175a0db5-r3_armv=
7a-vfp-neon.ipk.
Installing packagegroup-core-boot (1.0-r10) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/beaglebo=
ne/packagegroup-core-boot_1.0-r10_beaglebone.ipk.
udev: unsatisfied recommendation for udev-utils
Installing tinylogin (1.4-r9) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/tinylogin_1.4-r9_armv7a-vfp-neon.ipk.
Installing busybox (1.20.2-r4) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/busybox_1.20.2-r4_armv7a-vfp-neon.ipk.
Installing busybox-syslog (1.20.2-r4) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/busybox-syslog_1.20.2-r4_armv7a-vfp-neon.ipk.
Installing busybox-udhcpc (1.20.2-r4) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/busybox-udhcpc_1.20.2-r4_armv7a-vfp-neon.ipk.
Installing modutils-initscripts (1.0-r6) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/modutils-initscripts_1.0-r6_armv7a-vfp-neon.ipk.
Installing busybox-hwclock (1.20.2-r4) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/busybox-hwclock_1.20.2-r4_armv7a-vfp-neon.ipk.
Installing sysvinit (2.88dsf-r9) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/sysvinit_2.88dsf-r9_armv7a-vfp-neon.ipk.
Installing sysvinit-pidof (2.88dsf-r9) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/sysvinit-pidof_2.88dsf-r9_armv7a-vfp-neon.ipk.
Installing sysvinit-inittab (2.88dsf-r9) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/beaglebo=
ne/sysvinit-inittab_2.88dsf-r9_beaglebone.ipk.
Installing update-alternatives-cworth (1:0.1.8+svnr649-r11.0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/update-alternatives-cworth_0.1.8+svnr649-r11.0_armv7a-vfp-neon.ipk.
Installing udev (182-r2) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/udev_182-r2_armv7a-vfp-neon.ipk.
Installing libblkid1 (2.22.1-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/libblkid1_2.22.1-r0_armv7a-vfp-neon.ipk.
Installing udev-extraconf (1.0-r7) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/all/udev=
-extraconf_1.0-r7_all.ipk.
Installing usbutils-ids (006-r0) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/usbutils-ids_006-r0_armv7a-vfp-neon.ipk.
Installing initscripts (1.0-r137) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/initscripts_1.0-r137_armv7a-vfp-neon.ipk.
Installing netbase (5.0-r1) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/armv7a-v=
fp-neon/netbase_5.0-r1_armv7a-vfp-neon.ipk.
Installing base-files (3.0.14-r72) to root...
Downloading file:/home/jack/Projects/oe-r0005/r0005/tmp/deploy/ipk/beaglebo=
ne/base-files_3.0.14-r72_beaglebone.ipk.
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//etc/init.d/sysl=
og to syslog.busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//etc/syslog-star=
tup.conf to syslog-startup.conf.busybox
 Adding system startup for /home/jack/Projects/oe-r0005/r0005/tmp/work/beag=
lebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/etc/init.d/syslog.
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/bunzip2=
 to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/bzcat t=
o ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/date to bus=
ybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/groups =
to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/id to .=
./../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/touch to bu=
sybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/users t=
o ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/who to =
../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/patch t=
o ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/vi to busyb=
ox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/find to=
 ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/grep to bus=
ybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/egrep to bu=
sybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/fgrep to bu=
sybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/xargs t=
o ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/halt to ..=
/bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/poweroff t=
o ../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/reboot to =
../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/insmod to =
../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/lsmod to .=
./bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/modprobe t=
o ../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/rmmod to .=
./bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/ping to bus=
ybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/ping6 to bu=
sybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/ash to busy=
box
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/sh to busyb=
ox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/[ to ..=
/../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/[[ to .=
./../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/ar to .=
./../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/awk to =
../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/basenam=
e to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/cat to busy=
box
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/chattr to b=
usybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/chgrp to bu=
sybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/chmod to bu=
sybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/chown to bu=
sybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/sbin/chroot=
 to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/chvt to=
 ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/clear t=
o ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/cmp to =
../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/cp to busyb=
ox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/cpio to bus=
ybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/cut to =
../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/dc to .=
./../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/dd to busyb=
ox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/dealloc=
vt to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/df to busyb=
ox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/diff to=
 ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/dirname=
 to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/dmesg to bu=
sybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/dnsdomainna=
me to busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/du to .=
./../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/dumpkmap to=
 busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/dumplea=
ses to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/echo to bus=
ybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/env to =
../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/expr to=
 ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/false to bu=
sybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/sbin/fbset =
to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/fdisk to .=
./bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/flock t=
o ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/free to=
 ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/fsck to ..=
/bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/fsck.minix=
 to ../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/fuser t=
o ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/gunzip to b=
usybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/gzip to bus=
ybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/head to=
 ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/hexdump=
 to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/hostname to=
 busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/hwclock to=
 ../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/ifconfig t=
o ../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/ifdown to =
../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/ifup to ..=
/bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/ip to busyb=
ox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/kill to bus=
ybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/killall=
 to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/klogd to .=
./bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/less to=
 ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/ln to busyb=
ox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/sbin/loadfo=
nt to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/loadkmap t=
o ../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/logger =
to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/logname=
 to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/logread to=
 ../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/losetup to=
 ../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/ls to busyb=
ox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/md5sum =
to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/microco=
m to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/mkdir to bu=
sybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/mkfifo =
to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/mkfs.minix=
 to ../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/mknod to bu=
sybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/mkswap to =
../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/mktemp to b=
usybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/more to bus=
ybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/mount to bu=
sybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/mv to busyb=
ox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/nc to .=
./../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/netstat to =
busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/nohup t=
o ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/nslooku=
p to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/od to .=
./../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/openvt =
to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/pidof to bu=
sybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/pivot_root=
 to ../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/printf =
to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/ps to busyb=
ox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/pwd to busy=
box
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/sbin/rdate =
to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/readlin=
k to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/realpat=
h to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/renice =
to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/reset t=
o ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/rm to busyb=
ox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/rmdir to bu=
sybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/route to .=
./bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/run-par=
ts to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/sed to busy=
box
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/seq to =
../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/setconsole=
 to ../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/sleep to bu=
sybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/sort to=
 ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/start-stop=
-daemon to ../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/stat to=
 ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/strings=
 to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/stty to bus=
ybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/swapoff to=
 ../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/swapon to =
../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/switch_roo=
t to ../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/sync to bus=
ybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/sysctl to =
../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/syslogd to=
 ../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/tail to=
 ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/tar to busy=
box
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/tee to =
../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/telnet =
to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/test to=
 ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/tftp to=
 ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/time to=
 ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/top to =
../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/tr to .=
./../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/tracero=
ute to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/true to bus=
ybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/tty to =
../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/udhcpc to =
../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/sbin/udhcpd=
 to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/umount to b=
usybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/uname to bu=
sybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/uniq to=
 ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/unzip t=
o ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/uptime =
to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/usleep to b=
usybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/watch t=
o ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/wc to .=
./../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/wget to=
 ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/which t=
o ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/whoami =
to ../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/yes to =
../../bin/busybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/zcat to bus=
ybox
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/scp to =
scp.openssh
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/ssh to =
ssh.openssh
Usage: grpconv
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/passwd =
to passwd.shadow
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/chfn to=
 chfn.shadow
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/newgrp =
to newgrp.shadow
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/chsh to=
 chsh.shadow
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/groups =
to groups.shadow
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/sbin/chpass=
wd to chpasswd.shadow
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/login to lo=
gin.shadow
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/vipw to vi=
pw.shadow
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/vigr to vi=
gr.shadow
 Adding system startup for /home/jack/Projects/oe-r0005/r0005/tmp/work/beag=
lebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/etc/init.d/sshd.
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/insmod to =
insmod.kmod
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/modprobe t=
o modprobe.kmod
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/rmmod to r=
mmod.kmod
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/modinfo to=
 modinfo.kmod
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/lsmod to ls=
mod.kmod
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/lsmod to .=
./bin/lsmod.kmod
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/depmod to =
depmod.kmod
Package openssh-sftp-server (6.0p1-r4) installed in root is up to date.
Configuring libc6.
Configuring libgcc1.
Configuring libperl5.
Configuring perl.
Configuring perl-module-cgi-pretty.
Configuring perl-module-mime.
Configuring shadow-securetty.
Configuring perl-module-thread-semaphore.
Configuring perl-module-exporter-heavy.
Configuring perl-module-exporter.
Configuring perl-module-symbol.
Configuring perl-module-io.
Configuring perl-module-io-handle.
Configuring perl-module-io-seekable.
Configuring perl-module-file-spec-unix.
Configuring perl-module-file-spec.
Configuring perl-module-selectsaver.
Configuring perl-module-io-file.
Configuring perl-module-filehandle.
Configuring perl-module-extutils-embed.
Configuring perl-module-pod-simple-text.
Configuring libz1.
Configuring libwebsockets0.
Configuring libbz2-0.
Configuring perl-module-extutils-mksymlists.
Configuring perl-module-carp.
Configuring perl-module-dynaloader.
Configuring perl-module-xsloader.
Configuring perl-module-feature.
Configuring perl-module-file.
Configuring perl-module-file-glob.
Configuring perl-module-integer.
Configuring perl-module-math-bigint-calc.
Configuring perl-module-memoize.
Configuring perl-module-blib.
Configuring perl-module-io-uncompress-adapter-bunzip2.
Configuring openssh-sftp-server.
Configuring perl-module-i18n-langinfo.
Configuring perl-module-ipc.
Configuring perl-module-time-tm.
Configuring perl-module-getcwd.
Configuring perl-module-getopts.
Configuring busybox-syslog.
Configuring perl-module-attributes.
Configuring perl-module-net-cmd.
Configuring libaio1.
Configuring perl-module-tie-hash.
Configuring perl-module-tap-parser-grammar.
Configuring perl-module-unicode-collate-locale-eo.
Configuring perl-module-io-uncompress-anyuncompress.
Configuring perl-module-tie-hash-namedcapture.
Configuring perl-module-unicode-collate-locale-es.
Configuring perl-module-unicode-collate-locale-et.
Configuring perl-module-pod-simple-progress.
Configuring perl-module-extutils-liblist-kid.
Configuring perl-module-extutils-liblist.
Configuring perl-module-extutils-mm.
Configuring perl-module-extutils-my.
Configuring perl-module-extutils-makemaker.
Configuring perl-module-newgetopt.
Configuring perl-module-dbm-filter-compress.
Configuring perl-module-hostname.
Configuring perl-module-extutils-makemaker-config.
Configuring python-re.
Configuring libpython2.7-1.0.
Configuring python-lang.
Configuring python-core.
Configuring ncurses-terminfo-base.
Configuring ncurses-terminfo.
Configuring libtinfo5.
Configuring libreadline6.
Configuring libncursesw5.
Configuring python-readline.
Configuring perl-module-cgi-carp.
Configuring perl-module-shellwords.
Configuring perl-module-app-prove-state.
Configuring perl-module-io-uncompress-bunzip2.
Configuring kernel-vmlinux.
Configuring perl-module-unicode-collate-locale-fi.
Configuring perl-module-log-message-handlers.
Configuring perl-module-io-compress-deflate.
Configuring blktrace.
Configuring elfutils.
Configuring perl-module-unicode-collate-locale-fo.
Configuring perl-module-unicode-collate-locale-zh-big5.
Configuring perl-module-unicode-collate-locale-zh-pin.
Configuring update-rc.d.
Configuring busybox-udhcpc.
Configuring busybox.
Configuring perl-module-universal.
Configuring perl-module-unicode-collate-locale-fr.
Configuring eglibc-mtrace.
Configuring perl-module-pod-simple-search.
Configuring perl-module-encode-config.
Configuring perl-module-encode.
Configuring perl-module-encode-unicode.
Configuring libcrypto1.0.0.
Configuring libssl1.0.0.
Configuring openssh-scp.
Configuring openssh-ssh.
Configuring openssh-keygen.
Configuring shadow.
Configuring base-passwd.
Configuring openssh-sshd.
Configuring openssh.
Configuring packagegroup-core-ssh-openssh.
Configuring perl-module-text-abbrev.
Configuring perl-module-extutils-constant-base.
Configuring perl-module-extutils-constant-xs.
Configuring perl-module-extutils-constant-proxysubs.
Configuring libpng12-0.
Configuring libkmod2.
Configuring kmod.
Configuring update-modules.
update-modules.postinst returned 1, marking as unpacked only, configuration=
 requupdate-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/wo=
rk/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//boot/uImag=
e to uImage-3.2.28
 Adding system startup for /home/jack/Projects/oe-r0005/r0005/tmp/work/beag=
lebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/etc/init.d/dbus-1.
 Adding system startup for /home/jack/Projects/oe-r0005/r0005/tmp/work/beag=
lebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/etc/init.d/connman=
.
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/sh to bash
 Adding system startup for /home/jack/Projects/oe-r0005/r0005/tmp/work/beag=
lebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/etc/init.d/tcf-age=
nt.
 Adding system startup for /home/jack/Projects/oe-r0005/r0005/tmp/work/beag=
lebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/etc/init.d/modutil=
s.sh.
ired on target.
Configuring kernel-image-3.2.28.
Configuring kernel-3.2.28.
Configuring kernel-module-x-tables.
Configuring kernel-module-ip-tables.
Configuring iptables.
Configuring libdbus-1-3.
Configuring libexpat1.
Configuring dbus-1.
Configuring libcap2.
Configuring libtasn1-3.
Configuring libgpg-error0.
Configuring libgcrypt11.
Configuring libgnutls26.
Configuring libffi6.
Configuring libglib-2.0-0.
Configuring connman.
Configuring libsqlite3-0.
Configuring libjansson4.
Configuring libjpeg8.
Configuring r0005app.
Configuring perl-module-i18n-langtags-list.
Configuring perl-module-tap-parser-sourcehandler-file.
Configuring perl-module-encode-cn.
Configuring perl-module-pod-parseutils.
Configuring perl-module-pod-latex.
Configuring libpopt0.
Configuring rsync.
Configuring libuuid1.
Configuring bash.
Configuring tcf-agent.
Configuring strace.
Configuring libthread-db1.
Configuring gdbserver.
Configuring gdb.
Configuring packagegroup-core-tools-debug.
Configuring perl-module-extutils-miniperl.
Configuring liburcu.
Configuring lttng2-ust.
Configuring lttng-tools.
Configuring perl-module-app-prove-state-result.
Configuring perl-module-tap-parser-sourcehandler-handle.
Configuring perl-module-memoize-sdbm-file.
Configuring binutils.
Configuring perl-module-overload.
Configuring perl-module-object-accessor.
Configuring perl-module-tap-formatter-console-session.
Configuring perl-module-inc-latest-private.
Configuring perl-module-list.
Configuring perl-module-pod-parser.
Configuring perl-module-unicode-collate-cjk-pinyin.
Configuring perl-module-cpan.
Configuring r0005web.
Configuring perl-module-extutils-cbuilder-platform-windows.
Configuring perl-module-io-compress-bzip2.
Configuring perl-module-io-select.
Configuring perl-module-unicode-normalize.
Configuring perl-module-extutils-install.
Configuring perl-module-filter.
Configuring perl-module-sort.
Configuring perl-module-tainted.
Configuring perl-module-pod-perldoc-getoptsoo.
Configuring perl-module-unicode-collate-locale-ha.
Configuring perl-module-locale-codes-script.
Configuring perl-module-io-compress-base-common.
Configuring perl-module-tie-file.
Configuring perl-module-locale-maketext-guts.
Configuring perl-module-pod-simple-htmllegacy.
Configuring perl-module-pod-perldoc-tortf.
Configuring perl-module-file-globmapper.
Configuring perl-module-b-showlex.
Configuring perl-module-file-spec-os2.
Configuring perl-module-app-prove.
Configuring perl-module-pod-simple.
Configuring perl-module-unicode-collate-locale-hr.
Configuring perl-module-extutils-cbuilder-platform-darwin.
Configuring perl-module-io-socket-unix.
Configuring perl-module-unicode-collate-locale-hu.
Configuring perl-module-bigint.
Configuring perl-module-bignum.
Configuring perl-module-unicode-collate-locale-hy.
Configuring perl-module-extutils-mkbootstrap.
Configuring perl-module-pod-html.
Configuring modutils-initscripts.
Configuring libgdbm4.
Configuring perl-module-gdbm-file.
Configuring perl-module-file-basename.
Configuring perl-module-time-seconds.
Configuring perl-module-digest-file.
Configuring perl-module-pod-simple-blackbox.
Configuring perl-module-dbm-filter-null.
Configuring perl-module-tap-formatter-base.
Configuring perl-module-carp-heavy.
Configuring perl-module-devel.
Configuring perl-module-log-message-item.
Configuring perl-module-unicode-collate-locale-ig.
Configuring perl-module-sdbm-file.
Configuring perl-module-tap-parser-scheduler-spinner.
Configuring perl-module-net-smtp.
Configuring perl-module-extutils-cbuilder-platform-dec-osf.
Configuring perl-module-math-bigint-calcemu.
Configuring perl-module-unicode-collate-locale-is.
Configuring perl-module-memoize-storable.
Configuring perl-module-test-more.
Configuring perl-module-exceptions.
Configuring perl-module-hash-util-fieldhash.
Configuring perl-module-tap-formatter-console-parallelsession.
Configuring perl-module-utf8.
Configuring perl-module-tap-parser-result-bailout.
Configuring perl-module-net-config.
Configuring perl-module-unicode-collate-locale-ja.
Configuring perl-module-hash-util.
Configuring perl-module-pod-simple-transcupdate-alternatives: Linking /home=
/jack/Projects/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/core=
-image-dev/1.0-r0/rootfs//etc/init.d/functions to functions.initscripts
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/powertop to=
 ../usr/bin/powertop
odedumb.
Configuring perl-module-pluggable.
Configuring perl-module-pod-simple-dumpastext.
Configuring perl-module-fcntl.
Configuring perl-module-tap-parser-sourcehandler-rawtap.
Configuring perl-module-io-compress-gzip.
Configuring perl-module-mime-base64.
Configuring perl-module-opcode.
Configuring perl-module-build.pm.
Configuring perl-module-ipc-sysv.
Configuring perl-module-next.
Configuring perl-module-encode-makefile-pl.
Configuring perl-module-hash.
Configuring perl-module-pod-perldoc-tonroff.
Configuring perl-module-pod-perldoc-toman.
Configuring perl-module-db.
Configuring base-files.
Configuring perl-module-extutils-mm-any.
Configuring perl-module-extutils-mm-unix.
Configuring perl-module-extutils-mm-win32.
Configuring perl-module-class-struct.
Configuring perl-module-file-stat.
Configuring perl-module-pod-man.
Configuring perl-module-sys-syslog.
Configuring libpcreposix0.
Configuring libpcre.
Configuring sysvinit-inittab.
Configuring perl-module-tap-parser-iterator-stream.
Configuring babeltrace.
Configuring perl-module-pod-simple-tiedoutfh.
Configuring perl-module-tap-formatter-session.
Configuring perl-module-diagnostics.
Configuring perl-module-test-builder-tester.
Configuring perl-module-unicode-collate-locale-kk.
Configuring perl-module-net-hostent.
Configuring perl-module-unicode-collate-locale-kl.
Configuring perl-module-unicode-collate-locale-ko.
Configuring perl-module-encoding-warnings.
Configuring perl-module-extutils-makemaker-yaml.
Configuring libstdc++6.
Configuring perl-module-b.
Configuring perl-module-tie-memoize.
Configuring perl-module-tap-harness.
Configuring perl-module-test-builder-module.
Configuring perl-module-locale-codes.
Configuring perl-module-tap-parser-scheduler.
Configuring perl-module-o.
Configuring perl-module-file-dosglob.
Configuring perl-module-extutils-cbuilder-platform-windows-bcc.
Configuring pciutils-ids.
Configuring libpci3.
Configuring pciutils.
Configuring perl-module-sigtrap.
Configuring perl-module-selfloader.
Configuring perl-module-devel-selfstubber.
Configuring perl-module-i18n-langtags.
Configuring perl-module-io-uncompress-gunzip.
Configuring perl-module-io-compress-adapter-deflate.
Configuring perl-module-unicode-collate-locale-lt.
Configuring perl-module-tap-parser-result-plan.
Configuring perl-module-perlio-via-quotedprint.
Configuring perl-module-unicode-collate-locale-lv.
Configuring perl-module-bigfloat.
Configuring initscripts.
Configuring perl-module-validate.
Configuring perl-module-autodie.
Configuring perl-module-threads.
Configuring perl-module-locale-country.
Configuring perl-module-pod-find.
Configuring perl-module-unicode-collate-locale-de-phone.
Configuring perl-module-unicode-collate-locale-nso.
Configuring perl-module-digest-md5.
Configuring perl-module-tap-parser-scheduler-job.
Configuring perl-module-mime-quotedprint.
Configuring perl-module-io-uncompress-unzip.
Configuring perl-module-extutils-constant.
Configuring perl-module-extutils-mm-uwin.
Configuring perl-module-pod-perldoc-toxml.
Configuring perl-module-text-balanced.
Configuring perl-module-unicode-collate-locale-mt.
Configuring perl-module-tap-parser-result-unknown.
Configuring perl-module-tap-parser-result-comment.
Configuring perl-module-locale-codes-country.
Configuring libncurses5.
Configuring powertop.
Configuring perl-module-bytes-heavy.
Configuring perl-module-unicode-collate-locale-nb.
Configuring update-alternatives-cworth.
Configuring perl-module-config-extensions.
Configuring perl-module-encode-changes.
Configuring perl-module-list-util-pp.
Configuring perl-module-pod-escapes.
Configuring perl-module-encode-jp.
Configuring perl-module-cwd.
Configuring perl-module-file-path.
Configuring perl-module-locale-codes-language.
Configuring perl-module-storable.
Configuring perl-module-unicode-collate-locale-nn.
Configuring perl-module-net-netent.
Configuring perl-module-unicode-collate-locale-haw.
Configuring perl-module-locale-codes-currency.
Configuring libform5.
Configuring libmenu5.
Configuring r0005serial.
Configuring perl-module-pod-checker.
Configuring perl-module-scala Adding system startup for /home/jack/Projects=
/oe-r0005/r0005/tmp/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0=
-r0/rootfs/etc/init.d/hiawatha.
r-util-pp.
Configuring perl-module-list-util.
Configuring perl-module-scalar-util.
Configuring perl-module-threads-shared.
Configuring perl-module-thread-queue.
Configuring perl-module-encode-mime-header-iso-2022-jp.
Configuring perl-module-getopt-std.
Configuring perl-module-compress.
Configuring perl-module-archive-tar-constant.
Configuring perl-module-mro.
Configuring perl-module-perlio-scalar.
Configuring perl-module-extutils-installed.
Configuring perl-module-cgi.
Configuring perl-module-math-bigint.
Configuring perl-module-look.
Configuring perl-module-encode-kr.
Configuring perl-module-term-cap.
Configuring perl-module-encode--t.
Configuring perl-module-io-uncompress-base.
Configuring perl-module-unicode-collate-locale-om.
Configuring perl-module-ipc-sharedmem.
Configuring perl-module-tap-parser.
Configuring perl-module-i18n.
Configuring perl-module-compress-raw-zlib.
Configuring perl-module-find.
Configuring perl-module-test-harness.
Configuring perl-module-dbm-filter.
Configuring perl-module-extutils-testlib.
Configuring perl-module-version.
Configuring libxml2.
Configuring perl-module-pod-simple-linksection.
Configuring perl-module-log-message-simple.
Configuring perl-module-perlio.
Configuring perl-module-sys-hostname.
Configuring perl-module-net-ftp-dataconn.
Configuring perl-module-net-ftp-a.
Configuring perl-module-user-grent.
Configuring perl-module-cgi-fast.
Configuring perl-module-tap-parser-iteratorfactory.
Configuring perl-module-if.
Configuring perl-module-net-ftp-i.
Configuring perl-module-net-ftp-e.
Configuring perl-module-abbrev.
Configuring perl-module-charnames.
Configuring perl-module-open.
Configuring libxslt.
Configuring hiawatha.
Configuring libavahi-common3.
Configuring perl-module-finddepth.
Configuring perl-module-net-ftp-l.
Configuring perl-module-extutils-mm-aix.
Configuring perl-module-timelocal.
Configuring libblkid1.
Configuring perl-module-text-tabs.
Configuring perl-module-parse-cpan-meta.
Configuring perl-module-unicode-collate-locale-pl.
Configuring perl-module-extutils-cbuilder-base.
Configuring perl-module-math-trig.
Configuring perl-module-b-terse.
Configuring perl-module-extutils-mm-win95.
Configuring perl-module-ops.
Configuring perl-module-unicode-collate-cjk-jisx0208.
Configuring perl-module-unicore.
Configuring perl-module-findbin.
Configuring perl-module-dotsh.
Configuring perl-module-net-ping.
Configuring perl-module-tap-parser-yamlish-reader.
Configuring perl-module-importenv.
Configuring perl-module-tap-formatter-console.
Configuring perl-module-tie-stdhandle.
Configuring perl-module-pod-functions.
Configuring perl-module-pod-plaintext.
Configuring perl-module-pod-simple-transcode.
Configuring perl-module-tap-parser-result.
Configuring perl-module-ipc-open3.
Configuring perl-module-ipc-open2.
Configuring latencytop.
Configuring perl-module-net-netrc.
Configuring perl-module-b-concise.
Configuring perl-module-io-compress-adapter-bzip2.
Configuring perl-module-filecache.
Configuring perl-module-b-debug.
Configuring perl-module-io-zlib.
Configuring perl-module-io-compress-base.
Configuring perl-module-file-spec-vms.
Configuring perl-module-pod-simple-html.
Configuring perl-module-unicode-collate-locale-fil.
Configuring perl-module-net-ftp.
Configuring perl-module-pod-perldoc-tochecker.
Configuring perl-module-math-bigfloat.
Configuring perl-module-locale-language.
Configuring perl-module-devel-peek.
Configuring perl-module-flush.
Configuring perl-module-unicode-collate-locale-ro.
Configuring perl-module-data-dumper.
Configuring perl-module-encode-configlocal-pm.
Configuring perl-module-memoize-expiretest.
Configuring perl-module-tap-parser-result-test.
Configuring perl-module-filter-simple.
Configuring perl-module-safe.
Configuring perl-module-pwd.
Configuring perl-module-tap-base.
Configuring perl-module-tap-object.
Configuring perl-module-extutils-manifest.
Configuring perl-module-locale-script.
Configuring perl-module-autodie-hints.
Configuring perl-module-time-piece.
Configuring perl-module-encode-mime-name.
Configuring perl-module-io-compress-zlib-constants.
Configuring perl-module-load.
Configuring perl-module-tap-parser-iterator-process.
Configuring perl-module-file-temp.
Configuring perl-module-unicode-collate-cjk-stroke.
Configuring perl-module-lib.
Configuring perl-module-io-pipe.
Configuring perl-module-extutils-cbuilder-platform-unix.
Configuring perl-module-pod-simple-simpletree.
Configuring perl-module-pod-simple-pullparserstarttoken.
Configuring perl-module-unicode-collate-cjk-big5.
Configuring perl-module-pod-parselink.
Configuring perl-module-io-uncompress-anyinflate.
Configuring perl-module-tie-scalar.
Configuring perl-module-locale-currency.
Configuring perl-module-termcap.
Configuring perl-module-file-spec-functions.
Configuring perl-module-base.
Configuring perl-module-cpanplus.
Configuring perl-module-net-protoent.
Configuring perl-module-pod-simple-pullparserendtoken.
Configuring perl-module-tap-parser-result-version.
Configuring perl-module-digest-base.
Configuring perl-module-autoloader.
Configuring perl-module-locale-maketext.
Configuring perl-module-anydbm-file.
Configuring perl-module-math-complex.
Configuring perl-module-overloading.
Configuring perl-module-unicode-collate-locale-ca.
Configuring perl-module-pod-select.
Configuring perl-module-pod-usage.
Configuring perl-module-dbm-filter-encode.
Configuring perl-module-unicode-collate-locale-cs.
Configuring perl-module-extutils-mm-dos.
Configuring perl-module-pod-perldoc-topod.
Configuring perl-module-unicode-collate-locale-sq.
Configuring perl-module-pod-simple-xmloutstream.
Configuring perl-module-tap-formatter-file-session.
Configuring perl-module-extutils-parsexs.
Configuring perl-module-unicode-collate-locale-sw.
Configuring perl-module-unicode-collate-locale-sv.
Configuring perl-module-autouse.
Configuring perl-module-extutils-packlist.
Configuring perl-module-unicode-collate.
Configuring perl-module-unicode-collate-locale-sk.
Configuring perl-module-time-gmtime.
Configuring perl-module-extutils-command.
Configuring perl-module-tie-array.
Configuring perl-module-encode-unicode-utf7.
Configuring perl-module-io-compress-zip-constants.
Configuring perl-module-unicode-collate-locale-uk.
Configuring perl-module-unicode-collate-locale-sl.
Configuring perl-module-io-uncompress-inflate.
Configuring perl-module-ipc-msg.
Configuring perl-module-memoize-expire.
Configuring perl-module-devel-ppport.
Configuring perl-module-locale-maketext-gutsloader.
Configuring perl-module-filter-util-call.
Configuring perl-module-file-fetch.
Configuring perl-module-extutils-cbuilder-platform-windows-msvc.
Configuring perl-module-file-spec-cygwin.
Configuring perl-module-encode-symbol.
Configuring perl-module-pod-perldoc-totext.
Configuring perl-module-vmsish.
Configuring perl-module-tap-parser-sourcehandler-perl.
Configuring perl-module-parent.
Configuring perl-module-devel-innerpackage.
Configuring perl-module-b-deparse.
Configuring perl-module-perlio-via.
Configuring perl-module-math-bigint-trace.
Configuring perl-module-load.pm.
Configuring perl-module-thread.
Configuring perl-module-extutils-mm-macos.
Configuring perl-module-encode-guess.
Configuring perl-module-time-hires.
Configuring perl-module-posix.
Configuring perl-module-encode-encoding.
Configuring perl-module-cgi-util.
Configuring perl-module-net-time.
Configuring perl-module-io-uncompress-adapter-identity.
Configuring perl-module-term-ui-history.
Configuring perl-module-socket.
Configuring perl-module-file-compare.
Configuring perl-module-tap-parser-sourcehandler.
Configuring perl-module-sys.
Configuring perl-module-encode-jp-h2z.
Configuring perl-module-text-parsewords.
Configuring perl-module-encode-cn-hz.
Configuring perl-module-data.
Configuring perl-module-encode-byte.
Configuring perl-module-test.
Configuring perl-module-encode-mime-header.
Configuring perl-module-io-uncompress-rawinflate.
Configuring perl-module-time-local.
Configuring perl-module-pod-simple-xhtml.
Configuring perl-module-extutils-constant-utils.
Configuring perl-module-tie-refhash.
Configuring perl-module-english.
Configuring perl-module-pod-simple-rtf.
Configuring perl-module-locale-constants.
Configuring perl-module-io-compress-zip.
Configuring perl-module-compress-zlib.
Configuring perl-module-tap-parser-iterator-array.
Configuring perl-module-deprecate.
Configuring perl-module-math-bigrat.
Configuring perl-module-extutils-cbuilder-platform-vms.
Configuring perl-module-compress-raw-bzip2.
Configuring perl-module-unicode-collate-locale-ar.
Configuring perl-module-math-bigfloat-trace.
Configuring perl-module-unicode-collate-locale-tn.
Configuring perl-module-unicode-collate-locale-to.
Configuring perl-module-unicode-collate-locale-tr.
Configuring perl-module-unicode-collate-cjk-gb2312.
Configuring perl-module-perlio-encoding.
Configuring perl-module-extutils-mm-vos.
Configuring perl-module-cgi-switch.
Configuring perl-module-app-prove-state-result-test.
Configuring perl-module-extutils-mm-darwin.
Configuring perl-module-cgi-apache.
Configuring perl-module-unicode-collate-locale-da.
Configuring perl-module-pluggable.pm.
Configuring perl-module-tap-parser-result-pragma.
Configuring perl-module-pod-perldoc.
Configuring perl-module-pod-perldoc-totk.
Configuring perl-module-encode-gsm0338.
Configuring perl-module-assert.
Configuring perl-module-unicode-collate-locale-zh-strk.
Configuring perl-module-ctime.
Configuring perl-module-term-ansicolor.
Configuring perl-module-benchmark.
Configuring perl-module-filetest.
Configuring perl-module-pod-text-overstrike.
Configuring perl-module-unicode-collate-locale-zh-gb.
Configuring perl-module-encoding.
Configuring perl-module-app-cpan.
Configuring perl-module-pod-simple-pullparser.
Configuring perl-module-memoize-expirefile.
Configuring perl-module-tap-formatter-file.
Configuring perl-module-inc-latest.
Configuring perl-module-cgi-cookie.
Configuring perl-module-encode-tw.
Configuring perl-module-archive-extract.
Configuring perl-module-pod-perldoc-baseto.
Configuring perl-module-file-find.
Configuring perl-module-dumpvar.
Configuring perl-module-time.
Configuring perl-module-encode-ebcdic.
Configuring perl-module-utf8-heavy.
Configuring perl-module-archive-tar.
Configuring perl-module-list-util-xs.
Configuring perl-module-net-nntp.
Configuring perl-module-pod-inputobjects.
Configuring perl-module-i18n-langtags-detect.
Configuring perl-module-unicode-collate-locale-se.
Configuring perl-module-less.
Configuring perl-module-pod-simple-dumpasxml.
Configuring perl-module-fatal.
Configuring perl-module-memoize-anydbm-file.
Configuring perl-module-io-compress-gzip-constants.
Configuring perl-module-unicode-collate-locale-af.
Configuring perl-module-pod-simple-pullparsertexttoken.
Configuring perl-module-bytes.
Configuring perl-module-unicode-collate-locale-az.
Configuring perl-module-io-compress-adapter-identity.
Configuring perl-module-tap-parser-sourcehandler-executable.
Configuring perl-module-extutils-cbuilder.
Configuring perl-module-fields.
Configuring perl-module-extutils-cbuilder-platform-aix.
Configuring perl-module-encode-kr-2022-kr.
Configuring perl-module-pod-simple-pullparsertoken.
Configuring perl-module-tap-parser-resultfactory.
Configuring perl-module-shell.
Configuring perl-module-file-copy.
Configuring perl-module-unicode-ucd.
Configuring perl-module-fastcwd.
Configuring perl-module-io-compress-rawdeflate.
Configuring perl-module-tap-parser-result-yaml.
Configuring perl-module-tap-parser-multiplexer.
Configuring perl-module-b-xref.
Configuring perl-module-unicode-collate-locale-zh.
Configuring perl-module-net-servent.
Configuring perl-module-file-spec-epoc.
Configuring perl-module-term-ui.
Configuring perl-module-tie-handle.
Configuring perl-module-extutils-mm-beos.
Configuring perl-module-build.
Configuring perl-module-encode-jp-jis7.
Configuring perl-module-unicode-collate-locale-vi.
Configuring perl-module-re.
Configuring perl-module-extutils-mm-cygwin.
Configuring perl-module-autodie-exception-system.
Configuring perl-module-pod-text-color.
Configuring perl-module-pod-simple-debug.
Configuring perl-module-term-complete.
Configuring perl-module-subs.
Configuring perl-module-constant.
Configuring perl-module-text.
Configuring perl-module-digest-sha.
Config Adding system startup for /home/jack/Projects/oe-r0005/r0005/tmp/wor=
k/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/etc/init.d/h=
wclock.sh.
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/ar to a=
rm-oecore-linux-gnueabi-ar
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/strings=
 to arm-oecore-linux-gnueabi-strings
 Adding system startup for /home/jack/Projects/oe-r0005/r0005/tmp/work/beag=
lebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/etc/init.d/oprofil=
eui-server.
uring perl-module-open2.
Configuring perl-module-open3.
Configuring perl-module-test-builder.
Configuring perl-module-b-lint.
Configuring perl-module-net-domain.
Configuring perl-module-stat.
Configuring perl-module-tap-parser-iterator.
Configuring perl-module-tap-parser-utils.
Configuring perl-module-getopt.
Configuring perl-module-math.
Configuring perl-module-dbm-filter-int32.
Configuring perl-module-unicode-collate-locale-yo.
Configuring perl-module-pod-simple-textcontent.
Configuring perl-module-unicode-collate-locale-cy.
Configuring perl-module-extutils-cbuilder-platform-windows-gcc.
Configuring perl-module-unicode-collate-locale-wo.
Configuring perl-module-loaded.pm.
Configuring perl-module-encode-cjkconstants.
Configuring perl-module-syslog.
Configuring perl-module-devel-dprof.
Configuring perl-module-cacheout.
Configuring perl-module-net-pop3.
Configuring perl-module-ipc-semaphore.
Configuring perl-module-search-dict.
Configuring perl-module-math-bigint-fastcalc.
Configuring perl-module-complete.
Configuring perl-module-bigrat.
Configuring perl-module-unicode-collate-cjk-korean.
Configuring perl-module-unicode-collate-locale.
Configuring perl-module-tap-parser-yamlish-writer.
Configuring perl-module-encode--pm.
Configuring perl-module-autosplit.
Configuring perl-module-file-spec-mac.
Configuring perl-module-overload-numbers.
Configuring perl-module-package-constants.
Configuring perl-module-b-lint-debug.
Configuring perl-module-getopt-long.
Configuring perl-module-unicode-collate-locale-es-trad.
Configuring perl-module-errno.
Configuring perl-module-extutils-mm-nw5.
Configuring perl-module-autodie-exception.
Configuring perl-module-encode-readme.
Configuring perl-module-io-socket-inet.
Configuring perl-module-io-socket.
Configuring perl-module-pod-simple-htmlbatch.
Configuring perl-module-pod-text.
Configuring perl-module-tie.
Configuring perl-module-tie-substrhash.
Configuring perl-module-corelist.pm.
Configuring perl-module-log-message-config.
Configuring perl-module-pod-simple-checker.
Configuring perl-module-io-compress-zlib-extra.
Configuring perl-module-cgi-push.
Configuring perl-module-encode-alias.
Configuring perl-module-encode-encoder.
Configuring perl-module-pod-simple-transcodesmart.
Configuring perl-module-params-check.
Configuring perl-module-io-uncompress-adapter-inflate.
Configuring perl-module-extutils-mm-os2.
Configuring perl-module-test-builder-tester-color.
Configuring perl-module-extutils-cbuilder-platform-os2.
Configuring perl-module-tap-parser-aggregator.
Configuring perl-module-log-message.
Configuring perl-module-tap-formatter-color.
Configuring perl-module-tap-parser-source.
Configuring perl-module-archive-tar-file.
Configuring perl-module-extutils-mm-qnx.
Configuring perl-module-text-wrap.
Configuring perl-module-ipc-cmd.
Configuring perl-module-unicode-collate-locale-ru.
Configuring perl-module-io-poll.
Configuring perl-module-pod-simple-methody.
Configuring perl-module-extutils-command-mm.
Configuring perl-module-attribute-handlers.
Configuring perl-module-perl5db.
Configuring perl-module-extutils-cbuilder-platform-cygwin.
Configuring perl-module-io-dir.
Configuring perl-module-test-simple.
Configuring perl-module-extutils-mm-vms.
Configuring perl-module-time-localtime.
Configuring perl-module-pod-text-termcap.
Configuring perl-module-config-git.
Configuring perl-module-digest.
Configuring perl-module-dirhandle.
Configuring perl-module-locale-maketext-simple.
Configuring perl-module-locale.
Configuring perl-module-unicode.
Configuring perl-module-dbm-filter-utf8.
Configuring perl-module-memoize-ndbm-file.
Configuring perl-module-user-pwent.
Configuring perl-module-sdbm.
Configuring perl-module-file-spec-win32.
Configuring perl-module-text-soundex.
Configuring perl-module-term-readline.
Configuring perl-modules.
Configuring libavahi-glib1.
Configuring usbutils-ids.
Configuring libc6-dbg.
Configuring trace-cmd.
Configuring slang.
Configuring busybox-hwclock.
Configuring libavahi-client3.
Configuring binutils-symlinks.
Configuring oprofile.
Configuring oprofileui-server.
Configuring tinupdate-alternatives: Linking /home/jack/Projects/oe-r0005/r0=
005/tmp/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//=
sbin/getty to getty.tinylogin
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/pidof to pi=
dof.sysvinit
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/init to in=
it.sysvinit
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//bin/mountpoint =
to mountpoint.sysvinit
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/halt to ha=
lt.sysvinit
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/reboot to =
reboot.sysvinit
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/runlevel t=
o runlevel.sysvinit
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/shutdown t=
o shutdown.sysvinit
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//sbin/poweroff t=
o poweroff.sysvinit
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/last to=
 last.sysvinit
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/mesg to=
 mesg.sysvinit
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/utmpdum=
p to utmpdump.sysvinit
update-alternatives: Linking /home/jack/Projects/oe-r0005/r0005/tmp/work/be=
aglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs//usr/bin/wall to=
 wall.sysvinit
 Adding system startup for /home/jack/Projects/oe-r0005/r0005/tmp/work/beag=
lebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/etc/init.d/udev.
 Adding system startup for /home/jack/Projects/oe-r0005/r0005/tmp/work/beag=
lebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/etc/init.d/network=
ing.
 Adding system startup for /home/jack/Projects/oe-r0005/r0005/tmp/work/beag=
lebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/etc/init.d/run-pos=
tinsts.
WARNING: could not open /home/jack/Projects/oe-r0005/r0005/tmp/work/beagleb=
one-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/lib/modules/3.2.28/mo=
dules.order: No such file or directory
WARNING: could not open /home/jack/Projects/oe-r0005/r0005/tmp/work/beagleb=
one-oecore-linux-gnueabi/core-image-dev/1.0-r0/rootfs/lib/modules/3.2.28/mo=
dules.builtin: No such file or directory
ylogin.
Configuring sysvinit-pidof.
Configuring sysvinit.
Configuring udev-extraconf.
Configuring udev.
Configuring netbase.
Configuring packagegroup-core-boot.
Configuring systemtap.
Configuring libnewt0.52.
Configuring perf.
Configuring lttng-modules.
Configuring kernel-module-oprofile.
Configuring packagegroup-core-tools-profile.
Configuring libcurl5.
Configuring git.
Configuring valgrind.
Configuring htop.
Configuring run-postinsts.
Collected errors:
 * opkg_install_cmd: Cannot install package php-cgi.
ERROR: Function failed: do_rootfs (see /home/jack/Projects/oe-r0005/r0005/t=
mp/work/beaglebone-oecore-linux-gnueabi/core-image-dev/1.0-r0/temp/log.do_r=
ootfs.21904 for further information)

--------------010403060304060907090300--
