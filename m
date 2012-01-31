Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Rs3Dq-0008MN-6R
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 03:13:27 +0100
Received: (qmail 15687 invoked by uid 1003); 31 Jan 2012 02:05:31 -0000
Received: from unknown (HELO ?192.168.1.104?)
	(philip@opensdr.com@96.240.160.175)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	31 Jan 2012 02:05:31 -0000
Message-ID: <4F274C69.50800@balister.org>
Date: Mon, 30 Jan 2012 21:05:29 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAAQYJAtg4nTEypofzvD+XgCs5wqi38ubs1hvD+fL7v+H-jJA5w@mail.gmail.com>	<4F27222F.4000305@emagii.com>
	<4F272EFF.8@emagii.com>
In-Reply-To: <4F272EFF.8@emagii.com>
X-Enigmail-Version: 1.1.2
Subject: Re: [oe-classic] schroedinger build failure
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
X-List-Received-Date: Tue, 31 Jan 2012 02:13:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/30/2012 06:59 PM, Ulf Samuelsson wrote:
> 2012-01-31 00:05, Ulf Samuelsson skrev:
>> 2012-01-06 01:55, Andrea Adami skrev:
>>> Hint for the developers still using the org.openembedded.dev
>>> repository (oe-classic): i bump this old thread because apparently the
>>> issue is not fixed and the build of schroedinger fails as reported on
>>> #oe by new guests.
>>>
>>> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/032042.html
>>>
>>>
>>> I'm sorry but I don't work anymore on oe-classic so can't commit the
>>> patch for orc, maybe the issue can be resolved properly using the
>>> latest versions.
>>>
>>
>> The problem seems to be that Philip upgraded orc from orc-0.4.11 to
>> orc-0.4.16.
>>
>> Here is the log from the recipes/orc directory.
>> First 0.4.10 is added by Paul Menzel,
>> then 0.4.12 is removed because it is broken (by Henning Heinold)
>> who also adds, 0.4.13, but disables it when it is found to break
>> "schroedinger".
>> Paul then adds 0.4.11 which still works.
>> At the end Philip adds 0.4.16, which again breaks "schroedinger".
>>
>> I guess that in orc-0.4.12 the header functionality needed by
>> schroedinger is removed
>> so the solutions seems to be to
>> 1. disable the 0.4.16 or
>> 2. patch 0.4.16 to have the headers needed by schroedinger.
>>
>> Philip indicates that earlier versions generates seg-faults.
>> Can't comment on that.
>>
>> The reference to uhd seems to be something only a tiny minority is
>> interested in.
>> Maybe that can be handled in a local PREFERRED_VERSION.
>>
> Or why not try the obvious, upgrade schroedinger to 1.0.11.
> That seems to work...

I have a lot of hatred for the orc/schroeddinger version pinning. I fell
over this recently, but thought I hadn't pushed the orc update. Sorry
about that.

Philip

> 
> BR
> Ulf
> 
> 
> 
>> -------------------------------------
>>
>> $ git log recipes/orc
>>
>> commit f6df1033722a95ffbfe50e9725af5ac966edd248
>> Author: Philip Balister <philip@balister.org>
>> Date:   Fri Dec 9 08:24:23 2011 -0500
>>
>>     orc : Update to 0.4.16 per customer request.
>>
>>     uhd needs at least 0.4.12. oe-core already has 0.4.14, so
>> hopefully this
>>     does not have the segfault issues reported with other versions of
>> orc.
>>
>>     Signed-off-by: Philip Balister <philip@balister.org>
>>
>> commit b5a7a87e736b29307ba889e3c3d1e0ad4a631294
>> Author: Paul Menzel <paulepanter@users.sourceforge.net>
>> Date:   Wed Apr 20 11:50:37 2011 +0200
>>
>>     orc: add version 0.4.11
>>
>>     This version is build tested using `angstrom-2010.x` and
>> `minimal{,-uclibc}` f
>>
>>     Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
>>     Acked-by: Peter Gsellmann <pgsellmann@portner-elektronik.at>
>>
>> commit ddc04b7af7747c9f3fa79826aeb70ca38aa39ddb
>> Author: Henning Heinold <heinold@inf.fu-berlin.de>
>> Date:   Wed Apr 20 20:53:12 2011 +0200
>>
>>     orc: DP=-1 for 0.4.13 and some fixups
>>
>>     * use DEFAULT_PREFERENCE=-1 for 0.4.13 because its breaks
>> schroedinger
>>       and segfaults on debian unstable
>>     * remove unpinned versions
>>     * switched ot INC_PR
>>
>> commit f3dcc0656e356104d9c5ea3abcbef0c3a2e0c1bb
>> Author: Henning Heinold <heinold@inf.fu-berlin.de>
>> Date:   Tue Apr 19 14:20:04 2011 +0200
>>
>>     orc: add new version 0.4.13 and remove non-working 0.4.12
>>
>> commit f211e50085abf82a390876e50035a8a39ff5e77f
>> Author: Paul Menzel <paulepanter@users.sourceforge.net>
>> Date:   Thu Mar 24 10:21:23 2011 +0100
>>
>>     orc: add version 0.4.10
>>
>>
>>
>>
>>
>>
>>
>>> Regards
>>>
>>> Andrea
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 


