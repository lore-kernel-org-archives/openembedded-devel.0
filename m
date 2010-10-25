Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PAIEW-0007iS-FA
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 10:16:47 +0200
Received: by gxk22 with SMTP id 22so1950919gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 01:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=7Ifl9NssmLv4gytseewrKktiPm5FV2mxIa6XrqSUYR0=;
	b=P75zwqB9YLvbySWn6ybBBgNFdk7jCyhTzMRZwxN85uopwM22zEHAjNZC488gRnBwH1
	Grys9Alj2IDyD2G2et3Mz91rlAN/29vjXC+aji3H//Qp4CW3AaPnSvLQTSpyqXHKgLC0
	56UU1KJJ3AFaCiIk03d1tjHPn5qXe62brVzbg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=XxIEN/HUpR08rWRLGqTEoNShygthysYvzESFh0GcijvWhBydkne7rCd/daPM5pn2Qu
	ZR8RKJwLJSXDCHE+ejOubyB1R6hQM/zX9k4/QvkxNPb5NFj1U41ruyIyiFq7pTMU2ihP
	xpcGpiin2YQe8pm77ucJ3YPuWblH/ehEGAsb8=
Received: by 10.42.71.70 with SMTP id i6mr380617icj.200.1287994550664; Mon, 25
	Oct 2010 01:15:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.164.194 with HTTP; Mon, 25 Oct 2010 01:15:30 -0700 (PDT)
In-Reply-To: <AANLkTimPLjpHi7Xt=NsnQRxHOR+9ZWEPoTE7PjssdzN1@mail.gmail.com>
References: <AANLkTikq1TNg1Y=f7tVjpkZR8Hre1FoGyK1gUGTKNDKB@mail.gmail.com>
	<AANLkTimPLjpHi7Xt=NsnQRxHOR+9ZWEPoTE7PjssdzN1@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Oct 2010 01:15:30 -0700
Message-ID: <AANLkTi=8nX02nqndcpp3uMgx2D6sb83qMK20Nuy1jovN@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: empty strings
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
X-List-Received-Date: Mon, 25 Oct 2010 08:16:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 22, 2010 at 2:00 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> ping.
>
> people don't care?
> I feel there are some issues in the examples below (and some easy
> cleanup actions).

If you dont generalize and pick and test a recipe at a time that would
be much sane way to go with such changes.
Sometimes they might look obvious but they may not be. So my humble
request is to go recipe by recipe instead of
some seding and grepping.

>
> Frans
>
> 2010/10/14 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
>> triggered by a remark on irc, I decided to do a grep on "" in all our re=
cipes.
>> That gave some interesting observations. I've fixed a few things from
>> the type X +=3D "" or X_append =3D ""
>> See the patch set I just send.
>>
>> However there are also a few things that are not so obvious and for
>> which I want to ask your opinion, Some seem useless, others are
>> probably needed, but wanted to raise all issues that could be
>> unneeded.
>> Note that the recipes are just examples, ofthen there are more recipes
>> that have the same pattern.
>>
>> libvorbis/libvorbis_1.2.3.bb:EXTRA_OECONF =3D ""
>> aircrack/aircrack_2.1.bb:DEPENDS =3D ""
>> apt/apt-native.inc:PACKAGES =3D "" =C2=A0(this is a native recipe, isn't=
 this
>> always the case for native recipes ? )
>> bind/bind_9.3.1.bb:RPEDENDS =3D "" (this one has a DEPENDS on openssl, I
>> would expect it also to rdepend on openssl in this case)
>> c3110x/cx3110x_1.1.bb:export LDFLAGS =3D ""
>> classpath/classpath.inc:RPROVIDES_${PN} =3D ""
>> fuse/fuse-module_2.7.4.bb: =C2=A0 =C2=A0 =C2=A0LDFLAGS=3D""
>> glibc/glibc_2.10.1.bb: =C2=A0CPPFLAGS=3D"" oe_runconf (I was wondering o=
f the
>> resetting CPPFLAGS is useful, didn't really dig into this one)
>> gs/gs-fonts-std_8.11.bb:HOMEPAGE =3D ""
>> gsoap/gsoap-native_2.7.13.bb:EXTRA_OEMAKE =3D ""
>> ipkg/ipkg-native.inc:PROVIDES =3D "" =C2=A0(hm, no provides)
>> meta/staging-linkage_1.0.bb:SRC_URI =3D ""
>> psmisc/psmisc.inc:FILES_${PN} =3D "" (guess all files are added to other
>> packages, if that is so, should there be a line like this?)
>> tmake/tmake_1.11.bb:FILES =3D ""
>> ttf-fonts/ttf-hunkyfonts_0.3.0.bb:RRECOMMENDS_${PN}-dbg =3D "" (seems
>> somewhat strange to me)
>>
>>
>> this one also looked weird; guess it is ok but found it odd that these a=
re reset
>> hplip/hplip_2.8.10.bb:EXTRA_OEMAKE =3D 'BUILD_SYS=3D"" HOST_SYS=3D""'
>>
>> I would like opinions on which of these constructs is useful and which
>> not. (and yes, I know an assingment may be used to nullify an earlier
>> assingment in an .inc file and I am also aware of cases where there is
>> something like X_virtclass_native =3D "" which is used to nullify
>> non-native assignments to X.
>>
>> Enjoy, Frans
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


