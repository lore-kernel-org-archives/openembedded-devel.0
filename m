Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1S9tsv-0004ys-7S
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2012 08:53:37 +0100
Received: by eaae1 with SMTP id e1so2625001eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2012 00:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=resent-from:resent-to:resent-date:resent-message-id
	:resent-user-agent:received-spf:dkim-signature:mime-version
	:in-reply-to:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=q+Xwevv4y+CM2CmAnrNocEpwEEXCgLc4Hv1QMD8M3Z4=;
	b=AO1Fxjh4vw75CbebEKI77T5xZu55dzchJ9H33Cnxo5LUh0aMxkMLrbXlJ/2pjrj9Sp
	M1PCimX7Mr23FHvDvguyYbY80RLhnHdta/3g/DUqknLrphliOODShUZwx1QU7mv2NlTY
	AtfJ9cybeDKejvnPm5RAjZjLFJ9rJ55wAbpvw7FVkWJP1Oo83q2jkVpDohZySZtN+mEy
	HpYzmUUS/Wuy+Ol9o1CajRWNza5avFzZY0fiYWn6URlw7PN7YXc83wOJQxgadcUJ3Tfs
	ygNxLhtcFyyPKmSDJgI0ymo+EsfQs50yTQZSv0AlcBKjPobQtzqxdEpjqGfhiVPrx0a/
	3hFQ==
Received: by 10.14.127.76 with SMTP id c52mr1962362eei.37.1332229484694;
	Tue, 20 Mar 2012 00:44:44 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id e56sm2364368eea.11.2012.03.20.00.44.44
	(version=SSLv3 cipher=OTHER); Tue, 20 Mar 2012 00:44:44 -0700 (PDT)
Resent-From: Steffen Sledz <sledz@dresearch-fe.de>
Resent-To: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Tom Rini <tom.rini@gmail.com>, Khem Raj <raj.khem@gmail.com>
Resent-Date: Tue, 20 Mar 2012 08:44:43 +0100
Resent-Message-Id: <4F68356B.7060809@dresearch-fe.de>
Resent-User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
Received: by 10.216.1.67 with SMTP id 45csp10242wec;
	Tue, 20 Mar 2012 00:42:44 -0700 (PDT)
Received: by 10.224.106.66 with SMTP id w2mr19050249qao.1.1332229363860;
	Tue, 20 Mar 2012 00:42:43 -0700 (PDT)
Received: from mail-vb0-f44.google.com (mail-vb0-f44.google.com
	[209.85.212.44])
	by mx.google.com with ESMTPS id gk4si636208qab.50.2012.03.20.00.42.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Mar 2012 00:42:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of fransmeulenbroeks@gmail.com
	designates 209.85.212.44 as permitted sender)
	client-ip=209.85.212.44; 
Received: by vbbez10 with SMTP id ez10so1084529vbb.31
	for <sledz@dresearch-fe.de>; Tue, 20 Mar 2012 00:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=q+Xwevv4y+CM2CmAnrNocEpwEEXCgLc4Hv1QMD8M3Z4=;
	b=tyDPqhH6TouYNIAitsyzZQPASVF0NBfzNdx77WLke8AsE3Zsj1WHB4VlOjs6pzz3xg
	xhxHJCaSeA6vfuNlLcrJwl5Kz31aC603QnnNFuMl9CFdFRcO6+YX16zpypxDfJVVMsWf
	/klKG4Q24Ycfh9J+JIkgdIOnMfDVQ8f6OU6Vyp/0Z7BtxwWIoMGSQXYGvpporujBQ9ND
	CCJdIQ3GOSL4sV+bWrPZ4CvQSrdWvwgtYQjkHFN9z/Rz2oiCLjdMVRTYVxBoU9YekrCj
	rfo0MnNrxzMaWiSIRdJDQompDvjDnI8+0msEzMDgnNG4JzO/B2TzRafuHkZAtkGe/cS+
	G+aw==
MIME-Version: 1.0
Received: by 10.220.116.10 with SMTP id k10mr6168731vcq.25.1332229363008; Tue,
	20 Mar 2012 00:42:43 -0700 (PDT)
