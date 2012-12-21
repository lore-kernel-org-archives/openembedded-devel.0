Received: from mail-we0-f180.google.com ([74.125.82.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmA6t-0002iv-2N
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 22:26:28 +0100
Received: by mail-we0-f180.google.com with SMTP id t57so2385860wey.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 13:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0l4euocUWuy1Hc1KyykLBXUkzdQ0iCZtIrheQGdbqkA=;
	b=jzAJT4Y+yKD22CMJYy34l4WgjjXwjoa/5VeqvQClOyMuqOUkDVVcvX3Rr9g1K88Pn5
	85iH3zHEIUL0YyHdd4QxD21LuP3v0Gbggj9snDW85fmpBhDdQISWG3nXJuDUY1Nm1E6Z
	tgQtQbaOpWS5bf2P/89dSOcrnfItvP0PLvWFpWZoUOk11nshO2s4VnN7mH5HBUJLiV4y
	1DuZB8m4j0xRPBdHwI4bF+GZb3y183kXP5BJOsBucshCRCZly90b+uV+Tw4vmxWUtkt6
	zEBGrw2kycHlGVIdLsetGLBBtDvDsQ2E4ycJFVNnI3MMVQBMw0sUFinez6Z5+siOqqqw
	Om7g==
MIME-Version: 1.0
Received: by 10.194.76.99 with SMTP id j3mr25945295wjw.47.1356124300866; Fri,
	21 Dec 2012 13:11:40 -0800 (PST)
Received: by 10.194.178.72 with HTTP; Fri, 21 Dec 2012 13:11:40 -0800 (PST)
In-Reply-To: <CAMBWrQm6UbF9t5sAn=oudmhQ2MJdDNMb3ki6o7_sdjErun4SWw@mail.gmail.com>
References: <CAMBWrQnMQtEs78=OtkSR1mjctfet8ArQ_XE43wDB6-6NKiDShA@mail.gmail.com>
	<CAMBWrQm6UbF9t5sAn=oudmhQ2MJdDNMb3ki6o7_sdjErun4SWw@mail.gmail.com>
Date: Fri, 21 Dec 2012 22:11:40 +0100
Message-ID: <CA+chaQcvSts25RvERVyOxOcsqaLRfADf8zTq_YpqAB8Bp_O+fg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Subject: Re: Multiple .bb files are due to be built which each provide udev
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
X-List-Received-Date: Fri, 21 Dec 2012 21:26:29 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 21, 2012 at 9:58 PM, Stan Hu <stanhu@gmail.com> wrote:
>> My automated build system updated to the latest master of
>> meta-openembedded, and now I'm getting theis error message:

I'm sure this isn't latest master.
http://git.openembedded.org/meta-openembedded/commit/?id=f95109e3e04ee167fd0ceb80e62f7cfec81802de

and see bug referenced in
http://git.openembedded.org/meta-openembedded/commit/?id=2b4ec7cd91de4620abe5694d5aac6407bb143835

>> ERROR: Multiple .bb files are due to be built which each provide udev
>> (/var/lib/jenkins/jobs/systemd-image/workspace/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/udev/
>> udev_182.bb/var/lib/jenkins/jobs/systemd-image/workspace/setup-scripts/sources/meta-openembedded/meta-oe/recipes-core/systemd/
>> systemd_git.bb).
>>
>> I think I have recipes that depend upon libudev, so BitBake pulls in both
>> these recipes.  I'm not quite sure why I didn't get these warnings before I
>> updated.  What's the best way to resolve this?
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


