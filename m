Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1P0KQW-000825-Jq
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 22:35:57 +0200
Received: by gxk10 with SMTP id 10so1768029gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 13:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Z75FaiwI+EmpPMm7B/xzf+MNlPGFBdZFkquO9V+SuCY=;
	b=kxwSJ6R65X+MRXNXFVR74jFryy8rRxI/dRzxFfcdnUTl1l8Y7At6i+bLfvm9k3ZldR
	/ICtSair3a7I4YfV90gwm7R2jmly+5BpZNXc0IrSYMDeMnxtD19YZ373FFiTOU3bT5h4
	iGJktLo40f/dr+RuSpIZpFg/NMh7oFhnsKGXQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=HfMZKBztG2xVEARvpi9mLt/Uec3hCTmgxv0343yAM/wBS7acVvKKw3KrfmWS9Kukme
	/7g7S6J6CK3/lf8spj+sCUrqF0n5yMWYlktP96HJ0OCVtTlHDkn0gr+8uGX9Qw6Zd/11
	j759hsOkiaqLMQf564jTozaW+8ZYxXwANiDXw=
MIME-Version: 1.0
Received: by 10.151.82.5 with SMTP id j5mr7794459ybl.406.1285619743048; Mon,
	27 Sep 2010 13:35:43 -0700 (PDT)
Received: by 10.220.195.72 with HTTP; Mon, 27 Sep 2010 13:35:42 -0700 (PDT)
In-Reply-To: <AANLkTi=p=gKDTx8tdA4hNi68yox+_id_bH2AMsJ7n41Y@mail.gmail.com>
References: <AANLkTi=7Ys9reqVWjN5Byrpt+kagk6EBO-9xLr9ptPFa@mail.gmail.com>
	<AANLkTikkqKU+_z56TRPJKruaK9H4gKyH3wH4F1Y05fVi@mail.gmail.com>
	<AANLkTins7NgooRSA18jB=KsZ8tV9CCVwnUJdYbM510eF@mail.gmail.com>
	<AANLkTi=BJeoO6OUp4cShDvHbd8Mx=iJxzDGfGjciUEob@mail.gmail.com>
	<AANLkTinzN+6ys_DG481a7LiAh9+idyCxtSJ-RJZj-jYx@mail.gmail.com>
	<AANLkTi=p=gKDTx8tdA4hNi68yox+_id_bH2AMsJ7n41Y@mail.gmail.com>
Date: Mon, 27 Sep 2010 13:35:43 -0700
Message-ID: <AANLkTik17QrLf+MZ0NO7vDAnUFY=25nDagJPOgg5_gKo@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
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
X-List-Received-Date: Mon, 27 Sep 2010 20:35:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Aug 29, 2010 at 2:49 AM, J. L. <vwyodapink@gmail.com> wrote:
> Another thing I have noticed as well is that there are a bunch of
> packages that do not fail to build but while they build they show
> messages of not finding shared libraries missing depends and things
> like that. Is that things I should post as well?
>
> On Sun, Aug 29, 2010 at 2:44 AM, J. L. <vwyodapink@gmail.com> wrote:
>> if you tell me things to do or try I would be happy to help you figure
>> it out. I really wouldnt like to have to switch up yet at least. I am
>> honestly not great with OE at all yet so I would need dumb mans tips
>> to help you out.
>>
>>
>> On Sun, Aug 29, 2010 at 2:28 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Sun, Aug 29, 2010 at 2:23 AM, J. L. <vwyodapink@gmail.com> wrote:
>>>> That is the only OS I have setup with a build environment. Should I
>>>> just finally upgrade to the 10.04 release? Would clean install be the
>>>> best to do or can I just upgrade and not cause issues with the build
>>>> environment? I think its an issue for my build OS only as on the
>>>> gumstix board steve said it worked for him using the same OS as you
>>>> are.
>>>
>>> You can try and upgrade. if that does not work and reinstall. Your system
>>> your choice. Though it would be interesting to find why this error
>>> happens on 9.10
>>>
>>>>
>>>> On Sun, Aug 29, 2010 at 2:16 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>> On Sat, Aug 28, 2010 at 8:11 PM, J. L. <vwyodapink@gmail.com> wrote:
>>>>>> I am running ubuntu 9.10 with and up to date overo branch of OE and
>>>>>> apr- util will not build gives the following error:
>>>>>
>>>>> I cant reproduce it on ubuntu 10.04. If possible can you retry to
>>>>> reproduce it on some
>>>>> other build OS than 9.10
>>>>>
>>>>>>
>>>>>> NOTE: Running task 819 of 832 (ID: 9,
>>>>>> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb,
>>>>>> do_qa_configure)
>>>>>> ERROR: This autoconf log indicates errors, it looked at host includes.
>>>>>> Rerun configure task after fixing this. The path was
>>>>>> '/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/apr-util-1.3.4-r5/apr-util-1.3.4'
>>>>>> ERROR: Error in executing:
>>>>>> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb
>>>>>> ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
>>>>>> ERROR: Printing the environment of the function
>>>>>> ERROR: Build of
>>>>>> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb
>>>>>> do_qa_configure failed
>>>>>> ERROR: Task 9 (/home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb,
>>>>>> do_qa_configure) failed
>>>>>> NOTE: Tasks Summary: Attempted 818 tasks of which 818 didn't need to
>>>>>> be rerun and 1 failed.
>>>>>> ERROR: '/home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb'
>>>>>> failed
>>>>>>
>>>>>>
>>>>>> I have tried cleaning the recipe and rebuilding with no luck as well
>>>>>> as trying to build from a fresh tmp directory. Though I think I
>>>>>> understand the error I do not know how to go about fixing it with a
>>>>>> proper patch. I would appreciate any help with this.
>>>>>>
>>>>>> _______________________________________________
>>>>>> Openembedded-devel mailing list
>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>

I upgraded to 10.04 and I still have the same issue with apr-util_1.3.4

gives this error:

NOTE: Applying patch 'configure_fixes.patch'
(org.openembedded.dev/recipes/apr/apr-util/configure_fixes.patch)
NOTE: Running task 818 of 832 (ID: 12,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb,
do_configure)
NOTE: Running task 819 of 832 (ID: 13,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb,
do_qa_configure)
ERROR: This autoconf log indicates errors, it looked at host includes.
Rerun configure task after fixing this. The path was
'/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/apr-util-1.3.4-r6/apr-util-1.3.4'
ERROR: Error in executing:
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Build of
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb
do_qa_configure failed
ERROR: Task 13 (/home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb,
do_qa_configure) failed
NOTE: Tasks Summary: Attempted 818 tasks of which 813 didn't need to
be rerun and 1 failed.
ERROR: '/home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb'
failed


I will try going through devshell and see if I can make some progress
with it but I am still struggling with recipes. If anyone has
something specific I can try I would appreciate the tip. Thanks


