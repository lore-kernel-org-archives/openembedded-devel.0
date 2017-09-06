Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A5B1D77D3A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 20:44:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v86Ki5pd027753
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Sep 2017 13:44:05 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 13:44:04 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@googlemail.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
	<1504725809-12825-30-git-send-email-mark.hatle@windriver.com>
	<CALbNGRSzEDGhGK9bA+8oUeusKVqTHoCktFRPvuVQ9OQJ_NfKvg@mail.gmail.com>
	<9fab8446-0159-e7c8-b81f-a4e7fa3a5882@windriver.com>
	<CALbNGRRQAKUNR-X1U=vdc4dEzpobc5k+b_F8cS=u2VOi04s7MA@mail.gmail.com>
	<65cc49bb-5a7e-c3f6-1e08-09a6bcb8ccab@windriver.com>
	<CALbNGRS260modGqY+bkNV+R5XiONyVcdSQpE-eYLoR47VxqsRg@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <c1bf1c61-de6e-6f5c-9130-7808c77666e5@windriver.com>
Date: Wed, 6 Sep 2017 15:44:04 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRS260modGqY+bkNV+R5XiONyVcdSQpE-eYLoR47VxqsRg@mail.gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 29/31] xfce4-mixer: Remove, gstreamer-0.10 is obsolete
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Sep 2017 20:44:05 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/6/17 3:35 PM, Andreas Müller wrote:
> On Wed, Sep 6, 2017 at 10:21 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>
>> You are missing the point.  We DO need a replacement.  However, I was unable to
>> find one.  With the few references I found when searching that there was no
>> replacement, and it was effectively obsolete (and removed in other
>> distributions), I followed their example.
>>
>> As I said in the header, I don't believe this set is completely right.  But it's
>> a first stab and what it took for me to pass the testing script.
>>
>> I am retesting with this patch and the removal of gstreamer removed from the
>> test set (it will take a while, I've got -30,000- tasks to run through for a
>> test).  It's possible that something else in the system was triggering a fault
>> that caused gstreamer-0.10 to fail and that was resolved elsewhere.
>>
>> I tested the original work against master, but rebased to master-next after
>> talking w/ Martin... I then spot checked the modified recipes that they were
>> still working after the rebase.
>>
>>> And please don't even think about running your magic script for
>>> meta-qt5-extra or send patches.
>>
>> Again, you are missing the point here.  Someone has to start this work.  It's
>> the layer maintainers decision to accept or reject the patches, not mine..  but
>> I feel it's my obligation as a community member to submit the patches I create
>> to the community layers that I use.  I also feel it's my obligation as a patch
>> submitter to explain why (or why not) they are necessary for my specific
>> use-case.  (In this case, passing a specific compatibility test script.)
>>
>> --Mark
>>
>>> Over and out
>>>
>>> Andreas
>>>
>>
> I am sure that I miss the point again but fedora - for me
> reference/inspiration many times - has no problem with xfce4-mixer
> [1].
> 
> [1] http://pkgs.fedoraproject.org/cgit/rpms/xfce4-mixer.git/tree/xfce4-mixer.spec

arch - https://bbs.archlinux.org/viewtopic.php?id=222294
debian - https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=785846
mageia - https://forums.mageia.org/en/viewtopic.php?f=15&t=10018
Fedora - https://bugzilla.redhat.com/show_bug.cgi?id=1355763

etc...  This is what I based the original commit message on.

Just an FYI, the first part of my test WITHOUT the xfce4-mixer and
gstreamer-0.10 removal just passed.  I will let it continue and will report on
the status once the full test is complete.  (full test as in bitbake world)

--Mark

> Andreas
> 


