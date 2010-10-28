Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1PBT4e-00048X-VT
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 16:03:27 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Thu, 28 Oct 2010 16:02:40 +0200
X-TM-IMSS-Message-ID: <16da13df00007285@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 16da13df00007285 for
	<jaap.dejong@nedap.com>; Thu, 28 Oct 2010 16:02:42 +0100
Message-ID: <4CC98280.2010706@nedap.com>
Date: Thu, 28 Oct 2010 16:02:40 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.11) Gecko/20101006 Lightning/1.0b2 Thunderbird/3.1.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CC14738.9070309@nedap.com>	<20101028062422.GJ3311@excalibur.local>	<AANLkTim8XTQBvv0vsZ6w4RwFWHDC3cnxa-NAa7BZcZUK@mail.gmail.com>
	<20101028074407.GK3311@excalibur.local>
In-Reply-To: <20101028074407.GK3311@excalibur.local>
X-OriginalArrivalTime: 28 Oct 2010 14:02:40.0707 (UTC)
	FILETIME=[C8E2A130:01CB76A8]
X-SA-Exim-Connect-IP: 213.160.213.92
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cacaoh: patches to get do_install do its work
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
X-List-Received-Date: Thu, 28 Oct 2010 14:03:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
my initial patch was only intended to show the error I got while 
building openjdk-6 and I hoped to trigger the maintainers to get it fixed.
If this patch has caused any inconvenience to anyone, I apologize for that.
Jaap

On 10/28/2010 09:44 AM, Stefan Schmidt wrote:
> Hello.
>
> On Wed, 2010-10-27 at 23:36, Khem Raj wrote:
>> On Wed, Oct 27, 2010 at 11:24 PM, Stefan Schmidt
>> <stefan@datenfreihafen.org>  wrote:
>>> On Fri, 2010-10-22 at 10:11, Jaap de Jong wrote:
>>>>  From 60a5f60af4ad65112452f98d99350fce45332e8e Mon Sep 17 00:00:00 2001
>>>> From: Jaap de Jong<jaap.dejong@nedap.com>
>>>> Date: Fri, 22 Oct 2010 09:28:25 +0200
>>>> Subject: [PATCH] cacaoh: patches to get do_install do its work
>>>>
>>>> Signed-off-by: Jaap de Jong<jaap.dejong@nedap.com>
>>> This patch broke the openjdk-6 testing build for me. Openjdk did not compile due
>>> to missing header files.
>>>
>>> This is with angstrom-2008.1 so no libtool 2.4. I guess that you are using
>>> angstrom-2010 and therefor the 2.4 libtool?
>>>
>> I tested it with both 2.2 ad 2.4 libtools but what Enrico suggested
>> might be a better fix.
> Hmm, that works against my theory. :)
>
> I need to wait until my build on master is ready and if it fails as well I try
> to implement Enricos suggestion.
>
> regards
> Stefan Schmidt
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


