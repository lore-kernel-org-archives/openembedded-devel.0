Received: from mail-yw0-f195.google.com ([209.85.211.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nch5H-0008Ih-8Z
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Feb 2010 16:24:06 +0100
Received: by ywh33 with SMTP id 33so1352551ywh.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Feb 2010 07:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=v8J/HlCljN+1d0q/ZJvIlCP5QP+Ga2eowP2WiYV7UtE=;
	b=Fp62xZb4zM17/2GLCgZK8LYuSvK84NECL1dS0TwJRi1IXvyhDTui5nYuupIgjLw1Lw
	rwK9LuAq1Z1M/TZw5FbqdeWw3Vf1gBXfqZY/zapDvYg12ip1wg/QeU0s9Gv2KYWHmGSr
	jTcMh5BT/ITC9FuoMyrD+7IrQ6ZbfBS5WL9tY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=oSqoPouPTAmCuTJ4htPZfikGkX82M7QV2JgbvrHD78epeW2bbnIJZkMM+79k/7T6cq
	CuwlGZf2bK1pVjFPijGqZlxygLomvzxZO9YilyFashwFd5dgoIQRMqYATq6ysmmfk3Op
	afjDWDXpzFqIqBGi3KtLSQwXZQ4o2Z7MlWW+Q=
MIME-Version: 1.0
Received: by 10.101.211.17 with SMTP id n17mr9846575anq.226.1265210494790; 
	Wed, 03 Feb 2010 07:21:34 -0800 (PST)
In-Reply-To: <BAY127-W196CB49757D93B154DD129D8560@phx.gbl>
References: <BAY127-W196CB49757D93B154DD129D8560@phx.gbl>
Date: Wed, 3 Feb 2010 16:21:34 +0100
Message-ID: <ac9c93b11002030721s95f6c8bge3388e9a9d0926c9@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.195
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: problem in bitbaking
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
X-List-Received-Date: Wed, 03 Feb 2010 15:24:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/2/3 saleh usman <salehusman@hotmail.com>:
>
> If it is a problem of automake/automake. then how can I solve it.Actually=
 I am unable to diagnose these kinds of problems.Is there any tutorial/docu=
mentation other than openembedded user manual which can give me better unde=
rstanding of all of this process.
> plz help me in resolving this error.
> Saleh

I don't have/know ossie.
Some hints though:
You could try to do a bitbake boost (or maybe it is called libboost).
then bake ossieimage. If that works there is a missing dependency
somewhere.
I tmight also help to provide some more info. E.g. mention at what
time you get the message (which recipe was it building, which task is
failing etc).
With no info it becomes difficult to provide advice.

Frans

>
>>Steffen Sledz <sledz <at> dresearch.de> writes:
>
>>> saleh usman wrote:
>> > I am building ossie-image in openembedded using bitbake command but
>> > it is giving error of not finding boost_filesystem library.
>> > What exactly is this error.Plz guide me.
>>>saleh
>
>> Since today i see a similar problem when doing a clean bitbake of
>> glib-2.0. It seems to be a problem with automake/automake. :(
>>
>> Steffen
>
>
>
> _________________________________________________________________
> Hotmail: Free, trusted and rich email service.
> https://signup.live.com/signup.aspx?id=3D60969
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


