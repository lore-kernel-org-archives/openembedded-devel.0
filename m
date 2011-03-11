Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Py3cb-0004Pp-Ru
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 15:47:18 +0100
Received: by iwn10 with SMTP id 10so2854601iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 06:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=+u6rXmUzU1MLdPTUi4Y1v/WA2sr6q+Z7tgHaaE/d3y8=;
	b=FvIxIFNsuHH1d0rr80iKQkI7imUirMUWA/PDKRJwpFaBqbfyvM6zOczsleg9bfxt18
	qTd9vmFc+qmghkiZVji2YCAYKCt5A7ZtWCpdZMNI3JYBAmFXi0bT5UjjNdk7WiBI8P7i
	//0s9g/SvXBiJXeSwyxgiijr9vP+9Tc1rVzxw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=CNWPk7H/DF2QSZLIpgzRW4nQLLn9zk+A1w86N+KEx24EQypIO+G/jDO3yDZU5W72I2
	rRRFf0ZU22urXtUXS7Cigs26NG3w2obUUmpOcrYwt4IAbjdvgft7S3cTxy8/cLqo06Nn
	xCt/kXZ1HlhpM2Ms+VQqxfccG9JDr82dQnws8=
Received: by 10.42.220.69 with SMTP id hx5mr3218884icb.267.1299854738429; Fri,
	11 Mar 2011 06:45:38 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.42.176.137 with HTTP; Fri, 11 Mar 2011 06:45:12 -0800 (PST)
In-Reply-To: <1A8F942C-25F4-4C7D-B9F6-A2B3827CA104@dominion.thruhere.net>
References: <ild7rh$50f$1@dough.gmane.org>
	<AANLkTikftdJ1_H3AyyQEU4EAz_8S--TywGFHmtAJa4S9@mail.gmail.com>
	<1A8F942C-25F4-4C7D-B9F6-A2B3827CA104@dominion.thruhere.net>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 11 Mar 2011 07:45:12 -0700
X-Google-Sender-Auth: uzt_2J7C246zEvFlyTkMFkw-dyY
Message-ID: <AANLkTikgW-fVpgdZYnZ-VDrZabP2OPNMoORXF+jjfU=M@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Backporting bitbake python fixes to 1.12 branch?
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
X-List-Received-Date: Fri, 11 Mar 2011 14:47:18 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 11, 2011 at 7:38 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Op 11 mrt 2011, om 15:27 heeft Chris Larson het volgende geschreven:
>
>> On Fri, Mar 11, 2011 at 6:25 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>>> Various people trying out the maintenance branch get stuck on "parsing
>>> recipes: 0%" when using python 2.6.0 - 2.6.5-ish. I know master has
>>> bugfixes for that, could someone please backport/cherrypick/rediff them
>>> for the 1.12 branch?
>>
>> Pushed to the 1.12 branch. Thanks for the reminder :)
>
> Thanks for the quick response!

By the way, can I take this as confirmation that this fix actually
worked? I never got confirmation from anyone but myself that it fixed
the problem :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


