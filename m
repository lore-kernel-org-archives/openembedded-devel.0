Received: from mail-vc0-f179.google.com ([209.85.220.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1UXxHX-0002Ji-CQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 May 2013 19:27:03 +0200
Received: by mail-vc0-f179.google.com with SMTP id hz10so693161vcb.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 May 2013 10:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=fEojUoKSNvyOqmXclS2a02jdE8CTbJEKoS9e+2rBFwM=;
	b=eMBYcep1GJ+WeOLdqOvEKqj4MWK9Q4xpQ4TwNzUigGlXC4T+BrPDwMBQapmfTKko8/
	9jzYNjcX4CNpEH8UxwW0JdtLn6tfTlUavAhNssQ1n0Nd4VW2AVxOD68XWS+4XQGlzeDA
	cG/Qd+ikaHmrS/FTcI01QG0/HP+jgxeYwtukcrpGAf1druGvmDiclzXvRw+cd76XLE4l
	OoP6P0m6EfqM5dFmYCw8JCZNaVkqCDV/0/iDPsmlTqjCsmCSwxyv5Ru8WD0PglpcgVMe
	4DaVw6Jlv/xTAQ8QUDaRVN81gIgUdoEPl0LOw7Up2B50VT9sLweEb9++tLz0kKuy8Icx
	577w==
X-Received: by 10.52.67.11 with SMTP id j11mr2066089vdt.87.1367514544650; Thu,
	02 May 2013 10:09:04 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.48.5 with HTTP; Thu, 2 May 2013 10:08:44 -0700 (PDT)
In-Reply-To: <1838142.bVj6QfWozi@helios>
References: <20121213174202.GE3356@jama.jama.net>
	<CANyK_8d-AUKrqeFexg1HMT7KypQAZjmfgEF2ChXTwsggok9Ucw@mail.gmail.com>
	<CAHUNapSbKx1baQ++toBir_uw6uWhFun7yA9GwRpNYoTm=7L4BA@mail.gmail.com>
	<1838142.bVj6QfWozi@helios>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 2 May 2013 18:08:44 +0100
X-Google-Sender-Auth: kdKFtJP1PVsUa5xMUO3Ny9qxQGY
Message-ID: <CANyK_8coP2QSOX=QiiFNbG53NMtk18h6ZyPwLH9jEPqHrmPu5A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Trevor Woerner <twoerner@gmail.com>
Subject: Re: [OE-core] State of bitbake world
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
X-List-Received-Date: Thu, 02 May 2013 17:27:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2 May 2013 18:00, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Thursday 02 May 2013 12:30:59 Trevor Woerner wrote:
>> On Thu, May 2, 2013 at 11:57 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
>> > The recipe also has dependencies
>> > outside meta-oe (fluidsynth in meta-multimedia IIRC) but that's a
>> > separate issue.
>>
>> I've noticed that too. Shouldn't dependencies be contained within the
>> same layer? Is it normal from these dependencies to be spread out over
>> various layers?
>
> For meta-oe, this is unusual yes. In fact having checked recently this is the
> only case I'm aware of where a recipe in meta-oe depends on a recipe in
> another layer other than OE-Core, at least with no PACKAGECONFIG alterations.
>
> For this specific instance, it would be great if someone would send a patch to
> move fluidsynth to meta-multimedia.
>

Do you mean to move vlc to meta-multimedia so it's with fluidsynth? Or
do you mean move fluidsynth to meta-oe?

I think VLC wants a bigger overhaul anyway along with updating to
version 2.*. It has a lot of optional dependencies of which an
arbitrary subset seem to be enabled by default in OE. I'd like to see
the default be very minimal and have PACKAGECONFIG options to control
the rest. I'd like to take a look at it but unsure how soon I'll find
time to.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


