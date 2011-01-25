Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhqaQ-0003qs-LP
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 22:38:03 +0100
Received: by iyj18 with SMTP id 18so6144551iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 13:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=jSBlb/uENgtuYq8zqovEZZZE9NE7G23wTqxruzn542g=;
	b=k2qGBBruXoJVPfPZHLbwEajQR/T4gSlkHTnlSMpfpSXojfRsm8l+aVO01kYVwI4FaZ
	jpGmK30WO47x/tnbI+FLGj4bq7KA8KN5sBIlbZmWLeOjc5VmdS2hCXE51sPR4unV3VxA
	hMs7SV19VnpilyugqbLS1PyzYI4vg87WFaiz0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=bC7ioBcFH2cLrTK32TiZ1o1+zr26KN4A80Ei5WbD8m+Bh/Ik/5M2ElGJNhcMbCseBx
	+aU3nosNdWxjWhj2nu0SelqaAax7GSsazlhvPgQ9mk3Ymk3qBkKYvlSmVb61T/RADw+2
	9LmGTPyHluq2t5sOy/c3htRvTYDTUsMqesL0E=
Received: by 10.42.228.133 with SMTP id je5mr7336515icb.407.1295991434510;
	Tue, 25 Jan 2011 13:37:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.230.71 with HTTP; Tue, 25 Jan 2011 13:36:54 -0800 (PST)
In-Reply-To: <AANLkTinyeFc_8ai783_mu0deYyFUvebhVq4sVgzbCh0v@mail.gmail.com>
References: <131E5DFBE7373E4C8D813795A6AA7F08032A16A440@dlee06.ent.ti.com>
	<AANLkTinyeFc_8ai783_mu0deYyFUvebhVq4sVgzbCh0v@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Jan 2011 13:36:54 -0800
Message-ID: <AANLkTinc6eLwC5ZTu_uO=Ki00x1VQJc6vs_pFwz1f5oX@mail.gmail.com>
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
X-List-Received-Date: Tue, 25 Jan 2011 21:38:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2011 at 12:58 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2011/1/25 Maupin, Chase <chase.maupin@ti.com>:
>> All,
>>
>> I have noticed that when building packages such as perl that while my bu=
ild will report success and no errors, the return status from the bitbake c=
ommand was "1". =C2=A0I was able to produce this by doing:
>>
>> MACHINE=3Dam37x-evm bitbake perl
>>
>> After bitbake completed I saw:
>>
>> NOTE: Tasks Summary: Attempted 851 tasks of which 0 didn't need to be re=
run and 0 failed.
>>
>> but checking $? yields a return status of "1".
>>
>> I looked into the log and noticed a lot of messages like:
>>
>> ERROR: QA Issue with db: package db contains bad RPATH
>>
>> My understanding is that recent fixes to libtool 2.4 prevent these error=
s but I am using an older version of Angstrom which pins to libtool 2.2. =
=C2=A0I also have found this issue with the Arago distribution which likewi=
se uses libtool 2.2.
>>
>> So my question here is whether bitbake should be failing when it encount=
ers these QA issues with a bad RPATH and exiting?
>>
>> If not then should the return status be "1"? =C2=A0This causes issues wh=
en using a script that issues builds and then checks the return status for =
success or failure. =C2=A0If the QA issues are deemed acceptable (or should=
 be warnings) then I would expect the return status to not indicate a failu=
re.
>>
>> I have attached a log of my build for reference
>>
>> As another interesting side note which I don't know is related or not, w=
hen building Arago with bitbake 1.10.2 the return status is "1". =C2=A0When=
 building the same Arago metadata with bitbake 1.8.19 the return status is =
"0". =C2=A0What is strange here is that since Arago uses a slightly older v=
ersion of the OE metadata it is not seeing the RPATH errors reported above =
(the check isn't in the insane.bbclass for Arago yet). =C2=A0So for some re=
ason bitbake 1.8.19 says everything went fine and bitbake 1.10.2 reports a =
status of "1" even though there is no reported error. =C2=A0I'm not sure if=
 this is related to the above in any way or if this is a separate issue.
>>
>> Sincerely,
>> Chase Maupin
>>
>
> I've seen this on other places as well.
> I'd say if a package has a QA issue the build of that package should
> fail, because the resulting output is defnitely not OK.
>

yes it should fail. However some may raise questions "it used to build
and not it doesnt"
so someone has to fix the problems quickly

> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


