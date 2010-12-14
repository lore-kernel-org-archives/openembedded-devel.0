Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PSaUX-00012I-MZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 20:24:55 +0100
Received: by iwn8 with SMTP id 8so1121376iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Dec 2010 11:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=IGCoB8iY67RJLG8YtACMs+AIn5uucYjevR0/VLbbv5g=;
	b=egvT8IVJIT8ywRpdQQh6L4I45YO1/gH+9QG/fhHl1JdCI/2P/emPNYXE1aAej1t4dd
	oBvExrnDU9sgHyinM8+1rGMASnGuOrgv1yhhABqVtCDVvbEhsuH0+Kt9LR5Khrl8qcZg
	y71gvZ5t7TyUKjDa/K39VsftQ2wWweRuo3BFc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=X4SAvKdb7TEvdnjhdZkvqSto55IfqEA5A16JqoOWgnUvQtPGt5LXFgZitE9RWiSw2x
	kC7+6MhYWSPztfW3qYLvyEZVX4Svy/am+jYFNm7WYjMbkIPxHnZxI2xo4zlLSJajZmxC
	dchOdtKPyjVmqt3XpQl/O7a+iJrdENhpoNBl8=
MIME-Version: 1.0
Received: by 10.231.31.1 with SMTP id w1mr3906218ibc.7.1292354597901; Tue, 14
	Dec 2010 11:23:17 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Tue, 14 Dec 2010 11:23:17 -0800 (PST)
In-Reply-To: <4D076851.1030406@opendreambox.org>
References: <1292166229-23112-1-git-send-email-fransmeulenbroeks@gmail.com>
	<4D076851.1030406@opendreambox.org>
Date: Tue, 14 Dec 2010 20:23:17 +0100
Message-ID: <AANLkTimgwjE2aT34JvY=h9uW=_7Rc4ZTEhqmnBA-YpG_@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rm_work.bbclass: allow a shell var to override rm_work
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
X-List-Received-Date: Tue, 14 Dec 2010 19:24:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/12/14 Andreas Oberritter <obi@opendreambox.org>:
> On 12/12/2010 04:03 PM, Frans Meulenbroeks wrote:
>> Sometimes one is building with rm_work, but for a specific build you want to
>> keep the work even if the build is successful.
>> One way to achieve this is to comment the INHERIT += "rm_work" from your
>> local.conf file, but this means that all recipes need to be reparsed which takes some time.
>>
>> This patch introduces a variable KEEP_WORK
>> If this variable is set the work will not be removed.
>> Intended use is
>> KEEP_WORK=1 bitbake yourrecipe.bb
>> Default behaviour is kept the same (in case KEEP_WORK is not set)
>>
>> Note that in order for this to work KEEP_WORK needs to be added to the env var BB_ENV_EXTRAWHITE
>> e.g. export BB_ENV_EXTRAWHITE="KEEP_WORK"
>>
>> We still might want to improve the test so it only keeps the work if KEEP_WORK is > 0
>> (or do not execute the task at all if KEEP_WORK is not set).
>> Also we might want to add KEEP_WORK to the whitelist of vars that are always ok
>>
>> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
> I'd prefer a variable with a prefix like OE_, but that's probably just a
> matter of taste. Are there any guidelines?
>
> This patch motivates me to enable rm_work by default for our distro. It
> would be nice if this variable would become documented on the wiki.
>
> Acked-by: Andreas Oberritter <obi@opendreambox.org>
>
>
I can document it if it becomes accepted behaviour.
Wrt the naming: I have no real preference.
I'm not aware of any guidelines

Frans


