Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PNmpY-0001cN-5b
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 14:34:44 +0100
Received: by iwn8 with SMTP id 8so5837759iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 05:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=K8Q+tpBv2a7l3lSfwt7rC39LWbMtEk6M/bl4UG7sOms=;
	b=sIHxgDL8Z3ooBJMCEAX6oeYE2cAHof0LVOcFJYDZKkBN4AqJOtSzS4aoNTXwPWYH6r
	YB4yglAMGJZ17te5PHGXI8XD/H5fUzt7aclFj8gkBLHbMcKXVOi9p1zfoSwso1zSSBda
	NIsZ+UfPe/3B+72cCE6pST2qtPwGDMEidLLMM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=qMV1fSZbs/d1f7QM/R1OfzrTduW+SrE3Qd6yK3VaGwAJqoAWR3qHjmXAveyUov4RMB
	TUBJv1imL/UIpkqMINORBRIoURak8Wcsvtgge/WafvvrAXx0qK5A7xYP2bn51Hqyrj98
	3LScDeQkIDqnzHuOnQeDWloItn7AYBj1tDoDc=
MIME-Version: 1.0
Received: by 10.231.191.4 with SMTP id dk4mr9020576ibb.82.1291210403963; Wed,
	01 Dec 2010 05:33:23 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 1 Dec 2010 05:33:23 -0800 (PST)
In-Reply-To: <20101201104723.GA20482@excalibur.local>
References: <AANLkTi=yLLv7wx_M6fBkZV7+_RJaTqmDRbY995-xpb2P@mail.gmail.com>
	<20101201104723.GA20482@excalibur.local>
Date: Wed, 1 Dec 2010 14:33:23 +0100
Message-ID: <AANLkTi=4piRxXUC6GcBPg_pTsGjrbMC6sxEnUoVPJAy5@mail.gmail.com>
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
Subject: Re: release-2010: when & what to do
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
X-List-Received-Date: Wed, 01 Dec 2010 13:34:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/12/1 Stefan Schmidt <stefan@datenfreihafen.org>:
> Hello.
>
> On Wed, 2010-12-01 at 10:06, Frans Meulenbroeks wrote:
>>
>> I wanted to raise the issue of when to do the release. I seem to
>> recall dec 1 was coined in the past (which is today in most of the
>> timezones at the time of writing).
>
> Thats correct.
>
>> It seems to me that we still some areas needing attention (uclibc, the
>> multiple provides for a few packages and probably some more things).
>> What about if we try to get these resolved this week, plan an
>> additional testing session over the weekend and decide early next week
>> on how to proceed?
>
> Doe we already have patches for the issues? If not I think delaying the release
> for issues we don't even have fixes for is not a good idea. If we have fixes
> delaying some days for more testing would be ok imho.
>
> We need to keep in mind that none of our releases will be without issues.
> Striving for perfection is good but we should not start to delay releases just
> in the hope more time will fix more issues. That just does not work.
>
> Our next release would be targetted for 1th March. That means three months time
> to fix the issues with uclibc and getting it in good shape in master.
>
> So my opinion would be in short: Get in all fixes that we have today, test and
> release on friday. That would only make a two day slip and still a pretty solid
> release. The last word on this should be by Khem I think as he has the release
> manager hat on this time.
>
> regards
> Stefan Schmidt
>
I'm fine to make it Khems' call when to do the release
Wrt the uclibc/binutils: there is a patch, so Id' say go for bumping
versions. That at least gives a better baseline.

Wrt the multiple DEPENDS issue:
It is not too difficult to fix these. E.g. for mysql nuke the old
version, for modutils decide which package delivers depmod. (modutils
or modutils-cross) and for bluez retire bluez-libs_3* (or maybe pin
bluez-libs_4* in distros that do not pin bluez)
But of course this does carry some political implications.

Frans


