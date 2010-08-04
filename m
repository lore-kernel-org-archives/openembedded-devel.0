Received: from asmtpout027.mac.com ([17.148.16.102])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1OgYaG-0005ho-2s
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 09:40:17 +0200
MIME-version: 1.0
Received: from [192.168.1.103] ([87.201.169.38])
	by asmtp027.mac.com (Sun Java(tm) System Messaging Server 6.3-8.01
	(built Dec
	16 2008; 32bit)) with ESMTPSA id <0L6M001GQ7TJ3310@asmtp027.mac.com> for
	openembedded-devel@lists.openembedded.org; Tue,
	03 Aug 2010 23:39:23 -0700 (PDT)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 phishscore=0 bulkscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx engine=6.0.2-1004200000 definitions=main-1008030259
X-Proofpoint-Virus-Version: vendor=fsecure
	engine=2.50.10432:5.0.10011,1.0.148,0.0.0000
	definitions=2010-08-04_03:2010-08-04, 2010-08-04,
	1970-01-01 signatures=0
From: Elvis Dowson <elvis.dowson@mac.com>
Date: Wed, 04 Aug 2010 10:38:58 +0400
Message-id: <764E1214-84B1-42BB-996C-676D194F7208@mac.com>
To: OpenEmbedded Developer <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 17.148.16.102
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Error building libgles-omap3
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
X-List-Received-Date: Wed, 04 Aug 2010 07:40:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT

Hi,
      I downloaded the OMAP35x graphics sdk, and put in it my DL_DIR, which is located in /usr/share/sources, and bitbaking omap3-console-image gives me the following error.

I have created the md5 checksum, but it still complains that the checksum doesn't exist:


NOTE: Running task 3195 of 3228 (ID: 12, /tool/overo-oe/user.collection/recipes/images/omap3-console-image.bb, do_qa_staging)
NOTE: Missing checksum
ERROR: libgles-omap3-3.01.00.06: http://install.source.dir.local/OMAP35x_Graphics_SDK_setuplinux_3_01_00_06.bin has no checksum defined, cannot check archive integrity
ERROR: Error in executing: /tool/overo-oe/user.collection/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Error in executing: /tool/overo-oe/user.collection/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Build of /tool/overo-oe/user.collection/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb do_fetch failed
NOTE: Missing checksum
ERROR: omap3-sgx-modules-1.4.14.2616: http://install.source.dir.local/OMAP35x_Graphics_SDK_setuplinux_3_01_00_06.bin has no checksum defined, cannot check archive integrity


Here are the steps that I did to install the OMAP35x graphics sdk

How to install the TI OMAP35x Graphics SDK

01. Fetch the gl-es bin (full OMAP Graphics SDK) from here:

http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FDS.html

02. Put the OMAP35x_*.bin file in $DL_DIR, i.e. downloads/

mv OMAP35x_Graphics_SDK_setuplinux_3_01_00_06.bin ./downloads/

03. make the checksum file in ./downloads/ directory:

cd ./downloads/
md5sum OMAP35x_Graphics_SDK_setuplinux_3_01_00_06.bin > OMAP35x_Graphics_SDK_setuplinux_3_01_00_06.bin.md5

Best regards,

Elvis Dowson

