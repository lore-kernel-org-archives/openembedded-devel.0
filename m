Received: from [74.125.44.152] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1Lpm8v-00031D-VM
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Apr 2009 18:21:29 +0200
Received: by yx-out-1718.google.com with SMTP id 3so803743yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Apr 2009 09:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=G9SyXd174QCDWKnwefT8IyQztDfsl1UKgqE6JXv79eE=;
	b=NAc2nv23oIvYs5KwPzmL5sXyDx/dgXmQGeyZlycA0ZlyQJeVvx6w7J9vDJh4CKXdYF
	bBlLXjGdPUbEXdNFIGDrtSGSO2tFRXvqWHq0P1ZxSCCQkfiMEv57MBrxLoXgEnGrrO/t
	wlH3zV3OBnTJmSDIu59GSzPWgxSksqaehBD0o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=boZ6iU3HzdLbTsua4OqCLlO5L0Nqp6MBniYSEUrllMozFtEKOhCo7k6Vwcygwh1f3g
	xKPcF/Ap04QwkzniQDKrlgh3lb6edRaQNyEDv6r/v36g1k6E6owWZaipOzK9qcbzOWwW
	r78IYQfFQhLpx5HCJy1+G+cQMANMBj42U0bUY=
MIME-Version: 1.0
Received: by 10.100.240.9 with SMTP id n9mr1780949anh.135.1238775529209; Fri, 
	03 Apr 2009 09:18:49 -0700 (PDT)
In-Reply-To: <200904021325.22988.marcin@juszkiewicz.com.pl>
References: <200903311837.28324.marcin@juszkiewicz.com.pl>
	<d2b9ea600904020352v79eda72fk2fde69139ac29e10@mail.gmail.com>
	<200904021325.22988.marcin@juszkiewicz.com.pl>
Date: Fri, 3 Apr 2009 18:18:49 +0200
Message-ID: <d2b9ea600904030918s2f45debak2f76d45022fbe850@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.44.152
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_20,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE] branch created: stable/2009
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
X-List-Received-Date: Fri, 03 Apr 2009 16:21:32 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2009 at 1:25 PM, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
> Dnia czwartek, 2 kwietnia 2009 o 12:52:51 Esben Haabendal napisa=B3(a):
>> On Tue, Mar 31, 2009 at 6:37 PM, Marcin Juszkiewicz
>>
>> <marcin@juszkiewicz.com.pl> wrote:
>> > I also imported BitBake 1.8.12 (last release) into "stable/2009"
>> > branch as this is minimal stable version which works with this
>> > repository.
>>
>> Is this the new strategy for handling depedency on specific versions
>> of BitBake?
>
> No, but we require minimal versions of BitBake to be used with OE
> metadata so I prefer to have version which is granted to work. Imagine
> situation when OE.dev will require BitBake 1.8.22 which will not work
> with 'stable/2009' branch.

I fully understand the situation, but I am just wondering if we shouldn't b=
e
paying more attention to this problem.

For the stable branches I need to maintain, I have had to make a solution
control which version of bitbake is used with each branch. Maybe it would
be worth to try work out a more general version of such a solutin.

But, I think it would be great if we "encode" into the OpenEmbedded
metadata which version of bitbake is recommended, and maybe even
which versions work and which is not expected to work. It could be
something as simple as adding a ".bitbake" to the top of the
metadata which contains a single line in the style of
"tags/bitbake-1.8.10", which would then make it possible for
people to know which version to use, and even automate
this in their setups.

We could then also make bitbake aware of this file, and then print
out a warning if a "wrong" version is used.

I am sure I am not the only one who have had to debug strange
problems before finding out that it would just be easier to go back
to an older bitbake version...

It is not that it is a big problem to import BitBake into OpenEmbedded,
although it generally is not the best solution to many things, as it
makes it a bit painful to propagate eventual critical fixes to all
the places where it is needed, but I just think that this is an
important issue that is worth to find a proper solution for.

Regards,
--=20
Esben Haabendal, Senior Software Consultant
Dor=E9Development ApS, Ved Stranden 1, 9560 Hadsund, DK-Denmark
Phone: +45 51 92 53 93, E-mail: eha@doredevelopment.dk
WWW: http://www.doredevelopment.dk


