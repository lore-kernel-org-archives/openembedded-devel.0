Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LjfCy-0007nr-CW
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 20:44:18 +0100
Received: by ewy20 with SMTP id 20so300841ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2009 12:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=aCaKxlAr9KFcMX8NrdUOYM4TLLGKYs6k7u0Bn9jvWA8=;
	b=RDoyY9Dx6rqEN8GgDuO8oWGANhoSEk2tB9C+naSm7UGB52BxZcem5nz2APx6+oLTMs
	gLRZoZ39s505JqWvsLKhqY9XhOvYj5ygNApJMDbzAcwPesE+g1O/o6Eltgi/AOK9zVMR
	L8SJv0YlFqqS+oZfcEUOqnkdRV7S6NK95RguQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kWtdQhlYIf/mQeYpF1Vc+f6X0fHUzfeMkmvoWjZSqYy/ePWecydx4frpLZq/3GYNha
	VaoLuPQFSnFz0TOqJdcat228LjO+SjpMG1sv6QrxFwxWDpsK0gQBZMSdDSgWrZJenG3o
	f38swf1vbGXv+2c6buk/YcdWMOHLPHuzGxlTg=
MIME-Version: 1.0
Received: by 10.210.54.15 with SMTP id c15mr272975eba.25.1237319008513; Tue, 
	17 Mar 2009 12:43:28 -0700 (PDT)
In-Reply-To: <gpoter$l42$1@ger.gmane.org>
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
	<gpoter$l42$1@ger.gmane.org>
Date: Tue, 17 Mar 2009 20:43:28 +0100
Message-ID: <ac9c93b10903171243j78874fb6x51a46c14312c3568@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.172
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Package Maintenance
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
X-List-Received-Date: Tue, 17 Mar 2009 19:44:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/3/17 Koen Kooi <k.kooi@student.utwente.nl>:
> On 17-03-09 20:18, Chris Larson wrote:
>>
>> I'd like to propose re-establishing MAINTAINER, set per package, to
>> individuals, or left as default for packages which aren't directly
>> maintained.
>>
>> Doing this would:
>> - Facilitate dumping a list of unmaintained packages to give to new
>> users wanting to volunteer to help us, but not knowing how to
>> contribute.
>> - Return some individual responsibility to the project, giving one
>> person the blame for brokenness for that package, as well as giving
>> responsibility for pushing patches upstream to that person. =A0In my
>> opinion, a number of the recent issues in the project are due, in
>> part, to a lack of that individual responsibility. =A0Everything is
>> fuzzy, determined by a group, instead.
>> - Allow us to physically separate, in the repository, those packages
>> which get the most attention (are maintained) from those which get the
>> least (maintained by the entire team). =A0We could finally be *honest*
>> with our users about what we work on, telling them that the packages
>> which are maintained by the team are in need of an individual
>> maintainer, and get less attention, so bugs there will be fixed more
>> slowly, and there are no guarantees on functionality there. =A0I think
>> it'd be better to have a core set of *functional* recipes than have a
>> huge set of "might work, might not" recipes as things stand today. =A0In
>> my opinion, this would be more likely to give new users stability than
>> creating a stable branch, while making better use of our limited
>> manpower, rather than increasing the load drastically.
>>
>> Opinions?
>
> As long as it doesn't get put in resulting packages in any way, it's fine=
 by
> me.
>
> regards,
>
> Koen
>

Agree with koen

FM


