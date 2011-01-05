Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pabcr-0001bo-Pe
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 23:14:37 +0100
Received: by iwn8 with SMTP id 8so16147719iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 14:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=tSnDGK+PLqYbqEU+qY9NQ1zHLWrmaLVBLQake7beDTk=;
	b=ETiyQC8qT7ALe2iTtCREk4NCS5KgKnQeat4lanyiZOtnUZPwJGOeoZ7zvTR/adqWRg
	OAD76p4LmRchHzqM70HL4SCfRsxyE9+ZH61ebZRxsw39PoeV+VZ54GxIvCQ77MlVmzxz
	g9c88AL3cISU61qIekyaUzi/ZzheyEhip6+vk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FcC+pcFgzjJwVovoxZi29HvfLmRZgMivFu8A6Xrt26onRlQNBfaneL7a+dZcI5QnJ4
	xcZYub6JJbMnro9k/E9Rq7KNm9jBZHKRAFVhvX70g+h+vGNtSnf9gl7DoRtgUdpKkkH/
	MeZIWnjjzxR7AAg+fPPWJlQ+ij5n0pd2K8WK4=
MIME-Version: 1.0
Received: by 10.231.199.77 with SMTP id er13mr7689697ibb.44.1294265651876;
	Wed, 05 Jan 2011 14:14:11 -0800 (PST)
Received: by 10.231.38.11 with HTTP; Wed, 5 Jan 2011 14:14:11 -0800 (PST)
In-Reply-To: <4D24E1FF.9040303@eukrea.com>
References: <4D24E1FF.9040303@eukrea.com>
Date: Wed, 5 Jan 2011 23:14:11 +0100
Message-ID: <AANLkTi=43nQQ7Ec8VjkRtvVGzsR0DotNEmYJP+j7TrCt@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: cyclic dependencie
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
X-List-Received-Date: Wed, 05 Jan 2011 22:14:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/5 Eric B=E9nard <eric@eukrea.com>:
> Hi,
>
> while building minimal for an armv4 target on a freshly installed Fedora =
14
> x86_64, I meet the following problem :
>
> bitbake glib-2.0-native don't build because bitbake first tries to build
> desktop-file-utils-native which depends on glib-2.0-native and thus fails=
 to
> configure with "No package 'glib-2.0' found" (I don't have glib-devel
> installed on the host).
>
> desktop-file-utils-native seems to be listed as DEPENDS only in
> insane.bbclass.
>
> Do you have any idea on how to fix this ?
>
>
Disable QA, then you do not need desktop-file-utils
(or split the qa class in two parts; that would even be better as then
console only stuff does not need to drag in all the stuff
desktop-file-utils drags into the build).

Frans


