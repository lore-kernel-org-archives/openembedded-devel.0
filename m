Received: from mail-ve0-f175.google.com ([209.85.128.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1UXxbK-0004O3-V1
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 May 2013 19:47:28 +0200
Received: by mail-ve0-f175.google.com with SMTP id m1so749225ves.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 May 2013 10:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:from:date:x-google-sender-auth
	:message-id:subject:to:cc:content-type;
	bh=M8q2y5+6P3lgL2J/tpdk2okyYOqHOtTYJ04b0cGofG8=;
	b=T0z5RMMeE0PDlEKgT/emytd0lXiiP49cDLXezVzlJxvfIth3sOAlP0KEuQ46F7AeW7
	38Tdl68xUTK7t7TSaobJ4xlvzcIq77uTdTMyfTQIr2yppBcBhTn0DX/8W/RbIyKNkvpG
	mHh0SJ1MCV4USow8q9jZ1kltceLn6lpf49b/OWqusLENLAcJEFVNGE7Jag58vJmeT6S3
	D3PJOJDutsIlBzZ9l0Loe+wzWtmrteLzBVflL8nyU9HYEPoNPMqD/EHXnuXiuMDcA/8Z
	rnxLjizRh5KPHg35Hl2/SazMTbgfKsRZut7tkcCoLLSE4+B6KDQptEuUbHU2oKUIr0vZ
	2xOg==
X-Received: by 10.220.169.78 with SMTP id x14mr2522657vcy.41.1367515772781;
	Thu, 02 May 2013 10:29:32 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.48.5 with HTTP; Thu, 2 May 2013 10:29:12 -0700 (PDT)
From: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 2 May 2013 18:29:12 +0100
X-Google-Sender-Auth: azXJKDqWhAtgKMLLdRma5Wxze7Y
Message-ID: <CANyK_8eZKEOS+34o7GivEAHrKKyvY0aEhi9AiehdGLCHOORgbw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Trevor Woerner <twoerner@gmail.com>
Subject: [meta-oe] VLC (was re: State of bitbake world)
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
X-List-Received-Date: Thu, 02 May 2013 17:47:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

(Subject changed and moved to just openembedded-devel as we're getting
vlc specific now)

On 2 May 2013 18:22, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, May 02, 2013 at 12:30:59PM -0400, Trevor Woerner wrote:
>> On Thu, May 2, 2013 at 11:57 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
>> > The recipe also has dependencies
>> > outside meta-oe (fluidsynth in meta-multimedia IIRC) but that's a
>> > separate issue.
>>
>> I've noticed that too. Shouldn't dependencies be contained within the
>> same layer? Is it normal from these dependencies to be spread out over
>> various layers?
>
> Yes, fluidsynth needs to be explicitly disabled in vlc and removed from
> DEPENDS or vlc moved to meta-multimedia
>
> See:
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-April/045090.html
>

I don't think we should modify the behaviour of the current VLC recipe
by removing fluidsynth as someone may be using that feature. At the
minute, if someone is using vlc, they're building with meta-multimedia
included. Nothing else in meta-oe seems to depend on vlc so I think it
should move over to meta-multimedia.

So I'm looking at two patches:

1) Move vlc to meta-multimedia
2) Fix do_package failure in vlc

Shall try to get on it within the next week.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


