Received: from [200.154.152.45] (helo=sr03-06.mta.terra.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ramon@instramed.com.br>) id 1KvBIW-0001rf-OO
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Oct 2008 14:41:21 +0100
Received: from ponpeli.hst.terra.com.br (ponpeli.hst.terra.com.br
	[200.176.10.21])
	by bungunia.hst.terra.com.br (Postfix) with ESMTP id EB894600023C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2008 13:40:22 +0000 (UTC)
X-Terra-Karma: -2%
X-Terra-Hash: b935668da6bd342d89daffdf39575e9d
Received-SPF: none (ponpeli.hst.terra.com.br: 200.176.10.21 is neither
	permitted nor denied by domain of instramed.com.br)
	client-ip=200.176.10.21; envelope-from=ramon@instramed.com.br;
	helo=[192.168.1.105]; 
Received: from [192.168.1.105] (unknown [201.21.243.40])
	(authenticated user ramoninstramed@terra.com.br)
	by ponpeli.hst.terra.com.br (Postfix) with ESMTP id C4D19800012B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2008 13:40:22 +0000 (UTC)
Message-ID: <490867C7.9060809@instramed.com.br>
Date: Wed, 29 Oct 2008 11:40:23 -0200
From: =?ISO-8859-1?Q?Ram=F3n_Finger_Lilienthal?= <ramon@instramed.com.br>
Organization: Instramed Ltda.
User-Agent: Thunderbird 2.0.0.17 (X11/20080925)
MIME-Version: 1.0
To: OpenEmbedded - DEV <openembedded-devel@lists.openembedded.org>
Subject: Problems on bitbaking base-image
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
X-List-Received-Date: Wed, 29 Oct 2008 13:41:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Fellows,

I was trying to bitbake base-image by the first time and I get the 
following error:

---
NOTE: Handling BitBake files: \ (6121/6122) [99 %]
NOTE: Parsing finished. 5864 cached, 0 parsed, 258 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: build 200810281535: started

OE Build Configuration:
BB_VERSION        = "1.8.11"
METADATA_BRANCH   = "org.openembedded.dev"
METADATA_REVISION = "83176ca41497b63eab25babf275eb09b5de55a8d"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "omap5912osk"
DISTRO            = "angstrom"
DISTRO_VERSION    = "2008.1-test-20081028"
TARGET_FPU        = "soft"

NOTE: Resolving any missing task queue dependencies
ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime 
entity 'virtual/arm-angstrom-linux-gnueabi-gcc-2.95' but it wasn't found 
in any PACKAGE or RPROVIDES variables
NOTE: Runtime target 'virtual/arm-angstrom-linux-gnueabi-gcc-2.95' is 
unbuildable, removing...
Missing or unbuildable dependency chain was: 
['virtual/arm-angstrom-linux-gnueabi-gcc-2.95']
ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime 
entity 'openzaurus-sa' but it wasn't found in any PACKAGE or RPROVIDES 
variables
NOTE: Runtime target 'openzaurus-sa' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['openzaurus-sa']
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 749 of 2118 (ID: 2085, 
/home/work/openembedded/openembedded/packages/shared-mime-info/shared-mime-info-native_0.51.bb, 
do_compile)
NOTE: package shared-mime-info-native-0.51: started
NOTE: package shared-mime-info-native-0.51-r0: task do_compile: started
ERROR: function do_compile failed
ERROR: log data follows 
(/home/work/openembedded/tmp/work/x86_64-linux/shared-mime-info-native-0.51-r0/temp/log.do_compile.24240) 

| NOTE: make -j 4
| Making check in po
| make[1]: Entering directory 
`/home/work/openembedded/tmp/work/x86_64-linux/shared-mime-info-native-0.51-r0/shared-mime-info-0.51/po' 

| rm -f missing notexist
| srcdir=. 
/home/work/openembedded/tmp/staging/x86_64-linux/usr/bin/intltool-update -m
| if [ -r missing -o -r notexist ]; then \
|       exit 1; \
|     fi
| make[1]: Leaving directory 
`/home/work/openembedded/tmp/work/x86_64-linux/shared-mime-info-native-0.51-r0/shared-mime-info-0.51/po' 

