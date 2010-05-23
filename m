Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1OGGIR-0003Vj-HE
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 20:53:59 +0200
Received: by pxi14 with SMTP id 14so1037099pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 May 2010 11:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=iUahfoKS1OPLh7DrR5aoebMryZehfRAcWy/ygL5BQSc=;
	b=fKOLZszTLl1eUdw6wFEqFcvMVjRcMmv1zAIwVUGce2FbwXSTHBNdTqZYCUu5p5cf4l
	JmCjJyL6Uy8pO3knUf1z9reELrKsg61siMMVsHbBLMa8oSAQCYGKbgYoBXWje1Q7cMzP
	wQC5JxUON/xT5/30snxpOb6n8RS6vnHaHfufg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=pU0Twl0mxvJK3NiINMyc9OfJ8pQAWgCWSPS5mIf/30a6PtYiqsmz60Z13+EEp2jJch
	vrpzZ01wRHNB2zw2ia7BwlZmUIWSHmzBcB9l58riToltcASuULtvqJSniA0JqEx/cRzw
	fA+BQz6f31Y3f/J3G01hSlfKKhDplHpOoK7jg=
MIME-Version: 1.0
Received: by 10.141.23.15 with SMTP id a15mr3276958rvj.278.1274640544904; Sun, 
	23 May 2010 11:49:04 -0700 (PDT)
Received: by 10.141.51.17 with HTTP; Sun, 23 May 2010 11:49:04 -0700 (PDT)
In-Reply-To: <20100517214019.GA8515@gmail.com>
References: <AANLkTikfszFRLw6Ct-aEAUcu1xs8hRLdQRROW8OswCb7@mail.gmail.com>
	<hso7fa$2lh$2@dough.gmane.org>
	<AANLkTilux_HTutdHJZKh7hipzViaahkx7OtLOI6RFaVj@mail.gmail.com>
	<20100517214019.GA8515@gmail.com>
Date: Sun, 23 May 2010 15:49:04 -0300
Message-ID: <AANLkTimBQd3eDm165D0SEIE8HVyQ-QI_RD3KLpMBhGCR@mail.gmail.com>
From: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add cgreen. Library to do unit test for C language
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
X-List-Received-Date: Sun, 23 May 2010 18:54:05 -0000
X-Groupsio-MsgNum: 19505
Content-Type: multipart/mixed; boundary=000e0cd182a4e567760487476004

--000e0cd182a4e567760487476004
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Attached a unique patch.

Thanks

On Mon, May 17, 2010 at 6:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On (16/05/10 18:05), Jo=C3=A3o Henrique Freitas wrote:
>> Nothing special. This was a mistake.
>
> instead of incremental change can you reply to your previous patch with
> complete patch which includes this change as well.
>
> -Khem
>>
>> ---
>> =C2=A0recipes/cgreen/cgreen.inc =C2=A0 =C2=A0| =C2=A0 =C2=A02 --
>> =C2=A0recipes/cgreen/cgreen_svn.bb | =C2=A0 =C2=A06 ------
>> =C2=A02 files changed, 0 insertions(+), 8 deletions(-)
>>
>> diff --git a/recipes/cgreen/cgreen.inc b/recipes/cgreen/cgreen.inc
>> index 9c71db5..eb3307e 100644
>> --- a/recipes/cgreen/cgreen.inc
>> +++ b/recipes/cgreen/cgreen.inc
>> @@ -11,5 +11,3 @@ BBCLASSEXTEND =3D "native sdk"
>>
>> =C2=A0inherit cmake
>>
>> -#FILES_${PN}-dev +=3D "${bindir}/*-config"
>> -#FILES_${PN}-utils =3D ""
>> diff --git a/recipes/cgreen/cgreen_svn.bb b/recipes/cgreen/cgreen_svn.bb
>> index 88dad6d..65f2f34 100644
>> --- a/recipes/cgreen/cgreen_svn.bb
>> +++ b/recipes/cgreen/cgreen_svn.bb
>> @@ -13,9 +13,3 @@ EXTRA_OEMAKE =3D "INSTALL_PREFIX=3D${D}"
>> =C2=A0EXTRA_OECMAKE =3D ""
>>
>> =C2=A0OECMAKE_SOURCEPATH =3D "../cgreen"
>> -
>> -PARALLEL_MAKE =3D ""
>> -CCACHE =3D ""
>> -
>> -
>> -
>> --
>> 1.7.0.4
>>
>>
>> --
>> -----------------------------------------------------------
>> Jo=C3=A3o Henrique Freitas - joaohf_at_gmail.com
>> Campinas-SP-Brasil
>> BSD051283
>> LPI 1
>> http://www.joaohfreitas.eti.br
>
>> From ec5f835f78bd4cfee7da3202ce075b2c6db3f5c2 Mon Sep 17 00:00:00 2001
>> From: Joao H. Freitas <joaohf@gmail.com>
>> Date: Sun, 16 May 2010 18:00:34 -0300
>> Subject: [PATCH v2 8/9] Remove mistake configs
>>
>> ---
>> =C2=A0recipes/cgreen/cgreen.inc =C2=A0 =C2=A0| =C2=A0 =C2=A02 --
>> =C2=A0recipes/cgreen/cgreen_svn.bb | =C2=A0 =C2=A06 ------
>> =C2=A02 files changed, 0 insertions(+), 8 deletions(-)
>>
>> diff --git a/recipes/cgreen/cgreen.inc b/recipes/cgreen/cgreen.inc
>> index 9c71db5..eb3307e 100644
>> --- a/recipes/cgreen/cgreen.inc
>> +++ b/recipes/cgreen/cgreen.inc
>> @@ -11,5 +11,3 @@ BBCLASSEXTEND =3D "native sdk"
>>
>> =C2=A0inherit cmake
>>
>> -#FILES_${PN}-dev +=3D "${bindir}/*-config"
>> -#FILES_${PN}-utils =3D ""
>> diff --git a/recipes/cgreen/cgreen_svn.bb b/recipes/cgreen/cgreen_svn.bb
>> index 88dad6d..65f2f34 100644
>> --- a/recipes/cgreen/cgreen_svn.bb
>> +++ b/recipes/cgreen/cgreen_svn.bb
>> @@ -13,9 +13,3 @@ EXTRA_OEMAKE =3D "INSTALL_PREFIX=3D${D}"
>> =C2=A0EXTRA_OECMAKE =3D ""
>>
>> =C2=A0OECMAKE_SOURCEPATH =3D "../cgreen"
>> -
>> -PARALLEL_MAKE =3D ""
>> -CCACHE =3D ""
>> -
>> -
>> -
>> --
>> 1.7.0.4
>>
>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
-----------------------------------------------------------
Jo=C3=A3o Henrique Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil
BSD051283
LPI 1
http://www.joaohfreitas.eti.br

