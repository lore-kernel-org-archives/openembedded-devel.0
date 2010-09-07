Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ot0to-0000Jk-7O
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 18:19:57 +0200
Received: by yxk30 with SMTP id 30so2052961yxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 09:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=sqEa5iVPu5aH88Cg0DytJXt5OranBYAEhhGcetR7NFA=;
	b=BSwqFIB6vaqg6OsDfrL5ntXCD6Kp89n0aThCe4jUEuAx1ckFeUnUcR+Q75XlCQ1IX9
	zgb1a3D8HozVyFFnNhSPdMUa7jx6FAQFj4N8QXK0Q0DlU2X4Wr18QSPQyCDS10+Gry6a
	sdovOaluyE1V/eIfrBjCiSFjs/jGJQHtEeudo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=DF5CCBhxk4oFUUUiEABR7CDK3pl+5lIWiBcl5skjNv9eOxX099JGCOVE2NsAuGNBP7
	hwv1WOif+4R33YRxs7tz+Q2jm/l6ZtY8xCGVE554d6D/IkszPWVr+WGuSfNYIuYhAyFF
	ye1unZAsyDxVv6sV22pobVIyYqaRMEw5hEcxo=
Received: by 10.101.176.29 with SMTP id d29mr2782325anp.163.1283876354536;
	Tue, 07 Sep 2010 09:19:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Tue, 7 Sep 2010 09:18:54 -0700 (PDT)
In-Reply-To: <i65ci4$4c3$1@dough.gmane.org>
References: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>
	<AANLkTi=0ukfZL=oQxGHXaoUg30TCu5LfkTKhrvCM5g8d@mail.gmail.com>
	<i65ci4$4c3$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Sep 2010 09:18:54 -0700
Message-ID: <AANLkTi=o8sM5eBxtMLbB3WVk4vQ8r5mL7g5SKSrK0h34@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Images no longer automatically include libstdc++6
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
X-List-Received-Date: Tue, 07 Sep 2010 16:19:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 7, 2010 at 5:52 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>
> it happens when you build 'gcc' after 'gcc-cross', gcc will doesn't
> create a libstdc6++ package, but it does create a libstdc-dev package.
>

I see thats plausible. I think its time to look into separating gcc runtime
from gcc on the lines of poky.

-Khem


