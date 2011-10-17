Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RFui0-0003kq-46
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 23:26:56 +0200
Received: by qam2 with SMTP id 2so808394qam.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 14:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=lxYYZRzF/A9iqy/ChPRItTu6TR6Xwq9A86EOPClUWL0=;
	b=t/jvzqDv/T10qFpx0dCJeJXITSVB04TPnKmVJ3eWUkstjKyCwH1wn5LwqfAq4HZYus
	cqMHgng/Pa7eqcf/rf/8kAyJVuMNKc7Hy0ReJHKVir0toNtS1Cq5BHgA+jiTUDmJX6to
	7Dxu1G1s9IHYIZhk6cYs/tXhkkTlWYTc+qSrc=
Received: by 10.68.17.193 with SMTP id q1mr40427005pbd.98.1318886466192; Mon,
	17 Oct 2011 14:21:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Mon, 17 Oct 2011 14:20:36 -0700 (PDT)
In-Reply-To: <4E9C97B7.6010607@telia.com>
References: <CACphT6KqgRkRt1vtfS8ROS5P36P=yKACX0tNV6gw7NTa25U9Bg@mail.gmail.com>
	<4E9C97B7.6010607@telia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Oct 2011 14:20:36 -0700
Message-ID: <CAMKF1sp-JDV0i9k=0OXju5NfAdjYLsM3vv0CrEPTcOjFm-pF1A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Openssl build bug
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
X-List-Received-Date: Mon, 17 Oct 2011 21:26:56 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 17, 2011 at 2:01 PM, Ulf Samuelsson
<ulf_samuelsson@telia.com> wrote:
> 2011-10-17 22:46, Panda Resistor skrev:
>>
>> Openssl-native_1.0.0d-r14 will not build on Ubuntu 11.10, but is building
>> on
>> Ubuntu 10.04. The errors are undefined reference errors, and it has been
>> suggested that they are linked to erroneous ordering of library
>> dependencies
>> and dependency folders, however the libdepsfirst patch has been applied by
>> bitbake upon a compilation attempt.
>>
>> Cheers
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> I can confirm that I see the same.
> Builds on 11.04, but not on 11.10.
>

It has been fixed in oe-core. if its needed for maintainance 2011.03 branch
then do the needed backport.

> --
> Best Regards
> Ulf Samuelsson
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


