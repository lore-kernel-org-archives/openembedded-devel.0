Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OTI8j-00026W-0h
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jun 2010 19:29:01 +0200
Received: by iwn34 with SMTP id 34so99505iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jun 2010 10:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=0iwvoy26XtP2aNqesskUZ359BUNmgfZ8B/0L0KWhIFo=;
	b=vGWKsUwayLq36nLLtKkZIvd/X6xGwXofHXAl/a2UG3FNfGcyfbUYRWEmbO5wis6uT8
	rblFekGzrhD6amW42CEUKHPexwPN6Vh2UO269ucRr6uOzSwykbx/Q0vkGtQKL718HQ2G
	hviTa5tIcwncpN3XZewDxUsyJ9eHpAOU5Qy2Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=g/qTzyDjhgESdws2dGZiN/FGYI0jTKiSG94YoZG4ExmZRdU9yLauSKl6iq8u0egT/U
	e1vbkZ5HBhhmV8W2UfmhM2pGNtbI4Z95mxIFbHNlDcPz60gXgs0YB7iRCF1HOJEg4VC9
	QnyCYhNlF6Tah79IBqlSCt2/4u97Nh7ENTZSw=
Received: by 10.42.2.77 with SMTP id 13mr1761982icj.28.1277745860328; Mon, 28 
	Jun 2010 10:24:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Mon, 28 Jun 2010 10:24:00 -0700 (PDT)
In-Reply-To: <4C289A86.5010508@freyther.de>
References: <4C289700.1000409@jak.nl> <4C289A86.5010508@freyther.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jun 2010 10:24:00 -0700
Message-ID: <AANLkTinkr9YuMo0z6wxJuIPfcPLzJ6TPYuzPWsInAA8N@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: FeeBSD as OE build host
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
X-List-Received-Date: Mon, 28 Jun 2010 17:29:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 28, 2010 at 5:50 AM, Holger Freyther <holger+oe@freyther.de> wrote:
> On 06/28/2010 08:35 PM, Arjan wrote:
>> Hello,
>>
>> I read here
>> [http://wiki.openembedded.net/index.php/OEandYourDistro#FreeBSD] FreeBSD
>> was/is supported as build host. Is this still true?
>> Are there pitfalls or other prerequisites beside the ones mentioned?
>
> I haven't tried for quite a while so there might be some more issues
> again.... The most common thing is replacing cp -a with cp -pFR (IIRC).
>

there is a branch koen/darwin-host-fixes which should also have some fixes
that could help you. I have not tried mac osx or freebsd build in long time.


> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


