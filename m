Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id C5F996EE66
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 11:57:41 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id c41so468449yho.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 03:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=gvH3K40Si/n0LV5NtzP++R5RzNGJC7ZwciX2Cw6Z7zQ=;
	b=fB8qOnywFSm4gom2MbpqcmzZghf9qeN+AoeAqxcVjznDTHOUP32IrKYcfzHTJ0cnWl
	XAYBdizI3u+clliSa6/93VUcPG9QzFjmqORu/MS7ZfnuQMtXb2cb02vaHHp3hGGVolBI
	FIlNmuYFwUJPEv2wZVwBESuS2WHYVSxQU8kGhZgrXeeXitvUl8KUnnrusWw09B0EHDF7
	OVvDDiY1UMDyncxB7AbAmIBoL/WLocZhPfz6x+bX+sPMqf/0sy1VnGO0Cvxu+CiZWg/b
	J++ge87J6hv07wNCsmq9Nvz9oX+GHtzwkPl5VZd58zWUQV+3sxUm7LSNknwyzrAEBvAY
	5Jgg==
MIME-Version: 1.0
X-Received: by 10.236.84.135 with SMTP id s7mr2393180yhe.148.1392897461893;
	Thu, 20 Feb 2014 03:57:41 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Thu, 20 Feb 2014 03:57:41 -0800 (PST)
In-Reply-To: <1392882657.29514.3.camel@mars.bytesatwork.ch>
References: <1392780156-11122-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKo96otJprbv_3OboT4WpiKUdXJdyKdkt6ppJK3aC+kzDg@mail.gmail.com>
	<1392882657.29514.3.camel@mars.bytesatwork.ch>
Date: Thu, 20 Feb 2014 08:57:41 -0300
X-Google-Sender-Auth: uvGswdEaON5rPNhXMLdFWj59d94
Message-ID: <CAP9ODKoJB79eNAzqzuuTOMA20Wt9nOwoe46fS93DcA5BAtx6KQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 20 Feb 2014 11:57:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2014 at 4:50 AM, Urs F=E4ssler <urs@bytesatwork.ch> wrote:
> On Mit, 2014-02-19 at 16:11 -0300, Otavio Salvador wrote:
>> On Wed, Feb 19, 2014 at 12:22 AM, Otavio Salvador
>> <otavio@ossystems.com.br> wrote:
>> > When looking for Qt5 components and files we ought to use the Qt5
>> > specific path. In case the distribution wants to have a flat tree it
>> > can set QT_DIR_NAME and it will still works as expected.
>> >
>> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> > ---
>> > I have built two image and the SDK from scratch using this with no
>> > issues. Could someone also give this a try?
>>
>> Today I rebuilt 5.2.1 image and SDK in two build machines (one Debian
>> Sid and another Debian 7.4 based) and both succeed.
>>
>> Did someone try this one?
>>
>
> I successfully built Qt 5.2.1 (from the 5.2.1 repository, not the above
> patch) for ARM on Debian 7.4. I had some problems with cmake stuff, but
> not sure if this has to do with my configuration.

It may be related, can you elaborate so I can confirm at my side? Do
you have a test recipe for me to try?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

