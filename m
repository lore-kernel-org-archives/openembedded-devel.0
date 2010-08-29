Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1Ope7j-0002ET-2P
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 11:24:25 +0200
Received: by wwb31 with SMTP id 31so5246081wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 02:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=2n79/f3vXG+UyU5aou1ZVHmkzLas+DB6Qddpjnii2zQ=;
	b=pDHKZUhk0BYz0NIC62RLgGQZxtAaVUF8jZMPtwf5AGUpRpNvezAEW4kLtCCgQ1EU6g
	9iN3jPOvcpG+gieRFLoEzPNX4a6NyqVqnFP6CHoWun4I6MvyvGPDCjtiIUzfnbMhhwRa
	DaekoM23Vz3T9z4Ua0RscgCif11w5+PQuv+P4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=mX9mF1UeOU4Jo7+mui6s+XCSWePslORMZaSylVx8Dqn2GpKFurWGnXYswk+vovu1BG
	BwVNWWB3Al4FConrSkxRRkkXA6J/A6G/HfqvV6Xu0FdNEX7cVDc/ENeI1AkW1VOT4iF4
	OBVAysuliP4HRBQjETeoZ+JRD5aCark0h1SNM=
MIME-Version: 1.0
Received: by 10.227.39.222 with SMTP id h30mr3028265wbe.6.1283073832576; Sun,
	29 Aug 2010 02:23:52 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Sun, 29 Aug 2010 02:23:52 -0700 (PDT)
In-Reply-To: <AANLkTikkqKU+_z56TRPJKruaK9H4gKyH3wH4F1Y05fVi@mail.gmail.com>
References: <AANLkTi=7Ys9reqVWjN5Byrpt+kagk6EBO-9xLr9ptPFa@mail.gmail.com>
	<AANLkTikkqKU+_z56TRPJKruaK9H4gKyH3wH4F1Y05fVi@mail.gmail.com>
Date: Sun, 29 Aug 2010 02:23:52 -0700
Message-ID: <AANLkTins7NgooRSA18jB=KsZ8tV9CCVwnUJdYbM510eF@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: apr-util_1.3.4 does not build
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
X-List-Received-Date: Sun, 29 Aug 2010 09:24:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

That is the only OS I have setup with a build environment. Should I
just finally upgrade to the 10.04 release? Would clean install be the
best to do or can I just upgrade and not cause issues with the build
environment? I think its an issue for my build OS only as on the
gumstix board steve said it worked for him using the same OS as you
are.

On Sun, Aug 29, 2010 at 2:16 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sat, Aug 28, 2010 at 8:11 PM, J. L. <vwyodapink@gmail.com> wrote:
>> I am running ubuntu 9.10 with and up to date overo branch of OE and
>> apr- util will not build gives the following error:
>
> I cant reproduce it on ubuntu 10.04. If possible can you retry to
> reproduce it on some
> other build OS than 9.10
>
>>
>> NOTE: Running task 819 of 832 (ID: 9,
>> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb,
>> do_qa_configure)
>> ERROR: This autoconf log indicates errors, it looked at host includes.
>> Rerun configure task after fixing this. The path was
>> '/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/apr-util-1.3.4-r5/apr-util-1.3.4'
>> ERROR: Error in executing:
>> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb
>> ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
>> ERROR: Printing the environment of the function
>> ERROR: Build of
>> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb
>> do_qa_configure failed
>> ERROR: Task 9 (/home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb,
>> do_qa_configure) failed
>> NOTE: Tasks Summary: Attempted 818 tasks of which 818 didn't need to
>> be rerun and 1 failed.
>> ERROR: '/home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb'
>> failed
>>
>>
>> I have tried cleaning the recipe and rebuilding with no luck as well
>> as trying to build from a fresh tmp directory. Though I think I
>> understand the error I do not know how to go about fixing it with a
>> proper patch. I would appreciate any help with this.
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


