Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NRhR8-0008Ln-47
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 08:33:13 +0100
Received: by ywh8 with SMTP id 8so14841212ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jan 2010 23:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=syu9wv5hXkR1IUloPoIlillR4XMPLJkMVJ5rVEoWiwo=;
	b=aq4qBQ5YE/pDFivE1dPJZed5M26SBW7DMUHvlf4VabxSXtZAq37ql5zKMqtAPzkpDr
	EQrHnu1ccTD1K1xvDUNbWoHCiMb/X2CDcx+9deyauIutlL/YHiB3q3yllzTbKi9jBgnT
	W6mIlElgjRerfDe2twS6V08dQ0+xIXJhHi5fE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=NboYwXb5r5bbhBir4iknMbYNBqse4v1AUTJ/iB1vSjKFyxN0pb/0nUNZgPT4v6T05k
	bg1q2SDT6Ktnp0owAXwRPTlry3dNmhYjSay3lEsXMY7umgguLgYL2M7gUVgjmonSyb5C
	tkDbZWtluPIhRN43EMPYKdUazdGFMJmqkxol0=
MIME-Version: 1.0
Received: by 10.100.1.4 with SMTP id 4mr19586179ana.150.1262590266197; Sun, 03 
	Jan 2010 23:31:06 -0800 (PST)
In-Reply-To: <1262552980.2553.104.camel@lenovo.internal.reciva.com>
References: <ac9c93b11001030833v6236cb2ew11627fb47a6d7fa8@mail.gmail.com>
	<1262552980.2553.104.camel@lenovo.internal.reciva.com>
Date: Mon, 4 Jan 2010 08:31:06 +0100
Message-ID: <ac9c93b11001032331g641d1015hb7191696fdf5bb65@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: qmake issue
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
X-List-Received-Date: Mon, 04 Jan 2010 07:33:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/3 Phil Blundell <philb@gnu.org>:
> On Sun, 2010-01-03 at 17:33 +0100, Frans Meulenbroeks wrote:
>> I can imagine a few solutions, but no idea which one is the best and
>> how to implement them.
>> First option is to hack the generated makefile in a configure_append
>> step. While this would solve the issue for me it is not really a
>> generic solution.
>> Second option is to force removing a package from staging when a new
>> version is build
>> Third option is to change the class which generates the above command
>> to put the -L near the end (after any -L's from the makefile itself.
>
> In the particular case of the myth* libraries, I think they should not
> be getting staged in the first place. =A0As far as I know, no other
> package uses them for anything.
>
> However, that obviously doesn't solve your qmake problem in the general
> case. =A0With a bit of luck some Qt hacker will be able to shed light on
> what is really going on there.

Yeah figured out after a brief discussion on #oe that they probably
didn't need to be staged.

Actually the recipe does not contain any staging, so this is a side
effect of the new automated staging.
It could well be that other,  non qmake recipes also suffer from this.

The fix for mythtv is probably to have an empty do_stage()

However as a general rule the -L and -I flags to staging should be
last, not first.
And, ideally, when building a recipe the old contents from that
package in staging should be removed first.
By removing that we avoid the problem that if rX adds a file A to
staging and rY does not do so any more, the file A still remains in
staging (although perhaps incompatible with what rY made.

Frans


