Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Oz74s-0004We-TI
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 14:08:37 +0200
Received: by iwn2 with SMTP id 2so567486iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 05:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=c4zFMHR7KIgMZr0Ax9hN2Qk3Si7UME3ZmwfyJ/ZQEwU=;
	b=C/U+RGtK6g652qECLt/8fdlPS3xsTH+kqzEifj7fEM9+ZbYMYQi03tCpvPn8V4p9Wm
	6Ltm4G6pHt9uq+2cYqWIf49wrEhot9XTogOUSy3oLhnGlr9AuQL2p7CwlxpNFuQJv39X
	2VFYniPK9C518UKIoFH0U5WB8Bw0Xbp2CI6z8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hPn9Ui4DV3mXOautzlt8JTCnS+UZpATLm5KvXbpsQlpzTdWQfSdCV/hGL3xFJa0+Tl
	DzYDewG+P5SGnw68G9/KZfz3Ss9rvbFaGZuiuLyQIdiD2IEyAuc6SayjnAcL0Eq7ykvH
	LqZmfAo4emyNce5t2RjmDmv2wZqCndsSPgSMU=
MIME-Version: 1.0
Received: by 10.231.15.9 with SMTP id i9mr3628912iba.58.1285330109407; Fri, 24
	Sep 2010 05:08:29 -0700 (PDT)
Received: by 10.231.158.147 with HTTP; Fri, 24 Sep 2010 05:08:29 -0700 (PDT)
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080310E1558D@dlee06.ent.ti.com>
References: <131E5DFBE7373E4C8D813795A6AA7F080310E154E8@dlee06.ent.ti.com>
	<AANLkTi=45dASvU5XiCia4o2bia-Zx38neVw8vK6Qvrx-@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310E1558D@dlee06.ent.ti.com>
Date: Fri, 24 Sep 2010 21:38:29 +0930
Message-ID: <AANLkTi=41Y_wwKR1czvr5XW-7xZSpwg1J2-vQ5sKStRQ@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Question about automake licensing in recipe
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
X-List-Received-Date: Fri, 24 Sep 2010 12:08:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 24 September 2010 21:24, Maupin, Chase <chase.maupin@ti.com> wrote:
>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Graham Gower
>> Sent: Thursday, September 23, 2010 5:18 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] Question about automake licensing in recipe
>>
>> On 24 September 2010 05:44, Maupin, Chase <chase.maupin@ti.com> wrote:
>> > All,
>> >
>> > I was digging around in the automake sources and I noticed that there =
is
>> a top-level COPYING file that says automake is licensed under
>> GPLv2. =A0However, in the lib directory there is another COPYING file th=
at
>> says GPLv3. =A0I was trying to figure out what LICENSE should be set to =
for
>> automake when the sources contain both GPLv2 and GPLv3 code. =A0Should i=
t be
>> set to something like GPLv2/GPLv3? =A0I've read that GPLv2 and GPLv3 are
>> incompatible
>> (http://gplv3.fsf.org/wiki/index.php/Compatible_licenses#GPLv3-
>> incompatible_licenses) so can a recipe even be marked as being both GPLv=
2
>> and GPLv3?
>> >
>> > Any input would be appreciated here.
>>
>> If the GPLv2 has the "or later version" clause and you are combining
>> with GPLv3, then there is no incompatibility as the entire thing is
>> then distributed under the GPLv3. If there is no "or later" clause,
>> then its a problem that needs to be sorted out upstream.
>
> Graham,
>
> Thanks for the input. =A0I do not see the "or later" clause. =A0I see som=
e discussion on FSF about updating the exceptions for tools like automake. =
=A0I guess this comes back to my question though of how we should mark the =
LICENSE field for the automake recipe until all the licensing is done?
>
> also, has anyone thought about having a license type of GPLv3+exception o=
r some other format to indicate that there is an active exception for a pac=
kage?
>

I suppose you could mark it as GPLv3+violation...?

Basically, automake have to contact all their contributors to allow
their GPLv2 code to be distributed under GPLv3. Or they have to pull
the GPLv3 code out.

-Graham


