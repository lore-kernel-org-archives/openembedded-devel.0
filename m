Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OvwTj-0003As-Fg
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 20:13:12 +0200
Received: by gwb10 with SMTP id 10so164203gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 11:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=f2JqN7TGcXYJ0G7I9eenjV13eVL3POFUKDfbDgYflVQ=;
	b=mBPAU0/VYlmMgK0c2vw2IN4Lp0D6O2mqZ3G+KSkrqf9VbDxmyO5kCUsAi66VPAnOoG
	RpXMD5puqcqBRF41w4N6OvvHSorZ2cm3XWL/KTzm7rds5tmUA/CQfRQyS/mueV8OkfCI
	5DqVoklVC5THB+8tF1NE8XzEUdgVuCfZGBuEM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=V3A9F+PB+NQOwT46HY/xEJdBuZaTxL28WVG0qJxDqoGBt3T3uqgkomzCojVwbgHOEY
	ibsO9q0nTCYXTGDJxqAg+RmIAg1DIWBWwCFoZwIO3YdKB69aTOq28iIEH/lmXySgeU1H
	5/WqrKNzqU0CisVTDJgW6qel8xRvdWc8m/hcQ=
Received: by 10.150.200.9 with SMTP id x9mr2274739ybf.66.1284574336104; Wed,
	15 Sep 2010 11:12:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Wed, 15 Sep 2010 11:11:45 -0700 (PDT)
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA5019B4F28@deimsg40.de.net.world>
References: <12925243.239881284555095548.JavaMail.defaultUser@defaultHost>
	<0B51A1E7C61D114DAE6FC10B0FD0ABA5019B4F28@deimsg40.de.net.world>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Sep 2010 11:11:45 -0700
Message-ID: <AANLkTinOUv5541b=mS8At=3igF5s6R=jkCrayt+W42Na@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: net-snmp trouble
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
X-List-Received-Date: Wed, 15 Sep 2010 18:13:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 15, 2010 at 6:19 AM, Hauser, Wolfgang (external)
<Wolfgang.Hauser.external@eads.com> wrote:
> Hello,
>
>>IMAGE_INSTALL +=3D "\
>> =C2=A0 =C2=A0 =C2=A0 openssh =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>>nano =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> =C2=A0 =C2=A0 =C2=A0 file =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> =C2=A0 =C2=A0 =C2=A0 strace =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> =C2=A0 =C2=A0 =C2=A0 apache2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> =C2=A0 =C2=A0 =C2=A0 modphp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> =C2=A0 =C2=A0 =C2=A0 parted =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> =C2=A0 =C2=A0 =C2=A0 net-snmp =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> =C2=A0 =C2=A0 =C2=A0 "
>
> simply use packages
>
> net-snmp-client
> net-snmp-mib
>
> for a client installation
>
> net-snmp-server
> net-snmp-mib
>
> for a server installation
>
> The net-snmp recipe do not provide a net-snmp package, it provides the
> seen subpackages which may be installed.


its the difference between recipe name and package names. Recipes
could generate packages with same or different names and it could
generate
multiple packages from one recipe.

>
> Regards
>
> Wolfgang
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
-Khem


