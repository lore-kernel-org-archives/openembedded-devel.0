Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OM6C4-0007xQ-H6
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 23:18:45 +0200
Received: by iwn6 with SMTP id 6so3112376iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jun 2010 14:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=nNSEkPpdbUGDylQeR1jvg4v5SIor4hDd/iU7q+VKrEM=;
	b=IQPuYPkeCZSFP6F9V4QLqrjOa07ahRP3UQHVI/5vDoABWN82NBTrBaTcuD36QOUA9O
	pRJSMRZOXT/V3BSM7ISh89xQVoGbexOj5cG/mEG0zKq7R6NO+h9Rf7Cn5cmhwjeXeJHB
	/JeRPNR5qXZ3EdZK0HM2L9hfzUa7UAIhQo1/E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=uXq7whLmQOqATwNigID9hz+7b3sPVXp//SPnrecGH+aT74ALfrdVXlevJom985kHrX
	Rfl/ztu6S2dWGk+DnlKmyjvvpprP6Lrb3W8cnSj/NavIWZMHwFLT1KKCB+BQJBzxkRzH
	CBkz33BFp/ocbpkr5Js7x4+RQbNcShxng9TeE=
Received: by 10.231.124.5 with SMTP id s5mr6744631ibr.195.1276031664407; Tue, 
	08 Jun 2010 14:14:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.19.76 with HTTP; Tue, 8 Jun 2010 14:14:04 -0700 (PDT)
In-Reply-To: <4C0E9FA6.50804@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com> 
	<1275510896-30845-7-git-send-email-raj.khem@gmail.com>
	<hu6fm8$gg4$2@dough.gmane.org> <20100604002902.GA24343@gmail.com>
	<AANLkTimLGz3yNOafixBe0Mfkb1f_jLUK44Ubq68W1eUa@mail.gmail.com> 
	<4C0E9FA6.50804@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Jun 2010 14:14:04 -0700
Message-ID: <AANLkTimKK03Ke0Csq85Q4EQ3WH0a-vfO9eSxd3yBrZkC@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 06/16] db_5.0.21: Add recipes for target and native packages.
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
X-List-Received-Date: Tue, 08 Jun 2010 21:18:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 8, 2010 at 12:53 PM, Jan Paesmans <jan.paesmans@gmail.com> wrot=
e:
> On 06/04/2010 09:38 AM, Martin Jansa wrote:
>> On Fri, Jun 4, 2010 at 2:29 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On (02/06/10 22:41), Koen Kooi wrote:
>> On 02-06-10 22:34, Khem Raj wrote:
>> >>>> * Get rid of old style staging.
>> >>>>
>> >>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >>>> ---
>> >>>> =A0recipes/db/db-native_4.2.52.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
1 -
>> >>>> =A0recipes/db/db-native_5.0.21.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +
>>
>> Can these get converted to BBCLASSEXTEND?
>> >>
>> >> Yes. I have intended to do that afterwards
>>
>> > Then
>>
>> > Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>>
>> >>
>>
>> regards,
>>
>> Koen
> Sorry to be the bearer of bad news, but libpam_1.1.0.bb doesn't like
> this new berkley db.
> Got compile errors on module/pam_userdb.c, anything related to dbm_...
> functions that return and assign a value. As far as I can tell from the
> source of db.h there is a define missing: HAVE_DBM. Adding this to the
> compile line: -DHAVE_DBM=3D1 makes it compile fine but I haven't found
> where to set it from the configure flags and if indeed this is the
> correct thing to do.
> For now, might I suggest a DEFAULT_PREFERENCE =3D "-1" to be added to
> db_5.0.21.bb.

I have hit into this problem I am in process of patching pam.

>
> Regards,
>
> Jan
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


