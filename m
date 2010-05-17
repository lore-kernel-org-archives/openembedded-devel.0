Received: from mail-gx0-f228.google.com ([209.85.217.228])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ODubg-0002jp-TT
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 09:19:30 +0200
Received: by gxk28 with SMTP id 28so151844gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 00:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=AmD89r3zBWghH7eLAbEWW2BAFS2x/W1Qg+rDBE3HtoU=;
	b=DQaBxN81Mm1FycHtnHGTgg31AvNjy1E0kMSEnwXWjN5rZUI4ItRLqxhrJpyqJNqDwC
	oFvoeR7y9UOwz1Ojll7lQIDA/BQUvRi+XOaR6+OC/vW/KX7BZeZZJeWW8lZyb2fJftm7
	PnqE7rI/c0COrLIT0FHgBjOHOuEZbDTxDVWrQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=MburjeV5HJTEYmAodRcK6Rn1NOMLF9OLeJUUquW+FE9R3ZdMvJao9tD0kFvZwHDxir
	EhmnQLrptOJYIyLhUsGUC2qkBqFBXFyT6BzETYOt5mzsudTWZThgbErZu0XNBJrO8Zy5
	mXcC80OZO4tEyi1qrp4/yIHKtaUxI366mVD0I=
MIME-Version: 1.0
Received: by 10.101.156.18 with SMTP id i18mr5132838ano.180.1274080519818; 
	Mon, 17 May 2010 00:15:19 -0700 (PDT)
Received: by 10.100.96.12 with HTTP; Mon, 17 May 2010 00:15:19 -0700 (PDT)
In-Reply-To: <hsqlfi$p43$1@dough.gmane.org>
References: <hs35ae$l42$1@dough.gmane.org> <hsk1gf$v4j$1@dough.gmane.org>
	<AANLkTilxRS624wPR3D2zTT3GjyIE6owKY7OUC2DQ8O0f@mail.gmail.com>
	<AANLkTilyVGAczJbdPU_1Ra1HB7BnL0igar0BtGdj-GXg@mail.gmail.com>
	<AANLkTim9vyHfHb2K6SteJBOohyHpwY_tBzwIHTvBJVj0@mail.gmail.com>
	<hsqlfi$p43$1@dough.gmane.org>
Date: Mon, 17 May 2010 00:15:19 -0700
Message-ID: <AANLkTinD7v7KsSc_aHTDLigufKVuU9iwPm5EQq8-If3s@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.228
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libstc++ libtool problem, cross lamanger broken
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
X-List-Received-Date: Mon, 17 May 2010 07:20:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, May 16, 2010 at 10:50 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 17-05-10 00:10, Khem Raj wrote:
>> this -L only gets in with gcc 4.3 and not with gcc 4.4
>
> Using gcc 4.4.x isn't an option for angstrom, it generates way too slow
> code for arm. Those regressions are fixed in gcc 4.5.x, though, which
> incidentally is what the angstrom-next branch is using.
>

nice to know. So probably you have to wait a little for 4.5 to mature.
anyway I have committed a fix for 4.3 problem, try it out. I have done limited
testing myself. Let me know if it breaks anything else.

Thx
-Khem


