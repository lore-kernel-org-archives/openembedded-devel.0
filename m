Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nr4nX-0001GB-Mz
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 08:33:18 +0100
Received: by gye5 with SMTP id 5so1220329gye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 00:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=IrGPPNzGrEjmCV6WLCqC0KrndNFN7ng66KrOP0dN7UE=;
	b=VxxJMEIV8Ev62DBu9g9BWHLJfeYJTdmN25Be4cbLXEJICpoBKtQFSeNLmbITSy75cs
	g8I0Uw/iINJ7AH7CCgJuStliJp5qAMSB3EeGK0YG9WVu2BEKFwL87mzGvTkKZF9X+qVh
	vVgcewLLMc0ehwoYBcejEf1G1IfuLz4GR/St4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Z0sXTVR8bq5ik4917N+xMKvPgHPW6XoM/lufhAlFdE/m98aPUg/SsemzzDdUbF3W6Q
	av4b2bA9jEBIFu0BmvDw9/F4BG1W4h3LAg6cd7czlFw6CJ3uq//YVIH3ff1HRnrIsEQg
	1g0QJhPZBczqn8TehTYiwcXvaK6IfC9hU7248=
MIME-Version: 1.0
Received: by 10.101.151.28 with SMTP id d28mr7565870ano.34.1268638209493; Mon, 
	15 Mar 2010 00:30:09 -0700 (PDT)
In-Reply-To: <201003150446.26284.holger+oe@freyther.de>
References: <201003081300.19058.holger+oe@freyther.de>
	<B6E39224-2467-4EDA-A0F4-94C4F9DAF9CD@vanille-media.de>
	<201003081351.35463.holger+oe@freyther.de>
	<201003150446.26284.holger+oe@freyther.de>
Date: Mon, 15 Mar 2010 08:30:09 +0100
Message-ID: <ac9c93b11003150030i69015e69t78a3b16e6c11d2e5@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: samba-essential upgrade or remove?
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
X-List-Received-Date: Mon, 15 Mar 2010 07:33:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/3/15 Holger Hans Peter Freyther <holger+oe@freyther.de>:
> On Monday 08 March 2010 13:51:35 Holger Hans Peter Freyther wrote:
>> On Monday 08 March 2010 13:42:07 Dr. Michael Lauer wrote:
>> > While I'm not using it atm., I recall that samba-essential was the onl=
y
>> > recipe that worked relatively painless when Matthias Hentges create it
>> > back then.
>>
>> Then please fix it. You will do a great service to our users. The follow=
ing
>> CVEs are not addressed:
>> =A0 =A0 =A0 CVE-2009-2813, CVE-2009-2948, CVE-2009-2906, CVE-2009-1888,
>> CVE-2008-4314, CVE-2008-1105, CVE-2007-6015, CVS-2007-4572, =A0CVE-2007-=
5398,
>> CVE-2007-2444, CVE-2007-2446, CVE-2007-2447, CVE-2007-0452, CVE-2007-045=
3,
>> CVE-2007-0454, CAN-2006-1059..
>
>
> any update? Is anyone volunteering to update samba-essential or shall we
> remove it from the tree? I think we have a responsibility to our users th=
at if
> we install a network daemon that we at least fix the known security issue=
s with
> this one or remove it from our recipe collection... Opinions?

Do we feel we have that responsibility?

I didn't feel that sentiment when it came to removing other legacy
recipes (some of which definitely also will have security issues).
E.g. for openssl we have
openssl_0.9.7e.bb
openssl_0.9.7g.bb
openssl_0.9.7m.bb
openssl_0.9.8g.bb
openssl_0.9.8m.bb
I'm pretty certain the last one will fix some vulnerabilities present
in the first one.

The same probably holds for all network related stuff (nfs, apache,
php, cups, ...)

Btw this is not a volunteering proposal from my side. I haven't
recovered from being burned last time.

Frans

PS: I'm in favour of keeping samba-essential. In an embedded system
lightweight solutions are often desirable.


