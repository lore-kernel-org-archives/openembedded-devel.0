Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1OmLhh-0001Mi-Gb
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 09:07:56 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Fri, 20 Aug 2010 09:07:32 +0200
X-TM-IMSS-Message-ID: <0e669f1500004be5@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 0e669f1500004be5 for
	<jaap.dejong@nedap.com>; Fri, 20 Aug 2010 09:07:36 +0100
Message-ID: <4C6E29B3.8050801@nedap.com>
Date: Fri, 20 Aug 2010 09:07:31 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.11) Gecko/20100713 Lightning/1.0b1 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C624772.8000607@nedap.com>	<20100811072548.GB7282@mi.fu-berlin.de>	<20100819105518.GL11569@jama>	<20100819121301.GA21426@mi.fu-berlin.de>
	<20100819122903.GM11569@jama>
In-Reply-To: <20100819122903.GM11569@jama>
X-OriginalArrivalTime: 20 Aug 2010 07:07:32.0600 (UTC)
	FILETIME=[5BFE5F80:01CB4036]
X-SA-Exim-Connect-IP: 87.249.123.12
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: problem building openjdk-6
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
X-List-Received-Date: Fri, 20 Aug 2010 07:07:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

I've read about your fix on this matter and did a complete new rebuild 
last night, but it still does not translate here.
Although the error is somewhere else.

    ///
    | checking for a xalan2 jar...
    /media/OpenEmbedded/unstable/tmp/sysroots/java/xalan2.jar
    | checking for a xalan2 serializer jar... no
    | configure: error: "A xalan2-serializer jar was not found."
    NOTE: Task failed:
    /media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/openjdk-6-jre-6b18-1.8-r10.6/temp/log.do_configure.12290
    ERROR: TaskFailed event exception, aborting
    ERROR: Build of
    /media/OpenEmbedded/unstable/org.openembedded.dev/recipes/openjdk/openjdk-6_6b18-1.8.bb
    do_configure failed
    ERROR: Task 909
    (/media/OpenEmbedded/unstable/org.openembedded.dev/recipes/openjdk/openjdk-6_6b18-1.8.bb,
    do_configure) failed
    NOTE: Waiting for 2 active tasks to finish
    NOTE: 1:
    /media/OpenEmbedded/unstable/org.openembedded.dev/recipes/mono/mono-mcs-intermediate_2.6.3.bb,
    do_compile (9520)
    NOTE: 2:
    /media/OpenEmbedded/unstable/org.openembedded.dev/recipes/busybox/busybox_1.13.2.bb,
    do_package (14124)
    NOTE: Waiting for 1 active tasks to finish
    NOTE: 1:
    /media/OpenEmbedded/unstable/org.openembedded.dev/recipes/busybox/busybox_1.13.2.bb,
    do_package (14124)
    NOTE: Tasks Summary: Attempted 3363 tasks of which 0 didn't need to
    be rerun and 1 failed.
    ERROR:
    '/media/OpenEmbedded/unstable/org.openembedded.dev/recipes/openjdk/openjdk-6_6b18-1.8.bb'
    failed


Jaap


On 08/19/2010 02:29 PM, Martin Jansa wrote:
> On Thu, Aug 19, 2010 at 02:13:01PM +0200, Henning Heinold wrote:
>    
>> On Thu, Aug 19, 2010 at 12:55:18PM +0200, Martin Jansa wrote:
>>      
>>> Hi,
>>>
>>> did you resolve it somehow? I still have the same issue on 2 hosts, 2
>>> different DISTROs and I didn't find any empty .jar or something.
>>>
>>> Regards,
>>>
>>> -- 
>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>>        
>> Hi,
>>
>> not the jars are empty, some classes inside the jar. Unfornatly I will
>> not have the time to fix this before Sept. 13
>>
>> So rebuild packages where classes inside the jars have 0 Bytes.
>>
>> Bye Henning
>>      
> Hi,
>
> found better fix and pushed it :).
>
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=a1f89a780e9900c168c165e4120cf13c21de6c0f
>
> Regards,
>
>    

