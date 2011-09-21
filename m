Received: from www.dynamicdevices.co.uk ([89.200.136.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1R6LuP-00036l-CP
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 14:28:13 +0200
Received: from cpc9-live22-2-0-cust200.know.cable.virginmedia.com
	([82.42.173.201] helo=[192.168.1.102])
	by www.dynamicdevices.co.uk with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1R6LDK-0000x5-5S
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 11:43:42 +0000
Message-ID: <4E79CDE2.1040501@dynamicdevices.co.uk>
Date: Wed, 21 Sep 2011 12:43:30 +0100
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1316367951-10858-1-git-send-email-jdk@ti.com>
	<8C8866BE-2C89-4CDA-9FB1-94D0920ABCD0@dominion.thruhere.net>
	<CA+T6QPnbhrWRq_JELkfGSXn_RdqzpfKL7TZ7W4QKK++GPev+Yg@mail.gmail.com>
	<CAD=GYpYjWGaHWk0bsADxS6JE7TRbFCQU_Tixec3fSRLStdxtJg@mail.gmail.com>
	<D66610DE-8119-4D54-BCEF-70D7A85122BF@beagleboard.org>
	<CAD=GYpZo30VNWEQu7uD2JvegNv9u-NRrDn0fBEM-fKB=ZX9YiA@mail.gmail.com>
	<CA+T6QPnT_5jKcghy3kT=8K0qbwq2fEtG51gJjnxq4GoVkkLAiw@mail.gmail.com>
In-Reply-To: <CA+T6QPnT_5jKcghy3kT=8K0qbwq2fEtG51gJjnxq4GoVkkLAiw@mail.gmail.com>
Subject: Python 2.7.1 support in OpenEmbedded
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
X-List-Received-Date: Wed, 21 Sep 2011 12:28:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I've been trying to build the 2.7.1 Python recipe. The recipe
seems to build and deploy successfully but when I run python
on the target for test I see

ImportError: No module named _weakrefset

Given it is non-default, I'm wondering if the 2.7.1 recipe
is not currently usable in which case I'll revert back to
2.6.6?

The two changes I made to python/python.inc were:

DEFAULT_PREFERENCE = "-27"
PYTHON_MAJMIN = "2.7"

Thanks,

Alex

Dynamic Devices Ltd
http://www.dynamicdevices.co.uk