Received: by 10.52.30.98 with HTTP; Tue, 20 Mar 2012 00:42:42 -0700 (PDT)
In-Reply-To: <4F682E0C.4030101@dresearch-fe.de>
References: <4F61C54B.1000609@dresearch-fe.de>
	<4F66E4F2.2000909@dresearch-fe.de>
	<CA+M6bXmpiegfSspYOwybxKSLf4Ukg5tjRL4VR1aq8T4EFyaaRg@mail.gmail.com>
	<CACW_hTbMZ5R6VB_BChH+3rxx-tqV3jqxioX8Q5ZWsoiHJWZ=7w@mail.gmail.com>
	<20120319162122.GA19810@bill-the-cat>
	<4F682E0C.4030101@dresearch-fe.de>
Date: Tue, 20 Mar 2012 08:42:42 +0100
Message-ID: <CACW_hTZaNQSiUDPPC2VyDqzeBenFwyKXUT6uaqR96LooaNiDRg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
X-Gm-Message-State: ALoCoQmJRhKJ1K8ILaUk29gRy5QFVEm4+VBIA1PtqhySq856O8NW7tKc5T+PCi8HqRh7AAXGgAk1
Subject: Re: libmatthew-java-0.7.1.tar.gz not fetchable
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
X-List-Received-Date: Tue, 20 Mar 2012 07:53:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2012/3/20 Steffen Sledz <sledz@dresearch-fe.de>:
> On 19.03.2012 17:21, Tom Rini wrote:
>> On Mon, Mar 19, 2012 at 04:44:10PM +0100, Frans Meulenbroeks wrote:
>>> 2012/3/19 Tom Rini <tom.rini@gmail.com>:
>>>> On Mon, Mar 19, 2012 at 12:49 AM, Steffen Sledz <sledz@dresearch-fe.de=
> wrote:
>>>>> On 15.03.2012 11:32, Steffen Sledz wrote:
>>>>>> libmatthew-java-0.7.1.tar.gz (used in 2011.03-maintenance branch) is=
 no longer fetchable from it's original location (the maintainer provides t=
he latests version only). And i did not found another reliable source.
>>>>>>
>>>>>> Can someone put the tarball into the OE and/or Angstrom mirrors?
>>>>>
>>>>> Ping!
>>>>
>>>> If someone points Khem at a copy, this can happen...
>>>>
>>>> --
>>> google is your friend
>>>
>>> http://pkgs.fedoraproject.org/repo/pkgs/libmatthew-java/libmatthew-java=
-0.7.1.tar.gz/6a4db221129f230c64a0f937d00bb703/libmatthew-java-0.7.1.tar.gz
>>>
>>> It might be useful to update the recipe itself as well.
>>> Furthermore we might consider running a fetchall and put all fetched
>>> on the mirror.
>>
>> Does pkgs.fedoraproject.org have a policy about forever, ala
>> snapshot.debian.org? =A0Otherwise, we're just making a problem for
>> ourselves in the future. =A0WRT an everything mirror, I think bandwidth
>> usage is a concern there, ala what I think happened with the angstrom
>> everything mirror.

I don't know about the policy fedora has for retaining packages.
There might also be a copy on debian. Google gave a fair number of hits.

Wrt the bandwidth problem: fair
Then again, I'm not sure how much oe classic is build nowadays and how
much load this would really mean.

In any case we could run a fetchall and store the results somewhere.
Then we at least have a copy handy if upstream does not have the
sources any more.
>
> Khem has put the tarball on the mirror. But this does not fix our problem=
.
>
> Fetching from the original url downloads an XHTML error page and stores i=
t under the name of the archive. This of course results in a checksum misma=
tch. :(
>
> So in my opinion changing the recipe to the fedoraproject url seems to be=
 the best way.
>
There is yet another option. We could also host the sources somewhere
on oe and adapt the recipe to read from this oe dir.
The difference with a mirror is that this also works if there is no
mirror configured (and ofc "somewhere" could be the mirror dir).

Frans


