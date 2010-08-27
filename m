Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Op8S2-00021t-LI
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 01:35:16 +0200
Received: by iwn2 with SMTP id 2so2952433iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 16:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=M6po+ojMQrZ0sYCPID55CXjJ93d/HHl9tbJCa7ECOOA=;
	b=KDs716OzeUGiN1vPNS5+5C+uIL7Cecix2WLAdEO1ELHJd/SdQV4+2kWSBUxmoPQacZ
	Vj46aikWDuCyj3jKbMQZj87APkB5u9mQ26BQkOPrW0rd/jWG7SXbs/ByU8nGKWocQ4oO
	dDWuEwg5rIlVhIm1hn7oiiRTRmumXW/6dzhoM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=F7b0KU7J7QMO3dbh/CSM3elF/sGg79KGKn2DUa4UQUeIxCAEDwV4XWYhgiFkn0vHWJ
	O+3Ikk3T887VRLri8OboIa62sbg1Y3CJV4avCvukf0Vr2xgApMMXfVCZobMuZ1sRT0Pc
	5F4qV/SJM/KJbfz0i/YgfaXNpWn1ASwQkR96M=
Received: by 10.231.15.195 with SMTP id l3mr1785813iba.188.1282952085133; Fri,
	27 Aug 2010 16:34:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Fri, 27 Aug 2010 16:34:25 -0700 (PDT)
In-Reply-To: <4C77C60E.3080106@dresearch.de>
References: <1282916906-21411-1-git-send-email-sledz@dresearch.de>
	<4C77C60E.3080106@dresearch.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Aug 2010 16:34:25 -0700
Message-ID: <AANLkTinuV6vLXXKJ_hrkNs-23cauS8OZA6gpyZySz-=s@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rsyslog: keep rsyslog running as long as possible on shutdown
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
X-List-Received-Date: Fri, 27 Aug 2010 23:35:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 27, 2010 at 7:05 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> Am 27.08.2010 15:48, schrieb Steffen Sledz:
>> ...
>> +INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 90 0 1 6 ."
>
> I just wanted to ask if there are any objections (e.g. a policy on using start/stop order 'levels') in using 'stop 90' here.
>

I guess its distro maintainers call isnt it ? in that case you should
just add distro specific overrides for ones who want
it unless its a thing that all distros want.

> Steffen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


