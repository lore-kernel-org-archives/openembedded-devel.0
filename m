Received: from mail-iw0-f189.google.com ([209.85.223.189])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nfh5L-0003CA-IX
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 23:00:34 +0100
Received: by iwn27 with SMTP id 27so1734404iwn.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 13:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=AVa/in3sntT41y7ct5NsZ6dGFbin18YukXNQPtxpqVg=;
	b=YtyZKoX6BgQc4Rolc2Ula0vhbChmqcrYHE6DwoALarw5GN16Upplk/3zPH3msQ1oY3
	/BFtCPVlwzKeyO/GSdZEk+9NUC2yUiiGhG0UyyI2Vsw/rdc0OA+TJihMzjcKEZZD1Jet
	wpaR0GA2U+VXt0gLhKl2plqNepr7+DR66ssNI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Hwro0TsauWCzCFmy1Xr1EYFvqWLQ+Aw2cVRRb91JdPMaH8ZDkdLcRyDk7QoItdVTAK
	AlY2jjaxGn6KDI0q7dtncb+993DZ09pVISNss7nkmnkr7rIp8DLUAHCTpWrvVtNtiXEG
	wWfMxcckpYprbmufti5xjphLGc86rzfniO7TY=
MIME-Version: 1.0
Received: by 10.231.170.14 with SMTP id b14mr788805ibz.26.1265925475477; Thu, 
	11 Feb 2010 13:57:55 -0800 (PST)
In-Reply-To: <1265893453.3777.1053.camel@mill.internal.reciva.com>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-6-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-7-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-8-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-9-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-10-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-11-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-12-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-13-git-send-email-rep.dot.nop@gmail.com>
	<1265893453.3777.1053.camel@mill.internal.reciva.com>
Date: Thu, 11 Feb 2010 13:57:55 -0800
Message-ID: <19c1b8a91002111357x411fbaect5d062bd0a27f369@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.189
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 12/12] task-base.bb: use uniform test for set
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
X-List-Received-Date: Thu, 11 Feb 2010 22:00:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2010 at 5:04 AM, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2010-02-08 at 22:14 +0100, Bernhard Reutner-Fischer wrote:
>> - =A0 =A0if not hasattr(__builtins__, 'set'):
>> + =A0 =A0try:
>> + =A0 =A0 set
>> + =A0 =A0except NameError:
>> =A0 =A0 =A0 from sets import Set as set
>
> It's not completely obvious to me that this patch is an improvement: it
> replaces a single line of code with three new ones and doesn't seem to
> change the outcome. =A0Maybe one of our Python =FCberhackers can comment =
on
> whether or not this is really better.

hasatts uses getattr and catches the exception from getattr. There was
a problem in hasattr where it returned False on
any exception generated from getaddr so the result could be
unreliable. But this may not be applicable in this particular case

I still see

NOTE: Handling BitBake files: \ (7015/8051) [87 %]__builtin__:10:
DeprecationWarning: the sets module is deprecated
NOTE: Handling BitBake files: | (8051/8051) [100 %]
Parsing of 8051 .bb files complete (0 cached, 8051 parsed). 7800
targets, 333 skipped, 157 masked, 0 errors.



>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


