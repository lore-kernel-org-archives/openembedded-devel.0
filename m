Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U2PXL-0000zi-A9
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 18:08:55 +0100
Received: by mail-vc0-f180.google.com with SMTP id fo13so3989551vcb.39
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2013 08:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=cjSGYV9vC1IoQFYeUn4QrmyJtYHmsil+OxUD1cb78Lo=;
	b=O7lBnDsr+0skpdT4Zcm1uayBhSRG/awKZCrSXw1R/JCyeCwpyQHT8cmtqoAfq/uAqO
	Ui8dlMUvuLl6mB3iUS1thcD1Z/iv0+RWvwD3wEXnI2BwLnEZUNRQsN0HCSZSTTnwMHQf
	CjtXAEySVM8lbgYhXF2MMPS33sY5C5yCGjwSqJ2x0v4dYi9XWaoi72ERHZRL4/Xg85tW
	PYHqE8RUnMvS7NFsTsLsqF9A1917j4g6RzZLPBUWh1uq7dV1GbQQcNf8H5UWKIDGxLyq
	GukjBi3TRP/g42mxD+rg5iSW0t8u/BaWqkbqVMY/R8gzduo1tipfiRv53v8uWR7UgbNN
	KPyQ==
MIME-Version: 1.0
X-Received: by 10.52.28.101 with SMTP id a5mr20307638vdh.92.1359996786260;
	Mon, 04 Feb 2013 08:53:06 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Mon, 4 Feb 2013 08:53:06 -0800 (PST)
In-Reply-To: <85boc0ulkr.fsf@cl-t066-141cl.privatedns.com>
References: <1359982426-9836-1-git-send-email-mario@ossystems.com.br>
	<20130204120212.GA3271@jama>
	<85boc0ulkr.fsf@cl-t066-141cl.privatedns.com>
Date: Mon, 4 Feb 2013 17:53:06 +0100
Message-ID: <CALbNGRSVqTam7Z3KiBwWFYCty-h1=tBKSpevKtLYdcorrsDiHQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] xinput-calibrator: add --boot-mode comand line option to wrapper script
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
X-List-Received-Date: Mon, 04 Feb 2013 17:08:58 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 4, 2013 at 4:48 PM, Mario Domenech Goulart
<mario@ossystems.com.br> wrote:
> Hi Martin,
>
> On Mon, 4 Feb 2013 13:02:12 +0100 Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> On Mon, Feb 04, 2013 at 10:53:46AM -0200, Mario Domenech Goulart wrote:
>>> xinput_calibrator_once.sh has been renamed to
>>> run-xinput-calibrator.sh, which now also handles the --boot-mode
>>> command line option.
>>>
>>> When in boot mode (i.e., when --boot-mode is provided on the command
>>> line), the script exits if calibration data is found in the
>>> calibration data file.  When not in boot mode (i.e., no command line
>>> option), the script runs xinput-calibrator and creates/overwrites the
>>> calibration data file.
>>>
>>> This change allows other applications to use a common wrapper
>>> (run-xinput-calibrator.sh) for xinput-calibrator.
>>
>> Did you send this upstream?
>>
>> Can you provide Upstream-Status?
>
> Sorry, I messed up using git send-email (used a file as argument, which
> made it ignore --subject-prefix).
>
> Since Andreas is working on a better solution, this patch can be
> ignored.
I still have one problem to be solved and it might be that my solution
will not be accepted...
>
> Sorry for the noise.
That was just two people working on same issue :)

Andreas


