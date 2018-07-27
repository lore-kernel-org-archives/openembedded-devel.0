Return-Path: <asselsm@gmail.com>
Received: from mail-yb0-f169.google.com (mail-yb0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 12019789B5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 15:03:49 +0000 (UTC)
Received: by mail-yb0-f169.google.com with SMTP id s8-v6so2109629ybe.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9834Mjr0rneTYQvCniFnyhZZ9PGMaQkk4hsuVfWqrQ8=;
	b=ai5gBIeKU89YGmkXD5usWk1J7SdPPdfv0gu3/LHUsjRVYLjQbOkQY4gdC1H/Utx4GH
	5dHNZ9v1kGAbOliFIrOYc++QDf2CCCVTql1MxsogAIRJHLuUuNAs5526wC71b2J3PzMx
	QUWVdmJ9k1zyhcenHvLx/7a6kZRQVkagZF6WjQhd485cCq05K6mwRZfUHIodwVKTsZ9e
	g9QpGsG2bgH8bEQkXLpM+7d8SXT3bpwmBOQKOdlUbKR9djpZl02MdP2o+JH5IBQd9M+z
	mzex8exddYxHbt8vQ3clK0RabK869mMOArR0ex1zRkGxp+FjEI8OyLpBxpiLPDyQXqdF
	PWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc
	:content-transfer-encoding;
	bh=9834Mjr0rneTYQvCniFnyhZZ9PGMaQkk4hsuVfWqrQ8=;
	b=mvFsL/8cMnqC26MDhKr+uMPHv47nm9fzPuCDHqib7pSszuR4n6T2B56XXjD5vL/1/x
	iYeQ++F/Xnjr+L0YJxrN/YAlzDEcqn9ekBZ02QISyVp/D22/xX/suv5ibHrYZyKbjboI
	X62NxAX4wbuiS3+BgJ+Q4ot3qZBmaRX3SL4Uhqz3FN0xXH1oAXiXZQZrJ3G9m0OXCXT+
	cMQg6NcbQ2a0B5OmCeS+NOL/GiSc0jlE2xJFVqcoJKczqwRy5H/w9hLwtKtkd9Wu+OvR
	42NjyFhvj1exO5I04tna2jumHsr147b45f1xUBU0DbHjoDqLCRS9xmsLKvRerfu1erab
	ftOw==
X-Gm-Message-State: AOUpUlFX08ES5FjQUyA1jOMuY4IzRZ1bCcWSL06prwxn0cfrv7ky4Ngq
	i+Q8FMqke1S/AAZjNO7H1MiZPitFsDaS/qpAyTg=
X-Google-Smtp-Source: AAOMgpcy+AMwAoaQ6U2fGXks4w10RD97ZkKX0uc97+vpsT2ZYLWNEWdP+ocVCRp5YaVsqbLpUJk0F8/gCzLHm9jYN6I=
X-Received: by 2002:a25:ce49:: with SMTP id
	x70-v6mr3710931ybe.18.1532703830605; 
	Fri, 27 Jul 2018 08:03:50 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 2002:a5b:612:0:0:0:0:0 with HTTP;
	Fri, 27 Jul 2018 08:03:50 -0700 (PDT)
In-Reply-To: <CAPuovEKX5w=1ObAgOw71UteCmh74Qf9KQ44_L4NbmLniwX4Jyg@mail.gmail.com>
References: <CAOnRZELTeZbVDTo_eT_r6e6EG6et0vs7O_mT_fpqJ_RpoVhk2Q@mail.gmail.com>
	<CAPuovEKX5w=1ObAgOw71UteCmh74Qf9KQ44_L4NbmLniwX4Jyg@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Fri, 27 Jul 2018 11:03:50 -0400
X-Google-Sender-Auth: KAbgPE3jCCKZB46Yj6GS9UXVxr4
Message-ID: <CAPuovE+nMp9xaj_gusMTGM9_ChFuuHDzc9NKBRYZMX493DbU=Q@mail.gmail.com>
To: William Delacre <williamdelacre@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: (No subject)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2018 15:03:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 26, 2018 at 3:40 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> On Mon, Jul 23, 2018 at 8:28 AM, William Delacre
> <williamdelacre@gmail.com> wrote:
>> Hi ! :-)
>>
>> I=E2=80=99m facing issues when trying to run =E2=80=98bitbake python-twi=
sted=E2=80=99 (do_compile
>> error)
>>
>> Log says :
>> =E2=80=9CDownload error on https://pypi.python.org/simple/incremental/: =
[Errno -3]
>> Temporary failure in name resolution

With the additional info you sent me along with a second look at the
error I can fairly confidently say I know what the issue is.

Python, like some other languages (ruby, go...) will attempt to
download dependencies/requirements if they are not present. This is
done "outside" of the bitbake system and thus will ignore
BB_NO_NETWORK and is generally a bad thing. It isn't quite host
contamination but it is very similar. What we do with our python
recipes in bitbake is review a python package's source setup.py,
requirements.txt...files in order to determine what other python
packages are needed, add them as RDEPENDS or similar in order to avoid
the python attempting to complete a download such as this.

In this case python-twisted 'requires' python-incremental but the
Rocko version of the python-twisted recipe lacks the needed assignment
to ensure this is available in the recipe sysroot and thus the
attempted download.

Cherry pick commit b08b570c8624303acbb6bb064a7bda466a679df4
[python-twisted: avoid downloading build dependencies] to Rocko and
you will be good to go. You should also follow up this thread with a
request to have this commit put onto Rocko to avoid others hitting the
same issue.

Mark

>>
>> ............
>>
>> distutils.errors.DistutilsError : Could not find suitable distribution f=
or
>> Requirement.parse(=E2=80=98incremental>=3D16.10.1=E2=80=99)=E2=80=9D
>>
>> First of all I=E2=80=99m not connected to internet, so I=E2=80=99ve pre-=
downloaded all the
>> required packages (twisted-17.9.0.tar.bz2 & incremental-17.5.0.tar.gz ar=
e
>> present in my build/downloads folder)
>>
>> It=E2=80=99s the first time I have some =E2=80=9Cdownloading issues=E2=
=80=9D and I=E2=80=99m stuck on it
>> for a few hours now..
>>
>> Any tips for me ?
>
> Check all aspects of what you have manually downloaded and populated
> in your downloads. My guess is that a checksum or some other detail
> isn't matching and it is rejecting what you have and thus attempting
> to re-download the file.
>
> Mark
>
>>
>> Thanks in advance !
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

