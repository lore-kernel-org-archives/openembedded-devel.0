Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PxRQO-0005pM-Tm
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Mar 2011 23:00:09 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PxROm-0004N3-Od from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Mar 2011 13:58:28 -0800
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 9 Mar 2011 13:58:28 -0800
Received: from [172.30.80.238] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Wed, 9 Mar 2011 13:58:28 -0800
Message-ID: <4D77F7FB.70308@mentor.com>
Date: Wed, 9 Mar 2011 14:58:19 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1299679954.22332.8.camel@gnutoo-laptop>
	<4D77E827.3090400@gmail.com>
In-Reply-To: <4D77E827.3090400@gmail.com>
X-OriginalArrivalTime: 09 Mar 2011 21:58:28.0578 (UTC)
	FILETIME=[1F450C20:01CBDEA5]
Subject: Re: fennec build problem
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
X-List-Received-Date: Wed, 09 Mar 2011 22:00:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2011 01:50 PM, Jan Paesmans wrote:
> As far as I know, it seems like a missing dependency, gconf2 is provided
> by the gconf recipe but I didn't find any immediate dependencies on
> gconf. Or maybe there is something wrong in the configuration step for
> fennec that should disable the use of gconf.
> Looking at the rest of the libraries used, there might the more missing
> dependencies or missing disables in the configuration step of fennec.

Thinking back to
679a2367acde02f76f43f446c56c1eefed4e69c0 last year, I would be 
unsurprised if there weren't more implicit deps in both firefox and fennec.

[snip]
>> here's a grep for -lgconf-2:
>> gnutoo@gnutoo-laptop:~/embedded/oe/oetmps/nokia900/work/armv7a-oe-linux-gnueabi/fennec-1_2.0+4.0b3pre-r0/mozilla-central/objdir/xulrunner$ grep "\-lgconf-2" -r *
>>
>> config/autoconf.mk:MOZ_GNOMEUI_LIBS = -pthread -lgnomeui-2 -lSM -lICE
>> -lbonoboui-2 -lgnomevfs-2 -lgnomecanvas-2 -lgnome-2 -lpopt -lbonobo-2
>> -lbonobo-activation -lORBit-2 -lart_lgpl_2 -lgtk-x11-2.0 -lgdk-x11-2.0
>> -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0
>> -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgconf-2 -lgmodule-2.0
>> -lgobject-2.0 -lgthread-2.0 -lrt -lglib-2.0
>>
>> config/autoconf.mk:MOZ_GNOMEVFS_LIBS = -pthread -lgnomevfs-2 -lgconf-2
>> -lgmodule-2.0 -lgobject-2.0 -lgthread-2.0 -lrt -lglib-2.0
>>
>> config/autoconf.mk:MOZ_GCONF_LIBS = -pthread -lgconf-2 -lgobject-2.0
>> -lgthread-2.0 -lrt -lglib-2.0
>>
>> config.status:s%@MOZ_GNOMEVFS_LIBS@%-pthread -lgnomevfs-2 -lgconf-2
>> -lgmodule-2.0 -lgobject-2.0 -lgthread-2.0 -lrt -lglib-2.0%g
>>
>> config.status:s%@MOZ_GCONF_LIBS@%-pthread -lgconf-2 -lgobject-2.0
>> -lgthread-2.0 -lrt -lglib-2.0%g
>>
>> config.status:s%@MOZ_GNOMEUI_LIBS@%-pthread -lgnomeui-2 -lSM -lICE
>> -lbonoboui-2 -lgnomevfs-2 -lgnomecanvas-2 -lgnome-2 -lpopt -lbonobo-2
>> -lbonobo-activation -lORBit-2 -lart_lgpl_2 -lgtk-x11-2.0 -lgdk-x11-2.0
>> -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0
>> -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgconf-2 -lgmodule-2.0
>> -lgobject-2.0 -lgthread-2.0 -lrt -lglib-2.0%g
>>
>> Note that it need a modified autoconf.inc, that I will send for
>> review(as it's core).

Most of these should be pretty easily mappable to recipes and made sure 
we have explicit deps for them.

-- 
Tom Rini
Mentor Graphics Corporation


