Received: from harad.oktetlabs.ru ([89.163.14.95])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <helen@oktetlabs.ru>) id 1Q4u6u-0006g0-Em
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 14:02:52 +0200
Received: from aule.oktetlabs.ru (aule.oktetlabs.ru [192.168.37.14])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by harad.oktetlabs.ru (Postfix) with ESMTPSA id 3BCC47B4B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2011 16:00:53 +0400 (MSD)
Message-ID: <4D931B74.7020009@oktetlabs.ru>
Date: Wed, 30 Mar 2011 16:00:52 +0400
From: Elena Vengerova <helen@oktetlabs.ru>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.15) Gecko/20110307 Fedora/3.1.9-0.38.b3pre.fc13
	Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: prebuilt toolchain versus --sysroot
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
X-List-Received-Date: Wed, 30 Mar 2011 12:02:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I'm trying to use pre-built SDK. PATH, CPPFLAGS and LDFLAGS are correct. 
However configure of the first target package fails because compiler 
cannot find crt1.o. I've found out that it's due --sysroot that points 
to STAGING_DIR_TARGET.

Should I copy SDK libraries and headers to STAGING_DIR_TARGET or there 
is more correct option to resolve this issue?

Thanks,
     Elena




