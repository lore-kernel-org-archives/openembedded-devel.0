Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PlGW7-0003kO-BD
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 08:55:43 +0100
Received: by iwn8 with SMTP id 8so1935187iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Feb 2011 23:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=ZjBOqCaFl/yDH0PcN6WG3uuSFsWUJCLJpNkvCrj8/F8=;
	b=oEU0pbNrkR7obR68KEvg3HJX1XATBiUs3Giz3SNxH0XmlS6VhttkpoVIVnPKlnFJOK
	05oJUVZBe9T7sctf846pGsRvCC27vlT/NCHUXlomoD2ys8iNIMFAUeLdnAIjDIM+sGXt
	TI49T2Nf4V3raNNsMyvKQPhOs7cpMGi4NigcM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=wg6dcTg5M9xtrXmA9px76Qwms1J1R0PzfKgJ7ZNyJJXU5ZjKfR0zSNmRdhfmDoKy5P
	t2AvuydoqWBZNF6Pty78EHKIJoq5jGK1YhdDGYVMY2z6toFW6KSFaIwwXyKzanMhkayF
	EUUf+XvyFCOodFqqG2y3IHoPZ1EX3wYj1JQ8Q=
MIME-Version: 1.0
Received: by 10.231.172.75 with SMTP id k11mr9500260ibz.133.1296806084770;
	Thu, 03 Feb 2011 23:54:44 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Thu, 3 Feb 2011 23:54:44 -0800 (PST)
In-Reply-To: <4D4B35A7.4040000@mentor.com>
References: <131E5DFBE7373E4C8D813795A6AA7F08032A16A440@dlee06.ent.ti.com>
	<131E5DFBE7373E4C8D813795A6AA7F08032A16A5BE@dlee06.ent.ti.com>
	<4D403D6F.3040800@mentor.com> <201101271038.18945.ml@vdm-design.de>
	<AANLkTimy4Q0Y_3Y-=8=QCifqQUYwWmFx4T0DH+dNXPeZ@mail.gmail.com>
	<4D418914.2030703@mentor.com> <20110203070901.GA11867@denix.org>
	<4D4AE93E.2020509@mentor.com> <20110203222035.GA19477@denix.org>
	<4D4B35A7.4040000@mentor.com>
Date: Fri, 4 Feb 2011 08:54:44 +0100
Message-ID: <AANLkTinO257Uuh8bTQCb2LPXKFF1LtB+qN0KjM8aXZVN@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake does not fail when QA issues encountered
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
X-List-Received-Date: Fri, 04 Feb 2011 07:55:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/2/4 Tom Rini <tom_rini@mentor.com>:
> On 02/03/2011 03:20 PM, Denys Dmytriyenko wrote:
>>
>> On Thu, Feb 03, 2011 at 10:43:26AM -0700, Tom Rini wrote:
>>>
>>> On 02/03/2011 12:09 AM, Denys Dmytriyenko wrote:
>>>>
>>>> On Thu, Jan 27, 2011 at 08:02:44AM -0700, Tom Rini wrote:
>>>>>
>>>>> On 01/27/2011 04:27 AM, Frans Meulenbroeks wrote:
>>>>>
>>>>> The problem is that today we have QA Errors that are warnings
>>>>> (coreutils-native) and QA Errors that result in a non-zero exit code
>>>>> but
>>>>> also don't "kill the build" nor make it obvious at the end that there
>>>>> is
>>>>> a
>>>>> non-zero exit code (GNU_HASH, RPATH). =A0Finally we do have "kill the
>>>>> build"
>>>>> fatal checks in insane.bbclass, namely the do_qa_configure tests.
>>>>
>>>> Actually, I believe there was a simple error in the code which made QA
>>>> Error
>>>> on RPATH not kill the build[1]. BTW, GNU_HASH QA Error does stop the
>>>> build.
>>>>
>>>> [1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/42168
>>>
>>> Good spotting. =A0But.. GNU_HASH QA error will give you a non-zero exit
>>> code
>>> and not kill the build so we're back where we started, albeit with a le=
ss
>>> often hit in the community trigger (but I bet more often hit in private=
 /
>>> 3rd party collections).
>>
>> So, do you ack the patch, should I push it in? It will break the build f=
or
>> anyone still using libtool-2.2, specifically in gettext package...
>
> So, that would break angstrom-2008.1 so I don't think that's a great idea
> until we fix it..

Then again, if we push it there will be some incentive to fix it.

On a similar veign: I've reported some QA issues some time ago in
recipes that I have no affinity with, but they seem to be ignored.

Frans.


