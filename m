Return-Path: <s.stirtzel@googlemail.com>
X-Greylist: delayed 415 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 May 2014 09:23:15 UTC
Received: from mail-ob0-f172.google.com (unknown [209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id BA60C65F69
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 May 2014 09:23:15 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id wp18so906301obc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 May 2014 02:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=S1iBg2hiVx0VnNJHIKa852HgS5NmrJRkz8tp8jNCKR0=;
	b=TN27+LbgFU5C/NkILie/lUh9cNxOWkGHa6mdd3X1ZS3r/MSXFXtWfT0CLhYByR9jjV
	lxxwqoB6iKE+41RSwDatjAFWUT5RhQ+LGU2Tr0U0bPren77mzOPB4r0AdtHQ+g5XehQ+
	6v6ymL0MuFHTWKFs8eiD7dmerfAaAMmTdhv4X82n1vU5MPz95O1nPduHUT0gp+IMiVkV
	cVMk7FXkUeVZWTZ/b8Ufl0kzxIXLmOxe9Ih+EloRbX6Szq3zE4NHgz+DC/64YjMUwDHB
	LVb85eK+C5EFQ6FPF5x5DWYUAhSuZN3pAFbzirbIh9IbWqtjphbWThjroLUrPperxBK7
	jN9g==
X-Received: by 10.182.165.73 with SMTP id yw9mr8773788obb.39.1400145380768;
	Thu, 15 May 2014 02:16:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.60.169.210 with HTTP; Thu, 15 May 2014 02:16:00 -0700 (PDT)
In-Reply-To: <CAP9ODKo43jUETHixm0_wBjL=zwJcb+BdgQV2MLKnte2FdCe5Mg@mail.gmail.com>
References: <1398698859-15011-1-git-send-email-otavio@ossystems.com.br>
	<20140504214712.GG2486@jama>
	<CAP9ODKpL+SMvus2o_kY_-gYgxu95E3ahiBsKwFQxQGn93f69ug@mail.gmail.com>
	<CAP9ODKo43jUETHixm0_wBjL=zwJcb+BdgQV2MLKnte2FdCe5Mg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Thu, 15 May 2014 11:16:00 +0200
Message-ID: <CAGiJk9cPtJfRwOfUB3gEsFzhLSsegSf_Fk4k_YnqJg=FsG1XoQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtbase.inc: Enable accessibility by default
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
X-List-Received-Date: Thu, 15 May 2014 09:23:16 -0000
Content-Type: text/plain; charset=UTF-8

2014-05-14 21:04 GMT+02:00 Otavio Salvador <otavio@ossystems.com.br>:
> Hello folks,
>
> On Mon, May 5, 2014 at 9:21 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> On Sun, May 4, 2014 at 6:47 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> On Mon, Apr 28, 2014 at 12:27:39PM -0300, Otavio Salvador wrote:
>>>> qtdeclarative requires accessibility to be enabled and it is added by
>>>> default to the toolchain so we ought to have it enabled to ensure the
>>>> default toolchain generation works.
>>>>
>>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ...
>>> As I told you on gtalk, I would prefer default to stay as minimal as
>>> posible, why don't you change packagegroup-qt5-toolchain-target.bb to
>>> use RRECOMMENDS instead of RDEPENDS so that missing
>>> qtquickcontrols-qmlplugins package doesn't break it when it's not
>>> available (because it's empty)?
>>
>> I don't have a strong opinion for either case however I think we ought
>> to know what other meta-qt5 users think about it.
>>
>> In support to this patch addition I think we ought to provide the most
>> used features of Qt5 working out of box to users have a good first
>> use. Special cases can customize it per need basis. I think QML is
>> common enough for us to provide full support for it by default.
>
>
> Martin and I have different views on this topic and I'd like to merge
> or drop this patch. Could people comment on this one?
>


We may want to be able to let the user choose between 2 flavors of Qt.

One of them could be a standard Qt (which is what I use), other users
seem to prefer a stripped down version with some features switched
off.

As 'Giuseppe D'Angelo <giuseppe.dangelo@kdab.com>' noted on qt-interest [1]:
"Apart from this: builds with feature switches are not really tested,
so I'm not surprised that [there are combinations that don't even
build]. But we totally welcome patches that would fix such builds."

So IMO it would be a good idea to have a constantly tested low
footprint version.

There is no one size fits all in this case, but can we provide 2
versions that work for 99% of the users?



[1] http://lists.qt-project.org/pipermail/interest/2014-May/012237.html


-- 
Regards
Samuel

