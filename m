Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P2m1V-0002RJ-2P
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 16:28:20 +0200
Received: by iwn2 with SMTP id 2so6939217iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Oct 2010 07:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=8jF4NSiOiZ95kW1PwvMWMa3LUy2jh4XQfCorHWEQpkE=;
	b=UYj9t+b1t1i+eePA1XN8Hz7azwUER291j69TpgNjG5gfv+03zkknjNm0JB74yURVul
	tpGuYoufUlVxgtcPa0v5mjW77lFOfxKhpT0FzfBZAwRqcI6f+dsxCmUsFra9i5srGyeB
	PNP+x3t7p1Zu1PWLPcds4PL5FAcGA9db94ya0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=LqDIjfCfUb3g03fRCOoynIKIljNjkjNUkcR/G3ZAYUXQptEa+5mMNSo5fN8dnuUxx+
	czGr+MbSdTFj+0muVvSpakCGM+Qo/jRM8iY9bgtKXzzPP1zLypsIC9ad0GOBvbzpGymn
	MsyMf74z8qrdFqxQwC9UqR2gl3o1MurOL9cqc=
MIME-Version: 1.0
Received: by 10.231.30.76 with SMTP id t12mr10163377ibc.161.1286202472993;
	Mon, 04 Oct 2010 07:27:52 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 4 Oct 2010 07:27:52 -0700 (PDT)
In-Reply-To: <1285839949.3805.64.camel@mattotaupa>
References: <1285792798-6529-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1285796123.27605.4.camel@mattotaupa>
	<AANLkTimvzxaKE3d=oEYAA7BnX3XZLb9btL36qJ2Bhxwn@mail.gmail.com>
	<1285839949.3805.64.camel@mattotaupa>
Date: Mon, 4 Oct 2010 16:27:52 +0200
Message-ID: <AANLkTint=qobW34DwK9eFaZKAtoJnh2NPt1h_GLVR0n6@mail.gmail.com>
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
Subject: Re: [PATCH] kernel.bbclass: avoid NOTE messages for files that are staged but not packaged
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
X-List-Received-Date: Mon, 04 Oct 2010 14:28:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

I discovered an issue with this patch.
kerneldir was moved (and modified) from kernel_do_install to
sysroot_stage_all_append.
as the assignment to kerneldir was not used in kernel_do_install it
went unnoticed that some kernel recipes have a do_install_append which
references kerneldir.
I authored a small patch for this, setting kerneldir at the end of
kernel_do_install (with the original value).

I've already pushed it
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=98037f10625acdc68d35d94dfbce6cafff9fbe99
without the patch at least one of my testing targets would have failed.

Frans


