Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1PxMhB-0005wD-0R
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Mar 2011 17:57:09 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 51F151660448; Wed,  9 Mar 2011 09:55:31 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 8BDF21660448;
	Wed,  9 Mar 2011 09:55:29 -0700 (MST)
Message-ID: <4D77B101.4040204@mlbassoc.com>
Date: Wed, 09 Mar 2011 09:55:29 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D756D6B.9020108@mlbassoc.com> <4D77210E.8040602@gmail.com>
In-Reply-To: <4D77210E.8040602@gmail.com>
Subject: Re: Can't build gstreamer-ti
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
X-List-Received-Date: Wed, 09 Mar 2011 16:57:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/11 23:41, Khem Raj wrote:
>> | arm-angstrom-linux-gnueabi-libtool: link: warning: library
>> `/work/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgstbase-0.10.la'
>> was moved.
>> | /bin/grep:
>> /work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/lib/libgstreamer-0.10.la:
>> No such file or directory
>> | /bin/sed: can't read
>> /work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/lib/libgstreamer-0.10.la:
>> No such file or directory
>> | arm-angstrom-linux-gnueabi-libtool: link:
>> `/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/lib/libgstreamer-0.10.la'
>> is not a valid libtool archive
>>
>> Any ideas how to fix this?
>
> seems libtool is looking in machine sysroot where as it should be looking in arch sysroot
>
> could you try adding EXTRA_OECONF += "--with-libtool-sysroot=${STAGING_DIR_TARGET}" to corresponding recipe and see if that helps ?

No change, sorry.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


