Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Op03V-0002vO-Kj
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 16:37:22 +0200
Received: by ewy7 with SMTP id 7so2088111ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 07:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=hrB8CCKcTaJwgJdnZwPySVMOiIDzLw6C4Sm0WdDHXlg=;
	b=Oa7puPtD/PwHh5TssFBaP91WEIGWplHfFjSV6n3AHfyeJpk5ZL3FyJRSa7xj9Ne6m2
	gEOoxCUvQaq8uYGn28vGY9Ec1+NWm2vVI8UV5twCXavo7QiIErFdgkZ2a5mte4ShGoKz
	KU4GXwzI96OXAmjt3St74/COdErkG4KxYXt60=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=tIv5NhsCzfFoXnndyTYY0lvSfRG4c/GalsIGYj7p1PX/cIwSHNwgD+/wlHGrYdwldl
	EzGLpmyAAgCQjI911w71upH7lofmnIsiAYYeUT16GrusqzY0640nAEOPb7dfa5mwWeqD
	MzpIzSAMQQZbCbwKjL6QlcJ2kLj12232CAndg=
MIME-Version: 1.0
Received: by 10.216.70.10 with SMTP id o10mr913598wed.83.1282919814228; Fri,
	27 Aug 2010 07:36:54 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Fri, 27 Aug 2010 07:36:53 -0700 (PDT)
In-Reply-To: <AANLkTi=WnKFoiutD+vZHEQLDQzmFnhdrUMjYrvc_MNam@mail.gmail.com>
References: <AANLkTim6-d4krhcMuAZojQVNdy3W-m_ON-mOvK5y3tqn@mail.gmail.com>
	<4C76C597.9050302@mlbassoc.com>
	<AANLkTinnnfOCw3m_q6_d27o9Luyw4dWS-uVhJzYUTTbZ@mail.gmail.com>
	<4C76CD2C.2090102@mlbassoc.com>
	<AANLkTi=WnKFoiutD+vZHEQLDQzmFnhdrUMjYrvc_MNam@mail.gmail.com>
Date: Fri, 27 Aug 2010 10:36:53 -0400
Message-ID: <AANLkTimAqA1ikCdCZSYZXMJ2iYzKS2jqmfTKgY8oGEV7@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Graham Gower <graham.gower@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: testing branch 2010-08-23
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
X-List-Received-Date: Fri, 27 Aug 2010 14:37:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 26, 2010 at 7:20 PM, Graham Gower <graham.gower@gmail.com> wrote:
> """if a build fails, then issues are reported, and the testing-testing
> branch is moved ahead to capture fixes made in the dev branch. Once
> the issue is fixed, all combinations are retested."""
>
> Can I suggest that the testing-testing branch not be moved ahead? Its
> not really fair on testers to have to retest, especially if the branch
> is moved ahead a couple of times. Obviously breakages should be fixed
> and committed, but can't it just wait for the following week's testing
> branch to show up as a successful build?

I think this is a good suggestion -- testers including myself may not
have time or CPU bandwidth to be running multiple builds every week.
My original thought was that the testing branch does not get moved
until everything builds, but that is probably not reasonable.  If we
list last good build for each combination, and move the testing branch
when most of the combinations build, that is probably the best we can
do.

I have updated http://wiki.openembedded.net/index.php/Testing to
reflect these thoughts.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


