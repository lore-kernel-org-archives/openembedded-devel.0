Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UQbsG-0008MB-K2
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Apr 2013 13:10:35 +0200
Received: by mail-ea0-f180.google.com with SMTP id d10so1098593eaj.25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 03:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=yiK/MWWNt8f5g+QAXtKh552ucOMLHpNKQmZJkcWduv0=;
	b=a1kESUOSZgWFWcfFxZikdqjYN6umlfq/RznLHGjRJxVPdwo2FBHCB40TmtKpx1QsVi
	+gOdHydfXwTtiDCEanGcODwoky79H3XO9Oi+JddWHsEBsNFdDfT0N1Gd1YwoBPT4OSwS
	cY4Ue+cqLe+OrZF+BHgumybiI+dZMIdqSsyL+MOrjFZEZvyHdMhZwZRMZlTGqNJ20JeN
	hC7hJlyLMW/0uAL5IN8sHlXr1pvc3ATDmdCCV083u135enpePwLVW8VEAOuYzDu2+qbV
	vAYYBfBmXVdNsx3t87Le6ZQTAv+AnkR9VhYMWB5JQqcEsyeADn2a9jb4GMIH7amjOG5t
	IjEQ==
X-Received: by 10.14.214.65 with SMTP id b41mr27117074eep.37.1365763988245;
	Fri, 12 Apr 2013 03:53:08 -0700 (PDT)
Received: from ?IPv6:2001:610:612::de9:757b:5523:e196?
	([2001:610:612:0:de9:757b:5523:e196])
	by mx.google.com with ESMTPS id a2sm9017542eem.11.2013.04.12.03.53.04
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 03:53:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20130412103022.GK2477@jama>
Date: Fri, 12 Apr 2013 12:53:04 +0200
Message-Id: <8EA1371A-D3C7-4A97-82D8-DCA75C32A899@dominion.thruhere.net>
References: <1365761087-1229-1-git-send-email-koen@dominion.thruhere.net>
	<1365761087-1229-5-git-send-email-koen@dominion.thruhere.net>
	<20130412103022.GK2477@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQmqO9sXAi6iP2h2fxLTQjHT4I16K1kM6QqHcRjxcDAuI2B+TUN+80osVswBG8b4dgDAzXuc
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCHv3 5/5] nodejs 8.8.18: unset RDEPENDS for native builds
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
X-List-Received-Date: Fri, 12 Apr 2013 11:10:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 apr. 2013, om 12:30 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:

> On Fri, Apr 12, 2013 at 12:04:47PM +0200, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb | 1 +
>> 1 file changed, 1 insertion(+)
>>=20
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb =
b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
>> index 3ab2ed6..2db9e68 100644
>> --- a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
>> @@ -36,6 +36,7 @@ do_install () {
>> }
>>=20
>> RDEPENDS_${PN} =3D "curl python-shell python-datetime =
python-subprocess python-crypt python-textutils python-netclient "
>> +RDEPENDS_${PN}_class-native =3D ""
>=20
> Sorry if I caused problems by removing it before, why is this needed?=20=

> I haven't seen any issues without it.

You can't do DEPENDS =3D nodejs-native without this line, since =
python-shell has non -native variant

> Also we have patch to upgrade nodejs to 0.10.0, do you know if other
> components using nodejs are compatible with it?

Not sure, I haven't used node 0.10.0 yet. Otavio and I need to get =
serious and start meta-node real soon now :)

> We'll also need to add
> node-gyp if that's useful for someone else too.

Yes, I foresee needing it myself :)

regards,

Koen

>=20
> Cheers,
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