| make[1]: Entering directory 
`/home/work/openembedded/tmp/work/x86_64-linux/shared-mime-info-native-0.51-r0/shared-mime-info-0.51' 

| gcc 
-I/home/work/openembedded/tmp/staging/x86_64-linux/usr/include/libxml2 
-I/home/work/openembedded/tmp/staging/x86_64-linux/usr/include/glib-2.0 
-I/home/work/openembedded/tmp/staging/x86_64-linux/usr/lib/glib-2.0/include   
-isystem/home/work/openembedded/tmp/staging/x86_64-linux/usr/include -O2 
-Wall -Wstrict-prototypes -Wmissing-prototypes -Wwrite-strings  
-L/home/work/openembedded/tmp/staging/x86_64-linux/usr/lib 
-Wl,-rpath-link,/home/work/openembedded/tmp/staging/x86_64-linux/usr/lib 
-Wl,-rpath,/home/work/openembedded/tmp/staging/x86_64-linux/usr/lib 
-Wl,-O1 -o update-mime-database 
update_mime_database-update-mime-database.o 
-L/home/work/openembedded/tmp/staging/x86_64-linux/usr/lib -lxml2 
-lglib-2.0
| gcc 
-I/home/work/openembedded/tmp/staging/x86_64-linux/usr/include/glib-2.0 
-I/home/work/openembedded/tmp/staging/x86_64-linux/usr/lib/glib-2.0/include   
-isystem/home/work/openembedded/tmp/staging/x86_64-linux/usr/include -O2 
-Wall -Wstrict-prototypes -Wmissing-prototypes -Wwrite-strings  
-L/home/work/openembedded/tmp/staging/x86_64-linux/usr/lib 
-Wl,-rpath-link,/home/work/openembedded/tmp/staging/x86_64-linux/usr/lib 
-Wl,-rpath,/home/work/openembedded/tmp/staging/x86_64-linux/usr/lib 
-Wl,-O1 -o test-tree-magic test_tree_magic-test-tree-magic.o 
-L/home/work/openembedded/tmp/staging/x86_64-linux/usr/lib -lgio-2.0 
-lgobject-2.0 -lgmodule-2.0 -lglib-2.0
| /usr/bin/ld: cannot find -lgio-2.0
| collect2: ld returned 1 exit status
| make[1]: *** [test-tree-magic] Error 1
| make[1]: *** Waiting for unfinished jobs....
| make[1]: Leaving directory 
`/home/work/openembedded/tmp/work/x86_64-linux/shared-mime-info-native-0.51-r0/shared-mime-info-0.51' 

| make: *** [check-recursive] Error 1
| FATAL: oe_runmake failed
NOTE: Task failed: 
/home/work/openembedded/tmp/work/x86_64-linux/shared-mime-info-native-0.51-r0/temp/log.do_compile.24240 

NOTE: package shared-mime-info-native-0.51-r0: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package shared-mime-info-native-0.51: failed
ERROR: Build of 
/home/work/openembedded/openembedded/packages/shared-mime-info/shared-mime-info-native_0.51.bb 
do_compile failed
ERROR: Task 2085 
(/home/work/openembedded/openembedded/packages/shared-mime-info/shared-mime-info-native_0.51.bb, 
do_compile) failed
NOTE: Tasks Summary: Attempted 748 tasks of which 748 didn't need to be 
rerun and 1 failed.
ERROR: 
'/home/work/openembedded/openembedded/packages/shared-mime-info/shared-mime-info-native_0.51.bb' 
failed
NOTE: build 200810281535: completed

---

To install Bitbake and OpenEmbeded, I followed the instruction in 
Getting Started on openembedded site.

I am trying to compile under Linux Ubuntu 8.4 64bits.

Any help will be welcome.

-- 
Regards,
Eng. Ramon F. Lilienthal
Project Engineer
Instramed Ltda. - www.instramed.com.br
+55 (51) 33344199 ext. 213




