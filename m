Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ashcharles@gmail.com>) id 1OL0ZU-0002uG-1b
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 23:06:24 +0200
Received: by gyg10 with SMTP id 10so1702503gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Jun 2010 14:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=M502205DF5mcoQ7E+fHU7iPvmJvspOXHf0laTDWsAiw=;
	b=aBFYJsIfm3/lj9440UWGD4cVFtBlWjwlkWQNyizshvPfw5plxpJf+YoKXiCMRTslns
	WR0DTlPpSJm+q+JtVgAIcQ64jhuWNnz9dJrYrUD7IAD9PNupBKJIuMGWWCTbt7pLikhU
	W00UDmXUGY3h8byBKuAWD4Q5GNDl+Xd93bknQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=S1Ay23kreJFbehxVc4/TcszoVvpeFfohK+64Uty1NZNxMtma5RWAkKJ5knZQBvQeJA
	4IT9DNxxnL6KyFF0ynqGdNtkpCOu8X11GPQI1kdcUb1RfK7xi9LFTAA+gHcXxAae8QQD
	4YjAS/SF+9388vHbJ9YjdicsgCgv5ifZ2uVGk=
Received: by 10.90.204.13 with SMTP id b13mr2796772agg.162.1275771725087; Sat, 
	05 Jun 2010 14:02:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.81.3 with HTTP; Sat, 5 Jun 2010 14:01:45 -0700 (PDT)
In-Reply-To: <F7B59210-EE40-4F5D-AE84-3C2040426D89@mac.com>
References: <F7B59210-EE40-4F5D-AE84-3C2040426D89@mac.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Sat, 5 Jun 2010 14:01:45 -0700
Message-ID: <AANLkTimdoOiHxXo3XU-3tLC2v9o90k8V0omWcjX_8n5w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: ashcharles@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: autologin recipe for gumstix Overo
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
X-List-Received-Date: Sat, 05 Jun 2010 21:06:24 -0000
Content-Type: text/plain; charset=UTF-8

Hi Elvis,

On Sat, Jun 5, 2010 at 9:11 AM, Elvis Dowson <elvis.dowson@mac.com> wrote:
> For the autologin.bb recipe that is shown below, the pkg_postinst and the pkg_prerm parts do not run correctly.

Are these steps not being run at all when you install the package?  I
added in the 'echo' commands somewhat as a debugging tool to see if it
was being run.

-Ash


