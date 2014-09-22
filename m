Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 405A27148C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Sep 2014 12:28:08 +0000 (UTC)
Received: by mail-yh0-f41.google.com with SMTP id b6so1928196yha.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Sep 2014 05:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=ocrFnSGWjGSno5UcRzs5wR1TPGGRtcJLmboDDpPyLrc=;
	b=vcp9rJ518ZGiSreebG9+O8eoZjbDdmoiTyvxvyOAVAf5WWv3/1Zd/LOGsXXWkxJJrX
	KmJIiJBn4yYSLQjsMW9UFWuuw34i7BiLujoweHePgqmAI7cLIqhkCtg34idTq7P2KsM7
	pHqvckc5eOrgEJbp+4T0TbZDaDvD9AHtimgofB+ZBOe1Ad2HGn16fgs4zM6H7blIraPg
	+ovp0n1agnxV6XoooB/hlZzGhdWE32sJn3dFMmUJUkGkEThKePaEV4/0GCu+5qWCxB1Y
	nidB7xUQvbt66X6QhK+oMbjuq/PQEKsVPwuGJ33niddOESA/Dji58GYg+loLEKui+e1h
	ZBUQ==
MIME-Version: 1.0
X-Received: by 10.236.229.138 with SMTP id h10mr124028yhq.122.1411388889642;
	Mon, 22 Sep 2014 05:28:09 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.44.19 with HTTP; Mon, 22 Sep 2014 05:28:09 -0700 (PDT)
In-Reply-To: <5412139F.1060601@phoenixsoftware.it>
References: <54107627.9060100@phoenixsoftware.it>
	<CAP9ODKqdRy6_uoebjWjZPSDQCUOPTTpz+D1se0MmN=pRtmwirQ@mail.gmail.com>
	<5412139F.1060601@phoenixsoftware.it>
Date: Mon, 22 Sep 2014 09:28:09 -0300
X-Google-Sender-Auth: AgqHdUzJ_FJdmkg5OrCkvQ6hxxE
Message-ID: <CAP9ODKoXTSVGaqFNychd9mwT7yYwep3E-OLMK+zNyr60-2zFiQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5] [daisy] qtwayland fetch fail
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
X-List-Received-Date: Mon, 22 Sep 2014 12:28:10 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 11, 2014 at 6:26 PM, Pierluigi Passaro <
pierluigi.passaro@phoenixsoftware.it> wrote:

> On 11/09/2014 22:32, Otavio Salvador wrote:
>
>> On Wed, Sep 10, 2014 at 1:02 PM, Pierluigi Passaro
>> <pierluigi.passaro@phoenixsoftware.it> wrote:
>>
>>> Hi all,
>>> working on daisy, it looks like the fetching url of qtwayland is no
>>> longer
>>> available.
>>>
>>> The following patch helped me to solve the problem, hope it will help...
>>>
>> I did a patch using 5.4 as branch, for master. Can you test if it also
>> works for you?
>>
> The branch "5.4" is fine: the daisy SRCREV 573d0ee5ba86d99095f217ea9e19172bfc5e75fd
> is dated March 19 and "5.4" has been branched from "dev" a month ago, so
> this SRCREV is available in both.
>
> Please, if possible, keep alligned SRCREV in both qtwayland_git.bb and
> qtwayland-native_git.bb: in daisy, only qtwayland_git.bb was updated and
> qtwayland-native_git.bb has been kept older.
>

I fixed this in daisy please try it out.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

