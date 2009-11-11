Received: from [209.85.210.175] (helo=mail-yx0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N8FeW-0004sk-TT
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 17:02:40 +0100
Received: by yxe5 with SMTP id 5so1085417yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 08:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=FTNAaQxVBlYxQ0dIgnl4DF6hfJusXMBE0/iUzkBEzs8=;
	b=piSBLpHbUke998uGA1azaFiu5ZbY6FvT3Uvu9g73jBTIAC/C5HyDgk4Zvw0K3G6gw3
	y/882bVXp0T6c84BKp8ZoeqzjSQ5u3nK0MW4SmfXjUkwjokTZa2hdTildvzGlO1sWG5R
	JZRVavCs95Y/bjLVP3a/xGhS6d2agElQJ9Izo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=XRPQQQA3utVEeP+9FuIQmUmGw0njYuL+aHKqDFVpacoKfFCNLc7TMu8mjHkIbMr4nq
	+Jqy6SZsAE4TbGMYnZ9hlbaEHe43EpaG1zZ+drdQoEpfsJgdix+z6CIV5NQ9ewjZmjg8
	nXXC7t9Ss/vIpWcluw1WKYU2PVPB06g6AMOZY=
MIME-Version: 1.0
Received: by 10.101.54.13 with SMTP id g13mr1552243ank.158.1257955277886; Wed, 
	11 Nov 2009 08:01:17 -0800 (PST)
In-Reply-To: <1257954353.25369.304.camel@lenovo.internal.reciva.com>
References: <1257872140.1484.335.camel@mill.internal.reciva.com>
	<200911110206.20901.holger+oe@freyther.de>
	<1257927850.25369.283.camel@lenovo.internal.reciva.com>
	<200911110944.10399.holger+oe@freyther.de>
	<1257949048.29038.388.camel@dax.rpnet.com>
	<1257954353.25369.304.camel@lenovo.internal.reciva.com>
Date: Wed, 11 Nov 2009 17:01:17 +0100
Message-ID: <ac9c93b10911110801q308a2d80g916a0271757fedd5@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM 2009 summary: Death to checksums.ini?
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
X-List-Received-Date: Wed, 11 Nov 2009 16:02:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/11/11 Phil Blundell <philb@gnu.org>:
> On Wed, 2009-11-11 at 14:17 +0000, Richard Purdie wrote:
>> SCR_URI =3D "xyz://abc.com/efg.tgz;name=3Dbar"
>>
>> MD5SUM_bar =3D ""
>>
>> or maybe :
>>
>> MD5SUM[bar] =3D ""
>
> The labelling is a good idea, although I am not especially keen on
> either of those notations. =A0How about:
>
> SRC_URI =3D "xyz://abc.com/efg.tgz;name=3Dbar"
> SRC_URI[md5sum:bar] =3D "..."
> SRC_URI[sha256sum:bar] =3D "..."
>
Would we still be able to use PN and PV in the md5sum:bar etc?


