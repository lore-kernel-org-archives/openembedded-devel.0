Received: from mail-vb0-f52.google.com ([209.85.212.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TulNl-0000En-9W
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jan 2013 15:51:30 +0100
Received: by mail-vb0-f52.google.com with SMTP id ez10so3498232vbb.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2013 06:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Bs5MTtmIy/VhkYE5gz6ouX7gTHKMDFZKQhpal1tslOI=;
	b=ctmMpYNJgle0UXNZ9/WI96jftUR7GcCtdyUtVWmNwnALIgu4N8/bOaUzXYM/GQfN3h
	6JgvwGYajoKUcOyBjv8XgfJ4MOLwF4Ml2z2JMskTAOqF/h1aLaQQtRaW/DMQ4F08m8t4
	HE5tYHJ8UcK5voFJVcKgW1egJFROrDS4IM5x6oDfGod+xqEv4JmNWVBA1zxlI0WDRogu
	HBFS7mGwULg5gbJd+YPapA2pkmaDL9w1wqna5x30YEOqQzqu8+HNRLESArxcb+Hh9uDV
	ZUj3QdLkhRkpCnF1OBYI1IgEfDLwUePLdkDK1Apk8dpdNQL+08SUpP/auBsKNXREIKap
	shNw==
MIME-Version: 1.0
Received: by 10.220.228.138 with SMTP id je10mr60105921vcb.67.1358174165784;
	Mon, 14 Jan 2013 06:36:05 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Mon, 14 Jan 2013 06:36:05 -0800 (PST)
In-Reply-To: <2159085.vty0yDIBH9@helios>
References: <1357693239-13210-1-git-send-email-schnitzeltony@googlemail.com>
	<2159085.vty0yDIBH9@helios>
Date: Mon, 14 Jan 2013 16:36:05 +0200
Message-ID: <CAF6bG8ewV-MJArsCy799uW55nU7ftwJiYoga95rq5CeqEhY8EA@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe/meta-multimedia 0/2] games preparations
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
X-List-Received-Date: Mon, 14 Jan 2013 14:51:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 14 January 2013 15:34, Paul Eggleton <paul.eggleton@linux.intel.com> wro=
te:
> On Wednesday 09 January 2013 02:00:37 Andreas M=C3=BCller wrote:
>> While preparing / testing some games I would like to see these in common
>> layers
>>
>> Andreas M=C3=BCller (2):
>>   openal-soft: initial add 1.15.1
>>   physfs: initial add 2.0.3
>>
>>  .../openal/openal-soft_1.15.1.bb                   |   20
>> ++++++++++++++++++++ meta-oe/recipes-support/physfs/physfs_2.0.3.bb     =
|
>> 11 +++++++++++ 2 files changed, 31 insertions(+), 0 deletions(-)
>>  create mode 100644
>> meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb create m=
ode
>> 100644 meta-oe/recipes-support/physfs/physfs_2.0.3.bb
>
> There is a meta-games FYI, I think this is possibly where these recipes o=
ught
> to have gone.

 They actually are there at the moment. But as I have considered them
not games specific, they have been marked as something that lives
there only temporarily until they can be properly introduced to more
general layers. I guess Andreas has been working on that basis. My bad
for not checking from generic layers if they would be accepted.
 So, what's the concensus. Should they be removed from meta-games as
they are in general layer, or should they be moved from staging area
of meta-games to official game libraries area?


 - ML


