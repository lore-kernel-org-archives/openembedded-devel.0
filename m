Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OXcuW-0003Gk-UX
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Jul 2010 18:28:18 +0200
Received: by bwz10 with SMTP id 10so2059278bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Jul 2010 09:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=oiUy1WOuhov1O61ke5WDMf9apsYsgV35Orte6dJfCAs=;
	b=DqOMd3GhtiNGUmnIf8XqXMjKYPLP7oovC6N/9vaKbJwwhVMdWGDHBhFtgCJRTUBLxu
	/JSftdOdliPufwzSija8Ua6fjZISoAOe9H9asLS38jkoyDgsUqI6HFV5i3TAqlSfUspN
	lIJ1QLnRhFBylVpcFGJ0QzhAAp8FqES1MGb/s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=GaRuquaTnwK61nqG6anESyQxSKbe+FmXCsJDIcDKe4cWgMeR6PzNtK9DqKABmqDdLo
	HA0oujUUE5EGflDHFMV4edYaNCcI5Keh1ktn5QtyoY6jsaIbqG4AtpjsPvGcE9kUwCoA
	UGFlAb0L0C4UsnvLXGAQjADlQTHGQK01izPOM=
MIME-Version: 1.0
Received: by 10.204.81.39 with SMTP id v39mr4604419bkk.149.1278779003334; Sat, 
	10 Jul 2010 09:23:23 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Sat, 10 Jul 2010 09:23:23 -0700 (PDT)
In-Reply-To: <1278577398.15825.1.camel@lenovo.internal.reciva.com>
References: <1278527926-5065-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTikso9BfJHslU0Ss6nQ5SfnOdgy8RIU0WF383jXX@mail.gmail.com>
	<1278529036.4413.67.camel@lenovo.internal.reciva.com>
	<AANLkTil6ZzCLdFEKksqKwjzCj_DV2DT7eifCJakP1HhR@mail.gmail.com>
	<1278531880.4413.70.camel@lenovo.internal.reciva.com>
	<AANLkTilH4HHsk0ftnGdTN43qWb70aDZvYt1o6557tAH4@mail.gmail.com>
	<1278577398.15825.1.camel@lenovo.internal.reciva.com>
Date: Sat, 10 Jul 2010 18:23:23 +0200
Message-ID: <AANLkTinBxC1R3u6zNROCBSG59X-CzwmMCiohckgAnvtn@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] classes/base.bbclass: add INCOMPATIBLE_MACHINE
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
X-List-Received-Date: Sat, 10 Jul 2010 16:28:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/7/8 Phil Blundell <philb@gnu.org>:
> On Thu, 2010-07-08 at 08:49 +0200, Frans Meulenbroeks wrote:
>> The only concern I have is the name COMPATIBLE_TARGET
>> for me TARGET is the board so COMPATIBLE_TARGET for me more or less
>> equates to COMPATIBLE_MACHINE.
>> What about COMPATIBLE_ARCH or COMPATIBLE_ARCHITECTURE?
>
> I think the variable that you want to match against (in the specific
> case of cross.bbclass) is ${TARGET_SYS}. =A0Having the matching variable
> be named COMPATIBLE_ARCH would imply that it's going to match
> ${HOST_ARCH}, which obviously isn't what you want.
>
> I would have thought that confusion with ${MACHINE} should be minimal
> since that nomenclature is already quite well established in OE. =A0But
> you could name it COMPATIBLE_TARGET_SYS if you wanted to make the name
> completely explicit.
>
Patch posted. I named it COMPATIBLE_TARGET_SYS and compare with TARGET_SYS.
Tested it, and for me it works like a charm.

However just after posting I noticed we also have TARGET_ARCH.
I'm a little bit lost wrt the differences between these.
Let me know if I need to move to *ARCH

Frans


