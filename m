Received: from mail-ob0-f169.google.com ([209.85.214.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1ULDgl-0006ic-ER
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Mar 2013 15:20:24 +0100
Received: by mail-ob0-f169.google.com with SMTP id oi10so7948816obb.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2013 07:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=IpDYHhxIrf+0ZzcSrxAzojqV7evZYo/qQ5u3FeL7JgE=;
	b=ZY2K41s5LmR1m68ha/xb0prU6cDPKyQZ83feOKdoLsRFHuHMwsis4Ghjz5b/o2sSZb
	bLRybDN4OLbIA83RZ2HoVFrt5exRd4tKEpaB2tfsoT53kLjjCiVSWkrTSVz7l3gkKV4J
	k7h4SsfJRRNmKJHe8rnBgLbWNqNqxnXktiN6R/IQg77w1rzVWT7gCFZ/vT2w5gi/l2TS
	04leB45CzBJLNMZkBZlCVhn+lHX457sePQvmeNUR2KtA17F5c3Dep68o7WDDdl6IzAp3
	CP4sExCeavow2GSiUcL8WHhSzXaZ/UWLc4WV4GsxyMQ7fhi9fuRxaNy9e+6VoDNMtlkS
	f5Xg==
MIME-Version: 1.0
X-Received: by 10.60.37.229 with SMTP id b5mr17515420oek.21.1364479400359;
	Thu, 28 Mar 2013 07:03:20 -0700 (PDT)
Sender: paul.betafive@gmail.com
Received: by 10.76.154.4 with HTTP; Thu, 28 Mar 2013 07:03:20 -0700 (PDT)
In-Reply-To: <2592774.EEO2cMj6Fo@helios>
References: <1364469370-12082-1-git-send-email-paul@paulbarker.me.uk>
	<11972732.k3n4Vx4bzS@helios>
	<CANyK_8eJ6Y5V_=rD-n9CBBwckmkVwJJao8WUQrVetcmPzDw_fg@mail.gmail.com>
	<2592774.EEO2cMj6Fo@helios>
Date: Thu, 28 Mar 2013 14:03:20 +0000
X-Google-Sender-Auth: qgCjiOwbiNYhIXBUy27SWYEvC4M
Message-ID: <CANyK_8fNaGn+suY3WxK9nhTK5qKgLSKdbcdqOrDRQ01xQriWsA@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][TEMP PATCH] gd: Temporary patch while libgd.org is down, do not commit to main repository!
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
X-List-Received-Date: Thu, 28 Mar 2013 14:20:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 28 March 2013 14:00, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Thursday 28 March 2013 13:56:13 Paul Barker wrote:
>> On 28 March 2013 13:34, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>> > On Thursday 28 March 2013 11:16:10 Paul Barker wrote:
>> > > This is just a temporary patch to change the SRC_URI for gd as the
>> > > upstream
>> > > source libgd.org has been down for a week or so now. The MD5 and SHA256
>> > > sums match so this should be the exact same archive. It is not intended
>> > > to go in the main repository but may be useful to some of you until
>> > > libgd.org is back up.
>> >
>> > This is what we have MIRRORS for - perhaps we could add an entry to
>> > MIRRORS to handle this?
>>
>> I just went for a quick and dirty fix as I'm not very experienced with
>> bitbake recipes yet. Would this be added to mirrors.bbclass directly
>> or should I add a MIRRORS += line to the gd recipe?
>
> Since this is specific to the gd recipe I'd say in the recipe itself.

I'll rewrite my fix to append to MIRRORS in the recipe, test it and
re-send the patch if it works.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


