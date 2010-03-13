Received: from mail-iw0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NqWXt-00087d-Sd
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Mar 2010 19:58:51 +0100
Received: by iwn4 with SMTP id 4so889386iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Mar 2010 10:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ClIz/blpcp3O3cC350P65TW7Z4tqhOR8gW3PfR30Kkw=;
	b=WT3oWn3uZ0t5uk2+3DLqvmwI+6qYjRHlIIpJSli5xX2UPTUjtNZRCiV8mvqNHkeXm9
	Z+JFbfRezK5D5jr27mtrW1RsXAjiSg/TudJlGCZqO324vLHhXbacwnU3Vsk4moBfNhi6
	k/N+BWVi70HT6hWmvy1Sqh3sAMjBtu9iv+Ky8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=GUbO8XPr4OVz5bGffFjd2tNbtk27SBY11VnHCK9XphE8QpNGgzFwh3ERrZvCrAoXAs
	F+U55Jj+vQzD0aeXgcyPlGoh8ZaDqqcuvOIP9kOTCS2r1r/rRl9ATTRJFJH2Ucq7SthL
	lyaqQ2FqIdOdfxLubzKXkI/yY7s6IOpUcYrxw=
MIME-Version: 1.0
Received: by 10.231.148.1 with SMTP id n1mr659039ibv.96.1268506544910; Sat, 13 
	Mar 2010 10:55:44 -0800 (PST)
In-Reply-To: <4B9BD33E.502@zenlinux.com>
References: <1268465302-3725-1-git-send-email-sgarman@zenlinux.com>
	<19c1b8a91003130002g55d34a65l9858e5ae62062eb3@mail.gmail.com>
	<4B9BD33E.502@zenlinux.com>
Date: Sat, 13 Mar 2010 10:55:44 -0800
Message-ID: <19c1b8a91003131055o2e259175of495eee99dae47ff@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.174
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sed: migrate -native to BBCLASSEXTEND
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
X-List-Received-Date: Sat, 13 Mar 2010 18:58:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 13, 2010 at 10:02 AM, Scott Garman <sgarman@zenlinux.com> wrote=
:
> On 03/13/2010 12:02 AM, Khem Raj wrote:
>>
>> On Fri, Mar 12, 2010 at 11:28 PM, Scott Garman<sgarman@zenlinux.com>
>> =A0wrote:
>>>
>>> Signed-off-by: Scott Garman<sgarman@zenlinux.com>
>>
>> can you also convert other native recipes for sed to use BBCLASSEXTEND
>
> Yep, that was my plan. Although there is only one other sed-native recipe
> for v4.1.1. Should I just convert that one, or is there also any value in
> adding BBCLASSEXTEND =3D "native" for the two other v4.0.x recipes?

just convert one's that are there.

>
> Scott
>
> --
> Scott Garman
> sgarman at zenlinux dot com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


