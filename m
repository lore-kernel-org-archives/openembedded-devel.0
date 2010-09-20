Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OxbIN-0004c5-3x
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 10:00:15 +0200
Received: by iwn2 with SMTP id 2so4150389iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 00:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=DURGssTy1NwO90JdBVz5eHirpNDt62sbcEGGJwo2/M8=;
	b=VFbzTz/KvqyQYoprXKjdwxF3YzuIKayqUXrf64Lpz8bIXuF+xCJfKbzjcW2jeXL40o
	jzn8jf1ayjjRNU9ZgRW4BvezM+SeFVgJBYnw1ZpMBP+9D1ai7ZP+ueDQdQckS1k5dy/z
	8j1v5SZc8emy6vnuFO74d2by/8L/ff4HVsn4E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=uYkmlXKaGO883AglF3dNyfWPSqPrajmtC2nXELKqAdBxtGqxsKlXlrrLW0sUWzKHdV
	cunu98jCAhY+CuqqTKrK2Q4XEK+8HmEvhUEtl1kem4U9G5ckyyTTHbpXq4mcvJeUTw2G
	4kYfrHkIDeKnu8TAVT1CHkbBUeH5+f5YWVlrY=
MIME-Version: 1.0
Received: by 10.231.171.7 with SMTP id f7mr9894493ibz.72.1284969559486; Mon,
	20 Sep 2010 00:59:19 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 20 Sep 2010 00:59:19 -0700 (PDT)
In-Reply-To: <AANLkTinXAi_vfWGN=eWhPjT5nrOT4up7nPeK2=BYWtqJ@mail.gmail.com>
References: <AANLkTi=KDR=mtuVUiQE-5_-FL4oR+meQssfeUgz6bBLq@mail.gmail.com>
	<1284048433-20991-1-git-send-email-eric@eukrea.com>
	<AANLkTike7kmRPU9iw8wyC3v5=rLrr+DqiyskkoGC5H30@mail.gmail.com>
	<4C891E0C.1050400@eukrea.com>
	<AANLkTinXAi_vfWGN=eWhPjT5nrOT4up7nPeK2=BYWtqJ@mail.gmail.com>
Date: Mon, 20 Sep 2010 09:59:19 +0200
Message-ID: <AANLkTikSipVh8jPBhmUnj9DBMYZFh=NguHq9_C4rXRTB@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] generate-manifest-2.6.py: tune python-modules' RDEPENDS
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
X-List-Received-Date: Mon, 20 Sep 2010 08:00:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/9 J. L. <vwyodapink@gmail.com>:
> On Thu, Sep 9, 2010 at 10:49 AM, Eric B=E9nard <eric@eukrea.com> wrote:
>> Le 09/09/2010 19:34, J. L. a =E9crit :
>>>
>>> Dumb comment time: Wouldnt it be better to make maybe a few different
>>> python module packages installs instead of thining out the
>>> python-module? I know I personally use all the modules for python
>>> available here plus some other modules as well. I know not everyone is
>>> concerned with making their images as small as possible. Probably just
>>> not getting the reasoning or point but just thought I would make the
>>> statement there are those that use python-dev as is
>>>
>> this change doesn't prevent you from using python-dev, you will just hav=
e to
>> install it manually. This change only allow to install python-modules
>> without installing all the dev files they actually pull.
>>
>> Eric
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> Thanks Eric that makes total sense to me now, appreciate the response
> and clarification.
>
> JL
>

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


