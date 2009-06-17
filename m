Received: from [17.148.16.91] (helo=asmtpout016.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MGtz2-0007zL-SI
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 14:11:17 +0200
MIME-version: 1.0
Received: from [87.201.169.51] by asmtp016.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLD00ESITCWBG00@asmtp016.mac.com> for
	openembedded-devel@lists.openembedded.org; Wed,
	17 Jun 2009 05:00:38 -0700 (PDT)
Message-id: <05DB01B9-1334-4650-873E-96B20CAC9D8C@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Jun 2009 16:00:20 +0400
X-Mailer: Apple Mail (2.935.3)
Subject: glibc_2.6.1.bb - dangling symlink to /lib/libcidn-2.6.1.so
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
X-List-Received-Date: Wed, 17 Jun 2009 12:11:17 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	When I'm building glibc I get the following error message:

NOTE: Running task 547 of 581 (ID: 223, /tool/overo-oe/ 
org.openembedded.dev/recipes/glibc/glibc_2.6.1.bb, do_package)
NOTE: generation of binary locales disabled. this may break i18n!
NOTE: the following files were installed but not shipped in any package:
NOTE:   /lib/libmemusage.so
NOTE:   /lib/libcidn-2.6.1.so
NOTE: Multiple libraries (libnss_nisplus.so.2, libnss_hesiod.so.2,  
libnss_nis.so.2) found, but LEAD_SONAME 'libc.so' doesn't match any of  
them
NOTE: glibc contains dangling symlink to /lib/libcidn-2.6.1.so
NOTE: Running task 548 of 581 (ID: 204, /tool/overo-oe/ 
org.openembedded.dev/recipes/gcc/gcc-cross_4.3.3.bb, do_configure)
NOTE: Couldn't find shared library provider for libgcc_s.so.1

Is this significant?

Elvis Dowson




