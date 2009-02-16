Received: from [80.67.172.39] (helo=webmail.no-log.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1LZ6rd-0007Qu-Ud
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Feb 2009 18:02:37 +0100
Received: by webmail.no-log.org (Postfix, from userid 33)
	id 706C24C298; Mon, 16 Feb 2009 18:00:45 +0100 (CET)
X-Squirrel-UserHash: c3wyGAAN
X-Squirrel-FromHash: AFRWCldXDSo=
Message-ID: <33595.AFRWCldXDSo=.1234803644.squirrel@webmail.no-log.org>
In-Reply-To: <200902161659.09894.khimov@altell.ru>
References: <34765.AFRWCldXDSo=.1234790540.squirrel@webmail.no-log.org>
	<200902161659.09894.khimov@altell.ru>
Date: Mon, 16 Feb 2009 18:00:44 +0100 (CET)
From: "GNUtoo" <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.9a
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Subject: Re: bzip2-full-native_1.0.5.bb problem and possible fix
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
X-List-Received-Date: Mon, 16 Feb 2009 17:02:38 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

> GNUtoo:
>> I've:
>> >| cp: will not overwrite just-created
>>
>> `/home/embedded/oetmp_openmoko/work/i686-linux/bzip2-full-native-1.0.5=
-r0
>>/bzip2-1.0.5/install-sh' with
>> `/home/embedded/oetmp_openmoko/staging/i686-linux/usr/share/automake-1=
.9/
>>install-sh'
>
> Most probably you've worked with automake 1.9, then switched to automak=
e
> 1.10 (or reverse way) and got two automakes in staging directory, then
> this:
>
>> cp ${STAGING_DATADIR_NATIVE}/automake*/install-sh ${S}/
>
> which should expand as (for example)
>
> cp ${STAGING_DATADIR_NATIVE}/automake-1.10/install-sh ${S}/
>
> expands as
>
> cp ${STAGING_DATADIR_NATIVE}/automake-1.10/install-sh \
> 	${STAGING_DATADIR_NATIVE}/automake-1.9/install-sh ${S}/
>
> Boom.
>
> Had this on automake switch too, not sure how to fix it better, but it'=
s
> not
> a problem when you only use one automake (and you can clean up stale
> version manually if you switched from one version to another).
ah ok thanks a lot.
Denis.


