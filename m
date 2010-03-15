Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nr5OY-0000qS-Q5
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 09:11:33 +0100
Received: by gye5 with SMTP id 5so1230854gye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 01:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=9XV11tXR1F6aWKrqcMLE3s22wu47iSjNrYU6fGL3M7I=;
	b=AQyDgx2vFEgDMyDQzR6WtY6Wg5Ml55y84eH4DFA+GNK2N1N4hqPRQ5CU32Zt3j9P8I
	Llb9JBMetb1KsxEmr6aXCkJt5aSzNYJSJKy+28h/iOjUU9VIyLHT6hwsCWnTIDpclpUt
	QSbJJMMIB8ywatOtPTqEsLPUg7iH2r+qqH6kc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Y0VQMiJy9oJQpi3lnnatxJWcf0eCPiqgw/ngGzBE9DX7W+Kid1Xv001SobHsPPYyNK
	ybylO9WZoqCfiz4yzJYNvj+yQQKujtimw3IrwGlQskr9lVqczU6JtWYvWED3tJm8yAHn
	r63Ocs6vM2Ww75rGRizaunqUsCmvfe7P03QMM=
MIME-Version: 1.0
Received: by 10.101.126.14 with SMTP id d14mr1898096ann.225.1268640504557; 
	Mon, 15 Mar 2010 01:08:24 -0700 (PDT)
In-Reply-To: <201003150846.33517.holger+oe@freyther.de>
References: <201003081300.19058.holger+oe@freyther.de>
	<201003150446.26284.holger+oe@freyther.de>
	<ac9c93b11003150030i69015e69t78a3b16e6c11d2e5@mail.gmail.com>
	<201003150846.33517.holger+oe@freyther.de>
Date: Mon, 15 Mar 2010 09:08:24 +0100
Message-ID: <ac9c93b11003150108v70781eb6re16d6212c454637e@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: samba-essential upgrade or remove?
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
X-List-Received-Date: Mon, 15 Mar 2010 08:11:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/3/15 Holger Hans Peter Freyther <holger+oe@freyther.de>:
> On Monday 15 March 2010 08:30:09 Frans Meulenbroeks wrote:
>
>> Do we feel we have that responsibility?
>>
>> I didn't feel that sentiment when it came to removing other legacy
>> recipes (some of which definitely also will have security issues).
>> E.g. for openssl we have
>> openssl_0.9.7e.bb
>> openssl_0.9.7g.bb
>> openssl_0.9.7m.bb
>> openssl_0.9.8g.bb
>> openssl_0.9.8m.bb
>> I'm pretty certain the last one will fix some vulnerabilities present
>> in the first one.
>
> Well you are comparing two different things here. One is having the _default_
> of a recipe with known security issues, and one is keeping old non default
> recipes with security issues.

I agree they are not really identical issues. Then again it both boils
down to quality of the recipes.
see next remark
>
> If a distro maker decides to use an ancient version of OpenSSL it was his
> choice, if he just typed bitbake foo-image and he has a vulnerable daemon
> waiting to be owned in his default image... the story is a bit different.

Personally I feel it is pretty pointless to have old non-default
recipes in a development head.
If a distro wants to use an ancient version let them create their own
branch (I can perfectly understand that ancient versions are still
present in a stable branch or in a distro specific branch)
>
> I think we have at least three options on how to deal with it:
>
> 1.) Put a big fat warning on Openembedded.org saying it should not be used for
> users that have network connectivity or might put a SDcard/Storage with
> content on a device as we don't care about fixing vulnerable software.

Independent on what we say for the next two options I think we should
do that (although maybe in a different wording)
Our code is provided as is and we do not have the resources (or people
are not interested) to keep up with the latest vulnerabilities and
issues.
Actually it is not even limited to networking code. If you decide to
use an app, it can also be that we are providing an old version that
has a security hole that can be exploited e.g. to gain root access.
>
> 2.) Adopt a policy of addressing vulnerabilities in our defaults right away..
>
> 3.) Remove recipes for vulnerable software when no one is updating them in
> time... This can be combined with option 2...

These are good plans, but I'm not sure if you will get volunteers for
2 and people will definitely complain if you do 3.

Btw: personally I have no big problems with the samba vulnerabilities
(although preferably I would like to have them addressed). I'm using
OE images on some of my systems in home, but they are behind a
firewall so external exploits are less likely. The internal users are
trusted and also not capable to hack the system.

Frans


