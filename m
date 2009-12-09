Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1NIUQI-0001qK-0A
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Dec 2009 22:50:17 +0100
Received: by iwn32 with SMTP id 32so4810878iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Dec 2009 13:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=f/7IOTtdN55sDb0ikq0Oop5o+Fd39Y4x5MBOJGgtu0A=;
	b=XHxsrDlVh2oNQKX7C4n+JJIJMhvW4HVlEkGsgRZb7RzTvrlp6odgtveZEg7Fg3eVD4
	YxvC2WEUt4oNKjvvHXfVTaNDNQRErTIymy429pUveGaYK0Ad1ssvKLDNDfk0UoypZ9fF
	LyiS9W/UwsAOu5m1ZKmKiKKBkMYk0VhN6HJy8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=aElnGJgPn+AF3carypqwRLa6ze2jCQzui28izQLLBn5VpewpCRV9Z8twrWtcBKiXS7
	411QlmsmP7bOxdYb4ppdfQJ8S8TH3GMkaV+g1iA/UKDIJRpBYN9Zw0F8u+3mhhux2xqH
	xdJJmJjDlRF/Z40tBdo4WqN4cG9wUxZpcFAV8=
MIME-Version: 1.0
Received: by 10.231.9.216 with SMTP id m24mr1457210ibm.39.1260395311920; Wed, 
	09 Dec 2009 13:48:31 -0800 (PST)
In-Reply-To: <alpine.LFD.2.00.0911290633120.8046@localhost>
References: <alpine.LFD.2.00.0911281441150.14889@localhost>
	<20091128221627.GA29288@denix.org>
	<alpine.LFD.2.00.0911290633120.8046@localhost>
Date: Wed, 9 Dec 2009 16:48:31 -0500
Message-ID: <f96d234e0912091348v764dc72lffe36387c7d53471@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: invalid git commit for beagle in u-boot recipe?
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
X-List-Received-Date: Wed, 09 Dec 2009 21:50:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 29, 2009 at 6:33 AM, Robert P. J. Day <rpjday@crashcourse.ca> w=
rote:
> On Sat, 28 Nov 2009, Denys Dmytriyenko wrote:
>
>> On Sat, Nov 28, 2009 at 02:46:52PM -0500, Robert P. J. Day wrote:
>> >
>> > =A0 as best i can tell, this entry in u-boot_git.bb on the OE dev
>> > branch:
>> >
>> > SRCREV_beagleboard =3D "1590f84007e2b50ad346a482fff89195cb04ff4e"
>> >
>> > refers to an invalid commit. =A0this is what happens when i build for
>> > the beagle:
>> >
>> > NOTE: preferred version git of u-boot not available (for item u-boot)
>> >
>> > just an observation.
>>
>> The message above has nothing to do with the commit number
>> specified. The problem is with PV being overwritten for beagleboard
>> to specify a proper version, while PREFERRED_VERSION still wants
>> "git"...
>
> =A0ok, but isn't it still an issue that that commit appears to exist
> nowhere in that git repo? =A0i scanned the log and that commit tag
> simply doesn't show up.

I've run into the same problem.  Supposedly, this version is on an
Angstrom mirror, but I've never taken the time to figure out how to
make all that work.  As far as I know, I have the angstrom mirrors set
up correctly, but it still does not find this package.

Cliff


