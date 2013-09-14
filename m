Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id A7F0460EDC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Sep 2013 14:15:16 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id k18so2254509oag.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Sep 2013 07:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=sERCUBYh2vk1eGYXt7dJ6cZRQilHXbpyo8EgXheDFyE=;
	b=B1ac36zgIjIAVuxi56uR9drWsZrrcRGGqiBr7ntllHifpzJleWw1rQz5F88lkm+mBB
	qHlumDHc1HD7S63/QgF5F9ce3gBeGXvw/YdpE+Wt7UDJrJ9GhE56w4Kh32zCBmq+joVg
	DtAVVFUDDcyVbIVh8HaW+mxWibvSVhSYFjPOhxp8ZmwUimtK1svzLYKBpOPllcr5JAo0
	SE0vL912wjomPsJdxAeFOdEzz+JDKzR/iSBrm9n9WDR2KQniAdFv3WSgyPnPRc/1RfSI
	Qf/i4gBwMa8dULLj31gzP8WEN5w9c0xwUyOdE2H1nPlEMJlv9usXiPcVjwtWb1V6vvel
	Ljlg==
MIME-Version: 1.0
X-Received: by 10.182.131.166 with SMTP id on6mr835615obb.60.1379168117965;
	Sat, 14 Sep 2013 07:15:17 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Sat, 14 Sep 2013 07:15:17 -0700 (PDT)
In-Reply-To: <5234204D.9050904@communistcode.co.uk>
References: <1379110532-29457-1-git-send-email-ml@communistcode.co.uk>
	<CAP9ODKrVsBfpHDtwp031feCOitJEG6fi=bKah4e0sH5_Wkh6cg@mail.gmail.com>
	<5234204D.9050904@communistcode.co.uk>
Date: Sat, 14 Sep 2013 11:15:17 -0300
X-Google-Sender-Auth: JqeN8WcPLFJCD2BEq31PrztAgy4
Message-ID: <CAP9ODKo91chhZhV9N=KS6XM2dSsdOEekiHsaGTUmA43K1G7KcQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Jack Mitchell <ml@communistcode.co.uk>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv5] libsoc: new recipe
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
X-List-Received-Date: Sat, 14 Sep 2013 14:15:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Sep 14, 2013 at 5:37 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
> On 09/13/13 23:22, Otavio Salvador wrote:
>>
>> On Fri, Sep 13, 2013 at 7:15 PM, Jack Mitchell <ml@communistcode.co.uk>
>> wrote:
>>>
>>> From: Jack Mitchell <jack@embed.me.uk>
>>>
>>> Signed-off-by: Jack Mitchell <jack@embed.me.uk>
>>
>> ...
>>
>> The recipe is clean now ... but ...
>>
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-support/libsoc/libsoc_0.3.bb
>>> @@ -0,0 +1,14 @@
>>> +SUMMARY = "libsoc is a C library for interfacing with common SoC
>>> peripherals through generic kernel interfaces"
>>> +HOMEPAGE = "https://github.com/jackmitch/libsoc"
>>> +
>>> +LICENSE = "LGPLv2.1"
>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=e0bfebea12a718922225ba987b2126a5"
>>> +
>>> +inherit autotools
>>> +
>>> +SRCREV = "0764ee52b590d5ccb4bd4698f0011496b536ed70"
>>> +SRC_URI = "git://github.com/jackmitch/libsoc.git"
>>> +
>>> +S = "${WORKDIR}/git"
>>> +
>>> +RDEPENDS_${PN} = "libgcc"
>>
>> I am a little concerned /why/ this is need. Your code seems quite
>> simple and I don't understand why this special need. Did you try to
>> install and use it without this RDEPENDS ? It should work just fine.
>>
>
> There seems to be a bug with the eglibc recipe as noted in a previous
> discussion [1] where pthreads requires libgcc.so to be available but it
> isn't pulled in as a requirement. Now, I believe this goes largly unnoticed
> as there are very few functions which actually require the libgcc.so lib,
> but it happens that one of the functions I use (pthread_cancel), does
> require it, so I run into this bug and as such have to depened on RDEPENDS =
> "libgcc" in order to ensure it is in the rootfs.
>
> In the next version of the library I think I am going to see if I can work
> round using pthread_cancel in favour of a less awkward function.
>
> Cheers,
> Jack.
>
> [1] http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/37086
>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

