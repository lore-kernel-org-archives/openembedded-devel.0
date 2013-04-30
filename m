Received: from mail-ve0-f178.google.com ([209.85.128.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UXERf-0005cJ-A4
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 19:34:36 +0200
Received: by mail-ve0-f178.google.com with SMTP id c13so593624vea.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2013 10:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=oYM2r/w6ieaYiTnBYIr9Beh3bkIMOTRts5nk6kCQOXg=;
	b=f/zrfhOW4hnfJDB5/7UTLyKuzEiLuyz5mF4JNpxm359KFChEMXvzRU8YUda3olpASH
	NDktvyQ8s5Rc8dDbO6oUOC25Afo8FK2j7f86cFyPiVk8SZfsNf983/sjlATlZ/MwJPOI
	h+V/UipN6p00MkAOn4mkYbpVuzePWhEJVD4v+/lvS3Ep8ARH9uespekvtjh/57Tpa8bs
	hcYtNBxODAIZXzL0iS4dTAPDWvu7spBMrtgyFH8QZyFVfDq5+PKly0FnGwv1b5eWfQBh
	6HT/sAKmILAtRV+7vYiTJhhZnueUDPU0Uwm8YA4jT+n3EqiFfY1Eb9ozdWOZ1nqK9QEc
	7Z6w==
MIME-Version: 1.0
X-Received: by 10.220.78.131 with SMTP id l3mr3221247vck.54.1367342195866;
	Tue, 30 Apr 2013 10:16:35 -0700 (PDT)
Received: by 10.52.183.36 with HTTP; Tue, 30 Apr 2013 10:16:35 -0700 (PDT)
In-Reply-To: <CAP9ODKp-g7F8z30mdstCR_2zska_eeaeYcF7qmpMzLTZCZ5Hfg@mail.gmail.com>
References: <CAP9ODKpttkSQqRinJQWmDhWTeE+iXJWnLBDqZ1rsath6tJ2Xmw@mail.gmail.com>
	<CAJTo0LaF8rOcnfVFhqwrtsfAK3Pu4i79Zz27RV7XPpdo0UZU1Q@mail.gmail.com>
	<CAP9ODKrUJgBvJSocDxp15PtLtP8ObW-+-OgdedbSDt=1ALR9ow@mail.gmail.com>
	<CALbNGRQH1DbJXwONhYrZ6x0Lze38xtndUfs+mDcenxLZ-DD8Jg@mail.gmail.com>
	<CAP9ODKp-g7F8z30mdstCR_2zska_eeaeYcF7qmpMzLTZCZ5Hfg@mail.gmail.com>
Date: Tue, 30 Apr 2013 19:16:35 +0200
Message-ID: <CALbNGRR_5sB2_-3Vq9VmkA74EczYNm1jTUSe4MuL4Ljww4fVJQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome] gvfs build error
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
X-List-Received-Date: Tue, 30 Apr 2013 17:34:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2013 at 6:49 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Tue, Apr 30, 2013 at 12:33 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Tue, Apr 30, 2013 at 5:22 PM, Otavio Salvador
>> <otavio@ossystems.com.br> wrote:
>>> On Tue, Apr 30, 2013 at 11:58 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>>>> On 30 April 2013 15:42, Otavio Salvador <otavio@ossystems.com.br> wrot=
e:
>>>>> Hello,
>>>>>
>>>>> Did someone see:
>>>>>
>>>>> | metatree.c:71:1: error: unknown type name 'GStaticRWLock'
>>>>> | metatree.c:71:38: error: 'G_STATIC_RW_LOCK_INIT' undeclared here
>>>>> (not in a function)
>>>>> | metatree.c: In function 'meta_tree_ref':
>>>>
>>>> Those APIs are deprecated in new GLibs, so maybe you've a newer GLib
>>>> and an older gvfs, potentially one that is disabling deprecated code
>>>> (which is bad form, and shouldn't be done in GNOME these days afaik).
>>>
>>> I think you're  right as it used to work fine and now it broke.
>>>
>>> It seems meta-gnome will need some love with master updates now :-)
>>>
>> A never ending love story :)
>
> Did you start looking at these? or should I do?
>
> I don't really need it for today so I can call it a (two) day ;-)
>
> --
I did already: If I am not mistaken there was a patch for this
mainline on the way to 1.12.0. I will try to update to 1.12.3 and see
how far I get. A bit frightens me the (hopefully optional) support of
udisks2...

Andreas


