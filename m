Received: from mail-iw0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <listjiason@gmail.com>) id 1NuEtk-0005rL-Cv
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 01:56:41 +0100
Received: by iwn4 with SMTP id 4so2673630iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 17:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=ij/uPGVGribZV+gqDrY8Cgs5bW6atZYyO18H7jtfryw=;
	b=FnpsoCe8dU8NQ5ZGJNWSXzvjt8UpxvucEh+0Al2i14tnosPdP0OQS6DLG/o1DBxKLS
	L79QF2WfXsWvBCGeuyvtkbbbE0QkLZjC5fsew7NPX1A+qHSP4NyukKHfzwJJiI4FI/TT
	UWbBNNjBlvsIWL4yETYnicrSzK3EFAymLRDX0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=iJJbsizUiWGdLYYkMoPtDP5a8EYwOUhkBws2im+HCY/pRg7+Lo5/aKhnPFokFl1D26
	PtIpr5VR/weAS2J3kpC5zS9mA347v3lhmBTp1dnRQmy8MSAbUqxHcR35BvZVeIXZFhXt
	x4JFE7HfRFChqn9Zr/tvw2947Am6Lt1byHLvg=
MIME-Version: 1.0
Received: by 10.231.167.135 with SMTP id q7mr2815462iby.84.1269392009299; Tue, 
	23 Mar 2010 17:53:29 -0700 (PDT)
In-Reply-To: <20100323205054.GB12446@gmail.com>
References: <f275a9df1003230238ye20d27fm32a88ad21e6518ab@mail.gmail.com>
	<f275a9df1003230243h6942495bya29166db2fda49a@mail.gmail.com>
	<20100323205054.GB12446@gmail.com>
Date: Wed, 24 Mar 2010 08:53:29 +0800
Message-ID: <f275a9df1003231753y25619594i8310eb1883688fc9@mail.gmail.com>
From: Jiason Li <listjiason@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.174
X-SA-Exim-Mail-From: listjiason@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: How to rebuild images with updated PREFERRED_PROVIDER_xxx in machine conf?
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
X-List-Received-Date: Wed, 24 Mar 2010 00:56:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
thanks for the info! :D
I'll try then report if it worked. :-)

Thank you!
jiason
20100324


2010/3/24 Khem Raj:
> On (23/03/10 17:43), Jiason Li wrote:
>> Sorry all,
>>
>> My step was:
>> 1. bitbake some-image, oe/openembedded/recipes/some-pkg.bb was bitbaked.
>> 2. bitbake -c clean some-pkg
>> 3. update machine conf with PREFERRED_PROVIDER_some-pkg = "some-pkg-mine"
>> 4. bitbake some-pkg, according to the log,
>> oe/overlay/recipes/some-pkg-mine/some-pkg-mine.bb was bitbaked
>> correctly.
>> 5. bitbake some-image, but some-pkg was still bitbaked and was in
>> some-image, not some-pkg-mine!
>> 6. rm -rf oe/overlay/tmp
>> 7. bitbake some-image, this time some-pkg-mine is in some-image, finally.
>>
>> Any info are very appreciated. :)
>
> may be try
> bitbake -c package_update_index some-image
>
>>
>> Thank you!
>> jiason
>> 20100323
>>
>>
>> > My steps:
>> > 3. bitbake some-pkg, according to the log,
>> > oe/overlay/recipes/some-pkg-mine/some-pkg-mine.bb was bitbaked
>> > correctly.
>> > 4. update machine conf with PREFERRED_PROVIDER_some-pkg = "some-pkg-mine"
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


