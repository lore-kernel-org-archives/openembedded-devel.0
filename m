Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PfwOL-0001Oo-IZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 16:25:41 +0100
Received: by pxi17 with SMTP id 17so130157pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jan 2011 07:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type;
	bh=GgyQ9Nd7b3ky3BfPGAjG7DcNkuGJ8yCl8+1eRXwZbng=;
	b=E1/tPq+WK46V4woN+3eShlw8ldxy7Bdl88ZAgEuPnMQu4ABl1A/7GFzVuNIN0uDufp
	SXw5tWd4y2gJuadlZ+jhICYM2Lg8hpNOY/8R+wdefvdVRfduQJczKbUSpzKC3jkoymKB
	BjK0pFFPMh/VraRiLES7J4HRaCv/Fw0rxEZ2k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=C+Dk+elALljRTuEfzRLzq7ta98g/EgwaMWkZyB8SjNlelWtA3L/jAdNkkJGD+MHRzR
	qRh/naMOldlPaaR2ewFibMQgEUyb9U2l7LLZdrqp9Ge5/Q6lyUe+Q/fNbwWdAVtI8e7A
	ODBcTUCLI7e49L4xAfcLii+W3WbYqm+rKKoWM=
Received: by 10.143.40.9 with SMTP id s9mr2201714wfj.366.1295537099083; Thu,
	20 Jan 2011 07:24:59 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.132.18 with HTTP; Thu, 20 Jan 2011 07:24:38 -0800 (PST)
In-Reply-To: <AANLkTikP0b5DUmNCpc0ST8pgW=B-VPhmX36NJvkm5iPO@mail.gmail.com>
References: <4D36F9BE.1010601@xora.org.uk>
	<AANLkTi=sJGSCRxSF6tFPhrGb=NKfmiLNURg-n-Gmgc3Z@mail.gmail.com>
	<4D370A54.6020607@xora.org.uk>
	<AANLkTikUOPo2v+=qYF_afhSHxkyb1EK3HJC1_E4RRGub@mail.gmail.com>
	<AANLkTik3ysHryPYNcpObiyky4X98=9exDyKtJD_3yu+k@mail.gmail.com>
	<AANLkTikP0b5DUmNCpc0ST8pgW=B-VPhmX36NJvkm5iPO@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 20 Jan 2011 08:24:38 -0700
X-Google-Sender-Auth: qN0O-JGe9gY_UiUvCEBQwo9SlSQ
Message-ID: <AANLkTikb=j_fKEB9mTGmUCZv4FnimNPnu11qDv07OMRL@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: openembedded-core git repository
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
X-List-Received-Date: Thu, 20 Jan 2011 15:25:42 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 20, 2011 at 3:21 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2011/1/19 Graham Gower <graham.gower@gmail.com>:
>> On 20 January 2011 05:22, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>>> 2011/1/19 Graeme Gregory <dp@xora.org.uk>:
>>>> Core should probably have a build bot which crunches a standard set of
>>>> tests on each commit so unlike OE currently people don't wake up to bad
>>>> day of debugging OE.
>>>
>>> I'm not sure if that is needed (at least not on for every commit).
>>
>> Doing this for every commit may be good from the point of view of
>> keeping git-bisect useful.
>
> Good point. Didn't think of that!

Take a look at git test-sequence.  It's *awesome* for ensuring
bisectability on changes before pushing.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


