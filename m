Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P9OUC-0008A9-Qi
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 22:45:14 +0200
Received: by gyg13 with SMTP id 13so1018374gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 13:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=rm9eut7rlK/i9q+QBuzjsocVO32ymb80bf/J1ypAR+4=;
	b=VnGFcbeS1W7c1NH4z5v/8iKf2NJlJCvAW3+DGI/s4Vv4VXJWUtVzzoYcU0w7fhYN3d
	GKEhCOPKXtjYFKhRQGI5nW42ju/drliJSNNx53FLnuhlYd/ruOSGnSqP0ZIz/F9G8BAV
	cX7noLh7ISzEgqh2e6U0qBrQCJFj0scJqGY0c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=fSxGQvg4Tl4Ye9Md4sEzwyL1QUwjIsBNPoQt/cex8M0zY9Mo7B9vV9DF9d5etFG0Vl
	Nd3lyuWr79W6lRCvugwjAj8xhK5Kzn2LgTRAh1ZNpUR7DMgsGpVkQfXYq5CA6GlHsFjT
	V4OC0BAw1dJKMLKB72r0LvxMxv/F96savcI6w=
Received: by 10.42.22.133 with SMTP id o5mr2505955icb.268.1287780273853; Fri,
	22 Oct 2010 13:44:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.164.194 with HTTP; Fri, 22 Oct 2010 13:44:13 -0700 (PDT)
In-Reply-To: <AANLkTinSf5Ftqm9h+2bcKCjxOkqwKui4RaVuBJ49U7KD@mail.gmail.com>
References: <i9s8nh$e2$1@dough.gmane.org>
	<AANLkTinSf5Ftqm9h+2bcKCjxOkqwKui4RaVuBJ49U7KD@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Oct 2010 13:44:13 -0700
Message-ID: <AANLkTi=ri3VQQ=LSOVAgcpHsckj84e6BMc=UE7n2wSMZ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] using kernel.bbclass rename hook for external modules as well
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
X-List-Received-Date: Fri, 22 Oct 2010 20:45:14 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 22, 2010 at 10:06 AM, Chris Larson <clarson@kergoth.com> wrote:
> On Fri, Oct 22, 2010 at 7:56 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:
>
>> Currently kernel.bbclass splits and renames modules into
>> kernel-module-<foo>, but module.bbclass doesn't. What's your opinion on
>> making modules.bbclass follow the same logic for consistency?
>> To make upgrade paths work the 'kernel-modules' metapackage would be
>> ${PN} for external modules.
>>
>
> This sounds like a very good idea to me, it would make the package list much
> more consistent and improve the user experience, imo.

yes I agree fully. Will there be issues with upgrades ?

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


