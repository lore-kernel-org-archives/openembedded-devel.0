Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 770256E97D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 12:52:01 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id v1so537120yhn.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 04:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=NjcBGCmLff+TPSYLVCS3i/xGsNX639vJaq+ujDeeT9M=;
	b=NcO+RzgK601gWXJ6uOlFFbMQzmvTYCyqe3abaArCQotQNa3/l079KS2oHzg6HYOPNk
	8Y/U8I+zpXZgdEZZ6Pz323mnylwouUPBnT6Pwg03LdVsIx50loizMcuc5NW78zMAzgHM
	8c2tg0C/fCpJuWNgUJ4fyNeCDlD2+G9w+BXmvcu42eQ0yBItNMzn7DdOeM1/QGOjOfGf
	imHg2JK4JSRnbfAoj0XzH04KjF6W2FQCy5siCx0ciXnJ4TwTqxWiERfX2Y8hzXPI0uHT
	2eqR/1/WlV+n3lqvt9dXWHYp/SzYMUw2Jm8k8Q2H4iU4PzSCeEL89joyMyVBLD6NWxOw
	KLZQ==
MIME-Version: 1.0
X-Received: by 10.236.158.226 with SMTP id q62mr2956570yhk.2.1392900722562;
	Thu, 20 Feb 2014 04:52:02 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Thu, 20 Feb 2014 04:52:02 -0800 (PST)
In-Reply-To: <20140220124257.GE3854@jama>
References: <1392780156-11122-1-git-send-email-otavio@ossystems.com.br>
	<20140220121807.GD3854@jama>
	<CAP9ODKqGy4-cOisGa-cV06kHAs7UKt_=yM+Mv6=W-uyuj5RFfA@mail.gmail.com>
	<20140220124257.GE3854@jama>
Date: Thu, 20 Feb 2014 09:52:02 -0300
X-Google-Sender-Auth: LZB16aAod6Tx83nIviJ14LHQM2Y
Message-ID: <CAP9ODKr8SiapiTLMDheV1G+S-=DuZoQr_jJ0PLjZpGv7iddv-A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qmake5_base.bbclass: Use Qt version specific paths
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
X-List-Received-Date: Thu, 20 Feb 2014 12:52:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 20, 2014 at 9:42 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Feb 20, 2014 at 09:22:03AM -0300, Otavio Salvador wrote:
>> Martin,
>>
>> On Thu, Feb 20, 2014 at 9:18 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > On Wed, Feb 19, 2014 at 12:22:36AM -0300, Otavio Salvador wrote:
>> >> When looking for Qt5 components and files we ought to use the Qt5
>> >> specific path. In case the distribution wants to have a flat tree it
>> >> can set QT_DIR_NAME and it will still works as expected.
>> >
>> > NAK
>> >
>> > I don't think this is good idea, end-user applications shouldn't install
>> > their data, archdata, examples etc in qt5 subdirectories.
>> >
>> > https://github.com/meta-qt5/meta-qt5/wiki/Building-with-OE#wiki-bad-include-paths-and-build-failing-to-find-qt5-headers
>> >
>> > If you don't care about qt4/qt5 separation just set empty QT_DIR_NAME
>> > and all qtmodules will fold into default directories and you won't need
>> >
>> > OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"
>> >
>> > listed in above wiki.
>>
>> and what about we change just the headers? I want to avoid every
>> recipe using Qt5 and qmake to require setting the headers var.
>
> That is still quite bad work around, because ideally end-user apps
> shouldn't install headers in qt5 dirs as well.
>
> So having this line explicitly in the recipe at least shows that app
> headers will be installed in weird qt5 location (so your other recipes
> should search for it there).

If a system is splitting Qt5 and Qt4 I don't think this is wrong. I
understand your point but I think this causes no harm for user and
easy the general usage.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

