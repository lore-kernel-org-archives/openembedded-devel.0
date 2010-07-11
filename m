Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OXqWI-0007B7-V9
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 09:00:12 +0200
Received: by bwz10 with SMTP id 10so2254078bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Jul 2010 23:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=DvgAdaMX2C4tD7HR6l+4qydt4DGN7IXxXgJcmsA+OUw=;
	b=tDA5ZEOzu7op3DbIeXHL7KvUvSqxy1fBaRZhHYHla5cTRNLzma0paEDeRkqjl9/+91
	LZqUCJR3N//6p+NAPRJGWb9hGG5my4dXGFtEDvfFRi4WWnt5BkbKbyz/pIZQ0smDifqC
	7WbZzkp8LJ3MxvQAmlYuAcJgDHLTYFJNUluuE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=uVDya/BUzMNzpINsvYrogC7tnxVQCa5YEDS8iRFD8BV45/+LQHSyJjtjI2pE8npwM7
	nuWTmFZakqfsCVOC75l5wGI73m55CTLSMPS88Yzp0ucdPYRg6K0x86aGbSSbKkkrazei
	HyRjrkxpL9IHhIqEG6Sr92P18alNbEJf91Mts=
MIME-Version: 1.0
Received: by 10.204.81.203 with SMTP id y11mr4765365bkk.152.1278831312136; 
	Sat, 10 Jul 2010 23:55:12 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Sat, 10 Jul 2010 23:55:12 -0700 (PDT)
In-Reply-To: <1278801398.15825.40.camel@lenovo.internal.reciva.com>
References: <1278577398.15825.1.camel@lenovo.internal.reciva.com>
	<1278778757-31330-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1278801398.15825.40.camel@lenovo.internal.reciva.com>
Date: Sun, 11 Jul 2010 08:55:12 +0200
Message-ID: <AANLkTilo-z4ZlJoNCgFhcEnu1YA6vQaTbug9b9VslcEQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: introduce COMPATIBLE_TARGET_SYS
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
X-List-Received-Date: Sun, 11 Jul 2010 07:00:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/7/11 Phil Blundell <philb@gnu.org>:
> On Sat, 2010-07-10 at 18:19 +0200, Frans Meulenbroeks wrote:
>> This patch introduces COMPATIBLE_TARGET_SYS
>> It is similar to COMPATIBLE_MACHINE but where COMPATIBLE_MACHINE
>> is used to specify that a certain recipe is for a certain machine
>> COMPATIBLE_TARGET_SYS can be used to specify that a certain recipe
>> is for a certain architecture.
>>
>> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
> I think this should go in cross.bbclass, not base.bbclass. =A0Other than
> that it looks fine.
>

I have no real preference for location. The only reason for putting it
in base.bbclass is because that file also contains the tests for
COMPATIBLE_MACHINE and COMPATIBLE_HOST.
(as my pythonese is not that good I just copied/pasted/edited/tested there)
Please advice

Wrt the clarification of khem in the other thread:
What about adding a COMPATIBLE_TARGET_ARCH test  too ? (actually I
think that that is the one I would like to use at one place (although
ofc it is quite possible to use COMPATIBLE_TARGET_SYS).
(e.g. gblic has arch specific sysdeps, I would like to specify if a
version of glibc does not specify my arch).

Frans


