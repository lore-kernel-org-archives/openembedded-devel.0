Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OmREV-0006SO-LZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 15:02:28 +0200
Received: by gxk2 with SMTP id 2so1246392gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 06:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TildlNNNOF9m2P62v241cHYOj+Nup73zsfxgPli2uG8=;
	b=c1v47Vxfd6+UzaxNK9I1hGXQniQWwzUz0ypPT37i9prXMghdSUjDemXPXDggVf++bh
	nR05l70/NRTE0058XeAuNmgj0UL8MKj0rNANhRguEk8TbCTQ6g2D1KMzdYpfXNuesUkR
	UYuL6BYunnXz9vPsFLtFqq5DmDLglHT918TRk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=U9auaQJyfyyeov/PwSz33O3m/f05JKoT0rmJL1p5jo7xreuHfKA0H7A8istwdKrnSd
	yi0NVud2q4Tijue/MZst2RsGcH2pj5Y5s2rfQTMUC8rtw+pbILr0ZzmQiQnhLx/YceVK
	HKxajDezGOtaqYcgjM97j7iENhAy71Rap+za8=
MIME-Version: 1.0
Received: by 10.150.96.8 with SMTP id t8mr1999961ybb.1.1282309300190; Fri, 20
	Aug 2010 06:01:40 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Fri, 20 Aug 2010 06:01:40 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1008191432360.5745@asterix.crazy-teaparty.dyndns.org>
References: <AANLkTinr4-xEo+Urc_9P+uLmLk6qPJSRzCJNYVsKAxD6@mail.gmail.com>
	<alpine.LNX.2.00.1008191432360.5745@asterix.crazy-teaparty.dyndns.org>
Date: Fri, 20 Aug 2010 15:01:40 +0200
Message-ID: <AANLkTinMr1=Bj8eK2D+mg_J-P6jzvSAQAhXNtgkK=u1n@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: orphaned files
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
X-List-Received-Date: Fri, 20 Aug 2010 13:02:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/19 Vitus Jensen <vjensen@gmx.de>:
> On Sun, 15 Aug 2010, Frans Meulenbroeks wrote:
>
>> I've made a list of patch files in recipes (prefixed with file://) and
>> compared it with the list of patch files as appear on disk.
>> Below is the list of 645 files that do not show up in any recipe and
>> as such can be considered as orphaned.
>> Proposal is to remove these files after double checking that they are
>> indeed not used.
>>
>> Do people agree with this? If so can I have an ack?
>>
>> And do we want to have a commit for every file (makes it easy to
>> revert an error) or a big commit with all removals?
>> (removals per dir are also possible but that process is more difficult
>> to automate and hence not my preferred solution.
>>
>> Your opinion is appreciated.
>>
>> Frans
>
> Hello Frans,
>
> how did you create that list? =A0As I see it, there must be an error in t=
he
> analysis somewhere:

The procedure is described above
more explicit:
something like
grep -"file://.*patch" in recipes/*/* > file1
find recipes | grep patch >file2

in the editor change both file1 and file2 to whack off things like
;apply=3Dyes and a few more things in file1, also discard the file://
section and unify whitespace file layout of both file1 and file2
becomes as listed above.
then run diff file1 file2
visually examine the differences (especially for things like
file://x-${PV}.patch which of course do not match
then anything that appears in file2 and not in file1 is what is in the
list above

>
>> htmldoc paths_1.8.27.patch
>
>
> vitus@asterix:/home/nobkp/oe.dev/recipes/htmldoc$ fgrep -C 1
> paths_1.8.27.patch *
> htmldoc_1.8.27.bb-SRC_URI =3D "http://..../htmldoc-${PV}-source.tar.bz2 \
> htmldoc_1.8.27.bb:file://paths_1.8.27.patch"
> htmldoc_1.8.27.bb-
> --
> htmldoc-gui_1.8.27.bb-SRC_URI =3D
> "http://..../${PV}/htmldoc-${PV}-source.tar.bz2 \
> htmldoc-gui_1.8.27.bb:file://paths_1.8.27.patch"
> htmldoc-gui_1.8.27.bb-
> --
> htmldoc-native_1.8.27.bb-SRC_URI =3D "http://.../htmldoc-${PV}-source.tar=
.bz2
> \
> htmldoc-native_1.8.27.bb:file://paths_1.8.27.patch"
> htmldoc-native_1.8.27.bb-
> vitus@asterix:/home/nobkp/oe.dev/recipes/htmldoc$ find . -name
> paths_1.8.27.patch
> ./files/paths_1.8.27.patch
> vitus@asterix:/home/nobkp/oe.dev/recipes/htmldoc$
>

I thought I made a mistake in the script, but after verification I have not=
.
The recipes you mention have been removed a few days ago
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3De5287904a9d=
ddc8ddc0f486d8526bc8cfda427b7

It there any particular reason why you want to have both the 1.8 and
1.9 versions in the archive?
If so, we should revert the commit above (and then of course the patch
file itself should not be removed either.

Frans


