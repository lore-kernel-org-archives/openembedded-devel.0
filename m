Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 37CBF60842
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 02:08:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6O28gMv009074
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2013 19:08:42 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 23 Jul 2013 19:08:41 -0700
Message-ID: <51EF3729.8010903@windriver.com>
Date: Wed, 24 Jul 2013 10:08:41 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1373043676-5621-1-git-send-email-otavio@ossystems.com.br>
	<5249302.LRk1iTvfYM@helios>
	<CAP9ODKoM6TGuwfAsJOJSZr+9xqGOMHmHF069ydmxX4a66L6CeA@mail.gmail.com>
	<2813811.F5BqiUbT83@helios>
In-Reply-To: <2813811.F5BqiUbT83@helios>
X-Originating-IP: [128.224.162.233]
Subject: Re: [meta-oe PATCH] busybox: Follow OE-Core update to 1.12.1 version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jul 2013 02:08:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

On 07/23/2013 08:54 PM, Paul Eggleton wrote:
> On Tuesday 23 July 2013 09:46:36 Otavio Salvador wrote:
>> On Tue, Jul 23, 2013 at 9:41 AM, Paul Eggleton
>>
>> <paul.eggleton@linux.intel.com> wrote:
>>> On Tuesday 23 July 2013 09:09:37 Otavio Salvador wrote:
>>>> On Tue, Jul 23, 2013 at 6:44 AM, Paul Eggleton
>>>>
>>>> <paul.eggleton@linux.intel.com> wrote:
>>>>> On Monday 08 July 2013 13:35:21 Paul Eggleton wrote:
>>>>>> On Friday 05 July 2013 19:45:25 Eric Bénard wrote:
>>>>>>> Le Fri, 05 Jul 2013 18:29:04 +0100,
>>>>>>>
>>>>>>> Paul Eggleton <paul.eggleton@linux.intel.com> a écrit :
>>>>>>>> Could someone *please* figure out what this bbappend is needed for
>>>>>>>> and
>>>>>>>> get
>>>>>>>> it into OE-Core if it is still needed so we can drop it here?
>>>>>>> it's only here to install /etc/default/busybox-syslog which contains
>>>>>>> only one line : OPTIONS="-C64" which sets the size of the logbuffer.
>>>>>>> So obviously this could go into OE-Core.
>>>>>> Yes but why is this needed? If we are to merge this into OE-Core we'll
>>>>>> need
>>>>>> to say why this change is needed in the commit message.
>>>>> ping...
>>>> I am working in something else so I cannot work on busybox now. Feel
>>>> free to handle this.
>>>>
>>>> The syslog support would be good to be kept.
>>> The problem is it's not clear to me what we should do here. Surely having
>>> this bbappend or not isn't the determining factor in whether we have
>>> syslog support with systemd...?
>> With systemd we shouldn't provide it but for sysv we should provide it.
> I still need to know what this is needed for. Surely it doesn't actually
> enable syslog functionality, just adds one configuration value to it? If that's
> the case, why is this configuration change needed?
>
> Cheers,
> Paul
>
Hi All,

FWIW, there are two bugs which might be related to this.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=4837
https://bugzilla.yoctoproject.org/show_bug.cgi?id=4860

My opinion is to respect the same configuration file in both sysv and 
systemd systems.
The configuration file is /etc/syslog-startup.conf.

Best Regards,
Chen Qi

