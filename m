Received: from [209.85.210.175] (helo=mail-yx0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N6hHI-0008O8-S9
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 10:08:15 +0100
Received: by yxe5 with SMTP id 5so1590204yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2009 01:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=uyQF6C8RLfpd2DiBLzoOpH0ena5rNT34QhL2rb3GZ0M=;
	b=xTc70PC+v+YAofXVvajAur8xB9rmCOn+hT1308n5mJ7/G3Golpxb0VM42pMEht2yiR
	Ppxl8bm4yJBA4Ct43ErZKtMDCWO3ViRlGEp1sbREGCL5VzD25Z3bQEcpKd5A3z/wibHR
	hqlq9O9upAokSMPpse321xrXeJ5qC5AjX6lBM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=cOxNfv3mt3q3zGz6PAgawnwqOdOgHI9hTG0eXFj48pHUK6OCCAHIQ+vvusrfLVPd92
	cEvNNYu4/IvWdmayGv/XkgVO7VvpYD/IPkElftZNm38fUr0nCBTDik81v15DaQLqMX6X
	tE8XRxkKFX8Rdq3SXgpVKS3ktZ3q1jNIVotu8=
MIME-Version: 1.0
Received: by 10.100.81.12 with SMTP id e12mr5617057anb.4.1257584817413; Sat, 
	07 Nov 2009 01:06:57 -0800 (PST)
In-Reply-To: <200911070406.18094.holger+oe@freyther.de>
References: <ac9c93b10911061238p366f65edqeff04b25c872015f@mail.gmail.com>
	<200911070406.18094.holger+oe@freyther.de>
Date: Sat, 7 Nov 2009 10:06:57 +0100
Message-ID: <ac9c93b10911070106n587495a5qaf3cfc9288df7e8@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: what to do with wrong checksum
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
X-List-Received-Date: Sat, 07 Nov 2009 09:08:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

2009/11/7 Holger Hans Peter Freyther <holger+oe@freyther.de>:
> On Friday 06 November 2009 21:38:40 Frans Meulenbroeks wrote:
>> While trying to build xmltv I got this:
>>
>> NOTE: The MD5Sums did not match. Wanted:
>> '495fd8c320f67a0c8e0b90ccb060f0ea' and Got:
>> '68d9a93d507bbf917e1f3ad294fd5727'
>> NOTE: Task failed: Checksum of
>> 'http://xmltwig.com/xmltwig/XML-Twig-3.33.tar.gz' failed
>>
>> How should I handle this. Of course I can change the checksum, but i
>> don't think that is the intention :-)
>> Is there a version somewhere cached that has the old checksum (so I
>> can compare).
>> Or how else should I handle this?
>
>
> Check the angstrom mirror or sources.oe.org and download that version
> and then diff it.

Hm. Did that.
Apparently version control is not very strong for Twig.
The diff for the changes file:

diff -r old/XML-Twig-3.33/Changes new/XML-Twig-3.33/Changes
13a14
> added: indented_close_tag pretty_print option (suggested by H.Merijn Brand)
14a16,23
> fix:  xml_grep bug: warning when --count is used and no match is found
>       https://rt.cpan.org/Ticket/Display.html?id=33269
>       found by Hermann Peifer
> fix:  xml_split bug when using an XML declaration and a utf8 encoding. Spotted
>       by Chris Price.
> fix:  xml_pp bug, pod2text command to display help was not properly quoted.
>       Spotted by Chris Price.
> fix:  failing tests when LWP::UserAgent is not available

Reluctantly updated checksums.ini

Frans


