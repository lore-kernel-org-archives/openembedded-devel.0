Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1ObFKz-0002wQ-N5
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 18:06:34 +0200
Received: by ewy7 with SMTP id 7so1838819ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 09:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=8tE+vt+LMJSOWiHMq8xQnlKebLGlAIUq1hX0+BCWKDA=;
	b=Cpmcl2OGMDZpkSvM9rnX4lAkZ3pnwqMPdBUpBwoC4e9DqJrOB4BEIB4tOZCFySCa5U
	mxYjAbRufwzZzk2dbTUyroYV/KYKZPsQXVe1OEXZ/ukb0diJxB8OrN9KhKjnf1+nRjVX
	uLYZ7d3lACzLpVlzcp6OWooqrPR9fQ4naHRKY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=tLcMSoRM1h6wPM0yPdqGyFCHvh6x4eXRiYTJ8o1W7koMceckP4rYTmub9IYM4NbpCH
	qt2DlSRqToehYXfvnx/JSSEGh+JfMnXSvL+E+MFSQqhcb3zhl9SDSUvGHWk17I7eR78S
	00FfGOpH6A5FXnrTliD63KV70mTq3mJXlQ7tM=
Received: by 10.213.34.77 with SMTP id k13mr2455482ebd.77.1279641985742; Tue, 
	20 Jul 2010 09:06:25 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.212.11 with HTTP; Tue, 20 Jul 2010 09:06:05 -0700 (PDT)
In-Reply-To: <4C45C63E.70306@cbnco.com>
References: <1279290319.10837.1747.camel@rex> <4C44BAB3.8010703@mentor.com> 
	<AANLkTild0OtzxFT1GmBoNoUj8spV7jcvp1s_Cd69Frdy@mail.gmail.com> 
	<AANLkTinZATYyQw2PEk52Hk71R_4nIzdacjzB2qKt2ZnQ@mail.gmail.com> 
	<AANLkTikAmC6Li8IdUfbfZ48Or-dEABfH4ua8JjIgA0JT@mail.gmail.com> 
	<AANLkTim1m8AQ4WsVRLu_1BU3VUfOrCgpLNIclgewXhJz@mail.gmail.com> 
	<4C45BE9F.7000002@mentor.com> <4C45C63E.70306@cbnco.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 20 Jul 2010 09:06:05 -0700
X-Google-Sender-Auth: PC61iQRXxvkzkTdoHD4Ww_0nWXU
Message-ID: <AANLkTilXvrxo8FC6KYsyyxwVPOrzJvp9cleEfdzVANzA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: A new bitbake extension: .bbappend files
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
X-List-Received-Date: Tue, 20 Jul 2010 16:06:35 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 20, 2010 at 8:52 AM, Michael Smith <msmith@cbnco.com> wrote:

> Tom Rini wrote:
>
>> It's also needed, in some cases, to lock down your changes via OVERRIDES
>> that will only match what you want to work on.  For example, we're using a
>> snapshot with an older python, so amend.inc in our python directory looks
>> like:
>>
>> SRC_URI_append_pn-python-native =
>> "file://python-2.6-r73342.patch;patch=1;pnum=0"
>> PARALLEL_MAKE_pn-python-native = ""
>> PR_append_pn-python-native .= ".1"
>>
>> So that we only change python-native and not all of the other python
>> recipes.
>>
>
> I think you could get the same effect by putting your amend.inc in a
> python-native subdirectory under your overlay recipes/python directory.
>
> Maybe there's some native magic going on that would break that. (I've never
> amended a -native package but I use the same trick for other recipes where
> there are multiple .bb files are in the same OE directory.)


Well, that works for -native or -cross, but there's no -target, so you have
to use a pn- override to modify the target recipe but *not* native and
cross.  If you put it in python/, it applies to all of them.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

