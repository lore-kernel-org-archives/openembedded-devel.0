Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OmL2W-00066d-1b
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 08:25:22 +0200
Received: by iwn2 with SMTP id 2so11586iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 23:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=HrJ4bryIJCR/AGl1kbu98jHTK9uImp4PEZbDIzrBQj8=;
	b=mbowywYELsgIotETeK3lCR7B25PL2LOqh2zNIyQbitzRQS6WRE0yfvUmhof+o11bYA
	TyR+yQthg98yUQBaQTfgkzTXAqpevW3oLVcUwsqyyihzCKl8EKfDnUzpp4ObrLgDvTa3
	Wxb88h7BA0f9la0EmIqAwnVmpbAMO7KekElzI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=xJg7Aq5wc2YwxCjfpXCwxjEWZ9fpuS4L/jwiEN58uI2bRG9KFIDxYHOpOwU9Ul0H66
	YT51aY/SHTUfY/Wu599W7cUlr6f03WTppgcpQ4ALJaycr7kY9t7OXSeTEr/wRX5svI3X
	ig3EvOBGZ9uEH8ZNwe0Xe2weDb4SU0fKGA6fY=
MIME-Version: 1.0
Received: by 10.231.14.76 with SMTP id f12mr1145477iba.63.1282285500399; Thu,
	19 Aug 2010 23:25:00 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Thu, 19 Aug 2010 23:25:00 -0700 (PDT)
In-Reply-To: <20100819230246.GC26112@denix.org>
References: <AANLkTi=haC49V6XnCQpBCY8ickT24PL1F0sKYoh8h6=J@mail.gmail.com>
	<4C65BA04.9020908@mentor.com>
	<AANLkTim0dxLN000-oqvGbeaBdLTs7P6=9ZVDBfGn4LuA@mail.gmail.com>
	<AANLkTikAY38Wg01czaYa_o3_a2pXg2YcjAL8vbrEUYpL@mail.gmail.com>
	<AANLkTik8ujUK5vczYTOuoDdjuEEzTuY7_ifxbBnePpN9@mail.gmail.com>
	<20100819230246.GC26112@denix.org>
Date: Fri, 20 Aug 2010 08:25:00 +0200
Message-ID: <AANLkTik33d=iQg5bkkej26eq2BUVuLU8h4Z85WB1inqO@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: iputils fails to build due to missing sgmlspl
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
X-List-Received-Date: Fri, 20 Aug 2010 06:25:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/20 Denys Dmytriyenko <denis@denix.org>:
> On Sat, Aug 14, 2010 at 09:35:02AM -0600, AJ ONeal wrote:
>
>> I was mistaken. It didn't build iputils. I started over from scratch, built
>> everything up to iputils, and failed!
>>
[...]

>> sudo-apt-get install sgmlspl
>> bitbake iputils

That is a workaround which works because then you're using the native
sgmlspl (which is probably not too desirable wrt reproducability on
other systems).
>>
>> now it appears to be running...
>
> BTW, I think it has just been fixed:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=4511027a40d9659d944ff2e02503d51536af92a6

Yup. I bumped into the same issue (being unawara of this thread).
sgmlspl-native did not export its executable, only a -dev pacakge
(which might have sufficed at some point in time).
I just let it stage all its files. After that for me iputils builds fine.

Enjoy, Frans


