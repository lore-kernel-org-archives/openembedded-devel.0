Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P884L-0006ts-0M
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 11:01:17 +0200
Received: by iwn2 with SMTP id 2so2282500iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 02:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=zJfiSdGCflyx3f7yYYGZr3MdoxABp4b6kLmS1wmgFKc=;
	b=hxY1fVY7On7aqQcHpM3jNsabOIncD7G9aspeqytCswuzrNNjZpwbZpAt5J0/DTyM7c
	iAX6kd+9l6jqUk3aKVJGFPV8X5dayuoIiF8o9Iv8AH9oEPAmwki079QnC0okAHS0B+m8
	GZSfITQ5U+7mV69dX246CeLuIBowQIe8ePHQU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=TL0MlhxaeRkybfQYZfjEl6ua/sUSTsApqrEyZ+YhAbuj9TCqnJYWebOeF+rOBrVQD/
	Pj4m9K3a5f7hWv4ws8BPDlHyFl6ejpRgZWpLEj3HvBELovPk094uGoG3GxfBJbRVXUDi
	C40NDT11CW6fPs/NRiy+1UWPnSsqIwu3VYrLQ=
MIME-Version: 1.0
Received: by 10.231.172.205 with SMTP id m13mr4428482ibz.35.1287478842390;
	Tue, 19 Oct 2010 02:00:42 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 19 Oct 2010 02:00:42 -0700 (PDT)
In-Reply-To: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
References: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 19 Oct 2010 11:00:42 +0200
Message-ID: <AANLkTikTjmbYC8sg9QsNxi8Dt02sebKMkyMYG7oa5SyR@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Moving openmoko recipes and classes to obsolete
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
X-List-Received-Date: Tue, 19 Oct 2010 09:01:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/19 Martin Jansa <martin.jansa@gmail.com>:
> I was asked few times to cleanup old openmoko recipes.
>
> Openmoko as distribution was obsoleted on Aug 10 2010 and SHR is marked as
> successor in that distro config.
>
> Yesterday khem asked me to fix libmokoui2 or obsolete it. We don't use
> libmokoui2 in SHR and seems like nobody else does
> http://tinderbox.openembedded.org/packages/libmokoui2/
>
> So I started to obsolete it and recipes depending on it.. and when it started
> to fall apart I've moved last remaining parts to obsolete too.
>
> Please check this patch serie if you found something usefull for you and if yes,
> then became maintainer for it (as nobody seems to care now).
>
> BTW: I have nothing against openmoko company/distro/recipes/machines :).
>

Patch 9 didn't land here.
I agree with your reasoning, and reviewed the other patches and see no issues.
The only small remark is that if you plan to move to obsolete today,
that full removal on oct 22 is a little bit early in my eyes.

Anyway for all the patches:
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


