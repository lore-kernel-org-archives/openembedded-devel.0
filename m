Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 73054706B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Feb 2015 12:56:28 +0000 (UTC)
Received: by yhl29 with SMTP id 29so9833136yhl.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Feb 2015 04:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=RreIPJkrKDUE+OVFxIXAG1K7XJqy5vfr+I3M7MirX6s=;
	b=ucAjcCz0ShjRpfkHz54BwARPjH9PYjpS5mYLZYDWARzykVQp0XCM7u7XXpm0A0l8Io
	NP6gmmQwoS+tHMRUGKKf0StRly7cxEEtYEdK+xRMFAazzbEN0NHa2wTgg7hdJAQ0MbG7
	Xo7fKAqDJPQ5IY6pxViG/L/5l5KyekT/5qixp9cQ9xPCEinHKgh64IAzwjAqv5Fi1L6d
	lV/MRGQNWIZefCiVuwMyK7A0rvnPIt5nw+iillMRsxSp/ZsBdj1dwmXoQ/uaSjnoC8aN
	ScXSxs5/3D8wlanXcb/8dzHZu+68+8paOOHyKVrTad9lYkfeT3TGMxp6iPpCX7Rj2iRN
	kDzA==
MIME-Version: 1.0
X-Received: by 10.236.229.200 with SMTP id h68mr9569193yhq.90.1424696189746;
	Mon, 23 Feb 2015 04:56:29 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Mon, 23 Feb 2015 04:56:29 -0800 (PST)
In-Reply-To: <20150223125154.GA3630@piout.net>
References: <1424293077-4542-1-git-send-email-alexandre.belloni@free-electrons.com>
	<CAP9ODKpDUaOjV=qMHzDUgZ4aiCgV2iPs0rWYzSGFTdQ1Jj1gOA@mail.gmail.com>
	<20150223125154.GA3630@piout.net>
Date: Mon, 23 Feb 2015 09:56:29 -0300
X-Google-Sender-Auth: gPC1Q2zFW6QkAJdNqPX8cu4KHZU
Message-ID: <CAP9ODKpLuvNLkr9-yTZcY-9MmJEY1_qYznzuVsyPJiBcjSDo3g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][dizzy][PATCH] qmake5: don't always look in directories recursively
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
X-List-Received-Date: Mon, 23 Feb 2015 12:56:35 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 23, 2015 at 9:51 AM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> Hi,
>
> (I was not in copy of your reply)
>
> On 19/02/2015 at 17:07:43 -0200, Otavio Salvador wrote :
>> > diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
>> > index bb0bcdcac0af..22f0d30e0298 100644
>> > --- a/recipes-qt/qt5/qt5.inc
>> > +++ b/recipes-qt/qt5/qt5.inc
>> > @@ -18,6 +18,8 @@ OE_QMAKE_PATH_SETTINGS = "${OE_QMAKE_PATH_QT_SETTINGS}"
>> >  OE_QMAKE_PATH_EXAMPLES = "${OE_QMAKE_PATH_QT_EXAMPLES}"
>> >  OE_QMAKE_PATH_TESTS = "${OE_QMAKE_PATH_QT_TESTS}"
>> >
>> > +OE_QMAKE_RECURSIVE = ""
>>
>> Shouldn't this to be done for qtbase only?
>
> No, this has to be done for all the qt packages. The packages exhibiting
> the problem are qtdeclarative and qt3d.
> That fix is coming from a discussion I had with people from the QT
> Company.
>
> Actually, I think -r shouldn't be the default but let's not break
> current users of the qmake5 class.

In this case, yes. But I would than prefer if you could change the
default in a following commit so people can refer it if there are
problems.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

