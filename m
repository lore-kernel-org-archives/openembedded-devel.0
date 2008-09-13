Received: from [209.85.198.248] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <felipe.contreras@gmail.com>) id 1KeYFe-0007KC-9E
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Sep 2008 18:45:38 +0200
Received: by rv-out-0708.google.com with SMTP id f25so1746266rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Sep 2008 09:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=koGUHeVk9ZYN8sTewD8Q2e4SPB6DLE7yzkX5TCWhCNA=;
	b=N8DQIEGa1d9biqSoeSjnI0jVfP+tGghLYhJM/O6bLSuADHz1aRixFEreliAoTPXsmY
	HzQ0f4mnM9JYaD1QDwIgWCFN8+XbT6MPsxhxZPgCMOoG8qtC+CXkgdieuMGbFipHdge7
	Xd88ZeQvit9frnPmwyyM0v2vjG4Lmp8AqTzCI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=G40+2+Nq9NO6aOjBgmPlmusNycWhGzdA9tPonW1f1J8wBzXpNQcKW5FpZxc3Jzq3hv
	tgFLEsvoOK4yhJ1eUpViY2m7UWZmqBKckWjJ0oTrFy8uEAcrhCDOIPoJfLhoO/zF9csN
	XCEiWQMNCDJA2K/Oh7BX8McIFzj65qTGUXoLs=
Received: by 10.141.179.5 with SMTP id g5mr3454653rvp.237.1221324167754;
	Sat, 13 Sep 2008 09:42:47 -0700 (PDT)
Received: by 10.140.166.19 with HTTP; Sat, 13 Sep 2008 09:42:47 -0700 (PDT)
Message-ID: <94a0d4530809130942n3a6c2095t7018ecbfff9387f4@mail.gmail.com>
Date: Sat, 13 Sep 2008 19:42:47 +0300
From: "Felipe Contreras" <felipe.contreras@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48CBE436.9050500@laposte.net>
MIME-Version: 1.0
References: <94a0d4530809121559w5f644174j461ec61cb2327fd8@mail.gmail.com>
	<48CBE436.9050500@laposte.net>
Subject: Re: [ANN] mtn2git v0.1
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
X-List-Received-Date: Sat, 13 Sep 2008 16:45:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Sep 13, 2008 at 7:03 PM, cyril Romain <c.romain@laposte.net> wrote:
> Hi Felipe,
>
> Felipe Contreras wrote:
>>
>> This is the result of various experiments I've been doing while trying
>> to import mtn repositories into git. I've looked into other mtn2git
>> scripts but none fitted my needs
>
> Did you take a look at the mtn2git python script available in
> org.openembedded.dev/contrib/mtn2git/mtn2git.py ?
> Since it was intended and used to convert the OE monotone repository to git,
> I think it should fit your needs :-)

I did look at it, but there are some issues. For starters it seems to
be using extensively the manifest, which would probably make it very
slow. Also, it seems to be keeping the trees of all the revisions.

Superficially it seemed to have issues so I didn't try it, but I also,
I can't stand Python code =/ Do you know how long does it takes to
import the OE repo?

Anyway, the patches I did for git fast-import should also help your
script if there is a plan to stop using the manifest.

-- 
Felipe Contreras


