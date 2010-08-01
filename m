Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OfXNU-0004Fo-ER
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Aug 2010 14:10:53 +0200
Received: (qmail 26759 invoked by uid 503); 1 Aug 2010 12:28:21 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 1 Aug 2010 12:28:21 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 1 Aug 2010 14:10:27 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 1 Aug 2010 14:10:26 +0200
Message-ID: <4C556432.30906@eukrea.com>
Date: Sun, 01 Aug 2010 14:10:26 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.7) Gecko/20100713 Thunderbird/3.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <A806EA3C-FD29-40A7-82E7-9391241EF930@mac.com>	<C3A2B5D3-75D5-4A5A-843A-631916635440@mac.com>	<4C53F85C.7080301@eukrea.com>
	<7D0030BC-F8C2-479C-AF3D-072D5BD8D417@mac.com>
In-Reply-To: <7D0030BC-F8C2-479C-AF3D-072D5BD8D417@mac.com>
X-Ovh-Tracer-Id: 7219833154680696137
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Is bitbake 1.10 the latest stable version?
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
X-List-Received-Date: Sun, 01 Aug 2010 12:10:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi elvis,

Le 31/07/2010 13:24, Elvis Dowson a écrit :
> On Jul 31, 2010, at 2:18 PM, Eric Bénard wrote:
>
>>>
>> this may be because you have several BBTHREADS and thus several fetch running and outputing log at the same time.
>>
>
> With bitbake 1.8.19, I don't have that problem, as seen from the output. I have 6 threads set for make and bitbake, in the older instance, the formatting works better.
>
> NOTE: Unpacking /usr/share/sources/Python-2.6.1.tar.bz2 to tmp/work/x86_64-linux/python-native-2.6.1-ml8.2/
> NOTE: Running task 167 of 3214 (ID: 659, /tool/overo-oe/org.openembedded.dev/recipes/util-linux-ng/util-linux-ng_2.16.bb, do_fetch)
> NOTE: Running task 168 of 3214 (ID: 660, /tool/overo-oe/org.openembedded.dev/recipes/util-linux-ng/util-linux-ng_2.16.bb, do_unpack)
> NOTE: Unpacking /usr/share/sources/util-linux-ng-2.16.tar.bz2 to tmp/work/armv7a-angstrom-linux-gnueabi/util-linux-ng-2.16-r9.3/
> NOTE: Running task 169 of 3214 (ID: 2174, /tool/overo-oe/org.openembedded.dev/recipes/xorg-lib/libice_1.0.6.bb, do_setscene)
> NOTE: Running task 170 of 3214 (ID: 2824, /tool/overo-oe/org.openembedded.dev/recipes/perl/perl-native_5.8.8.bb, do_setscene)
> NOTE: Running task 171 of 3214 (ID: 2175, /tool/overo-oe/org.openembedded.dev/recipes/xorg-lib/libice_1.0.6.bb, do_fetch)
> NOTE: Running task 172 of 3214 (ID: 2825, /tool/overo-oe/org.openembedded.dev/recipes/perl/perl-native_5.8.8.bb, do_fetch)
> NOTE: Running task 173 of 3214 (ID: 2176, /tool/overo-oe/org.openembedded.dev/recipes/xorg-lib/libice_1.0.6.bb, do_unpack)
> NOTE: Running task 174 of 3214 (ID: 2826, /tool/overo-oe/org.openembedded.dev/recipes/perl/perl-native_5.8.8.bb, do_unpack)
> NOTE: Unpacking /usr/share/sources/libICE-1.0.6.tar.bz2 to tmp/work/armv7a-angstrom-linux-gnueabi/libice-1_1.0.6-r1/
> NOTE: Unpacking /usr/share/sources/perl-5.8.8.tar.gz to tmp/work/x86_64-linux/perl-native-5.8.8-r15/
> NOTE: Running task 175 of 3214 (ID: 2681, /tool/overo-oe/org.openembedded.dev/recipes/xorg-lib/libxdmcp_1.0.3.bb, do_setscene)
> NOTE: Running task 176 of 3214 (ID: 2682, /tool/overo-oe/org.openembedded.dev/recipes/xorg-lib/libxdmcp_1.0.3.bb, do_fetch)
> NOTE: Running task 177 of 3214 (ID: 2655, /tool/overo-oe/org.openembedded.dev/recipes/xorg-lib/libxau_1.0.5.bb, do_setscene)
> NOTE: Running task 178 of 3214 (ID: 2683, /tool/overo-oe/org.openembedded.dev/recipes/xorg-lib/libxdmcp_1.0.3.bb, do_unpack)
> NOTE: Unpacking /usr/share/sources/libXdmcp-1.0.3.tar.bz2 to tmp/work/armv7a-angstrom-linux-gnueabi/libxdmcp-1_1.0.3-r1/
>
try fetching several packages with bitbake 1.8.19 to have a real vs your 
previous mail (I think the log comes from the program who fetch the 
file, not from bitbake so you may get the same mixed log while several 
files are fetched at the same time)

Eric


