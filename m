Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TeVhV-0003vz-0r
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2012 19:52:37 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so1092696ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2012 10:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=gGIClHNh+RAL6XLWque8eI6Kk6SKpP0X592miVhes4g=;
	b=TEHyIlqQVm6j8y5NYGY2TTPqowWLNrrjUQn7mNHyb5N6Ez6XahwTqGlb0y/+mWS9WP
	3U4E+PzvL/w2Cbpx8tbYdb2q9vpTUZKVwEIuR/JBpEfJ2s3DNp83SZTfkX9rBeoSBY1w
	rE6ZlcyIZHQMYf8ZzFqyNUqZj69eWtIoGCHRFY4fPsAAs4gAMN9sDhimjja4T7qQ+wMU
	OlWByVvDOC6WVhRvNvdwWz86lolCTOhIc4I5zpc0hBchvN+LLWixGmReVuUmHLtNP7u7
	XdnegoKHK/p0nqtwi7MxvO+67B12cjh/md8ioYTN6iaiSZ6BsJHylvQUIQKQ6oM0qZ1L
	Z1vA==
MIME-Version: 1.0
Received: by 10.50.173.37 with SMTP id bh5mr1972332igc.45.1354300699204; Fri,
	30 Nov 2012 10:38:19 -0800 (PST)
Received: by 10.64.20.113 with HTTP; Fri, 30 Nov 2012 10:38:19 -0800 (PST)
In-Reply-To: <CAPOJ94MSTcpaoTQBSqJNAs2T=oKm6WYqPFKMC=DrO7rgPO3Kxg@mail.gmail.com>
References: <CAPOJ94OVOe=fP-8cgCdDFGFEJskce4G=DMcTR6a-JDM9QHJg0w@mail.gmail.com>
	<CALbNGRRqj6NvBxqB+EGcLcFd9CcNKKnSNZmJHM8f=BA-biF3dg@mail.gmail.com>
	<CAPOJ94NZvsiBoMemWPFdBUQtqQzH2rrkq9eP5hQGpB8amY4U2g@mail.gmail.com>
	<CALbNGRSXeE0UvpsZqijRRg1nRW4XFe+52Zoz6kX6wX_QSuDM+Q@mail.gmail.com>
	<CALbNGRRBstvSuMr3jPaNvnggN+TdigApJ=EyxCWeHEdg4tdgbw@mail.gmail.com>
	<CALbNGRRdcaOXoXJcswP6PO7ivsmdCL0f6hEE86GDMnyx7+r=wA@mail.gmail.com>
	<CAPOJ94MSTcpaoTQBSqJNAs2T=oKm6WYqPFKMC=DrO7rgPO3Kxg@mail.gmail.com>
Date: Fri, 30 Nov 2012 19:38:19 +0100
Message-ID: <CALbNGRQmHqSOQ_LVdTy6uO+5LF4TnYQsnr=VjEcRkB7O9BrGpg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Peter Bigot <bigotp@acm.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] gphoto2: fix gettext build error
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
X-List-Received-Date: Fri, 30 Nov 2012 18:52:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 30, 2012 at 7:22 PM, Peter Bigot <bigotp@acm.org> wrote:
> On Fri, Nov 30, 2012 at 11:50 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>>
>> On Fri, Nov 30, 2012 at 6:45 PM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>> > On Fri, Nov 30, 2012 at 6:17 PM, Andreas M=C3=BCller
>> > <schnitzeltony@googlemail.com> wrote:
>> >>> gettext 0.18.1 is installed both on the build machine, and as a nati=
ve
>> >>> package used when building under bitbake.  If it's at all relevant, =
I
>> >>> have
>> >>> LANG=3Den_US.UTF-8 in the environment in which bitbake is executed.
>> >>>
>> >>> Did you try a full reversion of 5febf70?  Can you tell why, in your
>> >>> environment, autotools.bbclass replaces the Makefile.in.in for
>> >>> libgphoto2?
>> >>> It does not do this for me (otherwise I think Koen's patch that only
>> >>> reverts
>> >>> part of 5febf70 would not work).
>> >>>
>> >>> Peter
>> >>>
>> >> It should copy see autotools.bbclass line 195
>> >>
>> >> Andreas
>> > Peter
>> >
>> > One stupid question: Are you working with oe-core master - because
>> >
>> > commit 841ea3c1c18e50e77fccbd5f44d6a79a50913b67
>> > Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > Date:   Thu Oct 11 08:43:01 2012 +0000
>> >
>> > which started my gphoto2 trouble is not found in danny
>
>
> Yes, seems to be a danny/master inconsistency, resulting from oe-core
> branching danny six weeks before meta-openembedded did, with my checkouts
> happening between the two points.
>
>> So from what I can see now is that meta-oe's
>>
>> commit 92e3f684d14fd287194e78bc5e65f80504758b7d
>> Author: Koen Kooi <koen@dominion.thruhere.net>
>> Date:   Wed Nov 21 14:42:02 2012 +0000
>>
>>     gphoto2: fix gettext build error
>>
>>     Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>
>> should be merged to danny and reverted (with PRbump) in master.
>
>
> I think 5febf70 should be reverted (with PR bump) in danny, which is wher=
e
> I'd started before I noticed 92e3f68 in patchwork.
agreed

> In any case 92e3f68 should be discarded since it leaves the removal of AM=
_PO_SUBDIRS() from
> configure.ac in place with no motivation once the Makefile.in.in is no
> longer overwritten.
Isn't that exactly what the patch I sent does?
>
> If that seems plausible I'll prepare a patch.
Appreciated - because if would do it would most likely cause further
confusion :)

Andreas


