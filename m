Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gdalex@gmail.com>) id 1Rio5n-0003pe-5x
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jan 2012 15:14:55 +0100
Received: by eaal1 with SMTP id l1so366186eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2012 06:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=biV5OBICkrwv1lZPbydzOF84u1Zl1Qv9a/Hs+RoidWs=;
	b=I8+W22j095B75YmlK6tpQ1YxONvNjdjjdYxfPvVvQ5xD5xOIJ5b81njiPoTmp6aodU
	wqKpeAxdyKg1pqjtYmRq3sRXOEIU0/uT8fW7mCW8Nhp+I/cc51mexBU6Fimf+KqFOVy0
	/Aqtc2UlEB+niEYc8v0Cq9xa1dDQFWRaRMjIw=
MIME-Version: 1.0
Received: by 10.205.128.12 with SMTP id hc12mr756471bkc.133.1325772449280;
	Thu, 05 Jan 2012 06:07:29 -0800 (PST)
Received: by 10.205.26.134 with HTTP; Thu, 5 Jan 2012 06:07:29 -0800 (PST)
In-Reply-To: <CAOy7-nNBAYxHFzPsNwZrQ_WAzSVuzNEVX+V9OQ+XK3v69+1=Ew@mail.gmail.com>
References: <CAFggvfNpJGosK3E0pG=Qikk3QXLoOSHndVRqxoTkNUS47_pDQw@mail.gmail.com>
	<CAOy7-nOSQ1-SjHjYqKo4t-N=ZDo7FPoEGBdTbabtTBSd78Cczw@mail.gmail.com>
	<CACj0d1jmq+XG=ksy5QTr9DsNs7xRZKVCtKwiSqXcJ=UGWDD_Pw@mail.gmail.com>
	<CAOy7-nP8oc7ZObfc7We8j4Oj7ZTrhqs-upo8KY61tvqDcRG6-g@mail.gmail.com>
	<CAOy7-nNBAYxHFzPsNwZrQ_WAzSVuzNEVX+V9OQ+XK3v69+1=Ew@mail.gmail.com>
Date: Thu, 5 Jan 2012 09:07:29 -0500
Message-ID: <CAFggvfM4p0nvDYmgaCa=ZkgQkNzZ5XPCShkOkcWJPrEjgmbjEw@mail.gmail.com>
From: George Alexandru Dorobantu <gdalex@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: openssl failing to compile
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
X-List-Received-Date: Thu, 05 Jan 2012 14:14:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

Edit openssl-native_1.0.0d.bb by removing the line containing this:

file://libdeps-first.patch \

It works after that. Don't forget to remove the stamps for openssl-native.

Good luck
George


On Wed, Jan 4, 2012 at 8:50 PM, James <angweiyang@gmail.com> wrote:

> Hi all,
>
> On Thu, Dec 29, 2011 at 10:17 AM, James <angweiyang@gmail.com> wrote:
> > Hi all,
> >
> > On Thu, Dec 29, 2011 at 9:36 AM, Neil Gruending <neil@gruending.net>
> wrote:
> >> I have the same issue. After some Googling it appears to only affect
> >> Ubuntu 11.10?
> >>
> >> Neil
> >>
> >> On Wed, Dec 28, 2011 at 5:23 PM, James <angweiyang@gmail.com> wrote:
> >>> Hi all,
> >>>
> >>> On Wed, Dec 21, 2011 at 11:09 PM, George Alexandru Dorobantu
> >>> <gdalex@gmail.com> wrote:
> >>>> Hello list,
> >>>>
> >>>> bulding a console-image for beagleboard, openssl fails to compile.
> >>>>
> >>>> The log shows this:
> >>>>
> >>>> openssl.o: In function `main':
> >>>> openssl.c:(.text+0x1eb): undefined reference to `BIO_s_file'
> >>>> openssl.c:(.text+0x1f3): undefined reference to `BIO_new'
> >>>> openssl.c:(.text+0x235): undefined reference to `BIO_ctrl'
> >>>> .....
> >>>>
> >>>> Removing libdeps-first.patch solved the issue.
> >>>>
> >>>> Does anyone know if libdeps-first.patch is really needed?
> >>>> If not, could it be removed?
> >>>>
> >>>>
> >>>> Thank you
> >>>> George A. Dorobantu
> >>>
> >>> I'm too experiencing this issue with my overo board too and is
> >>> currently using the same hack to get pass openssl compilation problem.
> >>>
> >>> Please backport openssl from oe-core to oe-classic to solve this once
> >>> and for all?
> >>>
> >>> Thanks.
> >>>
> >>> --
> >>> Regards,
> >>> James
> >>>
> >
> > My build host is Ubuntu 11.10 x64.
> >
> > --
> > Regards,
> > James
>
> Can anyone advise on this?
>
> Many thanks in adv
>
> --
> Regards,
> James
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