--000e0cd182a4e567760487476004
Content-Type: text/x-diff; charset=US-ASCII; name="cgreen.patch"
Content-Disposition: attachment; filename="cgreen.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g9k80nsq0

ZGlmZiAtLWdpdCBhL3JlY2lwZXMvY2dyZWVuL2NncmVlbi5pbmMgYi9yZWNpcGVzL2NncmVlbi9j
Z3JlZW4uaW5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjg3ODkzNzUKLS0t
IC9kZXYvbnVsbAorKysgYi9yZWNpcGVzL2NncmVlbi9jZ3JlZW4uaW5jCkBAIC0wLDAgKzEsMTQg
QEAKK0RFU0NSSVBUSU9OID0gIkNncmVlbiBpcyBhIHVuaXQgdGVzdCBmcmFtZXdvcmsgZm9yIEMg
bGFuZ3VhZ2UiCitTRUNUSU9OID0gImxpYnMiCitQUklPUklUWSA9ICJvcHRpb25hbCIKK0xJQ0VO
U0UgPSAiR1BMdjIiCitERVBFTkRTID0gImZsZXgtbmF0aXZlIgorCitTID0gIiR7V09SS0RJUn0v
JHtCUE59LSR7UFZ9IgorCitJTkNfUFIgPSAicjAiCisKK0JCQ0xBU1NFWFRFTkQgPSAibmF0aXZl
IHNkayIKKworaW5oZXJpdCBjbWFrZQorCmRpZmYgLS1naXQgYS9yZWNpcGVzL2NncmVlbi9jZ3Jl
ZW5fc3ZuLmJiIGIvcmVjaXBlcy9jZ3JlZW4vY2dyZWVuX3N2bi5iYgpuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwLi42NWYyZjM0Ci0tLSAvZGV2L251bGwKKysrIGIvcmVjaXBlcy9j
Z3JlZW4vY2dyZWVuX3N2bi5iYgpAQCAtMCwwICsxLDE1IEBACityZXF1aXJlIGNncmVlbi5pbmMK
KworU1JDUkVWID0gIjMzNCIKK1BSID0gIiR7SU5DX1BSfS4wIgorCitTID0gIiR7V09SS0RJUn0v
Y2dyZWVuIgorCitTUkNfVVJJID0gInN2bjovL2NncmVlbi5zdm4uc291cmNlZm9yZ2UubmV0L3N2
bnJvb3QvY2dyZWVuL3RydW5rO21vZHVsZT1jZ3JlZW47cHJvdG89aHR0cHMiCisKK0VYVFJBX09F
Q09ORiA9ICIiCitFWFRSQV9PRU1BS0UgPSAiSU5TVEFMTF9QUkVGSVg9JHtEfSIKKworRVhUUkFf
T0VDTUFLRSA9ICIiCisKK09FQ01BS0VfU09VUkNFUEFUSCA9ICIuLi9jZ3JlZW4iCg==

--000e0cd182a4e567760487476004--
