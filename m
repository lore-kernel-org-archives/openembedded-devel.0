Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QCJc6-0005VR-Ba for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 00:41:44 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QCJZp-0003UK-VG for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 00:39:21 +0200
Received: from adsl-76-205-222-174.dsl.snlo01.sbcglobal.net ([76.205.222.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 00:39:21 +0200
Received: from harvey.tim by adsl-76-205-222-174.dsl.snlo01.sbcglobal.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 00:39:21 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Tim Harvey <harvey.tim@gmail.com>
Date: Tue, 19 Apr 2011 15:39:10 -0700
Message-ID: <iol2ud$8ir$1@dough.gmane.org>
References: <4D756D6B.9020108@mlbassoc.com> <4D77210E.8040602@gmail.com>
	<4D77B101.4040204@mlbassoc.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: adsl-76-205-222-174.dsl.snlo01.sbcglobal.net
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
In-Reply-To: <4D77B101.4040204@mlbassoc.com>
X-TagToolbar-Keys: D20110419153909992
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
X-List-Received-Date: Tue, 19 Apr 2011 22:41:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2011 08:55 AM, Gary Thomas wrote:
> On 03/08/11 23:41, Khem Raj wrote:
>>> | arm-angstrom-linux-gnueabi-libtool: link: warning: library
>>> `/work/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgstbase-0.10.la'
>>>
>>>
>>> was moved. | /bin/grep:
>>> /work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/lib/libgstreamer-0.10.la:
>>>
>>>
>>> No such file or directory | /bin/sed: can't read
>>> /work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/lib/libgstreamer-0.10.la:
>>>
>>>
>>> No such file or directory | arm-angstrom-linux-gnueabi-libtool:
>>> link:
>>> `/work/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/lib/libgstreamer-0.10.la'
>>>
>>>
>>> is not a valid libtool archive
>>>
>>> Any ideas how to fix this?
>>
>> seems libtool is looking in machine sysroot where as it should be
>> looking in arch sysroot
>>
>> could you try adding EXTRA_OECONF +=
>> "--with-libtool-sysroot=${STAGING_DIR_TARGET}" to corresponding
>> recipe and see if that helps ?
>
> No change, sorry.
>

I don't see that this ever got resolved - I still run into it at least 
with release-2012-03.

The issue seems to have cropped up now that sysroot support was added to 
libtool in 2.4 and now the code in autotools.bbclass kicks in that adds 
--with-libtool-sysroot=${STAGING_DIR_HOST} to configur opts in oe_runconf.

Should that be --with-libtool-sysroot=${STAGING_TARGET_DIR} (arch vs 
machine) instead?  I would think that most things are arch dependent but 
that some things would be machine dependent.

Tim



