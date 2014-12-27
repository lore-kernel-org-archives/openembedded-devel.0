Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 155B97282E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 19:59:36 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id z6so5753714yhz.16
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 11:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=jxAsTknUm+YhJauUFjHVWyeTJyppSDcGI6qnfCm7PpY=;
	b=el6sTjNRK9zTxNqnw1LbPKO5awUNc4wvRL3MZTVlqTpKhhY2uzRHYSfe8WllnF4SAN
	we/SuVmKEctrXzpLkXqA8L5rQBGmxETCuHoP8iNWu/5pmuztkKMVXQaYoMC0P3Zzwla1
	vFZ3sp632cwJSlVjQoYFNYJH2aa5nyCLNJtEfcVPD4bu2lYK4+tBNU17r94suNUKi/OI
	foMgDXSH9Y+Nz3tEW9Dvc2ZqzMrB2yh3fYTLMycEmaNQB6jtV6vSA52L4enOG0ZkmPQF
	S51SlYaPGQfukWfIRT6k3q4ISw38K+WkiYxRgRf9j8c5kv/kFnKumQ4Iw+1VyLSdvWsr
	bT2Q==
MIME-Version: 1.0
X-Received: by 10.170.99.6 with SMTP id q6mr5084678yka.105.1419710376898; Sat,
	27 Dec 2014 11:59:36 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Sat, 27 Dec 2014 11:59:36 -0800 (PST)
In-Reply-To: <549F0F3B.4010901@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
	<c46d487b35f71ff4a9ecbc02ab17fde4ddd0a506.1419700394.git.akuster808@gmail.com>
	<CAP9ODKpBgYNd7+=D6+9LwP1ndYQ9w4cga2QVLxLfVJG74dSFEw@mail.gmail.com>
	<549F0F3B.4010901@gmail.com>
Date: Sat, 27 Dec 2014 17:59:36 -0200
X-Google-Sender-Auth: jgdU0WFugYqif3r3CFMluyMLSB4
Message-ID: <CAP9ODKo48UgE7HYKcX1Ay1=rGoj9Utm-=+yWvy90P-OD3BEv6Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 11/27] lvm2: add lvm.con to CONFFILES
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
X-List-Received-Date: Sat, 27 Dec 2014 19:59:39 -0000
Content-Type: text/plain; charset=UTF-8

Ok, you got me. Go ahead and merge it as is.

On Sat, Dec 27, 2014 at 5:57 PM, akuster808 <akuster808@gmail.com> wrote:
> Hmm, I got it that way from Master.
>
> do we really fix that ?
>
> - armin
>
>
> On 12/27/2014 11:27 AM, Otavio Salvador wrote:
>>
>> There is a typo in the short log. *conf*.
>>
>> On Sat, Dec 27, 2014 at 3:21 PM, Armin Kuster <akuster808@gmail.com>
>> wrote:
>>>
>>> From: Liu Jian <jian.liu@windriver.com>
>>>
>>> * Files will be over written when updating using rpm.
>>>
>>> * If there is no %config micro before the file in the spec file,
>>>    this file will be over-written after updating this package
>>>    using rpm. This will make our settings lost.
>>>
>>> Signed-off-by: Jian Liu <jian.liu@windriver.com>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>> ---
>>>   meta-oe/recipes-support/lvm2/lvm2.inc | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc
>>> b/meta-oe/recipes-support/lvm2/lvm2.inc
>>> index 1bbb158..42f6e3a 100644
>>> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
>>> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
>>> @@ -48,3 +48,5 @@ FILES_${PN} += "${libdir}/device-mapper/*.so
>>> ${base_libdir}/udev"
>>>   FILES_${PN}-dbg += "${libdir}/device-mapper/.debug"
>>>
>>>   RDEPENDS_${PN} = "bash"
>>> +
>>> +CONFFILES_${PN} += "${sysconfdir}/lvm/lvm.conf"
>>> --
>>> 1.9.1
>>>
>>
>>
>>
>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

