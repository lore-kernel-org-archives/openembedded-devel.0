Received: from mail-oa0-f46.google.com ([209.85.219.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UXE1B-0002aA-Tb
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 19:07:11 +0200
Received: by mail-oa0-f46.google.com with SMTP id k3so699340oag.19
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2013 09:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=/7LaZZ3ms2udDCEGVZ+wpeESA24CPq+RqeWYuA2yHvQ=;
	b=xdu53hBQuZ6St9VtWGOZIQ7NXpo8VklKJLNzotXq/107oJHI/L+5W9/ij+NJHmYj0g
	2b5FRTftjeWpXw9ZNtUI27qIB16P6hdfl5g7Q2hh3ndQsLkTKbh+kmZzocv5A0t3WZ3A
	MDic+TTSDeDjj5Q7XAHHs1+0mqer9Qoj/CrttC/+TPc776ki4tIP2St6vCC7f66n8CBX
	pAeJzzVS9MRGLgj5MRDpq4HiKvrz3Bf7o+rFFNB8CDcyu2PbW3yCF3ERHeYHwAYN8Ww6
	gR4ZlsbXOvAVjVMfY58Q2mUZWPE9Gnt7Xj/mmZ9k+Z3mhOEcu7numVsxiHrWBn8bBbAL
	zn/w==
MIME-Version: 1.0
X-Received: by 10.60.35.197 with SMTP id k5mr30767376oej.138.1367340554354;
	Tue, 30 Apr 2013 09:49:14 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Tue, 30 Apr 2013 09:49:14 -0700 (PDT)
In-Reply-To: <CALbNGRQH1DbJXwONhYrZ6x0Lze38xtndUfs+mDcenxLZ-DD8Jg@mail.gmail.com>
References: <CAP9ODKpttkSQqRinJQWmDhWTeE+iXJWnLBDqZ1rsath6tJ2Xmw@mail.gmail.com>
	<CAJTo0LaF8rOcnfVFhqwrtsfAK3Pu4i79Zz27RV7XPpdo0UZU1Q@mail.gmail.com>
	<CAP9ODKrUJgBvJSocDxp15PtLtP8ObW-+-OgdedbSDt=1ALR9ow@mail.gmail.com>
	<CALbNGRQH1DbJXwONhYrZ6x0Lze38xtndUfs+mDcenxLZ-DD8Jg@mail.gmail.com>
Date: Tue, 30 Apr 2013 13:49:14 -0300
X-Google-Sender-Auth: 9VG6SVQBax-wCmwJoA57kuZxAy0
Message-ID: <CAP9ODKp-g7F8z30mdstCR_2zska_eeaeYcF7qmpMzLTZCZ5Hfg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 30 Apr 2013 17:07:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2013 at 12:33 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Tue, Apr 30, 2013 at 5:22 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> On Tue, Apr 30, 2013 at 11:58 AM, Burton, Ross <ross.burton@intel.com> w=
rote:
>>> On 30 April 2013 15:42, Otavio Salvador <otavio@ossystems.com.br> wrote=
:
>>>> Hello,
>>>>
>>>> Did someone see:
>>>>
>>>> | metatree.c:71:1: error: unknown type name 'GStaticRWLock'
>>>> | metatree.c:71:38: error: 'G_STATIC_RW_LOCK_INIT' undeclared here
>>>> (not in a function)
>>>> | metatree.c: In function 'meta_tree_ref':
>>>
>>> Those APIs are deprecated in new GLibs, so maybe you've a newer GLib
>>> and an older gvfs, potentially one that is disabling deprecated code
>>> (which is bad form, and shouldn't be done in GNOME these days afaik).
>>
>> I think you're  right as it used to work fine and now it broke.
>>
>> It seems meta-gnome will need some love with master updates now :-)
>>
> A never ending love story :)

Did you start looking at these? or should I do?

I don't really need it for today so I can call it a (two) day ;-)

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


