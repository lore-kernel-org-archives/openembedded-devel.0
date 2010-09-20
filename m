Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OxmWk-0006LM-R6
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 21:59:51 +0200
Received: by ywa8 with SMTP id 8so1585472ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 12:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=5jOI7wV1WBemeb1Bmi88m3Tvdnol3AGfK9Ko/lnHafo=;
	b=YD9McKrPZz6sScF+x/y5WsPSB6wfLLinLH8qAk6MJw3+v7XcYpNYavxEU9iv3k2YPO
	wq4kC4uiaTSBQeylezhnkxjB8zjq6TuLkzUpKZc0hxaXA6Wld5ARr3Hs+HcumaQZ9/bb
	LumEPf4HNoJGU/VdgjXKdt4KS9g21NeQwUFWs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=p9/C6yAgTInRBM6DbzK6Aiah9izSaL534rZWqFyGe7W9/HC2rWvY3Xq7bcJSyStPB5
	weE+7lxWrPRB5zKF9WknmGxxH1HRS6qMoEZUw4ep3mrpZYVGb4aLf9FTyj7/0YF8Ri/l
	TGmhyx8sCihwq1zRKPAfQ2knVaoE4D0izcq4M=
MIME-Version: 1.0
Received: by 10.90.65.18 with SMTP id n18mr6104675aga.130.1285012786959; Mon,
	20 Sep 2010 12:59:46 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 20 Sep 2010 12:59:46 -0700 (PDT)
In-Reply-To: <AANLkTimSpV1UQgFg5-PgvhwhmGj-NZ-QMg-wOkLtzZtw@mail.gmail.com>
References: <E1OxTYC-0004Sl-3k@melo.openembedded.org>
	<4C97723F.7010401@mentor.com>
	<AANLkTimSpV1UQgFg5-PgvhwhmGj-NZ-QMg-wOkLtzZtw@mail.gmail.com>
Date: Mon, 20 Sep 2010 21:59:46 +0200
Message-ID: <AANLkTiktTQbys+N_qKijzDf6EASk1kDTO-F5u2=Hy9xh@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Khem Raj : iphone: Exclude from world.
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
X-List-Received-Date: Mon, 20 Sep 2010 19:59:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/20 Khem Raj <raj.khem@gmail.com>:
> On Mon, Sep 20, 2010 at 7:39 AM, Tom Rini <tom_rini@mentor.com> wrote:
>> git version control wrote:
>>>
>>> Module: openembedded.git
>>> Branch: master
>>> Commit: 0319f8878547c6e8a78373cfc86a85cea60450ae
>>> URL:
>>> =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=3D=
0319f8878547c6e8a78373cfc86a85cea60450ae
>>>
>>> Author: Khem Raj <raj.khem@gmail.com>
>>> Date: =A0 Sun Sep 19 16:38:38 2010 -0700
>>>
>>> iphone: Exclude from world.
>>>
>>> apple-csu overwrites the C startup files and nothing works after that
>>> we can not select them with normal linux toolchain being staged and
>>> used
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>> Shouldn't this be a COMPATIBLE_something case? =A0You'd want this for wo=
rld if
>> that was what you were targeting... no?
>
> yes. Actually its a distro iphone-compat that can be used to
> differentiate. but then will COMPATIBLE_<distro> work ?
>

Hm. I'm inclined to say that it is not distro specific (unless you see
iphone as a distro).
I can imagine different distro's running on iphone (ok maybe not *that* lik=
ely).
For me iphone is a machine.

Frans


