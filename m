Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PIe8I-0004X5-BT
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 10:16:51 +0100
Received: by wyb34 with SMTP id 34so1728084wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 01:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Js/eiSWNNsszoq6Pg6VMFlF22YMBY4bOurgJBg/bSo4=;
	b=xv56TCNYj27OU5V+IFB7CM952X5R6Y9A4nfK9LzcJon5m6jNRXpfdBPV5II9Tl/iz2
	ywclOnepudnSijYD+jEQyE9Ozpb/UfsiKLxk3hp4kduI/rh9mCivJ7pEzeolQgsyk+TD
	VHEeFY2aV+Q9atI13sh7IH6uFAfC5J9IJ26R8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=yEy1aVxzbMEmBKn+UBv0eKIudFLIKo4siXq0cxsE0UNqPRfWAXVfWvxxTvbpv/3OvW
	+P42JkX2e/89U4eg8iUbVa729OJIqqZtCTseU429UqA9uE5z9eH//eeoopO9K2m9BPzB
	EZoSI6gIJDmB79ctyc8oquq/4EFCETkyvStfQ=
MIME-Version: 1.0
Received: by 10.216.52.133 with SMTP id e5mr897832wec.0.1289985342510; Wed, 17
	Nov 2010 01:15:42 -0800 (PST)
Received: by 10.216.49.130 with HTTP; Wed, 17 Nov 2010 01:15:42 -0800 (PST)
In-Reply-To: <AANLkTimAqPZaYRHA9xy0pOVhpdwyFKq=LWuuMZRBq0N=@mail.gmail.com>
References: <AANLkTimAqPZaYRHA9xy0pOVhpdwyFKq=LWuuMZRBq0N=@mail.gmail.com>
Date: Wed, 17 Nov 2010 10:15:42 +0100
Message-ID: <AANLkTimgbSkwmvo4jH_-=gpswQopuSjvYDZF7kaR=HbN@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: PREFERRED_PROVIDER issue/question
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
X-List-Received-Date: Wed, 17 Nov 2010 09:16:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 16, 2010 at 10:44 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> When I am building mythtv-plugins for distro minimal I get:
...
> NOTE: multiple providers are available for runtime
> module-init-tools-depmod (module-init-tools, module-init-tools-cross)
..

I see the same note building Angstrom since some months.

Did not track yet the commit which originated that but seems a
conflict wrt module-init-tools-cross_3.2.2.bb
PROVIDES += "virtual/${TARGET_PREFIX}depmod virtual/${TARGET_PREFIX}depmod-2.6"


Besides that, I'm not sure I understand following RDEPENDS in
module-init-tools.inc: runtime depending on a package created by
itself?

PACKAGES =+ "module-init-tools-insmod-static module-init-tools-depmod"
RDEPENDS_${PN} += "module-init-tools-depmod"


Regards

Andrea


