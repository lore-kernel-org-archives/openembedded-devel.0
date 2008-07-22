Received: from [209.85.198.251] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KLPCj-0003nw-Mf
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jul 2008 23:15:30 +0200
Received: by rv-out-0708.google.com with SMTP id f25so2159134rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2008 14:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=DmXJAzm4QLLKvON97++BDdMzD0SEr4YHehwon/Kq1eQ=;
	b=HEsO2N4Z8Yow3+pL2XRdxNwSMAGNlW7UyaoQkA89getn7HWbyj+nc4ol/+10zulzQf
	M5cdpusu8Bmg4jBYvA6fc2ikVJto8bxDseHJcUCJPwkmNrScjeFMX9SYlpO0fGPMp8bu
	5hJABsRcLXYYEemXMwN2MvqDbAYJGaIKNkJJM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=MslVrz8Ryf6Ftbw5wVi9+/Qd7B5iTiDcMxOQdAIAne3gMWY1ObvcAwxA9Fngx66ih/
	Dx4u5R5QnfF0/sbvhGpHYNjLco4KKPoSrIv7opemLDpwzPediwDNKB+vinLVfic4tEju
	7JCCeQJYumbdyvGHYXfN1sVsXmfeGCTEyh39Q=
Received: by 10.140.185.1 with SMTP id i1mr144429rvf.264.1216761260619;
	Tue, 22 Jul 2008 14:14:20 -0700 (PDT)
Received: by 10.141.116.18 with HTTP; Tue, 22 Jul 2008 14:14:20 -0700 (PDT)
Message-ID: <d2b9ea600807221414o11109cd5ya06f947791a99ccb@mail.gmail.com>
Date: Tue, 22 Jul 2008 23:14:20 +0200
From: "Esben Haabendal" <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g64ht6$h2u$1@ger.gmane.org>
MIME-Version: 1.0
References: <d2b9ea600807220111i4c3adc1ekcb470034329e18f7@mail.gmail.com>
	<g64ht6$h2u$1@ger.gmane.org>
Subject: Re: Stable source repository
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 22 Jul 2008 21:15:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jul 22, 2008 at 1:56 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> Esben Haabendal wrote:
>>
>> Hi
>>
>> For some reason, some OSS projects does not offer persistent access to
>> old releases,
>> which continously give problems for OE and other similar distributions.
>
> Angstrom already provides a sourcemirror for exactly this reason.

I see.  But I guess it is still valid to use OE without using Angstrom?

>> With the org.openembedded.stable branch, this problem is considerably
>> worse.
>> The usual fix in .dev is to upgrade the recipes to a current release,
>> which of-course
>> is not what we want for a stable branch.
>>
>> Take for example
>> http://bugs.openembedded.net/show_bug.cgi?id=4227
>
> Fakeroot is present on the angstrom sourcemirror.

I know.  I am just trying to find out if a better permanent solution
for OE in general could be established.

>> I think it is worth considering a permanent solution to this kind of
>> problems.
>> We should have a download server which carries all sources referred to
>> by http and ftp URI's in org.openembedded.stable recipes.
>> Why not setup ftp://downloads.openembedded.org/org.openmbedded.stable
>> to mirror a copy of all sources referred to by current .stable recipes,
>> and
>> when a bug is filed with a missing source, the solution is simply to
>> change
>> the SRC_URI to use the ftp://downloads.openembedded.org URI instead.
>>
>> Of-course, unless continous manual labor is to be required, we need to
>> write a script or something like that to maintain the mirror repository.
>
> The angstrom autobuilder updates the sourcemirror already with distributable
> sources.

It would be nice if someone knowing how to operate the angstrom
autobuilder could describe how to re-use that for other distros.  We
really should have an easy way to do the same for any OE distro.

>> And we need a server with enough storage and a big fat pipe to the
>> Internet.
>>
>> What do you think?
>
> If you use a sane distro like angstrom, you will automagically have a source
> mirror.

Sorry, I seem to be using a non-sane distro then. I am just seeking a
way to sanitize it.

/Esben


