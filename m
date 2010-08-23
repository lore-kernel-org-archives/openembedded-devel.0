Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OnWBs-0002gi-8I
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 14:31:52 +0200
Received: by iwn2 with SMTP id 2so2995164iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 05:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=JzOq+c56Z2d2IszU/KaqoDKd9F2c8RnYr0VXYVMEggY=;
	b=TwsbIGjTtgMDhXY8Q6ngzXvjeLWnFHUibeimFB/yxk/Io88eHh7zDHq0lthZNNIXgz
	ItpHBltWLrdWvdJXI6Cbsr35PMYiXHaPNjCJrKIJUF5XZHFC/QX558tlSzWaht0HbSmC
	Z+sgpd3w4FUYJekfzccloi95oNbl41K05vTqc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=ML8Aj7FOu/Pu65Ii+1MgNwyd43xw3BrJfX9JaX4PZV6xdwrxfE3biLKfYNqbJWtD8c
	fN3MWX4ku/T/j1ud3DXjrczfoT5Y5L16hXhUbJ67oykKeB0BUJyWskYCSxcDSYw/ew0w
	AFyBQdXx0SwaHe5UCHhCRiTgY+mmloqkdC/NI=
MIME-Version: 1.0
Received: by 10.231.191.6 with SMTP id dk6mr6707269ibb.51.1282566685540; Mon,
	23 Aug 2010 05:31:25 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Mon, 23 Aug 2010 05:31:25 -0700 (PDT)
Date: Mon, 23 Aug 2010 14:31:25 +0200
Message-ID: <AANLkTin-zjJeiVyEEV-d2Ghy0JCHgvJwEwAiPb=dEbAk@mail.gmail.com>
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
Subject: INC_PR
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
X-List-Received-Date: Mon, 23 Aug 2010 12:31:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

Probably a useless fact but less than 25% of our inc files uses INC_PR:

frans@frans-desktop:~/workspace/openembedded.git/recipes$ ls */*inc | wc -l
890
frans@frans-desktop:~/workspace/openembedded.git/recipes$ grep -l
INC_PR */*inc | wc -l
202

So 890 inc files, 202 inc files have INC_PR

Frans


