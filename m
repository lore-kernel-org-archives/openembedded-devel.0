Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1PI1In-00018x-VZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 16:49:10 +0100
Received: by wwe15 with SMTP id 15so284640wwe.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Nov 2010 07:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=gIiw41WymeOo8Z00LDpoHBelhRevAcsScoQn43CAcR0=;
	b=B53yTJXIuH0bFi0a6UuNBQ5Mr5IPAVhRFfQcuQYyJdNiVCh1mtn94MgEl3CXKiNMfv
	Oy7WyqzuYvXBzF4adKctAJ4ZqvLulcXnVgmMV+qImMry5YLDg8Z/77JSZJWXiC3mkaUA
	Cv1t+tK8mIiJRIPvpE887upeStCQ0eChWaSUs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FAOMLLnJF3lVHSfHXzVbaAKdMphihrN+NyZALn57Ps0I7Hg1hvb17h5mQwfmUgEcrY
	ApWEXWTuZS6b+ZUPFDaEAXeUGde0ZAE0eMd+TmZRA40XFi/H/x5sc7Mhl2xCOTBfPKFt
	09zCpEJNXj/7StmYacDSSqbMLJDvRQoP+nN/k=
MIME-Version: 1.0
Received: by 10.216.164.137 with SMTP id c9mr6879799wel.19.1289836077894; Mon,
	15 Nov 2010 07:47:57 -0800 (PST)
Received: by 10.216.235.214 with HTTP; Mon, 15 Nov 2010 07:47:57 -0800 (PST)
In-Reply-To: <AANLkTinh8PHmpMrPBQUUb26MAQmWzU==vKzSY9Y_StTx@mail.gmail.com>
References: <AANLkTin8E_sSKJcCW7_gtx85_Uo6SvwHFTdiUA8XZ2tv@mail.gmail.com>
	<AANLkTinuoktvgvT9V7OX1=FkMfeAgztmDaOCFMdH5x7d@mail.gmail.com>
	<4CE02C8A.2040002@mentor.com>
	<AANLkTinh8PHmpMrPBQUUb26MAQmWzU==vKzSY9Y_StTx@mail.gmail.com>
Date: Mon, 15 Nov 2010 10:47:57 -0500
Message-ID: <AANLkTimg9YUNRoh+Qs8-jahK8mAJzpcEk9WiUOBFVNAz@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.41
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-11-12
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
X-List-Received-Date: Mon, 15 Nov 2010 15:49:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 14, 2010 at 2:23 PM, Yury Bushmelev <jay4mail@gmail.com> wrote:
> 2010/11/14 Tom Rini <tom_rini@mentor.com>:
>> On 11/14/2010 11:11 AM, Frans Meulenbroeks wrote:
>>>
>>> 2010/11/12 Cliff Brake<cliff.brake@gmail.com>:
>>>>
>>>> testing-next is ready for clean builds. =A0Not many builds succeeded
>>>> last week--I suspect people have been busy:
>>>
>>> Actually my builds also succeeded (apart from the neek one which seem
>>> to require some more love). The autobuilder did it's job quite nicely,
>>> but I was just not around to verify the results and update the page.
>>> The neek requires at least the os2 patch.
>>>
>>> Testing 2010-11-12 gives the same results. updated the testing page.
>>
>> After my first week of doing some testing branch test builds I was think=
ing,
>> would some form of either automated result submitting or form-based resu=
lt
>> submitting be a good idea? =A0We could try and use a google doc spreadsh=
eet /
>> form, for example. =A0Thoughts?
>
> I'll prefer to use our oestats-server to auto-publish builds data.
> Oestats have complete information about builds.

If someone has the time to update the oestats-server to provide
summary data in a tabular form, that would be great.

Alternatively, using forms on a google spreadsheet is an interesting
idea.  I had not thought of forms as a way that we could get anonymous
build data with requiring a google account.  Then again, I'm not sure
how we would keep the form from being spammed, other than perhaps
hiding it.

Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


