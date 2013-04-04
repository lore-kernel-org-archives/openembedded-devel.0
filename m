Received: from mail-qe0-f46.google.com ([209.85.128.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UNraV-0001Aw-Sv
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 23:20:52 +0200
Received: by mail-qe0-f46.google.com with SMTP id a11so1694121qen.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Apr 2013 14:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=ShPUtShZ4oOkL/B9eMytzNMSkOG9ZoXTMtT4WkMnGTg=;
	b=Iydwj8c5guhwmGaPrvHIbAq4tppzftHoYXQFvAPl/38GnauusMJ8DJdy7WDMF2hLs/
	1dj0yP98+lhXdFPbYB5ADpjpWhTWkOvnip7nrXYQ4uosIF/ejv8zOspSjQmabhND24ED
	UExuZW2jnkJAW+DEH023NXGnCJS6JDjsQunINEZ0rVRHkSEjI50x9H+YocAvufErxlpv
	HVAoCR6qDvxs0dzSLArIZnVh+VKUlqXHFSGsGGsIQL1uOBlupnHkyQn99l4jfa9bpXGg
	TYnL2KzWMItm6JvV0qooz+2rRHQxH1uXg1n5iu2WdjiVAXEg6pbnhRv4ZzwUtxSL1+CB
	BQkQ==
MIME-Version: 1.0
X-Received: by 10.49.64.72 with SMTP id m8mr6950174qes.51.1365109418157; Thu,
	04 Apr 2013 14:03:38 -0700 (PDT)
Received: by 10.49.58.171 with HTTP; Thu, 4 Apr 2013 14:03:38 -0700 (PDT)
In-Reply-To: <CA+chaQf0r77KGfkdT7ZNU=TXgXz-Jh3KxG82+=Lh9eVx+qHyOw@mail.gmail.com>
References: <515DE693.1050601@pseudoterminal.org>
	<CA+chaQf0r77KGfkdT7ZNU=TXgXz-Jh3KxG82+=Lh9eVx+qHyOw@mail.gmail.com>
Date: Thu, 4 Apr 2013 23:03:38 +0200
Message-ID: <CA+chaQfJxXkFjA7+L9qzx7LzQE2zAbBAG105VkYAgMfJaGexqw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: DEFAULTTUNE_<machine> not working
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
X-List-Received-Date: Thu, 04 Apr 2013 21:20:52 -0000
Content-Type: text/plain; charset=UTF-8

http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/30164


On Thu, Apr 4, 2013 at 11:02 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> Check with bitbake -e, don't trust the header shown at the beginning of
> build log.
>
>
> On Thu, Apr 4, 2013 at 10:46 PM, Carlos Rafael Giani <
> dv@pseudoterminal.org> wrote:
>
>> Hello,
>>
>> I have tried to set a machine specific DEFAULTTUNE in the local.conf .
>> Example:
>>     DEFAULTTUNE_beagleboard = "cortexa8hf"
>>
>> but this does not seem to work. I do not see "callconvention-hard" in the
>> TUNE_FEATURES list bitbake shows me.
>>
>> Writing this in local.conf works, however:
>>     DEFAULTTUNE = "cortexa8hf"
>>
>> I am using OE Danny, and distro is Poky 8.0 .
>>
>> Any ideas on what is going on here?
>>
>> ______________________________**_________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
>> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**
>> openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>>
>
>

