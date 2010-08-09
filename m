Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OiXbR-0007vs-E0
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 21:02:01 +0200
Received: by pvg6 with SMTP id 6so871306pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Aug 2010 12:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=6rONQ8hoRQR42+Eq9Bw3q3jkdJThSt391GL9ahH97Yw=;
	b=YiqQ4vCn2bgdcx7VgFhhsCP1P5fx0rOYfGxFkAMPkF/5LsAm/lunnRHG5XPRqumftG
	tPMzEoHhLx2Ac/te63L/d18h/ic95Z8EIPwvnbUySMMxe4ttJrpQClNNMap4FSji1q7d
	WhAsyphUUcGZp0DPOwk5Edh8t0ZMXGtAuqWCE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=JIfVre0iXdlGeKEvLhcPBrtZbyx4K1Wbo3MwddiW04goX5OqnknczvEMuwWXqtFNwP
	MoWdBLFp+kBKqumP8Cl2mbjZTrikLoCqmOpI0LKIaU3gTZrmFbXciS+49dQcW18KZIW9
	MxR+h/va5dZQi931F+O8titm/oDTTIegGPAJM=
MIME-Version: 1.0
Received: by 10.114.127.17 with SMTP id z17mr18967676wac.158.1281380487457; 
	Mon, 09 Aug 2010 12:01:27 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Mon, 9 Aug 2010 12:01:27 -0700 (PDT)
In-Reply-To: <AANLkTinK5O3F25QJ40B8+rt5M57BKwWVOYytUEZqvP-D@mail.gmail.com>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E82@deimsg40.de.net.world>
	<AANLkTinK5O3F25QJ40B8+rt5M57BKwWVOYytUEZqvP-D@mail.gmail.com>
Date: Mon, 9 Aug 2010 21:01:27 +0200
Message-ID: <AANLkTikjcrh78MDsSbdALEWbZGHU7nwrk14FQFiU=ynA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Why PREFERRED_VERSION setting of <distro>.conf overrules local.conf setting ?
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
X-List-Received-Date: Mon, 09 Aug 2010 19:02:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/9 Chris Larson <clarson@kergoth.com>:
> On Mon, Aug 9, 2010 at 6:26 AM, Hauser, Wolfgang (external) <
> Wolfgang.Hauser.external@eads.com> wrote:
>
>> Hello,
>>
>> I want to change some used versions of packages, so I added a
>> PREFERRED_VERSION_<package>=3D"xxx" for the packages I want to have a
>> special(newer) version to be used.
>>
>> But e. g. for busybox the version defined in the used <distro>.conf is
>> used instead of my setting in local.conf.
>>
>> Should local.conf not overrule <distro/machine>.conf ??
>
>
> Conceptually, local should override everything, as it's the "most specifi=
c"
> information available, but from a technical standpoint, we can't parse th=
e
> machine and distro configs until local.conf is parsed, as that's usually
> where the MACHINE and DISTRO are set. =A0You can use a 'local' override t=
o get
> around it, or you can ask the distro/machine maintainer to use ?=3D
> assignments (set only if unset).
>
> PREFERRED_VERSION_<package>_local =3D "xxx" is how you use the override.

The real solution woud be to either temporary store the
PREFERRED_VERSION and apply it later on.
Alternately we could parse local.conf twice, the first time ignoring
the PREFERRED lines, and the 2nd time only looking at these.
Yet another solution could be to split local.conf into two pieces, one
with settings like MACHINE and DISTRO, the other one with the
overrides.

Frans (who typically sets MACHINE in the environment, not in
local.conf, makes things a lot simpler if you have to build for
multiple machines)


