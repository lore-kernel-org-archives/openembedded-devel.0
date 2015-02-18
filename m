Return-Path: <Shalini.KP@lnttechservices.com>
Received: from mailout1.ltindia.com (mailout1.ltindia.com [203.199.60.132])
	by mail.openembedded.org (Postfix) with ESMTP id 99BBB6B6B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 04:52:19 +0000 (UTC)
Received: from unknown (HELO POCITMSEXHUB04.LntUniverse.com) ([10.2.1.69])
	by mailout1.ltindia.com with ESMTP; 18 Feb 2015 10:22:07 +0530
Received: from POCITMSEXMB05.LntUniverse.com ([fe80::518c:4525:d15f:548a]) by
	POCITMSEXHUB04.LntUniverse.com ([fe80::8c5f:9589:e5d5:ce78%11]) with
	mapi id 14.03.0181.006; Wed, 18 Feb 2015 10:22:07 +0530
From: Shalini K P <Shalini.KP@LntTechservices.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Error while building openjdk-6 using meta-java
Thread-Index: AdBLNoSmNLTPzjspSAmeaEbEblmBdw==
Date: Wed, 18 Feb 2015 04:52:06 +0000
Message-ID: <E5FF0F26CCED3843A9B0899B389686BA42E571@POCITMSEXMB05.LntUniverse.com>
Accept-Language: en-IN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.2.1.199]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Error while building openjdk-6 using meta-java
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Feb 2015 04:52:33 -0000
Content-Language: en-IN
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

        I m using "git://git.yoctoproject.org/meta-java" layer. I m getting=
 error while compiling java in the compilestep2. Not able to fix this. Belo=
w is the error log.


/home/ubuntu/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linu=
x-gnueabi/openjdk-6-jre/6b24-1.11.9-r22.1/build/bootstrap/jdk1.6.0/bin/java=
  -client -Xmx896m -Xms128m -XX:PermSize=3D32m -XX:MaxPermSize=3D160m -jar =
