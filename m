Received: from mail-iw0-f184.google.com ([209.85.223.184])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ns2HB-0002dg-KX
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 00:04:00 +0100
Received: by iwn14 with SMTP id 14so1287433iwn.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Mar 2010 16:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=r8EpJz+zm7UeXOHWdoTELrOaiHrHryVQFMGG6KIppTE=;
	b=T/OPSn3jzXrpNN/5h1ZH8VwxP1to3Qmso9EXlOoUoSAumUh9Jgdg6ttrXtkgpzXjQu
	BkZjXy0/r/jspOsAKnmFGUXFs9bDpqaACwDmHaVkl1X6dJxgB5F6P1gvtj861pX/382h
	3VhF5wWbKcP/ptOHGIVD/APYBSmx6minK3eNA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=vDqVufd3LMiP7/PNPLlKvtZMAuBvFVl9Xv4F4S/iec4R5w6WfN03kXwuTyZmudNoMg
	xWZdQqFKxBLpjoHHNkm/VgJvffsGWSX0G5ojCzZvD4dTnjKEy/9cY6taBmqu16e9CdHS
	D5pkV+nEd9q5EJk1KiJr5mgf3Bubydl5vcpDY=
MIME-Version: 1.0
Received: by 10.231.146.134 with SMTP id h6mr536715ibv.16.1268866840200; Wed, 
	17 Mar 2010 16:00:40 -0700 (PDT)
In-Reply-To: <d1ded4381003171500q63682e8dn3ae47f8c13f05765@mail.gmail.com>
References: <openembedded-devel@lists.openembedded.org>
	<1267830919-14718-1-git-send-email-aalonso00@gmail.com>
	<20100316190003.GA20970@excalibur.local>
	<d1ded4381003171500q63682e8dn3ae47f8c13f05765@mail.gmail.com>
Date: Wed, 17 Mar 2010 16:00:40 -0700
Message-ID: <19c1b8a91003171600u10444eb8obd60b8fceabd62f4@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.184
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/7] device_table_add-xsa: add dev nodes for system ace
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
X-List-Received-Date: Wed, 17 Mar 2010 23:04:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 17, 2010 at 3:00 PM, Adrian Alonso <aalonso00@gmail.com> wrote:
> Hi,
>
> I tested on my previous build and everything is ok (tested console-image);
>
> Building from scratch arise a build error with "gcc-cross_4.3.3.bb failed"
> I'm going to track the changes in gcc-cross recipe to find out why is
> falling
> The complete error log can be found at [1].
>
> [1] http://pastebin.com/2m4TP2Vs

seems more like your gcc on host is causing the problem here. What
host os do you have
and try to clean and rebuild gcc-cross that might fix it.

>
> Regards
> Adrian Alonso
>
> On Tue, Mar 16, 2010 at 1:00 PM, Stefan Schmidt
> <stefan@datenfreihafen.org>wrote:
>
>> Hello.
>>
>> Back from holiday I found the time to test your patches. I needed to adjust
>> one
>> manually due to a change going in between but that was easy enough.
>>
>> I tested and pushed them out now. Please test on your side if everything is
>> ok
>> and thanks for your contribution.
>>
>> regards
>> Stefan Schmidt
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>
>
> --
> Saludos
> Adrian Alonso
> http://aalonso.wordpress.com
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


