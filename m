Received: from [209.85.220.224] (helo=mail-fx0-f224.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <maxilos@gmail.com>) id 1MXxgF-0003fk-Hu
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Aug 2009 15:34:23 +0200
Received: by fxm24 with SMTP id 24so2389344fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Aug 2009 06:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=IhMny+MI7p0QHSRr5j0WcobhO84HKDwbK4Sc7QPN5kE=;
	b=OwWKs1gcD52CTaOO4d5Sq+oYwOZbOVPNLjJ7CSd/0RgRUAhyNOIaBBYLboDEdLZ9Dv
	9+GQwVk2XZkrRaali43+dlZnjbSkf/OspLEaErUA9UMO+Bgv8uWG4megpIlIXNb1lTEv
	dMEHqJp0ASAqQZo4su7XXZRGbNHhoxpayUTB8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=sNgKXlHQhDjFqFIuGPmv1kFQ0U2UuNj2EvG0gPbsNDELV33zNrSmUJLKLqjT7S7Rrh
	Ay6XxYvTOgmCmA7zPbo2O0wFjf3iiwntEwFllpskfDYK9rrSm9IJSaHDZFWu9n/6myxt
	TGGga5r6H8nI85Ypt/l+EnItS4DpF1Pw2WeGE=
MIME-Version: 1.0
Received: by 10.103.231.8 with SMTP id i8mr3482441mur.65.1249305535537; Mon, 
	03 Aug 2009 06:18:55 -0700 (PDT)
Date: Mon, 3 Aug 2009 16:18:55 +0300
Message-ID: <24aa85dc0908030618ib31d99bnad7a3b7234ff03f9@mail.gmail.com>
From: Gregory Machairidis <maxilos@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: (No subject)
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
X-List-Received-Date: Mon, 03 Aug 2009 13:34:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

php.inc have an error on the URI

this is the correct for a working task, us2.php.net dont have that file
anymore...

SRC_URI =     "http://museum.php.net/php5/php-${PV}.tar.bz2\
               file://acinclude-xml2-config.patch;patch=1"


NOTE: Running task 365 of 921 (ID: 525, /stuff/openembedded/recipes/php/
php-native_5.2.6.bb, do_fetch)
NOTE: fetch http://us2.php.net/distributions/php-5.2.6.tar.bz2
--15:31:22--  http://us2.php.net/distributions/php-5.2.6.tar.bz2
Resolving us2.php.net... 64.71.164.5, 2001:470:0:b9::4047:a405
Connecting to us2.php.net|64.71.164.5|:80... connected.
HTTP request sent, awaiting response... 302 Found
Location:
http://us2.php.net/search.php?show=quickref&lang=en&pattern=distributions%2Fphp-5.2.6.tar.bz2[following]
--15:31:23--
http://us2.php.net/search.php?show=quickref&lang=en&pattern=distributions%2Fphp-5.2.6.tar.bz2
Reusing existing connection to us2.php.net:80.
HTTP request sent, awaiting response... 302 Found
Location:
http://us2.php.net/manual-lookup.php?pattern=distributions%2Fphp-5.2.6.tar.bz2&lang=en[following]
--15:31:23--
http://us2.php.net/manual-lookup.php?pattern=distributions%2Fphp-5.2.6.tar.bz2&lang=en
Reusing existing connection to us2.php.net:80.
HTTP request sent, awaiting response... 200 OK
Length: 6310 (6.2K) [text/html]
Saving to:
`/stuff/sources/manual-lookup.php?pattern=distributions%2Fphp-5.2.6.tar.bz2&lang=en'

100%[=====================================================================================================================>]
6,310       26.0K/s   in 0.2s

15:31:24 (26.0 KB/s) -
`/stuff/sources/manual-lookup.php?pattern=distributions%2Fphp-5.2.6.tar.bz2&lang=en'
saved [6310/6310]

NOTE: Task failed: Fetch failed:
http://us2.php.net/distributions/php-5.2.6.tar.bz2
ERROR: TaskFailed event exception, aborting
ERROR: Build of /stuff/openembedded/recipes/php/php-native_5.2.6.bb do_fetch
failed