/homeError: time is more than 10 years from present: 1104530400000
| java.lang.RuntimeException: time is more than 10 years from present: 1104=
530400000
|
|     at build.tools.generatecurrencydata.GenerateCurrencyData.makeSpecialC=
aseEntry(GenerateCurrencyData.java:285)
|     at build.tools.generatecurrencydata.GenerateCurrencyData.buildMainAnd=
SpecialCaseTables(GenerateCurrencyData.java:225)
|     at build.tools.generatecurrencydata.GenerateCurrencyData.main(Generat=
eCurrencyData.java:154)
|
| make[5]: *** [/home/ubuntu/fsl-community-bsp/build/tmp/work/cortexa9hf-vf=
p-neon-poky-linux-gnueabi/openjdk-6-jre/6b24-1.11.9-r22.1/build/openjdk.bui=
ld-ecj/lib/currency.data] Error 1
|
| make[5]: Leaving directory `/home/ubuntu/fsl-community-bsp/build/tmp/work=
/cortexa9hf-vfp-neon-poky-linux-gnueabi/openjdk-6-jre/6b24-1.11.9-r22.1/bui=
ld/openjdk-ecj/jdk/make/java/java'
|
| make[4]: *** [all] Error 1
| make[4]: Leaving directory `/home/ubuntu/fsl-community-bsp/build/tmp/work=
/cortexa9hf-vfp-neon-poky-linux-gnueabi/openjdk-6-jre/6b24-1.11.9-r22.1/bui=
ld/openjdk-ecj/jdk/make/java'
|
| make[3]: *** [all] Error 1
| make[3]: Leaving directory `/home/ubuntu/fsl-community-bsp/build/tmp/work=
/cortexa9hf-vfp-neon-poky-linux-gnueabi/openjdk-6-jre/6b24-1.11.9-r22.1/bui=
ld/openjdk-ecj/jdk/make'
|
| make[2]: *** [jdk-build] Error 2
| make[2]: Leaving directory `/home/ubuntu/fsl-community-bsp/build/tmp/work=
/cortexa9hf-vfp-neon-poky-linux-gnueabi/openjdk-6-jre/6b24-1.11.9-r22.1/bui=
ld/openjdk-ecj'
|
| make[1]: *** [build_product_image] Error 2
| make[1]: Leaving directory `/home/ubuntu/fsl-community-bsp/build/tmp/work=
/cortexa9hf-vfp-neon-poky-linux-gnueabi/openjdk-6-jre/6b24-1.11.9-r22.1/bui=
ld/openjdk-ecj'
|
| make: *** [stamps/icedtea-ecj.stamp] Error 2
|
| + die oe_runmake failed
| + bbfatal oe_runmake failed
| + echo ERROR: oe_runmake failed
| ERROR: oe_runmake failed
| + exit 1
| + bb_exit_handler
| + ret=3D1
| + echo WARNING: exit code 1 from a shell command.
| WARNING: exit code 1 from a shell command.
| + exit 1
|
| /ubuntu/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-g=
nueabi/openjdk-6-jre/6b24-1.11.9-r22.1/build/openjdk.build-ecj/btjars/gener=
atecurrencydata.jar -o /home/ubuntu/fsl-community-bsp/build/tmp/work/cortex=
a9hf-vfp-neon-poky-linux-gnueabi/openjdk-6-jre/6b24-1.11.9-r22.1/build/open=
jdk.build-ecj/lib/currency.data.temp \
|         < ../../../src/share/classes/java/util/CurrencyData.properties
| Error: time is more than 10 years from present: 1104530400000
| java.lang.RuntimeException: time is more than 10 years from present: 1104=
530400000
|     at build.tools.generatecurrencydata.GenerateCurrencyData.makeSpecialC=
aseEntry(GenerateCurrencyData.java:285)
|     at build.tools.generatecurrencydata.GenerateCurrencyData.buildMainAnd=
SpecialCaseTables(GenerateCurrencyData.java:225)
|     at build.tools.generatecurrencydata.GenerateCurrencyData.main(Generat=
eCurrencyData.java:154)
| make[5]: *** [/home/ubuntu/fsl-community-bsp/build/tmp/work/cortexa9hf-vf=
p-neon-poky-linux-gnueabi/openjdk-6-jre/6b24-1.11.9-r22.1/build/openjdk.bui=
ld-ecj/lib/currency.data] Error 1
| make[5]: Leaving directory `/home/ubuntu/fsl-community-bsp/build/tmp/work=
/cortexa9hf-vfp-neon-poky-linux-gnueabi/openjdk-6-jre/6b24-1.11.9-r22.1/bui=
ld/openjdk-ecj/jdk/make/java/java'
| make[4]: *** [all] Error 1
| make[4]: Leaving directory `/home/ubuntu/fsl-community-bsp/build/tmp/work=
/cortexa9hf-vfp-neon-poky-linux-gnueabi/openjdk-6-jre/6b24-1.11.9-r22.1/bui=
ld/openjdk-ecj/jdk/make/java'
| make[3]: *** [all] Error 1
| make[3]: Leaving directory `/home/ubuntu/fsl-community-bsp/build/tmp/work=
/cortexa9hf-vfp-neon-poky-linux-gnueabi/openjdk-6-jre/6b24-1.11.9-r22.1/bui=
ld/openjdk-ecj/jdk/make'
| make[2]: *** [jdk-build] Error 2
| make[2]: Leaving directory `/home/ubuntu/fsl-community-bsp/build/tmp/work=
/cortexa9hf-vfp-neon-poky-linux-gnueabi/openjdk-6-jre/6b24-1.11.9-r22.1/bui=
ld/openjdk-ecj'
| make[1]: *** [build_product_image] Error 2
| make[1]: Leaving directory `/home/ubuntu/fsl-community-bsp/build/tmp/work=
/cortexa9hf-vfp-neon-poky-linux-gnueabi/openjdk-6-jre/6b24-1.11.9-r22.1/bui=
ld/openjdk-ecj'
| make: *** [stamps/icedtea-ecj.stamp] Error 2
| + die oe_runmake failed
| + bbfatal oe_runmake failed
| + echo ERROR: oe_runmake failed
| ERROR: oe_runmake failed
| + exit 1
| + bb_exit_handler
| + ret=3D1
| + echo WARNING: exit code 1 from a shell command.
| WARNING: exit code 1 from a shell command.
| + exit 1
| ERROR: Function failed: do_compilesteptwo (log file is located at /home/u=
buntu/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnuea=
bi/openjdk-6-jre/6b24-1.11.9-r22.1/temp/log.do_compilesteptwo.28700)
ERROR: Task 6 (/home/ubuntu/fsl-community-bsp/sources/meta-java/recipes-cor=
e/openjdk/openjdk-6_6b24-1.11.9.bb, do_compilesteptwo) failed with exit cod=
e '1'
NOTE: Tasks Summary: Attempted 1894 tasks of which 1887 didn't need to be r=
erun and 1 failed.
No currently running tasks (1894 of 1903)

Summary: 1 task failed:
  /home/ubuntu/fsl-community-bsp/sources/meta-java/recipes-core/openjdk/ope=
njdk-6_6b24-1.11.9.bb, do_compilesteptwo
Summary: There were 5 WARNING messages shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

Request help in this regard.


Thanks & Regards
Shalini K P

L&T Technology Services Ltd

www.LntTechservices.com<http://www.lnttechservices.com/>

This Email may contain confidential or privileged information for the inten=
ded recipient (s). If you are not the intended recipient, please do not use=
 or disseminate the information, notify the sender and delete it from your =
system.

