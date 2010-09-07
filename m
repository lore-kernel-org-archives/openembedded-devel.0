Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1Ot0xV-0001pP-3T
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 18:23:46 +0200
Received: by wwi14 with SMTP id 14so5536251wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 09:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=YP7ghy+R7LElwVU7o5Nu7Z4F+KqI+W/zEwAIdPhXk9w=;
	b=lZmYrBqWRO5djjkovB++pw58rTUGSb5xq6jnwp+FNtXJENVd+ZUBHbLUZYaAzZuAuu
	yegeWVIS3BcC4HJeYiptFd8AQbJd6vdmsFUDBLJ929bt22qV4rtCgLQuhjyymQyRj15W
	ULLn1PuJ0rc4FYFJRpPea50NbfY9AoA/6XAkY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=EUP6u850pa9Dp2LAoyH+fSldQM5iZBUk0G5ZJC5fJVGt5C+00XAOtEZMPniBhWRBDe
	tRXQOYUMy3K3Ou2SIdXFbQxQG9TYJ3Y7r1OCe1WYUuZX7Sle/MxM+YD7zWKrq2w3dVCW
	sqGlJu3Hs+Cj+UF2ZODby+9D+Lr/2koN+ZLL4=
MIME-Version: 1.0
Received: by 10.227.138.84 with SMTP id z20mr129630wbt.214.1283876568058; Tue,
	07 Sep 2010 09:22:48 -0700 (PDT)
Received: by 10.216.58.197 with HTTP; Tue, 7 Sep 2010 09:22:47 -0700 (PDT)
In-Reply-To: <4C86593A.7000006@mentor.com>
References: <AANLkTinU39HjKWb9=VMiSa=R2YA_9BxPDctiW1ire48C@mail.gmail.com>
	<AANLkTikk1sce-dOHW_uVOO3m+XPx1ZjapvcNAAHiXwnS@mail.gmail.com>
	<AANLkTikkJod_2MTGN4B+8Q4wS74v9Z=nEBqrucUrcYjv@mail.gmail.com>
	<AANLkTikZuBMiU2H8m3M97xFwcQE2GCdQ_2Q=TSM4b23-@mail.gmail.com>
	<AANLkTi=eX15FWkO+Fux8UpNv9tXkTVtkYrd=t3c_==2k@mail.gmail.com>
	<4C86593A.7000006@mentor.com>
Date: Tue, 7 Sep 2010 09:22:47 -0700
Message-ID: <AANLkTi=AL6HCYtK7CuCwzeTo7WW2QvfT8p9s8R73gVsO@mail.gmail.com>
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
Subject: Re: Perl modules I can not get to build, libdbd-sqlite-perl libversion-perl
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
X-List-Received-Date: Tue, 07 Sep 2010 16:23:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 7, 2010 at 8:24 AM, Tom Rini <tom_rini@mentor.com> wrote:
> Graham Gower wrote:
>>
>> On 3 September 2010 09:13, J. L. <vwyodapink@gmail.com> wrote:
>
> [snip]
>>
>>> and the other is honestly above me at the moment as I do not grasp
>>> using devshell yet and how to work with in there, let alone properly
>>> lay out a program recipe and then patch it to work properly. Once I
>>> grasp things more I hope to be a help and not such a hindrance, I
>>> welcome any tips links or anything to point to how to fix either and I
>>> will try more on more with those pointers and if successful post the
>>> results and maybe a patch or post the failure.
>>
>> Read the OE manual. Read the Bitbake manual. Read .bb files. Read
>> .conf files. Read .bbclass files. Read Bitbake sources. Send patches.
>> Add time. Repeat. == expert!
>
> I'd just like to add in that while it's great (really, I mean it), you're
> reporting problems, if you can reproduce them in vanilla OE with something
> like MACHINE=qemuarm and DISTRO=angstrom-2008.1 (or DISTRO=minimal) or
> similar, that will help rule out a lot of concern on our part and give a
> testcase we can all easily try out.
>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

OK thanks Tom I will try and read more on how to do that. Have not
done anything with qemu yet. But what I get now and correct if I am
wrong by OE vanilla you mean fresh directly off the dev branch no
other sub tree correct? then modify my .conf to to the settings you
listed above? If I am way off dont worry about taking the time to
explain in detail I will just read about it. I feel I have become an
annoyance on the boards from my lacking knowledge. Would showing the
recipe I build for my gumstix help? Its now building but not with
everything I want and some programs are broken, but its very close the
closest I have gotten so far. Any who thanks for replying and giving
me more info on how to help you guys help me. I do appreciate
everyones help and input a bunch.

JL


