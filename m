Received: from [209.85.220.222] (helo=mail-fx0-f222.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MnEbF-000432-Lo
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Sep 2009 18:40:24 +0200
Received: by fxm22 with SMTP id 22so2232115fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2009 09:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=SYgYlge+1jMff01CSPL8kHN94ibdYszsDMQtU62qb4U=;
	b=RZIWbQwMgv1MXZTyuXOMUqFafpHestTQqamH3tM9MDHI74iRWy8wxrBreSPCfTWnfP
	FBhB42wHZWbzkFSf5OL8U9I2GoTj1k0RdUGGkQil91kO2/luZ24kRWmd3HCbMPTEYZqZ
	SkkH/sW0/id7rsdhQo6XAr8vXaZyHxHpzEQtM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=us8WwZ2+ekj20kdNHJfogQKR54EMMOvaR13G1Vx8AtGNF+Pv1ahj8tlX0c3ZMYWyl+
	U+0H3IAhMLxc7RHEJFrmquG9r87k33itLuOxFbuBmuhH1B34wfM6MTfGYAzPcl5rbHn0
	gk3sr9eB72qJdOpmrcuBCeDWQBM+skh+yggas=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.190.73 with SMTP id w9mr124494hbh.197.1252946390618; Mon, 
	14 Sep 2009 09:39:50 -0700 (PDT)
In-Reply-To: <141020e30909131608u56b25755vb7df93dd97296256@mail.gmail.com>
References: <1252881838-19764-1-git-send-email-Martin.Jansa@gmail.com>
	<141020e30909131608u56b25755vb7df93dd97296256@mail.gmail.com>
Date: Mon, 14 Sep 2009 13:39:50 -0300
X-Google-Sender-Auth: fe28ce273e7ba90b
Message-ID: <be7a9f3d0909140939i5c86c5c7n6432bcc355417e42@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.222
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: bitbake-dev@lists.berlios.de
Subject: Re: [PATCH] Allow % as wildcard in the end of PREFERRED_VERSION_pkg
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
X-List-Received-Date: Mon, 14 Sep 2009 16:40:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I personally  like the idea but could you make clear your usercase?


On Sun, Sep 13, 2009 at 8:08 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Mon, Sep 14, 2009 at 12:43 AM, Martin Jansa <martin.jansa@gmail.com>wr=
ote:
>
>> ---
>> =A0lib/bb/providers.py | =A0 13 ++++++++++++-
>> =A01 files changed, 12 insertions(+), 1 deletions(-)
>>
>
> As I'm not python programmer, I should at least test it better :/ sorry f=
or
> that noise.
> true->True, false->False
>
> better version in attachment
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>



--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


