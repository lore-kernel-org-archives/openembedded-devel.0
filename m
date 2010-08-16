Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OkzyM-00078L-VT
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 15:43:32 +0200
Received: by iwn38 with SMTP id 38so1654627iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 06:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=9sYphlRsScBs2cmJdsB6LgwcKPMwuIjvlNXNQCD2R/o=;
	b=g8YtHmYH/r2XyFiy4A0TR1bzZoQ78tH0dezdy0vtuVcj5EwMgvkJ9jOBegowl8O9TM
	x5BJwc7q9e2lGQGCu08ok8tbNF1WsRe78gPA1UZdCu4Qwlg22gvwAB/u1JXGxrHDE5Lf
	cIWavJrnD/9ZvirfzNUuxiygOGLCSYPCsdopE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=GoVSka+JzLvkYDed9S1yl5erHKYErOQb+ndcvAg4AptSyceziAOyYZDHDgFg37VzVF
	HAF3EwZsH0Txyj0VH/G1ovxQQ55rRrOQriRjCVCDl7tbgQ68FkDkYzyGIrs0/8lzNeCI
	7UZM1cchrOCWrJZuoAy62mMFntO9J97HjJKYM=
MIME-Version: 1.0
Received: by 10.231.174.65 with SMTP id s1mr6148789ibz.3.1281966190421; Mon,
	16 Aug 2010 06:43:10 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Mon, 16 Aug 2010 06:43:10 -0700 (PDT)
In-Reply-To: <20100816132317.GA7983@zlo.nu>
References: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>
	<20100816132317.GA7983@zlo.nu>
Date: Mon, 16 Aug 2010 15:43:10 +0200
Message-ID: <AANLkTikB5uioXp0BwFg4Gj6GV9MjgMmyOgvjLLOwS8fh@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cleaning recipes
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
X-List-Received-Date: Mon, 16 Aug 2010 13:43:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/16 Marc Olzheim <zlo@zlo.nu>:
> On Sun, Aug 15, 2010 at 04:59:17PM +0200, Frans Meulenbroeks wrote:
>> As some of you might have noticed I've been cleaning up our
>> recipes.during the last week or so.
>> As I had some time at hand this weekend, lots of cleaning has been done.
>> I did my very best to stay within the guidelines of the TSC (as
>> described in http://lists.linuxtogo.org/pipermail/openembedded-devel/201=
0-May/020047.html),
>> but it is quite possible that at some point I made a mistake or so.
>> If so, let me know and I'll repair things and/or revert the commit. (I
>> feel if you make a mess you should also clean it yourself).
>
> Hmm, the "guidelines" do not mention anything about licenses. Thus the
> only version you left of coreutils after
> 82dcd385984ba059b346a0e37fd3e14d536074ad is infected with GPLv3, while
> the older (6.0) GPLv2 version works fine for us. =A0I do not know
> whether other people mind about licenses, but we cannot use any GPLv3
> software in our image, because of its viral nature.
>
> Marc

Valid point.
I did not consider licenses. Although the company I work for has no
problems with GPLv2, I understand your concern
What would be the most recent version of coreutils that is still using v2?
We can reinstate that one.

Thanks alot for your feedback.
Frans


