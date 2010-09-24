Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Oz68A-0005eP-Vy
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 13:07:59 +0200
Received: by ywe9 with SMTP id 9so721082ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 04:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Yjg5WPLqwSfOsuFr3E4vA6DuU1i+gusY3i23008m0cE=;
	b=HJYQNm6U3f6EN6nsrZwlBQpui1K1RQtq9M7t/FG7nrtmr+i3iEWFhPuAdQESaEpvZ+
	w63RytGpD5uAFyyYKmZJKehtOWolu171kQDiknBxPr3hoGsXJBiMnL3iYp1pyORR7/6b
	MlqXvmtEEazvSycxXGJ8ZSnigx6otU5Lteg40=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Wp+nUcsm84pm+EVV8TcYeTTImN1xSqb3nkpYwbkeRCbJUI1loT0+SSonlcSoSwcZFM
	HIWLLL4rBQzY5+f/IMYB3TfDCik7CFqwO7Vm4a3ykyYc56mmNKCr+KwR3ACZuuXtaShd
	DftJH40Xwd733/bPfuPn4jkbaLVcpPqXqlixw=
MIME-Version: 1.0
Received: by 10.90.118.4 with SMTP id q4mr2759217agc.16.1285326467227; Fri, 24
	Sep 2010 04:07:47 -0700 (PDT)
Received: by 10.231.158.147 with HTTP; Fri, 24 Sep 2010 04:07:47 -0700 (PDT)
In-Reply-To: <i7hr2q$kte$2@dough.gmane.org>
References: <4C9C4B81.8010700@gmail.com>
	<i7hr2q$kte$2@dough.gmane.org>
Date: Fri, 24 Sep 2010 20:37:47 +0930
Message-ID: <AANLkTi=2SgHJxqBLqHLxnKEs4vW1UBpE__WibmavOhZG@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] firefox_3.6.8.bb: Add mipsel support.
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
X-List-Received-Date: Fri, 24 Sep 2010 11:07:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 24 September 2010 19:00, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 24-09-10 08:56, Graham Gower wrote:
>> Patches taken from Gentoo and Debian.
>>
>> Runs almost acceptably on my 350mhz/128mb mipsel, after a lengthy
>> startup delay. Should work for big endian mips without much more
>> work, but I can't test.
>>
>> Signed-off-by: Graham Gower <graham.gower@gmail.com>
>
> Thanks for the patch! It doesn't apply, could you rework and resend it
> please?
>
> regards,
>
> Koen
>

I can't git pull in order to merge right now... But hand editing the
below fragment, to change r2->r3 would probably fix it. Otherwise it
will have to wait a couple of days.

--- a/recipes/mozilla/firefox_3.6.8.bb
+++ b/recipes/mozilla/firefox_3.6.8.bb
@@ -1,5 +1,5 @@
 DEPENDS += "cairo sqlite3 libnotify"
-PR = "r1"
+PR = "r2"

 # The .pc files below have "3.6" hardcoded, fix that before using
them in a newer FF version!


